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
