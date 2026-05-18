# agentic-csharp

Agent plugin containing C#-focused assets from the agentic workspace.

## Included asset sets

- Skills: all C#-named skills plus dotnet-refactor, dotnet-resilience, syrx-data-access, syrx-validation.
- Agents: csharp-engineer.
- Instructions: csharp.instructions.md.
- Prompts: none (strict C#-named prompt filter produced no matches).

## Install as local plugin location

Add this plugin directory to VS Code settings:

```json
"chat.pluginLocations": {
  "c:/Projects/vs_local_marketplace/plugins/agentic-csharp": true
}
```

## Marketplace entry

This plugin is indexed by local marketplace metadata in `.github/plugin/marketplace.json`.
