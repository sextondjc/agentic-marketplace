# Agent Plugin Authoring Skills: Quick Reference

## Overview

This skill family enables you to author, test, and distribute VS Code agent plugins. Plugins bundle agent customizations (skills, agents, hooks, MCP servers) for discovery and installation via plugin marketplaces.

## Skill Family (7 Skills)

### 1. **agent-plugin-setup**
Initialize a new plugin with directory structure and `plugin.json` manifest.

**Use when**: Starting a new agent plugin from scratch.  
**Output**: Scaffolded directory, valid plugin.json, README.  
**Next**: agent-plugin-design

### 2. **agent-plugin-design**
Define agent persona, capabilities, tool whitelist, and workflow logic before implementation.

**Use when**: Designing agent behavior, security boundaries, multi-agent handoffs.  
**Output**: Design document with persona, tool whitelist, workflow, security boundaries.  
**Next**: agent-plugin-implementation-markdown OR agent-plugin-implementation-extension

### 3. **agent-plugin-implementation-markdown**
Implement agents in Markdown (`.agent.md`) for simple workflows using built-in or MCP tools.

**Use when**: Building simple agents without custom TypeScript code.  
**Output**: Valid `.agent.md` file with YAML frontmatter and instructions.  
**Next**: agent-plugin-tools-integration

### 4. **agent-plugin-implementation-extension**
Implement agents in TypeScript as VS Code extensions for complex workflows with custom tools.

**Use when**: Agents need custom tools, VS Code API integration, or dynamic behavior.  
**Output**: VS Code extension (TypeScript), compiled extension, VSIX package.  
**Next**: agent-plugin-tools-integration

### 5. **agent-plugin-tools-integration**
Wire agents to built-in tools, MCP servers, or extension tools with proper configuration.

**Use when**: Configuring tool availability, MCP servers, approval models, sandbox constraints.  
**Output**: `.mcp.json` configuration, tool whitelist validation, TOOLS.md documentation.  
**Next**: agent-plugin-security-hardening

### 6. **agent-plugin-security-hardening**
Apply security controls (SSRF prevention, secrets, sandbox, input validation) before release.

**Use when**: Agent needs security review, secret management, or permission restriction.  
**Output**: Security audit, hardening checklist, SECURITY.md documentation.  
**Next**: agent-plugin-publishing

### 7. **agent-plugin-publishing**
Package and publish plugins to Marketplace, GitHub, or private registries.

**Use when**: Plugin is ready for distribution, versioning, and monitoring.  
**Output**: VSIX package, release notes, published plugin, telemetry baseline.  
**Done**: Plugin is live and monitored.

## Workflow Diagram

```
START
  ↓
agent-plugin-setup (create scaffold)
  ↓
agent-plugin-design (define behavior)
  ↓
  ├─ agent-plugin-implementation-markdown (simple .agent.md agents)
  │   ↓
  │ agent-plugin-tools-integration (bind to tools)
  │   ↓
  │ agent-plugin-security-hardening (apply security)
  │   ↓
  │ agent-plugin-publishing (ship to marketplace)
  │   ↓
  │  DONE
  │
  └─ agent-plugin-implementation-extension (complex TypeScript agents)
      ↓
    agent-plugin-tools-integration (custom tools, MCP)
      ↓
    agent-plugin-security-hardening (security review)
      ↓
    agent-plugin-publishing (package & ship)
      ↓
     DONE
```

## Typical Scenarios

### Scenario 1: Simple Agent (Code Reviewer)
1. **agent-plugin-setup** → Create plugin scaffold
2. **agent-plugin-design** → Define read-only code review persona, whitelist: search, read, web, grep
3. **agent-plugin-implementation-markdown** → Write `.agent.md` with review instructions
4. **agent-plugin-tools-integration** → Verify tool availability, set web approval to domain-based
5. **agent-plugin-security-hardening** → Prevent SSRF, validate input, remove write tools
6. **agent-plugin-publishing** → Package, publish to Marketplace

**Estimated effort**: 2-4 hours

### Scenario 2: Complex Agent (Test Runner) with Custom Tools
1. **agent-plugin-setup** → Create plugin scaffold
2. **agent-plugin-design** → Define test execution persona, tool whitelist: search, execute, custom-test-tool
3. **agent-plugin-implementation-extension** → TypeScript extension with custom test-runner tool
4. **agent-plugin-tools-integration** → Bind custom tool, configure MCP servers (if needed)
5. **agent-plugin-security-hardening** → Sandbox terminal commands, validate test paths, manage secrets
6. **agent-plugin-publishing** → Multi-platform VSIX, publish to Marketplace

**Estimated effort**: 6-10 hours

### Scenario 3: Security Hardening Existing Agent
1. **agent-plugin-design** → Review design document, pressure-test assumptions
2. **agent-plugin-security-hardening** → Audit tool permissions, implement SSRF prevention, configure sandbox
3. **agent-plugin-publishing** → Bump patch version, release hotfix

**Estimated effort**: 1-2 hours

## Common Patterns

### Built-in Tools
- `search`: Find symbols, files, patterns in workspace
- `read`: Read file contents
- `edit`: Edit files (requires confirmation)
- `execute`: Run shell commands
- `web/fetch`: HTTP requests (SSRF prevention required)
- `grep`: Pattern search

### MCP Servers (External Tools)
- Playwright: Browser automation
- GitHub: GitHub API access
- Custom: Your own MCP server

### Custom Tools (TypeScript Extension)
- Specific domain logic (e.g., test framework integration)
- VS Code API integration (editors, workspace)
- Stateful operations across multiple turns

### Tool Approval Models
- **Pre-approved**: Safe read-only operations (search, read, grep)
- **Per-request**: Mutating operations (edit, execute, write)
- **Domain-based**: Web requests to trusted domains (api.github.com, docs.microsoft.com)

## Security Checklist

Before publishing:

- [ ] Tool whitelist is minimal (deny-by-default)
- [ ] No hardcoded secrets
- [ ] SSRF prevention rules documented
- [ ] Input validation at boundaries
- [ ] Terminal auto-approval denies destructive commands
- [ ] MCP servers sandboxed (file/network restricted)
- [ ] Logs don't leak secrets or PII
- [ ] Security review completed

## Getting Help

- **Stuck on design?** → Use agent-plugin-design skill, pressure-test assumptions
- **Tool not available?** → Use agent-plugin-tools-integration skill, check MCP server config
- **Security concerns?** → Use agent-plugin-security-hardening skill, review threat model
- **Publishing issues?** → Use agent-plugin-publishing skill, check vsce output

## Resources

- [VS Code Agent Plugins Docs](https://code.visualstudio.com/docs/copilot/customization/agent-plugins)
- [Agent Tools Reference](https://code.visualstudio.com/docs/copilot/agents/agent-tools)
- [MCP Protocol](https://modelcontextprotocol.io/)
- [VS Code Security](https://code.visualstudio.com/docs/copilot/security)

