# Rollback Procedure - agentic-governance 1.0.0

## Rollback Owner
- Role: Marketplace maintainer
- Name: Pending assignment

## Steps
1. Remove or disable the plugin entry for agentic-governance in .github/plugin/marketplace.json.
2. Remove plugins/agentic-governance from the marketplace repository.
3. If plugin is already installed, disable it in VS Code Agent Plugins view.
4. Re-enable previous known-good plugin version (if available).
5. Verify no agentic-governance components are active in chat plugin listings.

## Validation
- Marketplace manifest no longer references agentic-governance.
- VS Code no longer shows active plugin commands, skills, or agents from this plugin.

# Rollback Procedure - agentic-csharp 1.0.0

## Rollback Owner
- Role: Marketplace maintainer
- Name: Pending assignment

## Steps
1. Remove or disable the plugin entry for agentic-csharp in .github/plugin/marketplace.json.
2. Remove plugins/agentic-csharp from the marketplace repository.
3. If plugin is already installed, disable it in VS Code Agent Plugins view.
4. Re-enable previous known-good plugin version (if available).
5. Verify no agentic-csharp components are active in chat plugin listings.

## Validation
- Marketplace manifest no longer references agentic-csharp.
- VS Code no longer shows active plugin skills or agents from this plugin.
