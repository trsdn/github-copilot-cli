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
| `#` | Include a GitHub issue or pull request in context |
| `!` | Execute shell command directly (bypass Copilot) |
| `?` | Open quick help on an empty prompt |
| `Esc` | Cancel current operation |
| `Ctrl+C` | Cancel operation / clear input; press twice to exit |
| `Ctrl+D` | Shutdown |
| `Ctrl+Enter` / `Ctrl+Q` | Queue a message while the agent is busy |
| `Ctrl+G` | Edit prompt in external editor |
| `Ctrl+L` | Clear the screen |
| `Ctrl+R` | Reverse search command history |
| `Ctrl+V` | Paste from clipboard as an attachment |
| `Ctrl+X` then `/` | Run a slash command after typing a prompt |
| `Ctrl+X` then `e` | Edit the prompt in an external editor |
| `Ctrl+X` then `o` | Open the most recent link from the timeline |
| `Shift+Enter` / `Option+Enter` | Insert a newline in the input |
| `Shift+Tab` | Cycle modes (standard → plan → autopilot) |

### Timeline

| Shortcut | Action |
|----------|--------|
| `Ctrl+T` | Expand/collapse reasoning display |
| `Ctrl+O` | Expand recent timeline items when prompt is empty |
| `Ctrl+E` | Expand all timeline items when prompt is empty |
| `Page Up` / `Page Down` | Scroll the timeline |

### Editing

| Shortcut | Action |
|----------|--------|
| `Ctrl+A` | Move to beginning of line |
| `Ctrl+E` | Move to end of line |
| `Ctrl+H` | Delete previous character |
| `Ctrl+W` | Delete previous word |
| `Ctrl+U` | Delete from cursor to beginning of line |
| `Ctrl+K` | Delete from cursor to end of line |
| `Alt+←` / `Alt+→` | Move cursor by word on Windows/Linux |
| `Option+←` / `Option+→` | Move cursor by word on macOS |
| `↑` / `↓` | Navigate command history |
| `Tab` / `Ctrl+Y` | Accept inline completion suggestion |

## Slash Commands

### Agent & Customization

| Command | Purpose |
|---------|---------|
| `/init` | Initialize Copilot instructions and agentic features for this repository |
| `/agent` | Browse and select from available agents |
| `/skills` | Manage skills for enhanced capabilities |
| `/mcp` | Manage MCP server configuration |
| `/plugin` | Manage plugins and plugin marketplaces |
| `/instructions` | View and toggle custom instruction files |
| `/env` | Show loaded instructions, MCP servers, skills, agents, plugins, LSPs, and extensions |

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
| `/pr` | View, create, fix, or automate pull requests |
| `/review` | Run code review agent |
| `/lsp` | Manage language server configuration |
| `/plan` | Create implementation plan before coding |
| `/research` | Run deep research investigation |
| `/delegate` | Delegate changes to a remote repository with an AI-generated pull request |

### Permissions

| Command | Purpose |
|---------|---------|
| `/allow-all`, `/yolo` | Enable, disable, or show all permissions |
| `/add-dir` | Add a directory to allowed list |
| `/list-dirs` | Display all allowed directories |
| `/cwd`, `/cd` | Change working directory |
| `/reset-allowed-tools` | Reset allowed tools |

### Session

| Command | Purpose |
|---------|---------|
| `/resume`, `/continue` | Resume a previous session |
| `/rename` | Rename current session |
| `/context` | Show context window token usage |
| `/usage` | Display session usage metrics |
| `/compact` | Summarize conversation to reduce context |
| `/share`, `/export` | Share session or research to Markdown, HTML, or GitHub gist |
| `/copy` | Copy last response to clipboard |
| `/session` | Show session info |

### Help & Feedback

| Command | Purpose |
|---------|---------|
| `/help` | Show help for interactive commands |
| `/changelog`, `/release-notes` | Display changelog for CLI versions |
| `/feedback` | Provide feedback about the CLI |
| `/theme` | View or configure terminal theme |
| `/update` | Update CLI to latest version |
| `/experimental` | Manage experimental features |
| `/clear`, `/new`, `/reset` | Start a new conversation |
| `/version` | Display version information and check for updates |

### Other

| Command | Purpose |
|---------|---------|
| `/exit`, `/quit` | Exit the CLI |
| `/login` | Log in to Copilot |
| `/logout` | Log out of Copilot |
| `/user` | Manage GitHub user list |
| `/remote` | Enable or end remote steering |
| `/undo`, `/rewind` | Rewind the last turn and revert file changes |
| `/keep-alive` | Prevent sleep while the CLI session is active or busy |
| `/terminal-setup` | Configure terminal for multiline input (shift+enter) |

## Modes

### Standard Mode (default)

Standard chat mode. Copilot asks for approval before modifying files or executing tools unless permissions allow them.

### Plan Mode

Press `Shift+Tab` to enter plan mode. Copilot creates an implementation plan before writing any code. Great for complex tasks.

### Autopilot Mode (experimental)

Copilot continues working on tasks until completion with less manual intervention. Enable with `--mode autopilot`,
`--autopilot`, or by cycling modes with `Shift+Tab`.

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

## Built-in Agents

