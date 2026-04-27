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
- For SKILL.md files: optional fields include `license`, `allowed-tools`, `user-invocable`, and
  `disable-model-invocation`
- For agent files: ensure `description` is present, `name`, `target`, and `tools` recommended
- For agent files: optional fields include `model`, `mcp-servers`, `user-invocable`, and
  `disable-model-invocation`
- For instruction files: ensure `applyTo` glob is present in frontmatter
- For hook files: use JSON under `.github/hooks/*.json` with `version: 1`
- For MCP config: use JSON with an `mcpServers` object in `.github/mcp.json` or `.mcp.json`
