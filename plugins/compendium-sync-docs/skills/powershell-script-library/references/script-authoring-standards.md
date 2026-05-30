# Script Authoring Standards

## Naming and Parameters

- Use Verb-Noun script names.
- Use PascalCase parameter names.
- Prefer ValidateSet and mandatory parameter attributes.

## Safety and Execution

- Use CmdletBinding with SupportsShouldProcess for mutating operations.
- Return objects, not display strings, for machine-readable output.
- Keep scripts non-interactive unless user explicitly requests prompts.

## Structure

- Keep scripts single-purpose.
- Prefer helper functions over duplicated blocks.
- Document usage and output in header comments.

## Example Header

```powershell
# ScriptName.ps1: One-line purpose
# Usage: ./script-name.ps1 -Param Value
# Output: PSCustomObject with <fields>
```
