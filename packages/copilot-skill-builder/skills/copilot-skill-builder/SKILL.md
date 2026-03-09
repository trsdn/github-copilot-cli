---
name: copilot-skill-builder
description: A meta-skill that teaches how to create and maintain Agent Skills for Copilot CLI. Use this skill when the user wants to create a new skill, understand skill format, or learn best practices for writing SKILL.md files.
---

# Skill Builder

This skill helps you create well-structured Agent Skills for GitHub Copilot CLI.

## When to use this skill

- User wants to create a new Agent Skill
- User asks about the SKILL.md format or best practices
- User wants to understand how skills work in Copilot CLI
- User needs to debug or improve an existing skill

## SKILL.md Format

Every skill lives in its own directory and must contain a `SKILL.md` file:

```
.github/skills/<skill-name>/
├── SKILL.md          # Required: skill instructions
├── scripts/          # Optional: helper scripts
├── examples/         # Optional: example files
└── templates/        # Optional: template files
```

### SKILL.md Structure

```markdown
---
name: skill-name
description: What the skill does and when Copilot should use it. Be specific to help Copilot decide when to load this skill.
license: MIT  # Optional
---

# Skill Title

Overview of what this skill accomplishes.

## When to use this skill

- Specific trigger 1
- Specific trigger 2

## Step-by-step procedure

1. First step
2. Second step

## Examples

### Example 1: Description
...

## References

- [Link to relevant docs](https://...)
```

### Frontmatter Fields

| Field | Required | Description |
|-------|----------|-------------|
| `name` | ✅ Yes | Unique identifier, lowercase with hyphens, max 64 chars |
| `description` | ✅ Yes | What it does and when to use it, max 1024 chars |
| `license` | ❌ No | License information for the skill |

## Skill Locations

| Type | Location | Scope |
|------|----------|-------|
| Project skills | `.github/skills/<name>/SKILL.md` | Current repository |
| Personal skills | `~/.copilot/skills/<name>/SKILL.md` | All your projects |
| Alternative | `.claude/skills/<name>/SKILL.md` | Cross-tool compatible |

## Best Practices

### Writing effective descriptions

The `description` field is critical — it's how Copilot decides when to load your skill.

**Good descriptions:**

- "Guide for debugging failing GitHub Actions workflows. Use when asked to debug CI failures."
- "Convert images between formats using ImageMagick. Use when asked to convert, resize, or optimize images."

**Bad descriptions:**

- "A useful skill" (too vague)
- "Helps with stuff" (non-specific)

### Writing effective instructions

1. **Be specific** — provide concrete steps, not vague guidance
2. **Include examples** — show expected input/output pairs
3. **Reference resources** — link to scripts and files using relative paths (e.g., `[template](./template.js)`)
4. **Define scope** — clearly state what the skill does and doesn't do
5. **Keep it focused** — one skill per concern, not a kitchen sink

### Including scripts and resources

Skills can include additional files that Copilot can reference:

```markdown
When creating a new component, use the template at [component-template](./templates/component.tsx)
as a starting point.

To run validation, execute the script at [validate](./scripts/validate.sh).
```

## Managing Skills in Copilot CLI

```bash
/skills list     # List available skills
/skills          # Toggle skills on/off interactively
/skills info     # View details about a skill
/skills reload   # Reload after adding new skills
/skills add      # Add alternative skill location
/skills remove   # Remove a skill directory
```

## Skills vs Custom Instructions

| Aspect | Skills | Custom Instructions |
|--------|--------|-------------------|
| When loaded | On-demand, when relevant | Always, automatically |
| Scope | Task-specific | General/project-wide |
| Can include scripts | ✅ Yes | ❌ No |
| Best for | Detailed task procedures | Coding standards, conventions |

**Rule of thumb:** Use instructions for "always apply" rules, skills for "when relevant" procedures.

## Template

Use [skill-template.md](./skill-template.md) as a starting point for new skills.
