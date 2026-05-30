# Agent Plugin Authoring: Source Ledger

**Last Updated**: 2026-05-18  
**Authority Level**: Official Microsoft documentation and VS Code source  
**Freshness Threshold**: 30 days  

## Official Sources

| Source | Authority | Relevance | Last Verified | Status |
|--------|-----------|-----------|---------------|--------|
| [VS Code Agent Plugins Documentation](https://code.visualstudio.com/docs/copilot/customization/agent-plugins) | Official | Core plugin structure, manifest, distribution | 2026-05-18 | ✅ Current |
| [VS Code Custom Agents](https://code.visualstudio.com/docs/copilot/customization/custom-agents) | Official | Agent design, .agent.md format, handoffs | 2026-05-18 | ✅ Current |
| [Agent Tools Reference](https://code.visualstudio.com/docs/copilot/agents/agent-tools) | Official | Built-in tools, tool binding, approval models | 2026-05-18 | ✅ Current |
| [MCP Servers Configuration](https://code.visualstudio.com/docs/copilot/customization/mcp-servers) | Official | MCP tool integration, sandbox, configuration | 2026-05-18 | ✅ Current |
| [VS Code Security Documentation](https://code.visualstudio.com/docs/copilot/security) | Official | SSRF prevention, sandbox, secret management | 2026-05-18 | ✅ Current |
| [plugin.json Schema Reference](https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-plugin-reference#pluginjson) | Official | Plugin manifest schema, cross-tool compatibility | 2026-05-18 | ✅ Current |
| [Extension Publishing Guide](https://code.visualstudio.com/api/working-with-extensions/publishing-extension) | Official | VSIX packaging, Marketplace publishing, versioning | 2026-05-18 | ✅ Current |
| [VS Code Extension API Reference](https://code.visualstudio.com/api/references/vscode-api) | Official | vscode.lm.registerAgent(), custom tool APIs | 2026-05-18 | ✅ Current |
| [MCP Protocol Specification](https://modelcontextprotocol.io/) | Official | MCP server architecture, tool definitions | 2026-05-18 | ✅ Current |

## Research Findings

**Topic**: Agent Plugin Authoring on VS Code  
**Depth**: L3 (Specialist: Implementation patterns, security, distribution)  
**Confidence**: High (all sources cross-referenced)

### Key Findings Extracted

1. **Dual Implementation Paths**:
   - Markdown-based (.agent.md): Simple agents with built-in/MCP tools
   - TypeScript Extension: Complex agents with custom tools, state management, VS Code API integration
   - Source: Official VS Code Custom Agents docs

2. **Cross-Tool Compatibility**:
   - Single plugin.json format works with VS Code, GitHub Copilot CLI, Claude Code
   - Format auto-detection: `.plugin/`, `plugin.json` (root), `.github/plugin/`, `.claude-plugin/`
   - Source: Agent Plugins docs, plugin.json schema reference

3. **Three-Layer Tool Architecture**:
   - Built-in tools: search, read, edit, web, execute (managed by VS Code)
   - MCP servers: External tool services (Model Context Protocol)
   - Extension tools: Custom tools via VS Code API
   - Source: Agent Tools Reference, MCP documentation

4. **Security Model**:
   - Deny-by-default tool permissions (explicit whitelist)
   - SSRF prevention: URL validation, domain blocklists
   - Sandbox configuration: File/network access restrictions (MCP servers)
   - Source: VS Code Security docs, MCP spec

5. **Distribution Channels**:
   - VS Code Marketplace (primary, recommended for public)
   - GitHub Releases (community, open-source friendly)
   - Private registries (enterprise)
   - Direct VSIX install (testing, local development)
   - Source: Extension Publishing Guide, Marketplace guidelines

6. **Release Governance**:
   - Semantic versioning (MAJOR.MINOR.PATCH)
   - Release notes must include: scope, known issues, rollback, approval evidence
   - Pre-release checks: npm audit, smoke tests, security review
   - Source: Release Governance policy (workspace standard), GitHub Copilot CLI reference

## Skill Family Design Decisions

### Scope Decomposition
The topic "Agent Plugin Authoring" is decomposed into **7 specialized skills** rather than one monolithic skill:

1. **agent-plugin-setup**: Initialize plugin scaffold and manifest
2. **agent-plugin-design**: Design personas, workflows, tool permissions
3. **agent-plugin-implementation-markdown**: Write .agent.md agents
4. **agent-plugin-implementation-extension**: Write TypeScript extension agents
5. **agent-plugin-tools-integration**: Wire agents to tools
6. **agent-plugin-security-hardening**: Apply security controls
7. **agent-plugin-publishing**: Package and distribute

### Rationale
- **Reusability**: Each skill can be invoked independently or in sequence
- **Specialization**: Narrow scope = clear trigger conditions and done criteria
- **Portability**: Skills are workspace-agnostic and cross-project usable
- **Discoverability**: Developers can find the exact skill for their current phase

### Workflow Sequence (DAG)
```
agent-plugin-setup (first)
    ↓
agent-plugin-design (required)
    ↓
[Choice: Markdown vs Extension]
├→ agent-plugin-implementation-markdown
└→ agent-plugin-implementation-extension
   ↓
agent-plugin-tools-integration (any path)
    ↓
agent-plugin-security-hardening (before release)
    ↓
agent-plugin-publishing (final)
```

## Coverage Matrix

| Requested Outcome | Routed to Skill | Rationale |
|-------------------|-----------------|-----------|
| Start new plugin | agent-plugin-setup | Creates directory, plugin.json manifest |
| Define agent role and scope | agent-plugin-design | Persona, tool whitelist, workflow logic |
| Create simple agent | agent-plugin-implementation-markdown | .agent.md syntax for Markdown-based agents |
| Create complex agent with custom tools | agent-plugin-implementation-extension | TypeScript extension, vscode.lm API |
| Configure MCP servers or external tools | agent-plugin-tools-integration | Tool binding, approval models, sandbox |
| Prevent SSRF, manage secrets, harden permissions | agent-plugin-security-hardening | Security controls before release |
| Package and distribute agent | agent-plugin-publishing | VSIX, Marketplace, versioning, release notes |

## Quality Checklist

✅ **Maintenance**: All skills reference current official documentation (as of 2026-05-18)  
✅ **Learning**: Depth-calibrated L3 (specialist level with hands-on patterns)  
✅ **Reasoning**: Assumptions clear, trade-offs documented, security principles explicit  
✅ **Completeness**: Full workflow coverage from setup through publishing  
✅ **Reusability**: Each skill is self-contained; no cross-skill references (SKR-M4 compliant)  
✅ **Discoverability**: Skill names lowercase-hyphenated, searchable, cross-project portable

