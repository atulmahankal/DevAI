#!/bin/bash
#
# AI-Instructional Setup Script
# Sets up the directory structure for AI agent workflows
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/atulmahankal/AI-Instructional/refs/heads/master/setup.sh | bash
#   or
#   ./setup.sh [project-name]
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Project directory (current dir or provided name)
PROJECT_DIR="${1:-.}"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}   AI-Instructional Setup${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Create directory structure
echo -e "${YELLOW}Creating directory structure...${NC}"

mkdir -p "$PROJECT_DIR/.ai/memory"
mkdir -p "$PROJECT_DIR/Implementation"
mkdir -p "$PROJECT_DIR/Reference"
mkdir -p "$PROJECT_DIR/docs/API"
mkdir -p "$PROJECT_DIR/.github"

# ============================================
# .ai/ Directory - Project Configuration
# ============================================

# PROJECT_CONTEXT.md
cat > "$PROJECT_DIR/.ai/PROJECT_CONTEXT.md" << 'EOF'
# Project Context

## Project Name
<!-- Enter your project name -->

## Description
<!-- Brief description of the project -->

## Tech Stack
<!-- List technologies, frameworks, languages used -->
-

## Project Goals
<!-- What is this project trying to achieve? -->
1.

## Key Features
<!-- Main features of the application -->
-

## External Dependencies
<!-- APIs, services, databases used -->
-

## Repository
<!-- Git repository URL -->

## Team
<!-- Team members and roles -->
-

---
*Last Updated: <!-- date -->*
EOF

# AI_INSTRUCTIONS.md
cat > "$PROJECT_DIR/.ai/AI_INSTRUCTIONS.md" << 'EOF'
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
EOF

# ARCHITECTURE_AND_DECISIONS.md
cat > "$PROJECT_DIR/.ai/ARCHITECTURE_AND_DECISIONS.md" << 'EOF'
# Architecture & Design Decisions

## System Architecture
<!-- Describe the high-level architecture -->

```
<!-- Add architecture diagram using Mermaid or ASCII -->
```

## Design Decisions

### Decision 1: [Title]
- **Date**:
- **Status**: Accepted | Proposed | Deprecated
- **Context**:
- **Decision**:
- **Consequences**:

## Directory Structure
```
project/
├── src/           # Source code
├── tests/         # Test files
├── docs/          # Documentation
└── ...
```

## Data Flow
<!-- Describe how data flows through the system -->

## Integration Points
<!-- External systems and APIs -->

---
*Last Updated: <!-- date -->*
EOF

# CODING_GUIDELINES.md
cat > "$PROJECT_DIR/.ai/CODING_GUIDELINES.md" << 'EOF'
# Coding Guidelines

## Code Style
<!-- Define coding standards -->

### Naming Conventions
- Variables: `camelCase`
- Constants: `UPPER_SNAKE_CASE`
- Functions: `camelCase`
- Classes: `PascalCase`
- Files: `kebab-case`

### File Organization
<!-- How should files be organized -->

## Best Practices
- Write self-documenting code
- Keep functions small and focused
- DRY (Don't Repeat Yourself)
- KISS (Keep It Simple, Stupid)

## Comments
- Only add comments for complex logic
- Use JSDoc/docstrings for public APIs
- Avoid obvious comments

## Error Handling
<!-- How to handle errors -->

## Security
- Never commit secrets
- Validate all inputs
- Sanitize outputs

---
*Last Updated: <!-- date -->*
EOF

# OPERATIONAL_GUIDELINES.md
cat > "$PROJECT_DIR/.ai/OPERATIONAL_GUIDELINES.md" << 'EOF'
# Operational Guidelines

## Development Workflow

### Branch Strategy
- `main` - Production ready
- `develop` - Integration branch
- `feature/*` - New features
- `fix/*` - Bug fixes

### Commit Messages
```
type(scope): subject

body (optional)

footer (optional)
```

Types: feat, fix, docs, style, refactor, test, chore

## Deployment
<!-- Deployment process -->

## Monitoring
<!-- How to monitor the application -->

## Incident Response
<!-- Steps for handling incidents -->

---
*Last Updated: <!-- date -->*
EOF

# PROJECT_MANAGEMENT.md
cat > "$PROJECT_DIR/.ai/PROJECT_MANAGEMENT.md" << 'EOF'
# Project Management

## Milestones

### Phase 1: [Name]
- [ ] Task 1
- [ ] Task 2

### Phase 2: [Name]
- [ ] Task 1
- [ ] Task 2

## Sprint Planning
<!-- Current sprint details -->

## Backlog
<!-- Prioritized list of upcoming work -->
1.

## Completed
<!-- Done items for reference -->

---
*Last Updated: <!-- date -->*
EOF

# TESTING_GUIDELINES.md
cat > "$PROJECT_DIR/.ai/TESTING_GUIDELINES.md" << 'EOF'
# Testing Guidelines

## Test Types
- **Unit Tests**: Test individual functions/methods
- **Integration Tests**: Test component interactions
- **E2E Tests**: Test complete user flows

## Test Structure
```
describe('Component/Function', () => {
  it('should do expected behavior', () => {
    // Arrange
    // Act
    // Assert
  });
});
```

## Coverage Requirements
- Minimum: 80% coverage
- Critical paths: 100% coverage

## Running Tests
```bash
# Run all tests
npm test

# Run specific test
npm test -- --grep "test name"

# Coverage report
npm run test:coverage
```

## Mocking Guidelines
<!-- How to mock dependencies -->

---
*Last Updated: <!-- date -->*
EOF

# TODO.md (Agent editable)
cat > "$PROJECT_DIR/.ai/TODO.md" << 'EOF'
# AI Agent Task Queue

## Current Priority
<!-- Agent updates this section -->

## In Progress
- [ ]

## Pending
- [ ]

## Blocked
<!-- Tasks waiting on dependencies or human input -->

## Completed This Session
<!-- Move completed items here with timestamp -->

---
*Auto-managed by AI Agent*
EOF

# ============================================
# Implementation Directory
# ============================================

# CURRENT_TASK.md
cat > "$PROJECT_DIR/Implementation/CURRENT_TASK.md" << 'EOF'
# Current Task

## Task
<!-- What is being worked on -->

## Status
- [ ] Not Started
- [ ] In Progress
- [ ] Blocked
- [ ] Complete

## Context
<!-- Relevant background information -->

## Approach
<!-- How this task will be completed -->

## Progress
<!-- Step-by-step progress updates -->
1.

## Blockers
<!-- Any issues preventing progress -->

## Next Steps
<!-- What should happen after this task -->

---
*Last Updated: <!-- timestamp -->*
EOF

# Implementation TODO.md
cat > "$PROJECT_DIR/Implementation/TODO.md" << 'EOF'
# Implementation Tasks

## Phase 1: Setup
- [ ] Initialize project structure
- [ ] Configure development environment

## Phase 2: Core Development
- [ ]

## Phase 3: Testing
- [ ] Write unit tests
- [ ] Write integration tests

## Phase 4: Documentation
- [ ] API documentation
- [ ] User guide

## Phase 5: Deployment
- [ ] Prepare deployment
- [ ] Deploy to staging
- [ ] Deploy to production

---
*Managed by Developer & AI Agent*
EOF

# PROJECT_CONTEXT.md for Implementation
cat > "$PROJECT_DIR/Implementation/PROJECT_CONTEXT.md" << 'EOF'
# Implementation Context

## Current Phase
<!-- Which phase of development -->

## Active Features
<!-- Features currently being implemented -->

## Technical Decisions Made
<!-- Implementation-specific decisions -->

## Known Issues
<!-- Current bugs or limitations -->

## Dependencies Added
<!-- New dependencies introduced -->

---
*Last Updated: <!-- date -->*
EOF

# ============================================
# AI Tool Instruction Files
# ============================================

# CLAUDE.md
cat > "$PROJECT_DIR/CLAUDE.md" << 'EOF'
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
EOF

# agent.md (for codex & opencode)
cat > "$PROJECT_DIR/agent.md" << 'EOF'
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
EOF

# GEMINI.md
cat > "$PROJECT_DIR/GEMINI.md" << 'EOF'
# Gemini CLI Instructions

## Workflow
On `continue` or `proceed` command:
1. Read `.ai/AI_INSTRUCTIONS.md` for guidelines
2. Check `.ai/TODO.md` for tasks
3. Read `Implementation/CURRENT_TASK.md` for active work
4. Load latest `.ai/memory/*.md` for context
5. Resume from last checkpoint

## Permissions
- Editable: `.ai/TODO.md`, `.ai/memory/*`, `Implementation/CURRENT_TASK.md`
- Read-only: Everything else in `.ai/`

## Session Memory
Save to `.ai/memory/YYYYMMDD_HHMMSS.md`
EOF

# .github/copilot-instructions.md
cat > "$PROJECT_DIR/.github/copilot-instructions.md" << 'EOF'
# GitHub Copilot Instructions

## Context
This project uses an AI-agent workflow system.
See `.ai/AI_INSTRUCTIONS.md` for full details.

## Key Commands
- `continue` / `proceed` - Resume from last session

## Important Files
- `.ai/TODO.md` - Task tracking
- `Implementation/CURRENT_TASK.md` - Active task
- `.ai/memory/` - Session memory
EOF

# .cursorrules
cat > "$PROJECT_DIR/.cursorrules" << 'EOF'
# Cursor Rules

## AI Agent Workflow
This project follows an AI-instructional pattern.
Read `.ai/AI_INSTRUCTIONS.md` for workflow details.

## Commands
- `continue` / `proceed` - Resume from last session

## Key Files
- `.ai/TODO.md` - Editable task list
- `.ai/memory/` - Session memory storage
- `Implementation/CURRENT_TASK.md` - Current work

## Rules
1. Always check TODO files before starting
2. Create memory file for each session
3. Update progress incrementally
4. Keep memory entries minimal
EOF

# ============================================
# docs/API placeholder
# ============================================

cat > "$PROJECT_DIR/docs/API/example.rest" << 'EOF'
### Example API Request
# Add your API definitions here

# GET /api/example
GET http://localhost:3000/api/example
Content-Type: application/json

###
EOF

# ============================================
# CHANGELOG.md
# ============================================

cat > "$PROJECT_DIR/CHANGELOG.md" << 'EOF'
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial project setup with AI-Instructional structure

### Changed

### Deprecated

### Removed

### Fixed

### Security

---
EOF

# ============================================
# README.md
# ============================================

cat > "$PROJECT_DIR/README.md" << 'EOF'
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
EOF

# ============================================
# ai.sh Helper Script
# ============================================

cat > "$PROJECT_DIR/ai.sh" << 'EOF'
#!/bin/bash
#
# AI-Instructional Helper Script
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_DIR="$SCRIPT_DIR/.ai"
MEMORY_DIR="$AI_DIR/memory"
IMPL_DIR="$SCRIPT_DIR/Implementation"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

usage() {
    echo -e "${BLUE}AI-Instructional Helper${NC}"
    echo ""
    echo "Usage: ./ai.sh <command>"
    echo ""
    echo "Commands:"
    echo "  init      Create new session memory file"
    echo "  status    Show current task status"
    echo "  memory    List recent memory files"
    echo "  cleanup   Remove old memory files (keep last 10)"
    echo "  todo      Show TODO summary"
    echo "  help      Show this help"
    echo ""
}

cmd_init() {
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    MEMORY_FILE="$MEMORY_DIR/${TIMESTAMP}.md"

    cat > "$MEMORY_FILE" << MEMEOF
# Session: $(date +"%Y-%m-%d %H:%M:%S")

## Context
<!-- Session starting point -->

## Completed
-

## In Progress
-

## Next Session
-

## Notes
-

---
*Session initialized: $(date)*
MEMEOF

    echo -e "${GREEN}Created memory file: ${MEMORY_FILE}${NC}"
}

cmd_status() {
    echo -e "${BLUE}=== Current Status ===${NC}"
    echo ""

    # Current task
    echo -e "${YELLOW}Current Task:${NC}"
    if [ -f "$IMPL_DIR/CURRENT_TASK.md" ]; then
        head -20 "$IMPL_DIR/CURRENT_TASK.md" | sed 's/^/  /'
    else
        echo "  No current task file found"
    fi
    echo ""

    # Latest memory
    echo -e "${YELLOW}Latest Memory:${NC}"
    LATEST_MEM=$(ls -t "$MEMORY_DIR"/*.md 2>/dev/null | head -1)
    if [ -n "$LATEST_MEM" ]; then
        echo "  File: $(basename "$LATEST_MEM")"
        head -15 "$LATEST_MEM" | sed 's/^/  /'
    else
        echo "  No memory files found"
    fi
    echo ""
}

cmd_memory() {
    echo -e "${BLUE}=== Recent Memory Files ===${NC}"
    echo ""

    if [ -d "$MEMORY_DIR" ]; then
        ls -lt "$MEMORY_DIR"/*.md 2>/dev/null | head -10 | while read -r line; do
            echo "  $line"
        done

        COUNT=$(ls -1 "$MEMORY_DIR"/*.md 2>/dev/null | wc -l)
        echo ""
        echo -e "${CYAN}Total: $COUNT memory files${NC}"
    else
        echo "  Memory directory not found"
    fi
}

cmd_cleanup() {
    echo -e "${YELLOW}Cleaning up old memory files...${NC}"

    if [ -d "$MEMORY_DIR" ]; then
        COUNT=$(ls -1 "$MEMORY_DIR"/*.md 2>/dev/null | wc -l)

        if [ "$COUNT" -gt 10 ]; then
            # Keep last 10, remove rest
            ls -t "$MEMORY_DIR"/*.md | tail -n +11 | while read -r file; do
                rm "$file"
                echo "  Removed: $(basename "$file")"
            done
            echo -e "${GREEN}Cleanup complete. Kept last 10 files.${NC}"
        else
            echo -e "${GREEN}No cleanup needed. Only $COUNT files exist.${NC}"
        fi
    else
        echo "  Memory directory not found"
    fi
}

cmd_todo() {
    echo -e "${BLUE}=== TODO Summary ===${NC}"
    echo ""

    echo -e "${YELLOW}Agent TODO (.ai/TODO.md):${NC}"
    if [ -f "$AI_DIR/TODO.md" ]; then
        grep -E "^\s*-\s*\[" "$AI_DIR/TODO.md" 2>/dev/null | head -15 | sed 's/^/  /'
    else
        echo "  File not found"
    fi
    echo ""

    echo -e "${YELLOW}Implementation TODO:${NC}"
    if [ -f "$IMPL_DIR/TODO.md" ]; then
        grep -E "^\s*-\s*\[" "$IMPL_DIR/TODO.md" 2>/dev/null | head -15 | sed 's/^/  /'
    else
        echo "  File not found"
    fi
}

# Main
case "${1:-}" in
    init)
        cmd_init
        ;;
    status)
        cmd_status
        ;;
    memory)
        cmd_memory
        ;;
    cleanup)
        cmd_cleanup
        ;;
    todo)
        cmd_todo
        ;;
    help|--help|-h)
        usage
        ;;
    "")
        usage
        ;;
    *)
        echo -e "${RED}Unknown command: $1${NC}"
        echo ""
        usage
        exit 1
        ;;
esac
EOF

chmod +x "$PROJECT_DIR/ai.sh"

# ============================================
# Create initial memory file
# ============================================

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
cat > "$PROJECT_DIR/.ai/memory/${TIMESTAMP}.md" << EOF
# Session: $(date +"%Y-%m-%d %H:%M:%S")

## Context
Initial project setup completed.

## Completed
- Created AI-Instructional directory structure
- Generated template files

## Next Session
- Fill in PROJECT_CONTEXT.md with project details
- Define implementation tasks
- Begin development

## Notes
- This is the initial setup session
- All configuration files are ready for customization

---
*Session: Initial Setup*
EOF

# ============================================
# Create .gitignore additions
# ============================================

if [ -f "$PROJECT_DIR/.gitignore" ]; then
    echo "" >> "$PROJECT_DIR/.gitignore"
    echo "# AI Memory (optional - uncomment to ignore)" >> "$PROJECT_DIR/.gitignore"
    echo "# .ai/memory/" >> "$PROJECT_DIR/.gitignore"
else
    cat > "$PROJECT_DIR/.gitignore" << 'EOF'
# AI Memory (optional - uncomment to ignore)
# .ai/memory/

# Common ignores
node_modules/
.env
.env.local
*.log
.DS_Store
EOF
fi

# Make setup.sh executable
chmod +x "$PROJECT_DIR/setup.sh" 2>/dev/null || true

# ============================================
# Done
# ============================================

echo ""
echo -e "${GREEN}Setup complete!${NC}"
echo ""
echo -e "${BLUE}Directory structure created:${NC}"
echo "  .ai/              - AI configuration files"
echo "  .ai/memory/       - Session memory storage"
echo "  Implementation/   - Active work tracking"
echo "  Reference/        - Reference materials"
echo "  docs/API/         - API definitions"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Edit .ai/PROJECT_CONTEXT.md with your project details"
echo "  2. Review and customize other .ai/*.md files"
echo "  3. Add tasks to Implementation/TODO.md"
echo "  4. Start your AI agent and type 'continue' or 'proceed'"
echo ""
echo -e "${CYAN}Helper commands:${NC}"
echo "  ./ai.sh init      - Create new session memory"
echo "  ./ai.sh status    - Show current status"
echo "  ./ai.sh todo      - Show TODO summary"
echo "  ./ai.sh help      - Show all commands"
echo ""
echo -e "${GREEN}Happy coding with AI!${NC}"
