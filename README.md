# Copilot MCP Tools - Custom Tools Issue

This repository demonstrates an issue with GitHub Copilot where custom tools (MCP servers) are not available when an array of tools is specified in the prompt frontmatter.

## Problem Description

When using GitHub Copilot with custom MCP (Model Context Protocol) servers: **custom tools do not get sent to Copilot when there is an array of tools specified in the prompt frontmatter**.

## Demonstration

This repository contains two identical prompts that showcase this issue:

### ✅ Working Prompt
**File**: `.github/prompts/trivy-code-scan-working.prompt.md`

```yaml
---
mode: agent
---
```

- No `tools` array is specified in the frontmatter
- Custom MCP tools (like `trivy-mcp`) are available to Copilot
- The agent can successfully use custom tools

### ❌ Broken Prompt
**File**: `.github/prompts/trivy-code-scan-broken.prompt.md`

```yaml
---
mode: agent
tools: ['changes', 'codebase', 'editFiles', 'extensions', 'fetch', 'findTestFiles', 'githubRepo', 'new', 'openSimpleBrowser', 'problems', 'runCommands', 'runNotebooks', 'runTasks', 'search', 'searchResults', 'terminalLastCommand', 'terminalSelection', 'testFailure', 'usages', 'vscodeAPI', 'trivy-mcp']
---
```

- The `tools` array is explicitly specified in the frontmatter
- Even though `trivy-mcp` is listed in the tools array, it's not available to Copilot
- Custom MCP tools are filtered out when an explicit tools array is provided

## Workaround

The only current workaround is to **omit the `tools` array entirely** from the prompt frontmatter if you need to use custom MCP tools. 

## Example Usage

Both prompts are designed to use the Trivy security scanner via the `trivy-mcp` tool:

```bash
# This works (no tools array specified)
/trivy-code-scan-working 

# This fails (tools array specified, custom tools filtered out)
/trivy-code-scan-broken 
```


---

*This repository serves as a minimal reproduction case for the custom tools filtering issue in GitHub Copilot.*
