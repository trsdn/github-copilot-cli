# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---
## [v0.3.0] - 2026-04-27

## What's Changed

### ✨ Features
- feat: add CLI-first, VS Code-friendly coverage for current Copilot CLI customization specs
- feat: document hooks, plugins, advanced MCP, permissions, built-in agents, and OpenTelemetry
- feat: expand setup audit checks for advanced Copilot CLI features and configuration gaps

### 📚 Documentation
- docs: reframe blueprint positioning from CLI-only to CLI-first and VS Code-friendly
- docs: update agent, skill, instruction, hook, MCP, and plugin guidance across source and package docs
- docs: refresh skill templates with current frontmatter and tool-safety guidance

### 🔧 Maintenance
- chore: update installer and validation workflow for hooks and MCP configuration files

## [v0.2.0] - 2026-03-09

## What's Changed

### ✨ Features
- feat(skills): add skillpm-compatible npm packages for all skills

## [v0.1.1] - 2026-03-09

## What's Changed

### 📚 Documentation
- docs: add missing CLI slash commands to cli-guide skill
- docs: polish README with centered header, badges, emoji sections, and tree view


## [v0.1.0] - 2026-03-09

## Initial Release

First release of the GitHub Copilot CLI customization blueprint.


## [v0.1.0] - 2026-03-09

### ✨ Features

- feat: initial release — CLI-first Copilot customization blueprint
- feat: custom agent for building Copilot CLI customizations
- feat: skill builder meta-skill with template
- feat: setup audit skill for CLI configuration review
- feat: CLI guide skill with commands, shortcuts, and modes reference
- feat: scoped Markdown instructions
- feat: root-level AGENTS.md for agent instructions
- feat: install script for adding blueprint to existing projects
- feat: conventional commits enforcement via git hooks
- feat: GitHub Actions workflows (release, validate, commit-lint)
