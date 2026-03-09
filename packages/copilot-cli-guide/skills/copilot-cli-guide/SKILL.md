---
name: copilot-cli-guide
description: Quick reference for GitHub Copilot CLI features, slash commands, keyboard shortcuts, modes, and advanced usage. Use when the user asks about CLI capabilities, commands, or how to use specific features.
---

# Copilot CLI Guide

Quick reference for GitHub Copilot CLI — the terminal-native AI coding agent.

## When to use this skill

- User asks about Copilot CLI features or capabilities
- User needs help with slash commands or keyboard shortcuts
- User wants to understand modes (interactive, plan, autopilot)
- User asks about context management or session handling

## Getting Started

```bash
# Install (macOS/Linux)
curl -fsSL https://gh.io/copilot-install | bash

# Install (Homebrew)
brew install copilot-cli

# Install (npm, cross-platform)
npm install -g @github/copilot

# Install (Windows)
winget install GitHub.Copilot

# Launch
copilot
```

## Keyboard Shortcuts

### Global

| Shortcut | Action |
|----------|--------|
| `@` | Mention files, include contents in context |
| `Ctrl+S` | Run command while preserving input |
| `Shift+Tab` | Cycle modes (interactive → plan) |
| `Ctrl+T` | Toggle model reasoning display |
| `Ctrl+O` | Expand recent timeline (when no input) |
| `Ctrl+E` | Expand all timeline (when no input) |
| `↑` / `↓` | Navigate command history |
| `!` | Execute shell command directly (bypass Copilot) |
| `Esc` | Cancel current operation |
| `Ctrl+C` | Cancel operation / clear input / exit |
| `Ctrl+D` | Shutdown |
| `Ctrl+L` | Clear the screen |

### Editing

| Shortcut | Action |
|----------|--------|
| `Ctrl+A` | Move to beginning of line |
| `Ctrl+E` | Move to end of line |
| `Ctrl+H` | Delete previous character |
| `Ctrl+W` | Delete previous word |
| `Ctrl+U` | Delete from cursor to beginning of line |
| `Ctrl+K` | Delete from cursor to end of line |
| `Meta+← →` | Move cursor by word |
| `Ctrl+G` | Edit prompt in external editor |

## Slash Commands

### Agent & Customization

| Command | Purpose |
|---------|---------|
| `/init` | Initialize Copilot instructions for this repository |
| `/agent` | Browse and select from available agents |
| `/skills` | Manage skills for enhanced capabilities |
| `/mcp` | Manage MCP server configuration |
| `/plugin` | Manage plugins and plugin marketplaces |
| `/instructions` | View and toggle custom instruction files |

### Models & Subagents

| Command | Purpose |
|---------|---------|
| `/model` | Select AI model to use |
| `/fleet` | Enable fleet mode for parallel subagent execution |
| `/tasks` | View and manage background tasks |

### Code & Review

| Command | Purpose |
|---------|---------|
| `/ide` | Connect to an IDE workspace |
| `/diff` | Review changes made in current directory |
| `/review` | Run code review agent |
| `/lsp` | Manage language server configuration |
| `/plan` | Create implementation plan before coding |
| `/research` | Run deep research investigation |

### Permissions

| Command | Purpose |
|---------|---------|
| `/allow-all` | Enable all permissions |
| `/add-dir` | Add a directory to allowed list |
| `/list-dirs` | Display all allowed directories |
| `/cwd` | Change working directory |
| `/reset-allowed-tools` | Reset allowed tools |

### Session

| Command | Purpose |
|---------|---------|
| `/resume` | Resume a previous session |
| `/rename` | Rename current session |
| `/context` | Show context window token usage |
| `/usage` | Display session usage metrics |
| `/compact` | Summarize conversation to reduce context |
| `/share` | Share session to markdown or GitHub gist |
| `/copy` | Copy last response to clipboard |
| `/session` | Show session info |

### Help & Feedback