Use built-in agents before creating a custom project agent when the task matches their purpose.

| Agent | Purpose |
|-------|---------|
| `explore` | Fast read-only codebase exploration and focused answers |
| `research` | Deeper investigation across code, GitHub, and web sources |
| `task` | Build, test, lint, and command execution summaries |
| `code-review` | High signal-to-noise review of diffs for bugs, security, and logic issues |
| `general-purpose` | Complex multi-step work in a separate context window |
| `configure-copilot` | Experimental configuration helper for MCP servers, agents, and skills |
| `rubber-duck` | Experimental critique of plans, designs, implementations, or tests |

## MCP Servers

Built-in MCP servers include GitHub, Playwright, fetch, and time. Additional MCP servers can be configured at
repository, workspace, user, agent, or one-session scope.

```bash
/mcp show               # Show configured MCP servers
/mcp add                # Add a new MCP server interactively
copilot mcp list        # List servers from the shell
copilot mcp add NAME -- COMMAND ARGS...
```

Common config locations:

- `.github/mcp.json` for repository-level MCP config
- `.mcp.json` for workspace MCP config
- `~/.copilot/mcp-config.json` for user-level MCP config
- `--additional-mcp-config` for a single session

Advanced MCP considerations:

- Use `/mcp auth SERVER-NAME` when a remote OAuth server needs re-authentication.
- Use `filterMapping` to control how MCP output is cleaned or formatted before it reaches the model.
- Use OIDC only when the server is designed to receive Copilot-issued identity tokens.
- Expect enterprise allowlists to block non-default servers until approved by policy.
- Migrate VS Code `.vscode/mcp.json` to `.mcp.json` by remapping `servers` to `mcpServers`.

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

Path-specific instruction files require `applyTo` frontmatter and can include comma-separated glob patterns.

## Useful CLI Flags

```bash
copilot --banner          # Show animated banner
copilot --experimental    # Enable experimental features
copilot --mode plan       # Start in plan mode
copilot --mode autopilot  # Start in autopilot mode
copilot --plan            # Shorthand for --mode plan
copilot --autopilot       # Enable autopilot in prompt mode
copilot --continue        # Resume most recent session
copilot --resume SESSION  # Resume specific session
copilot --agent=NAME      # Use specific agent
copilot --prompt "..."    # Start with a prompt
copilot --interactive "..." # Start interactive mode and run a prompt
copilot --allow-all       # Enable all permissions
copilot --yolo            # Alias for --allow-all
copilot --available-tools=read,grep,edit # Restrict tools available to the model
copilot --allow-tool='shell(git:*)'      # Pre-approve matching tool calls
copilot --deny-tool='shell(git push)'    # Deny matching tool calls
copilot --add-dir=/path/to/project       # Allow access to another directory
copilot --config-dir=/path/to/config     # Use a different config directory
```

## Programmatic Usage

Use prompt mode for scripts, CI helpers, or repeatable local automation. In non-interactive contexts, provide explicit
tool and path permissions so the run does not stop for approval prompts.

```bash
copilot --prompt "Update the changelog" --allow-tool=read,grep,edit --add-dir="$PWD"
copilot --prompt "Review this branch" --output-format=json --silent
copilot --prompt "Run the test task" --share=./copilot-session.md
```

Token environment variables are checked in this order: `COPILOT_GITHUB_TOKEN`, `GH_TOKEN`, then `GITHUB_TOKEN`.
Prefer fine-grained tokens with the minimum required permissions for automation.

## Permission Patterns

Permission flags accept broad tool names or structured patterns. Deny rules take precedence over allow rules.

```bash
copilot --allow-tool='shell(git:*)' --deny-tool='shell(git push)'
copilot --allow-url='https://github.com' --deny-url='https://example.com/private'
copilot --allow-tool='MyMCP(create_issue)'
copilot --allow-tool='MyMCP'
```

Common pattern kinds include `read`, `write`, `shell`, `url`, `memory`, and MCP server names.

## OpenTelemetry Monitoring

Copilot CLI can export traces and metrics for agent turns, LLM requests, tool calls, token usage, and errors.
Monitoring is off by default and activates when an OpenTelemetry endpoint or file exporter is configured.

```bash
export COPILOT_OTEL_ENABLED=true
export OTEL_EXPORTER_OTLP_ENDPOINT=https://otel.example.com/v1/traces
export OTEL_SERVICE_NAME=github-copilot
```

Do not enable full content capture in shared or untrusted environments. It may record prompts, code, tool arguments,
and tool results.

## Reference Documentation

- [About Copilot CLI](https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli)
- [Using Copilot CLI](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/use-copilot-cli)
- [CLI Best Practices](https://docs.github.com/en/copilot/how-tos/copilot-cli/cli-best-practices)
- [CLI Command Reference](https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-command-reference)
- [CLI Programmatic Reference](https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-programmatic-reference)
- [CLI Plugin Reference](https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-plugin-reference)
- [CLI Configuration Directory](https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-config-dir-reference)
- [Custom Instructions](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-custom-instructions)
- [Custom Agents](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/coding-agent/create-custom-agents)
- [Agent Skills](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills)
- [MCP Servers](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/coding-agent/extend-coding-agent-with-mcp)
