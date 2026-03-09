---
applyTo: "**/*.md"
---

When writing or editing Markdown files in this repository:

- Use ATX-style headings (`#`, `##`, etc.) — not underline style
- Use fenced code blocks with language identifiers (```yaml, ```bash, ```markdown)
- Keep lines under 120 characters where practical
- Use relative links for internal documentation references
- YAML frontmatter: quote strings that contain special characters
- For SKILL.md files: ensure `name` and `description` are present in frontmatter
- For agent files: ensure `description` is present, `name` and `tools` recommended
- For instruction files: ensure `applyTo` glob is present in frontmatter