| Command | Purpose |
|---------|---------|
| `/help` | Show help for interactive commands |
| `/changelog` | Display changelog for CLI versions |
| `/feedback` | Provide feedback about the CLI |
| `/theme` | View or configure terminal theme |
| `/update` | Update CLI to latest version |
| `/experimental` | Manage experimental features |
| `/clear` | Clear the conversation history |
| `/streamer-mode` | Toggle streamer mode (hides model names and quota) |

### Other

| Command | Purpose |
|---------|---------|
| `/exit`, `/quit` | Exit the CLI |
| `/login` | Log in to Copilot |
| `/logout` | Log out of Copilot |
| `/user` | Manage GitHub user list |
| `/terminal-setup` | Configure terminal for multiline input (shift+enter) |

## Modes

### Interactive Mode (default)

Standard chat mode. Copilot asks for approval before modifying files.

### Plan Mode

Press `Shift+Tab` to enter plan mode. Copilot creates an implementation plan before writing any code. Great for complex tasks.

### Autopilot Mode (experimental)

Enable via `/experimental`. Copilot continues working on tasks until completion with less manual intervention. Enable with `--experimental` flag or `/experimental` command.

## Context Management

### Include files

Use `@` followed by a relative path to include file contents:

```
Explain @config/ci/ci-required-checks.yml
Fix the bug in @src/app.js
```

### Manage context window

```bash
/context    # Visual overview of token usage
/usage      # Detailed session statistics
/compact    # Compress conversation history
```

Copilot CLI automatically compresses history when approaching 95% of the token limit.

### Working with directories

```bash
/add-dir /path/to/directory    # Add trusted directory
/cwd /path/to/directory        # Change working directory
/list-dirs                     # Show allowed directories
```

## Session Management

```bash
# Resume previous session
/resume

# Resume most recent session from terminal
copilot --continue

# Start with a specific agent
copilot --agent=my-agent --prompt "Do something"
```

## MCP Servers

The GitHub MCP server is included by default, providing access to GitHub resources (repos, PRs, issues).

```bash
/mcp add     # Add a new MCP server
/mcp         # Manage MCP configuration
```

Config stored in `~/.copilot/mcp-config.json`.

## LSP Configuration

For enhanced code intelligence, configure language servers:

- User-level: `~/.copilot/lsp-config.json`
- Repository-level: `.github/lsp.json`

```json
{
  "lspServers": {
    "typescript": {
      "command": "typescript-language-server",
      "args": ["--stdio"],
      "fileExtensions": {
        ".ts": "typescript",
        ".tsx": "typescript"
      }
    }
  }
}
```

## Custom Instructions Locations

Copilot CLI reads instructions from these locations (in order):

1. `CLAUDE.md` (git root & cwd)
2. `GEMINI.md` (git root & cwd)
3. `AGENTS.md` (git root & cwd)
4. `.github/instructions/**/*.instructions.md` (git root & cwd)
5. `.github/copilot-instructions.md`
6. `$HOME/.copilot/copilot-instructions.md`
7. `COPILOT_CUSTOM_INSTRUCTIONS_DIRS` (additional directories via env var)

## Useful CLI Flags

```bash
copilot --banner          # Show animated banner
copilot --experimental    # Enable experimental features
copilot --continue        # Resume most recent session
copilot --resume SESSION  # Resume specific session
copilot --agent=NAME      # Use specific agent
copilot --prompt "..."    # Start with a prompt
copilot --allow-all       # Enable all permissions
copilot --yolo            # Alias for --allow-all
```

## Reference Documentation

- [About Copilot CLI](https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli)
- [Using Copilot CLI](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/use-copilot-cli)
- [CLI Best Practices](https://docs.github.com/en/copilot/how-tos/copilot-cli/cli-best-practices)
- [CLI Command Reference](https://docs.github.com/en/copilot/reference/cli-command-reference)
- [Custom Instructions](https://docs.github.com/en/copilot/how-tos/copilot-cli/add-custom-instructions)
- [Custom Agents](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/coding-agent/create-custom-agents)
- [Agent Skills](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/create-skills)
- [MCP Servers](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/coding-agent/extend-coding-agent-with-mcp)
