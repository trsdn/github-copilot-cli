# copilot-setup-audit

[![npm](https://img.shields.io/npm/v/copilot-setup-audit)](https://www.npmjs.com/package/copilot-setup-audit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Agent Skill — Audit a repository's Copilot CLI customization setup and suggest improvements.

Packaged with [skillpm](https://github.com/sbroenne/skillpm) — the package manager for
[Agent Skills](https://agentskills.io). Install once, and skillpm handles resolution,
agent wiring, and config deployment automatically.

## Install

```bash
# Install with skillpm (recommended)
skillpm install copilot-setup-audit

# Or with npx (no global install needed)
npx skillpm install copilot-setup-audit
```

## What's included

- **Comprehensive audit checklist** covering instructions, agents, skills, and MCP configuration
- **Project-type detection** with language-specific recommendations
- **Structured report format** with actionable findings (✅ / ⚠️ / ❌ / 💡)
- **Diagnostic commands** to run in your Copilot CLI session

## When does Copilot load this skill?

Copilot loads this skill when you ask to audit or review your Copilot setup, want to optimize
your CLI customization, or ask "what's missing from my Copilot config?"

## Part of the Copilot CLI Blueprint

This skill is from the [github-copilot-cli](https://github.com/trsdn/github-copilot-cli)
blueprint repository. See also:

- [`copilot-cli-guide`](https://www.npmjs.com/package/copilot-cli-guide) — CLI commands & shortcuts reference
- [`copilot-skill-builder`](https://www.npmjs.com/package/copilot-skill-builder) — Create new skills

> **Why skillpm?** The [Agent Skills spec](https://agentskills.io) defines what a skill is — but
> not how to publish, install, or share them. [skillpm](https://skillpm.dev) fills that gap by
> mapping Agent Skills onto npm's ecosystem: same registry, same versioning, same dependency
> management. Small skills that compose, not monoliths that overlap.

## License

MIT
