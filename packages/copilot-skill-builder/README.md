# copilot-skill-builder

[![npm](https://img.shields.io/npm/v/copilot-skill-builder)](https://www.npmjs.com/package/copilot-skill-builder)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Agent Skill — Create and maintain Agent Skills for Copilot CLI. Includes a bundled
**Copilot Customization Builder** agent and markdown instructions.

Packaged with [skillpm](https://github.com/sbroenne/skillpm) — the package manager for
[Agent Skills](https://agentskills.io). Install once, and skillpm handles resolution,
agent wiring, and config deployment automatically.

## Install

```bash
# Install with skillpm (recommended)
skillpm install copilot-skill-builder

# Or with npx (no global install needed)
npx skillpm install copilot-skill-builder
```

## What's included

### Skill: copilot-skill-builder

- **SKILL.md format reference** — frontmatter fields, body structure, best practices
- **Skill locations** — project, personal, and alternative directories
- **Writing effective descriptions** — good vs bad examples
- **Including scripts and resources** — relative path references
- **Skills vs custom instructions** — when to use which
- **Template** — ready-to-use `skill-template.md` starting point

### Bundled configs (deployed via skillpm)

On `skillpm install`, the following config files are automatically deployed to your workspace:

| Source | Deployed to |
|--------|-------------|
| `customization-builder.agent.md` | `.github/agents/copilot-customization-builder.agent.md` |
| `markdown.instructions.md` | `.github/instructions/copilot-markdown.instructions.md` |

The **Copilot Customization Builder** agent helps create and maintain agents, instructions,
skills, and MCP configurations — all targeting Copilot CLI.

On `skillpm uninstall`, deployed configs are cleaned up automatically via the
[skillpm manifest](https://skillpm.dev/creating-skills/#bundling-agent-configs-rules-and-prompts).

## When does Copilot load this skill?

Copilot loads this skill when you want to create a new skill, ask about the SKILL.md format,
or need best practices for writing skills.

## Part of the Copilot CLI Blueprint

This skill is from the [github-copilot-cli](https://github.com/trsdn/github-copilot-cli)
blueprint repository. See also:

- [`copilot-cli-guide`](https://www.npmjs.com/package/copilot-cli-guide) — CLI commands & shortcuts reference
- [`copilot-setup-audit`](https://www.npmjs.com/package/copilot-setup-audit) — Audit your Copilot setup

> **Why skillpm?** The [Agent Skills spec](https://agentskills.io) defines what a skill is — but
> not how to publish, install, or share them. [skillpm](https://skillpm.dev) fills that gap by
> mapping Agent Skills onto npm's ecosystem: same registry, same versioning, same dependency
> management. Small skills that compose, not monoliths that overlap.

## License

MIT
