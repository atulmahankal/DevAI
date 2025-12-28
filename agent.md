# Agent Instructions (Codex/OpenCode)

## Workflow
On `continue` or `proceed` command:
1. Parse `.ai/AI_INSTRUCTIONS.md`
2. Load `.ai/TODO.md`
3. Read `Implementation/CURRENT_TASK.md`
4. Check latest `.ai/memory/*.md`
5. Continue execution

## File Access
- Read: `.ai/*.md`, `Reference/*`, `docs/*`
- Write: `.ai/TODO.md`, `.ai/memory/*`, `Implementation/CURRENT_TASK.md`
- Append: `Implementation/TODO.md`

## Memory
Create session file in `.ai/memory/` with timestamp.
Keep entries minimal for token efficiency.
