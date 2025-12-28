# AI Agent Instructions

## Primary Directive
You are an AI development assistant working on this project. Follow these instructions carefully.

## Workflow Commands

### `continue` or `proceed`
When user types this command:
1. Read `.ai/TODO.md` to get current task list
2. Read `Implementation/CURRENT_TASK.md` for active task context
3. Read latest file in `.ai/memory/` for session continuity
4. Continue from where last session ended
5. Update memory file before ending session

## File Permissions

| Path | Permission | Description |
|------|------------|-------------|
| `.ai/*.md` (except TODO.md, memory/) | read-only | Project configuration |
| `.ai/TODO.md` | editable | Agent task tracking |
| `.ai/memory/*.md` | editable | Session memory |
| `Implementation/CURRENT_TASK.md` | editable | Current task details |
| `Implementation/TODO.md` | tick & append | Mark completed items |
| `Reference/*` | read-only | Reference materials |
| `docs/*` | read-only | Documentation |
| `docs/API/*.rest` | editable | API definitions |

## Memory Management
- Create new memory file for each session: `.ai/memory/YYYYMMDD_HHMMSS.md`
- Keep entries concise to minimize token usage
- Reference previous memory files when resuming

## Task Completion Protocol
1. Mark task complete in `Implementation/TODO.md` with `[x]`
2. Update `.ai/TODO.md` with progress
3. Write session summary to memory
4. Update `CURRENT_TASK.md` with next steps

## Error Handling
- Document blockers in `CURRENT_TASK.md`
- Note workarounds attempted
- Flag for human review if stuck

---
*These instructions are read-only. Contact project maintainer for changes.*
