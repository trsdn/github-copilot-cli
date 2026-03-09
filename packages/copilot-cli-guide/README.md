# copilot-cli-guide

[![npm](https://img.shields.io/npm/v/copilot-cli-guide)](https://www.npmjs.com/package/copilot-cli-guide)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Agent Skill — Quick reference for GitHub Copilot CLI features, slash commands, keyboard shortcuts,
modes, and advanced usage.

Packaged with [skillpm](https://github.com/sbroenne/skillpm) — the package manager for
[Agent Skills](https://agentskills.io). Install once, and skillpm handles resolution,
agent wiring, and config deployment automatically.

## Install

```bash
# Install with skillpm (recommended)
skillpm install copilot-cli-guide

# Or with npx (no global install needed)
npx skillpm install copilot-cli-guide
```

## What's included

- **Keyboard shortcuts** — global, editing, and navigation
- **Slash commands** — full reference table for all CLI commands
- **Modes** — interactive, plan, and autopilot
- **Context management** — file inclusion, token usage, directories
- **Session management** — resume, rename, share
- **MCP & LSP configuration** — setup and usage
- **Custom instructions locations** — where Copilot reads instructions from
- **CLI flags** — useful startup options

## When does Copilot load this skill?

Copilot loads this skill when you ask about CLI features, capabilities, slash commands,
keyboard shortcuts, or how to use specific Copilot CLI functionality.

## Part of the Copilot CLI Blueprint

This skill is from the [github-copilot-cli](https://github.com/trsdn/github-copilot-cli)
blueprint repository. See also:

- [`copilot-setup-audit`](https://www.npmjs.com/package/copilot-setup-audit) — Audit your Copilot setup
- [`copilot-skill-builder`](https://www.npmjs.com/package/copilot-skill-builder) — Create new skills

> **Why skillpm?** The [Agent Skills spec](https://agentskills.io) defines what a skill is — but
> not how to publish, install, or share them. [skillpm](https://skillpm.dev) fills that gap by
> mapping Agent Skills onto npm's ecosystem: same registry, same versioning, same dependency
> management. Small skills that compose, not monoliths that overlap.

## License

MIT
