#!/bin/bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

BLUEPRINT_REPO="https://github.com/trsdn/github-copilot-cli.git"
TEMP_DIR=$(mktemp -d)

echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  GitHub Copilot CLI Customizations Blueprint Installer ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}✗ Error: Not in a git repository${NC}"
    echo "Please run this script from within a git repository."
    exit 1
fi

echo -e "${GREEN}✓ Git repository detected${NC}"
echo ""

# Ask user what to install
echo -e "${YELLOW}What would you like to install?${NC}"
echo "  1) Everything (agents, skills, instructions, hooks, MCP config)"
echo "  2) Agents only"
echo "  3) Skills only"
echo "  4) Instructions only"
echo "  5) Custom selection"
read -p "Enter choice [1-5]: " choice

# Initialize flags
INSTALL_AGENTS=false
INSTALL_SKILLS=false
INSTALL_INSTRUCTIONS=false
INSTALL_HOOKS=false
INSTALL_MCP=false

case $choice in
    1)
        INSTALL_AGENTS=true
        INSTALL_SKILLS=true
        INSTALL_INSTRUCTIONS=true
        INSTALL_HOOKS=true
        INSTALL_MCP=true
        ;;
    2)
        INSTALL_AGENTS=true
        ;;
    3)
        INSTALL_SKILLS=true
        ;;
    4)
        INSTALL_INSTRUCTIONS=true
        ;;
    5)
        read -p "Install agents? (y/n): " answer
        [[ $answer =~ ^[Yy]$ ]] && INSTALL_AGENTS=true

        read -p "Install skills? (y/n): " answer
        [[ $answer =~ ^[Yy]$ ]] && INSTALL_SKILLS=true

        read -p "Install instructions? (y/n): " answer
        [[ $answer =~ ^[Yy]$ ]] && INSTALL_INSTRUCTIONS=true

        read -p "Install Copilot CLI hooks? (y/n): " answer
        [[ $answer =~ ^[Yy]$ ]] && INSTALL_HOOKS=true

        read -p "Install MCP config? (y/n): " answer
        [[ $answer =~ ^[Yy]$ ]] && INSTALL_MCP=true
        ;;
    *)
        echo -e "${RED}✗ Invalid choice${NC}"
        exit 1
        ;;
esac

echo ""
echo -e "${BLUE}📦 Fetching Copilot CLI customizations blueprint...${NC}"

# Clone the blueprint repository
if ! git clone --depth 1 "$BLUEPRINT_REPO" "$TEMP_DIR" 2>/dev/null; then
    echo -e "${RED}✗ Failed to fetch blueprint repository${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Blueprint fetched successfully${NC}"
echo ""

# Create directories
echo -e "${BLUE}📁 Creating directories...${NC}"
mkdir -p .github/agents
mkdir -p .github/skills
mkdir -p .github/instructions
mkdir -p .github/hooks

# Install components
INSTALLED_COUNT=0

if [ "$INSTALL_AGENTS" = true ]; then
    echo -e "${BLUE}→ Installing agents...${NC}"
    if cp -r "$TEMP_DIR/.github/agents/"* .github/agents/ 2>/dev/null; then
        COUNT=$(find "$TEMP_DIR/.github/agents/" -name "*.agent.md" | wc -l | xargs)
        echo -e "${GREEN}  ✓ Installed $COUNT agent(s)${NC}"
        INSTALLED_COUNT=$((INSTALLED_COUNT + COUNT))
    else
        echo -e "${YELLOW}  ⚠ No agents found in blueprint${NC}"
    fi
fi

if [ "$INSTALL_SKILLS" = true ]; then
    echo -e "${BLUE}→ Installing skills...${NC}"
    if cp -r "$TEMP_DIR/.github/skills/"* .github/skills/ 2>/dev/null; then
        COUNT=$(find "$TEMP_DIR/.github/skills/" -name "SKILL.md" | wc -l | xargs)
        echo -e "${GREEN}  ✓ Installed $COUNT skill(s)${NC}"
        INSTALLED_COUNT=$((INSTALLED_COUNT + COUNT))
    else
        echo -e "${YELLOW}  ⚠ No skills found in blueprint${NC}"
    fi
fi

if [ "$INSTALL_INSTRUCTIONS" = true ]; then
    echo -e "${BLUE}→ Installing instructions...${NC}"
    if cp -r "$TEMP_DIR/.github/instructions/"* .github/instructions/ 2>/dev/null; then
        COUNT=$(find "$TEMP_DIR/.github/instructions/" -name "*.instructions.md" | wc -l | xargs)
        echo -e "${GREEN}  ✓ Installed $COUNT instruction file(s)${NC}"
        INSTALLED_COUNT=$((INSTALLED_COUNT + COUNT))
    else
        echo -e "${YELLOW}  ⚠ No instruction files found in blueprint${NC}"
    fi
fi

if [ "$INSTALL_HOOKS" = true ]; then
    echo -e "${BLUE}→ Installing Copilot CLI hooks...${NC}"
    if [ -d "$TEMP_DIR/.github/hooks" ] && cp -r "$TEMP_DIR/.github/hooks/"* .github/hooks/ 2>/dev/null; then
        COUNT=$(find "$TEMP_DIR/.github/hooks/" -name "*.json" | wc -l | xargs)
        echo -e "${GREEN}  ✓ Installed $COUNT hook config(s)${NC}"
        INSTALLED_COUNT=$((INSTALLED_COUNT + COUNT))
    else
        echo -e "${YELLOW}  ⚠ No Copilot CLI hooks found in blueprint${NC}"
    fi
fi

if [ "$INSTALL_MCP" = true ]; then
    echo -e "${BLUE}→ Installing MCP configuration...${NC}"
    if [ -f "$TEMP_DIR/.github/mcp.json" ]; then
        cp "$TEMP_DIR/.github/mcp.json" .github/mcp.json
        echo -e "${GREEN}  ✓ Installed repository MCP config${NC}"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    else
        echo -e "${YELLOW}  ⚠ No repository MCP config found in blueprint${NC}"
    fi
fi

# Install git hooks for conventional commits
if [ -d "$TEMP_DIR/.githooks" ]; then
    echo -e "${BLUE}→ Installing git hooks...${NC}"
    mkdir -p .githooks
    cp -r "$TEMP_DIR/.githooks/"* .githooks/ 2>/dev/null || true
    chmod +x .githooks/*

    mkdir -p scripts
    cp "$TEMP_DIR/scripts/setup-hooks.sh" scripts/ 2>/dev/null || true
    chmod +x scripts/setup-hooks.sh 2>/dev/null || true

    git config core.hooksPath .githooks
    echo -e "${GREEN}  ✓ Git hooks installed (Conventional Commits enforced)${NC}"
fi

# Cleanup
rm -rf "$TEMP_DIR"

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  ✓ Installation Complete!             ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════╝${NC}"
echo ""
echo -e "${BLUE}Installed $INSTALLED_COUNT customization(s)${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Review the installed files in .github/"
echo "  2. Run 'copilot' to start a CLI session"
echo "  3. Use '/agent' to see available agents"
echo "  4. Use '/skills list' to see available skills"
echo "  5. Use '/env' to inspect loaded instructions, skills, agents, hooks, plugins, and MCP servers"
echo "  6. Commit: git add .github && git commit -m 'feat: add copilot cli customizations'"
echo ""
echo -e "${BLUE}Documentation:${NC} https://github.com/trsdn/github-copilot-cli#readme"
echo ""
echo -e "${GREEN}Happy coding with Copilot CLI! 🚀${NC}"
