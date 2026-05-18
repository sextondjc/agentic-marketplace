param(
    [string]$SkillsRoot = 'c:/Projects/agentic_templates/.github/skills'
)

$ErrorActionPreference = 'Stop'

function Get-MarkdownHeadingSlugSet {
    param([string]$MarkdownContent)

    $slugs = New-Object System.Collections.Generic.HashSet[string]
    $slugCounts = @{}
    $lines = $MarkdownContent -split "`r?`n"

    foreach ($line in $lines) {
        if ($line -notmatch '^\s{0,3}#{1,6}\s+(.+?)\s*$') {
            continue
        }

        $heading = $Matches[1].Trim()
        $heading = $heading -replace '\s+#+\s*$', ''

        $baseSlug = $heading.ToLowerInvariant()
        $baseSlug = $baseSlug -replace '<[^>]+>', ''
        $baseSlug = $baseSlug -replace '[^a-z0-9\s-]', ''
        $baseSlug = $baseSlug -replace '\s+', '-'
        $baseSlug = $baseSlug -replace '-+', '-'
        $baseSlug = $baseSlug.Trim('-')

        if ([string]::IsNullOrWhiteSpace($baseSlug)) {
            continue
        }

        if (-not $slugCounts.ContainsKey($baseSlug)) {
            $slugCounts[$baseSlug] = 0
            $slug = $baseSlug
        }
        else {
            $slugCounts[$baseSlug]++
            $slug = "$baseSlug-$($slugCounts[$baseSlug])"
        }

        $null = $slugs.Add($slug)
    }

    return $slugs
}

function Get-MarkdownLinkIntegrity {
    param(
        [string]$Content,
        [string]$BasePath
    )

    $contentWithoutCodeFences = [regex]::Replace($Content, '(?s)```.*?```', '')
    $currentDocSlugs = Get-MarkdownHeadingSlugSet -MarkdownContent $contentWithoutCodeFences
    $targetSlugCache = @{}

    $detectedLinkCollection = [regex]::Matches($contentWithoutCodeFences, '(?<!!)\[[^\]]+\]\((?<target>[^)]+)\)')
    $placeholderCount = 0
    $brokenTargets = New-Object System.Collections.Generic.List[string]

    foreach ($m in $detectedLinkCollection) {
        $rawTarget = $m.Groups['target'].Value.Trim()
        if ([string]::IsNullOrWhiteSpace($rawTarget)) {
            continue
        }

        # Strip optional title from markdown links: [text](path "title")
        $target = ($rawTarget -split '\s+"', 2)[0].Trim()
        if ($target.StartsWith('<') -and $target.EndsWith('>')) {
            $target = $target.Substring(1, $target.Length - 2)
        }

        if ($target -eq '#') {
            $placeholderCount++
            $brokenTargets.Add($target)
            continue
        }

        if (
            $target.StartsWith('http://') -or
            $target.StartsWith('https://') -or
            $target.StartsWith('mailto:') -or
            $target.StartsWith('tel:') -or
            $target.StartsWith('copilot-skill:')
        ) {
            continue
        }

        if ($target.StartsWith('#')) {
            $fragment = [uri]::UnescapeDataString($target.Substring(1).ToLowerInvariant())
            if ([string]::IsNullOrWhiteSpace($fragment) -or -not $currentDocSlugs.Contains($fragment)) {
                $brokenTargets.Add($target)
            }

            continue
        }

        $targetParts = $target -split '#', 2
        $fileTarget = (($targetParts[0]) -split '\?', 2)[0]
        $fragment = if ($targetParts.Count -gt 1) { [uri]::UnescapeDataString($targetParts[1].ToLowerInvariant()) } else { '' }

        if ([string]::IsNullOrWhiteSpace($fileTarget)) {
            continue
        }

        $resolvedTarget = if ([System.IO.Path]::IsPathRooted($fileTarget)) {
            $fileTarget
        }
        else {
            Join-Path $BasePath $fileTarget
        }

        if (-not (Test-Path $resolvedTarget)) {
            $brokenTargets.Add($target)
            continue
        }

        if (-not [string]::IsNullOrWhiteSpace($fragment) -and ([System.IO.Path]::GetExtension($resolvedTarget) -eq '.md')) {
            if (-not $targetSlugCache.ContainsKey($resolvedTarget)) {
                $targetContent = Get-Content $resolvedTarget -Raw
                $targetContentNoCode = [regex]::Replace($targetContent, '(?s)```.*?```', '')
                $targetSlugCache[$resolvedTarget] = Get-MarkdownHeadingSlugSet -MarkdownContent $targetContentNoCode
            }

            if (-not $targetSlugCache[$resolvedTarget].Contains($fragment)) {
                $brokenTargets.Add($target)
            }
        }
    }

    $distinctBroken = @($brokenTargets | Select-Object -Unique)
    return [pscustomobject]@{
        PlaceholderCount = $placeholderCount
        BrokenCount = $distinctBroken.Count
        BrokenTargets = ($distinctBroken -join '; ')
    }
}

$skills = Get-ChildItem $SkillsRoot -Directory |
    Sort-Object Name |
    Where-Object { Test-Path (Join-Path $_.FullName 'SKILL.md') }

$rows = foreach ($s in $skills) {
    $skillFile = Join-Path $s.FullName 'SKILL.md'
    $content = Get-Content $skillFile -Raw

    $frontMatch = [regex]::Match($content, '(?s)^---\r?\n(.*?)\r?\n---')
    $front = if ($frontMatch.Success) { $frontMatch.Groups[1].Value } else { '' }

    $hasFrontmatter = $frontMatch.Success
    $hasName = $front -match '(?m)^name\s*:'
    $hasDescription = $front -match '(?m)^description\s*:'

    $descriptionStartsUseWhen =
        (($front -match '(?im)^description\s*:\s*.*Use when') -or
        (($front -match '(?im)^description\s*:\s*>\s*$') -and ($front -match '(?i)Use when')))

    $linkAudit = Get-MarkdownLinkIntegrity -Content $content -BasePath $s.FullName

    [pscustomobject]@{
        Skill = $s.Name
        HasFrontmatter = $hasFrontmatter
        HasName = $hasName
        HasDescription = $hasDescription
        DescriptionStartsUseWhen = $descriptionStartsUseWhen
        HasTriggerSection = ($content -match '(?im)^##\s+(When to Use|Trigger Conditions|Typical Use Cases|Use Cases)')
        HasReferences = (Test-Path (Join-Path $s.FullName 'references'))
        PlaceholderHashLinks = $linkAudit.PlaceholderCount
        BrokenLocalLinks = $linkAudit.BrokenCount
        BrokenLinkTargets = $linkAudit.BrokenTargets
    }
}

$rows | Sort-Object Skill | Format-Table -AutoSize | Out-String
