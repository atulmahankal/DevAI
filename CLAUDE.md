# Claude Code Instructions

## Quick Start
When user types `continue` or `proceed`:
1. Read `.ai/AI_INSTRUCTIONS.md` for full workflow
2. Check `.ai/TODO.md` for pending tasks
3. Read `Implementation/CURRENT_TASK.md` for context
4. Review latest `.ai/memory/*.md` for session continuity
5. Resume work from last checkpoint

## Key Directories
- `.ai/` - Project configuration (mostly read-only)
- `.ai/memory/` - Session memory (editable)
- `Implementation/` - Active work tracking
- `Reference/` - Reference materials
- `docs/` - Documentation

## Session Protocol
1. Create memory file: `.ai/memory/YYYYMMDD_HHMMSS.md`
2. Log progress incrementally
3. Update TODO files on completion
4. Summarize before session end

## Memory Format
```markdown
# Session: YYYY-MM-DD HH:MM

## Completed
- Item 1
- Item 2

## In Progress
- Current task details

## Next Session
- What to continue with

## Notes
- Important observations
```
