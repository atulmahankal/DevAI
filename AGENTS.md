# AGENTS.md

> Standard configuration file for AI coding agents.
> See [agents.md](https://agents.md/) for specification.

## Instructions

**AGENT_NAME** = Use your tool's identifier (e.g., `codex`, `copilot`, `cursor`)

**MANDATORY**: Read `.ai/AI_INSTRUCTIONS.md` and follow the Session Start Protocol.

## Quick Reference

### Instructions Location
- **Main**: `.ai/AI_INSTRUCTIONS.md` (workflow, phases, permissions)
- **Local Override**: `.ai/AI_INSTRUCTIONS.local.md` (if exists)
- **Code Standards**: `.ai/CODING_GUIDELINES.md`
- **Testing**: `.ai/TESTING_GUIDELINES.md`
- **Operations**: `.ai/OPERATIONAL_GUIDELINES.md`

### Key Protocols
1. Read `Implementation/CURRENT_TASK.md` to check active sessions
2. Read `Implementation/TODO.md` to find unclaimed tasks
3. Claim task with `@{agent}` `#YYYYMMDD-HHMMSS` tag
4. Create memory file: `.ai/memory/YYYYMMDD_HHMMSS_{agent}.md`
5. Register in `CURRENT_TASK.md` active sessions table

## ⚠️ Critical Rules (MUST Follow)

### After Completing ANY Task
```
IMMEDIATELY: Update TODO.md → Change [•] to [✓] for completed task
IMMEDIATELY: Update your memory file with completion notes
IMMEDIATELY: Update CURRENT_TASK.md if you were registered
```

### Before Starting Next Task
```
VERIFY: Previous task is marked [✓] in TODO.md
DO NOT: Start new task until TODO.md is updated
```

### Before Starting Next Phase
```
STOP: Confirm ALL tasks in current phase are [✓] marked
STOP: Ask user to confirm git commit
STOP: DO NOT proceed until commit is done
```

## Project Info

- **Tech Stack**: See `Implementation/PROJECT_CONTEXT.md`
- **Architecture**: See `Implementation/ARCHITECTURE.md`
- **Current Tasks**: See `Implementation/TODO.md`

All rules, protocols, and guidelines are centralized in `.ai/AI_INSTRUCTIONS.md`.
