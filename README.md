# Project Name

> Brief description of your project

## Quick Start

### For New Projects
```bash
curl -fsSL https://raw.githubusercontent.com/atulmahankal/AI-Instructional/refs/heads/master/setup.sh | bash
```

### Setup
1. Fill in `.ai/PROJECT_CONTEXT.md` with your project details
2. Update `.ai/AI_INSTRUCTIONS.md` if needed
3. Configure other `.ai/*.md` files as required

### Using with AI Agents
```bash
# Start your AI CLI (Claude, Gemini, Copilot, etc.)
claude  # or gemini, copilot, opencode

# Then type:
continue
# or
proceed
```

The AI agent will:
1. Read project configuration from `.ai/`
2. Check current tasks from TODO files
3. Load context from memory files
4. Resume work from last session

## Project Structure

```
.
├── .ai/                          # AI Configuration (read-only except noted)
│   ├── PROJECT_CONTEXT.md        # Project overview
│   ├── AI_INSTRUCTIONS.md        # Agent instructions
│   ├── ARCHITECTURE_AND_DECISIONS.md
│   ├── CODING_GUIDELINES.md
│   ├── OPERATIONAL_GUIDELINES.md
│   ├── PROJECT_MANAGEMENT.md
│   ├── TESTING_GUIDELINES.md
│   ├── TODO.md                   # Agent task queue (editable)
│   └── memory/                   # Session memory (editable)
│       └── YYYYMMDD_HHMMSS.md
├── Implementation/               # Active work tracking
│   ├── CURRENT_TASK.md          # Current task (editable)
│   ├── PROJECT_CONTEXT.md       # Implementation context
│   └── TODO.md                  # Implementation tasks (tick & append)
├── Reference/                    # Reference materials (read-only)
├── docs/                         # Documentation
│   └── API/                     # API definitions
│       └── *.rest
├── .github/
│   └── copilot-instructions.md  # Copilot config
├── CLAUDE.md                    # Claude Code config
├── GEMINI.md                    # Gemini CLI config
├── agent.md                     # Codex/OpenCode config
├── .cursorrules                 # Cursor config
├── CHANGELOG.md                 # Version history
├── README.md                    # This file
└── ai.sh                        # Helper script
```

## Workflow

### First Time Setup
1. Run setup script
2. Fill in `.ai/PROJECT_CONTEXT.md`
3. Define tasks in `Implementation/TODO.md`
4. Start working with AI

### Continuing Work
1. Open terminal
2. Start AI agent (`claude`, `gemini`, etc.)
3. Type `continue` or `proceed`
4. AI resumes from last session

### Session Memory
AI agents create memory files in `.ai/memory/` to track:
- What was completed
- What's in progress
- What comes next
- Important notes

## AI Helper Script

```bash
# Initialize new session
./ai.sh init

# Show current status
./ai.sh status

# List recent memory files
./ai.sh memory

# Clean up old memory files (keep last 10)
./ai.sh cleanup
```

## License

<!-- Add your license -->

---
*Built with [AI-Instructional](https://github.com/atulmahankal/AI-Instructional)*
