[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter()]
    [string]$WorkspaceRoot = (Get-Location).Path,

    [Parameter()]
    [switch]$ForceTemplate
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$resolvedRoot = (Resolve-Path -LiteralPath $WorkspaceRoot).Path

$directories = @(
    '.config',
    '.docs',
    '.github',
    '.scripts',
    'src',
    'test',
    'test/common',
    'test/integration',
    'test/unit'
)

foreach ($relativePath in $directories) {
    $targetDir = Join-Path -Path $resolvedRoot -ChildPath $relativePath
    if (-not (Test-Path -LiteralPath $targetDir)) {
        if ($PSCmdlet.ShouldProcess($targetDir, 'Create scaffold directory')) {
            New-Item -Path $targetDir -ItemType Directory | Out-Null
            Write-Host "Created directory: $targetDir"
        }
    }

    $gitKeepPath = Join-Path -Path $targetDir -ChildPath '.gitkeep'
    if (-not (Test-Path -LiteralPath $gitKeepPath)) {
        if ($PSCmdlet.ShouldProcess($gitKeepPath, 'Create .gitkeep marker')) {
            New-Item -Path $gitKeepPath -ItemType File | Out-Null
        }
    }
}

$templatePath = Join-Path -Path $PSScriptRoot -ChildPath '..\templates\Directory.Build.targets'
$templatePath = (Resolve-Path -LiteralPath $templatePath).Path
$rootTargetsPath = Join-Path -Path $resolvedRoot -ChildPath 'Directory.Build.targets'

$shouldCopyTemplate = $ForceTemplate -or -not (Test-Path -LiteralPath $rootTargetsPath)
if ($shouldCopyTemplate) {
    if ($PSCmdlet.ShouldProcess($rootTargetsPath, 'Copy Directory.Build.targets template to workspace root')) {
        Copy-Item -LiteralPath $templatePath -Destination $rootTargetsPath -Force:$ForceTemplate
        Write-Host "Applied template asset: $rootTargetsPath"
    }
}
else {
    Write-Host 'Directory.Build.targets already exists; use -ForceTemplate to replace it.'
}

Write-Host 'Scaffold complete.'

