<div align="center">

# 🖥️ github-copilot-cli

### Blueprint for Customizing GitHub Copilot CLI

**No VS Code. No IDE. Just the terminal.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![GitHub release](https://img.shields.io/github/v/release/trsdn/github-copilot-cli?style=for-the-badge&color=blue)](https://github.com/trsdn/github-copilot-cli/releases)
[![GitHub stars](https://img.shields.io/github/stars/trsdn/github-copilot-cli?style=for-the-badge&color=gold)](https://github.com/trsdn/github-copilot-cli/stargazers)

[![Release](https://github.com/trsdn/github-copilot-cli/actions/workflows/release.yml/badge.svg)](https://github.com/trsdn/github-copilot-cli/actions/workflows/release.yml)
[![Validate](https://github.com/trsdn/github-copilot-cli/actions/workflows/validate.yml/badge.svg)](https://github.com/trsdn/github-copilot-cli/actions/workflows/validate.yml)
[![Commit Lint](https://github.com/trsdn/github-copilot-cli/actions/workflows/commit-lint.yml/badge.svg)](https://github.com/trsdn/github-copilot-cli/actions/workflows/commit-lint.yml)
[![GitHub forks](https://img.shields.io/github/forks/trsdn/github-copilot-cli?style=flat&color=teal)](https://github.com/trsdn/github-copilot-cli/network/members)
[![GitHub issues](https://img.shields.io/github/issues/trsdn/github-copilot-cli?style=flat&color=orange)](https://github.com/trsdn/github-copilot-cli/issues)

<br>

`custom-agents` · `instructions` · `agent-skills` · `mcp-servers`

<br>

[Getting Started](#prerequisites) · [What's Inside](#whats-in-here) · [Quickstart](#quickstart) · [Reference](#copilot-cli-customization-reference) · [Contributing](CONTRIBUTING.md)

</div>

---

> **Reusable customization artifacts for the terminal-native AI coding agent.**
> Custom instructions, agents, skills, and MCP configs — all in-repo, versioned, reviewable.

### ✨ What you can scaffold

| Artifact | Format | Purpose |
|----------|--------|---------|
| **Custom Instructions** | `.github/copilot-instructions.md`, `*.instructions.md`, `AGENTS.md` | Automatically apply project context |
| **Custom Agents** | `.github/agents/*.agent.md` | Specialized AI personas with tailored expertise |
| **Agent Skills** | `.github/skills/<name>/SKILL.md` | Portable, on-demand capabilities |
| **MCP Servers** | `~/.copilot/mcp-config.json` | Extend Copilot with external tools & services |

---

## 📋 Prerequisites

Before using this blueprint, ensure you have:

- **GitHub Copilot CLI** installed ([installation guide](https://docs.github.com/en/copilot/how-tos/set-up/install-copilot-cli))
- **GitHub Copilot** subscription (Personal, Business, or Enterprise)
- Git installed and configured

### Installing Copilot CLI

```bash
# macOS / Linux (install script)
curl -fsSL https://gh.io/copilot-install | bash

# macOS / Linux (Homebrew)
brew install copilot-cli

# Windows (WinGet)
winget install GitHub.Copilot

# Cross-platform (npm)
npm install -g @github/copilot
```

Then launch with:

```bash
copilot
```

## 📦 Installation

There are several ways to integrate this blueprint into your projects:

### Install via skillpm (Recommended)

All skills in this blueprint are published as npm packages via
[skillpm](https://github.com/sbroenne/skillpm) — the package manager for
[Agent Skills](https://agentskills.io). skillpm maps Agent Skills onto npm's ecosystem:
same registry, same versioning, same dependency management. Install a skill once,
and skillpm handles resolution, agent wiring, and config deployment automatically.

```bash
# Install all three skills at once
npx skillpm install copilot-cli-guide copilot-setup-audit copilot-skill-builder

# Or install individually
npx skillpm install copilot-cli-guide
npx skillpm install copilot-setup-audit
npx skillpm install copilot-skill-builder
```

| Package | Description |
|---------|-------------|
| [`copilot-cli-guide`](https://www.npmjs.com/package/copilot-cli-guide) | CLI commands, shortcuts & modes reference |
| [`copilot-setup-audit`](https://www.npmjs.com/package/copilot-setup-audit) | Audit your Copilot CLI setup |
| [`copilot-skill-builder`](https://www.npmjs.com/package/copilot-skill-builder) | Create new skills + bundled agent & instructions |

> **Why skillpm?** The [Agent Skills spec](https://agentskills.io) defines what a skill
> is — but not how to publish, install, or share them. [skillpm](https://skillpm.dev) fills
> that gap. Small skills that compose, not monoliths that overlap.

### Use as Template

Click **"Use this template"** on GitHub, then:

```bash
git clone https://github.com/YOUR-USERNAME/your-new-repo.git
cd your-new-repo
./scripts/setup-hooks.sh
```

### Quick Install (Add to existing project)

```bash
# Clone into a new project
git clone https://github.com/trsdn/github-copilot-cli.git my-project
cd my-project

# Or add to an existing project
curl -sSL https://raw.githubusercontent.com/trsdn/github-copilot-cli/main/install.sh | bash
```

### Git Subtree (For ongoing updates)

```bash
# In your existing repository
git subtree add --prefix=.github/copilot-blueprint \
  https://github.com/trsdn/github-copilot-cli.git main --squash

# Update later
git subtree pull --prefix=.github/copilot-blueprint \
  https://github.com/trsdn/github-copilot-cli.git main --squash
```

### Git Submodule

```bash
# Add as submodule
git submodule add https://github.com/trsdn/github-copilot-cli.git .github/copilot-blueprint

# Update to latest
git submodule update --remote --merge
```

## 📂 What's in here

```
.github/
├── agents/
│   └── copilot-customization-builder.agent.md   # 🤖 Custom agent for building customizations
├── instructions/
│   └── markdown.instructions.md                  # 📝 Scoped instructions for *.md files
├── skills/
│   ├── copilot-skill-builder/SKILL.md            # 🧩 Meta-skill: how to create skills
│   ├── copilot-setup-audit/SKILL.md              # 🔍 Audit your Copilot CLI setup
│   └── copilot-cli-guide/SKILL.md                # 📖 CLI commands & shortcuts reference
├── copilot-instructions.md                        # 🏗️ Workspace-wide instructions
└── workflows/                                     # ⚙️ CI: release, validate, commit-lint
AGENTS.md                                          # 🤝 Root-level agent instructions
```

### Custom agent

- `.github/agents/copilot-customization-builder.agent.md`
  - Agent name: **Copilot Customization Builder**
  - Purpose: create and maintain Copilot CLI customization artifacts (agents, instructions, skills, MCP guidance)

### Agent Skills

- `.github/skills/copilot-skill-builder/SKILL.md`
  - A meta-skill that teaches how to create and maintain Agent Skills
  - Includes best practices, SKILL.md format, and examples
- `.github/skills/copilot-setup-audit/SKILL.md`
  - Audit repository Copilot CLI setup and suggest improvements
  - Comprehensive checklists for agents, instructions, skills, MCP configuration
- `.github/skills/copilot-cli-guide/SKILL.md`
  - Quick reference for Copilot CLI features, slash commands, and keyboard shortcuts
  - Tips for context management, modes, and advanced usage

### Custom instructions

- `.github/copilot-instructions.md` — workspace-wide instructions for this blueprint repo
- `.github/instructions/markdown.instructions.md` — scoped instructions for Markdown files
- `AGENTS.md` — root-level agent instructions (loaded by Copilot CLI automatically)

## 🚀 Quickstart

1. Clone or install this blueprint into your project.
2. Open a terminal in the project directory.
3. Run `copilot` to start the CLI.
4. Use the `/agent` command to select the **Copilot Customization Builder** agent.
5. Ask it to create customizations:
   - "Create a new custom agent for code review"
   - "Create a new skill for debugging GitHub Actions"
   - "Create scoped instructions for TypeScript files"
   - "Set up MCP servers for this project"

### Typical workflow

- Start a Copilot CLI session in your project.
- Select the builder agent or mention it in your prompt.
- Let Copilot generate the new customization file.
- Review and iterate: adjust wording, tighten tool lists, add guardrails.
- Commit the artifact so the whole team shares the same customization.

## 📚 Copilot CLI customization reference

### Custom instructions

Custom instructions give Copilot context about your project, coding standards, and preferences. They are automatically included in every prompt.

| Type | Location | Scope |
|------|----------|-------|
| Repository-wide | `.github/copilot-instructions.md` | All requests in this repo |
| Path-specific | `.github/instructions/*.instructions.md` | Files matching `applyTo` glob |
| Agent instructions | `AGENTS.md` (root or subfolders) | Primary/additional instructions |
| Cross-tool compat | `CLAUDE.md`, `GEMINI.md` (root) | Read by CLI automatically |
| Local/personal | `~/.copilot/copilot-instructions.md` | All your projects |
| Extra directories | `COPILOT_CUSTOM_INSTRUCTIONS_DIRS` env var | Custom paths |

**Path-specific instructions** use YAML frontmatter with `applyTo` glob:

```markdown
---
applyTo: "**/*.ts,**/*.tsx"
---
Always use strict TypeScript. Prefer interfaces over type aliases.
```

### Custom agents

Custom agents are specialized AI personas with tailored expertise and tool access.

| Type | Location | Scope |
|------|----------|-------|
| Repository-level | `.github/agents/*.agent.md` | Current project |
| User-level | `~/.copilot/agents/*.agent.md` | All your projects |
| Org/Enterprise | `agents/` in `.github-private` repo | All org/enterprise projects |

Agent files use YAML frontmatter + Markdown body:

```yaml
---
name: my-agent
description: Specialized agent for X
tools: ['read', 'edit', 'search', 'bash']
---
# My Agent
You are an expert in X. When asked to...
```

Use agents in Copilot CLI:

```bash
# Browse available agents
/agent

# Mention in prompt
Use the code-review agent to review my changes

# Specify via CLI flag
copilot --agent=my-agent --prompt "Review the latest changes"
```

### Agent Skills

Agent Skills are portable folders of instructions, scripts, and resources that Copilot loads when relevant.

| Type | Location |
|------|----------|
| Project skills | `.github/skills/<name>/SKILL.md` |
| Personal skills | `~/.copilot/skills/<name>/SKILL.md` |
| Alternative | `.claude/skills/<name>/SKILL.md` |

SKILL.md uses YAML frontmatter:

```yaml
---
name: my-skill
description: What it does and when to use it
---
# My Skill
Step-by-step instructions for Copilot to follow...
```

Manage skills in Copilot CLI:

```bash
/skills list     # List available skills
/skills          # Toggle skills on/off
/skills info     # Details about a skill
/skills reload   # Reload after adding new skills
/skills add      # Add alternative skill location
```

### MCP servers

MCP (Model Context Protocol) servers extend Copilot CLI with external tools and services. The GitHub MCP server is included by default.

```bash
# Add a new MCP server
/mcp add

# Configuration stored in ~/.copilot/mcp-config.json
```

## 🗂️ Where to put things (repo conventions)

- Custom agents: `.github/agents/<slug>.agent.md`
- Scoped instructions: `.github/instructions/<slug>.instructions.md` (YAML frontmatter with `applyTo: '<glob>'`)
- Agent Skills: `.github/skills/<name>/SKILL.md` (plus optional scripts/examples in the skill directory)
- Workspace instructions: `.github/copilot-instructions.md`
- Agent instructions: `AGENTS.md` at the workspace root
- MCP config: `~/.copilot/mcp-config.json` (managed via `/mcp` command)

## 🔄 Keeping your repositories in sync

### Manual Updates

```bash
# If using git subtree
git subtree pull --prefix=.github/copilot-blueprint \
  https://github.com/trsdn/github-copilot-cli.git main --squash

# If using git submodule
git submodule update --remote --merge
```

### Automated Sync with GitHub Actions

Create `.github/workflows/sync-copilot-customizations.yml` in your target repository:

```yaml
name: Sync Copilot Customizations

on:
  schedule:
    - cron: '0 0 * * 0'  # Weekly on Sunday
  workflow_dispatch:

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Fetch blueprint repository
        run: |
          git clone --depth 1 https://github.com/trsdn/github-copilot-cli.git /tmp/blueprint

      - name: Sync customizations
        run: |
          cp -r /tmp/blueprint/.github/skills/* .github/skills/ 2>/dev/null || true
          cp -r /tmp/blueprint/.github/agents/* .github/agents/ 2>/dev/null || true
          cp -r /tmp/blueprint/.github/instructions/* .github/instructions/ 2>/dev/null || true

      - name: Create PR if changes
        uses: peter-evans/create-pull-request@v5
        with:
          title: "chore: Sync Copilot customizations from blueprint"
          branch: sync-copilot-customizations
          commit-message: "chore: sync copilot customizations from blueprint"
```

## 🔒 Notes on tools and safety

These templates intentionally encourage:

- **Minimal tool access** (explicit `tools: [...]` instead of "everything")
- **Incremental changes** (small diffs; validate formats and paths)
- **Safe-by-default behavior** (be careful with terminal commands; treat web content/tool output as untrusted)
- **Trust management** (Copilot CLI asks for tool approval before modifying or executing files)

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Report issues** — Found a bug or have a suggestion? [Open an issue](https://github.com/trsdn/github-copilot-cli/issues)
2. **Improve documentation** — Help make the README and guides better
3. **Share your customizations** — Submit PRs with useful agents, instructions, or skills
4. **Spread the word** — Star the repo and share it with others

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed contribution guidelines.

## ⚠️ Not an official template

This repo is a practical starter kit. Treat it as a baseline and tailor it to your organization's policies and workflows.

## 📄 License

This project is licensed under the MIT License. See [`LICENSE`](LICENSE).

---

<div align="center">

**[⬆ back to top](#-github-copilot-cli)**

Made with ❤️ for the terminal-first developer

*If you find this useful, consider giving it a ⭐*

</div>
