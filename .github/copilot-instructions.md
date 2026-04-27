# Copilot Instructions

These instructions are automatically applied to every Copilot CLI session in this workspace.

## Project Context

This is a **GitHub Copilot CLI Customization Blueprint** — a template repository for bootstrapping
custom agents, instructions, skills, hooks, plugins, and MCP configurations for Copilot CLI usage, including
sessions launched from the VS Code integrated terminal.

This blueprint is **CLI-first** — no VS Code dependency, but compatible customization formats should remain useful
from VS Code when the same files are supported there.

## Conventions

- Repository customization files live under `.github/` (agents, skills, instructions, hooks, MCP)
- Use **Conventional Commits** for all commit messages: `<type>(<scope>): <description>`
- Allowed types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`
- Agent files: `.agent.md` with YAML frontmatter (`description` required, `name` and `tools` recommended)
- Agent frontmatter can include `target`, `model`, `mcp-servers`, `user-invocable`, and
  `disable-model-invocation`
- Skill files: `SKILL.md` in a named directory under `.github/skills/<name>/`
- Skill frontmatter requires `name` and `description`; optional fields include `license`, `allowed-tools`,
  `user-invocable`, and `disable-model-invocation`
- Instruction files: `*.instructions.md` with YAML frontmatter (`applyTo` glob required)
- Hook files: JSON files under `.github/hooks/*.json` with `version: 1`
- MCP files: `.github/mcp.json` for repository MCP config, `.mcp.json` for workspace MCP config
- For cross-tool compatibility, also support `CLAUDE.md`, `GEMINI.md`, and `AGENTS.md` at repo root

## File Structure

```
.github/
├── agents/           # Custom agent profiles (.agent.md)
├── instructions/     # Scoped instruction files (*.instructions.md)
├── skills/           # Agent Skills (each in its own directory with SKILL.md)
├── hooks/            # Optional Copilot CLI hook configuration (*.json)
├── workflows/        # GitHub Actions (release, validate, commit-lint)
├── mcp.json          # Optional repository MCP configuration
└── copilot-instructions.md  # This file
AGENTS.md             # Root-level agent instructions
```

## Code Style

- Markdown: ATX-style headings, fenced code blocks with language identifiers
- YAML frontmatter: quote strings that contain special characters
- Shell scripts: use `set -e`, add color output, include usage help
- Keep lines under 120 characters where practical
