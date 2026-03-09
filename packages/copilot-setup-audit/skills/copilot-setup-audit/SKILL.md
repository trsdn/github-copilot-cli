---
name: copilot-setup-audit
description: Audit a repository's Copilot CLI customization setup and suggest improvements. Use when the user wants to review their Copilot configuration, find gaps, or optimize their CLI customization setup.
---

# Copilot CLI Setup Audit

This skill audits a repository's GitHub Copilot CLI customization setup and provides actionable recommendations.

## When to use this skill

- User asks to audit or review their Copilot setup
- User wants to optimize their CLI customization
- User asks "what's missing from my Copilot config?"
- Setting up a new project and want best-practice guidance

## Audit Checklist

### 1. Custom Instructions

Check for existence and content of:

| File | Location | Purpose |
|------|----------|---------|
| `copilot-instructions.md` | `.github/` | Repository-wide instructions |
| `*.instructions.md` | `.github/instructions/` | Path-specific instructions |
| `AGENTS.md` | Root directory | Agent instructions |
| `CLAUDE.md` | Root directory | Cross-tool compatibility |
| `GEMINI.md` | Root directory | Cross-tool compatibility |

**Validate:**

- YAML frontmatter is valid
- `applyTo` globs match intended files (for scoped instructions)
- Instructions are specific and actionable, not vague
- No conflicting instructions between files

### 2. Custom Agents

Check for agents in:

| Location | Type |
|----------|------|
| `.github/agents/*.agent.md` | Repository-level |
| `~/.copilot/agents/*.agent.md` | User-level |

**Validate:**

- `description` is present (required)
- `name` is present (recommended)
- `tools` list is explicit and minimal (security best practice)
- Prompt text is under 30,000 characters
- No VS Code-specific features used (prompt files, hooks, plugins)

### 3. Agent Skills

Check for skills in:

| Location | Type |
|----------|------|
| `.github/skills/*/SKILL.md` | Project skills |
| `~/.copilot/skills/*/SKILL.md` | Personal skills |

**Validate:**

- `name` and `description` are present in frontmatter
- Description is specific enough for Copilot to decide when to load
- Skill directory name matches the `name` field
- Additional resources (scripts, examples) are referenced correctly

### 4. MCP Configuration

Check `~/.copilot/mcp-config.json` for:

- Valid JSON structure
- GitHub MCP server present (default)
- Any additional MCP servers configured
- Security settings (sandbox, URL approval)

### 5. Project-Type Detection

Detect the project type from:

- `package.json` → Node.js / JavaScript / TypeScript
- `requirements.txt` / `pyproject.toml` → Python
- `go.mod` → Go
- `Cargo.toml` → Rust
- `*.csproj` / `*.sln` → .NET
- `pom.xml` / `build.gradle` → Java

Tailor recommendations to the detected project type.

## Audit Report Format

```markdown
## Copilot CLI Setup Audit Report

### ✅ What's Working Well
- [Specific positive findings]

### ⚠️ Warnings
- [Non-critical issues]

### ❌ Issues to Fix
- [Critical problems]

### 💡 Suggestions
- [Recommended improvements]

### Recommended Next Steps
1. [Priority-ordered actions]
```

## Common Recommendations

### For all projects

- Add `.github/copilot-instructions.md` with project context, build commands, and testing approach
- Add `AGENTS.md` at root with key conventions and architecture notes
- Create at least one custom agent for the project's primary workflow

### For specific languages

**TypeScript/JavaScript:**

- Add `*.instructions.md` with `applyTo: "**/*.ts,**/*.tsx"` for TS conventions
- Consider a skill for running/debugging tests

**Python:**

- Add instructions for virtual environment, linting (ruff/flake8), and type hints
- Consider a skill for package management (pip/poetry/uv)

**Go:**

- Add instructions for `go fmt`, `go vet`, and module conventions
- Consider a skill for Go test patterns

## Diagnostic Commands

Suggest the user run these in their Copilot CLI session:

```bash
/instructions    # View which instruction files are loaded
/skills list     # See available skills
/agent           # See available agents
/mcp             # Check MCP server configuration
```
