# Contributing to github-copilot-cli

Thank you for your interest in contributing to this GitHub Copilot CLI customization blueprint! This document provides guidelines and instructions for contributing.

## Code of Conduct

This project adheres to the Contributor Covenant [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates. When you create a bug report, include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps to reproduce the problem**
- **Provide specific examples** (screenshots, code snippets, etc.)
- **Describe the behavior you observed and what you expected**
- **Include your environment details**:
  - Copilot CLI version (`copilot --version`)
  - Operating system
  - Shell (bash, zsh, PowerShell, etc.)

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion:

- **Use a clear and descriptive title**
- **Provide a detailed description of the suggested enhancement**
- **Explain why this enhancement would be useful**
- **Include examples** of how the feature would be used

### Contributing New Customizations

You can contribute:

- **New Agent Skills** — Domain-specific capabilities in `.github/skills/`
- **Custom Agents** — Specialized agent profiles in `.github/agents/`
- **Instructions Files** — Scoped instructions for specific contexts
- **Documentation improvements** — Better README, guides, or examples

## Development Setup

1. **Fork and clone the repository**

```bash
git clone https://github.com/YOUR-USERNAME/github-copilot-cli.git
cd github-copilot-cli
```

2. **Set up git hooks** (enforces Conventional Commits locally):

```bash
./scripts/setup-hooks.sh
```

3. **Test with Copilot CLI**:

```bash
copilot
```

## Contribution Guidelines

### Agent Skills

When creating a new skill in `.github/skills/<name>/SKILL.md`:

- Follow the existing `SKILL.md` structure
- Include clear `name` and `description` in frontmatter
- Description should be specific enough for Copilot to decide when to load
- Provide concrete examples
- Document any dependencies or prerequisites
- Test by running `/skills info` in Copilot CLI

### Custom Agents

When creating agents in `.github/agents/`:

- Define a clear, focused purpose
- Specify minimal necessary tools (security principle)
- Include comprehensive instructions
- Document limitations and use cases
- Prefer Copilot CLI-native schemas and paths; preserve VS Code compatibility where the same artifact format overlaps
- Test by running `/agent` in Copilot CLI

### Instructions Files

When creating instruction files:

- Use descriptive filenames
- Include proper YAML frontmatter with `applyTo` glob patterns
- Keep instructions concise and actionable
- Test with relevant file types
- Verify with `/instructions` in Copilot CLI

## Style Guidelines

### Markdown

- Use ATX-style headings (`#` not underlines)
- Use fenced code blocks with language identifiers
- Keep lines under 120 characters when possible
- Use relative links for internal documentation

### YAML Frontmatter

```yaml
---
name: Display Name
description: Clear, concise description
applyTo: '**/*.{js,ts}'  # For instructions files
---
```

### File Organization

```
.github/
├── agents/              # Custom agent profiles
│   └── *.agent.md
├── instructions/        # Scoped instructions
│   └── *.instructions.md
└── skills/              # Agent Skills
    └── <name>/
        ├── SKILL.md     # Required
        └── examples/    # Optional
```

## Submitting Changes

### Pull Request Process

1. **Create a feature branch**

```bash
git checkout -b feature/your-feature-name
```

2. **Make your changes** — follow the style guidelines, test thoroughly, update docs

3. **Commit your changes**

```bash
git add .
git commit -m "feat: add new skill for X"
```

> **Important:** This repository enforces [Conventional Commits](https://www.conventionalcommits.org/).

Use conventional commit messages:

- `feat:` — New features (triggers **minor** version bump)
- `fix:` — Bug fixes (triggers **patch** version bump)
- `feat!:` or `BREAKING CHANGE:` — Breaking changes (triggers **major** version bump)
- `docs:` — Documentation changes
- `style:` — Formatting, no code change
- `refactor:` — Code restructuring
- `chore:` — Maintenance tasks

4. **Push to your fork**

```bash
git push origin feature/your-feature-name
```

5. **Open a Pull Request** — use a clear title, reference related issues, describe what changed

## Questions?

- Check existing [Issues](https://github.com/trsdn/github-copilot-cli/issues)
- Open a [Discussion](https://github.com/trsdn/github-copilot-cli/discussions)

Thank you for contributing! 🎉
