#!/usr/bin/env bash
# Workhugs Adgents installer — copies 14 marketing agency subagents into ~/.claude/agents/
# Usage: curl -fsSL https://raw.githubusercontent.com/FakeFlorist/adgents/main/install.sh | bash

set -e

REPO="https://github.com/FakeFlorist/adgents.git"
TARGET="$HOME/.claude/agents"
TMPDIR=$(mktemp -d)

echo ""
echo "🅰️  Workhugs Adgents installer"
echo "=============================="
echo ""

# Check git
if ! command -v git &> /dev/null; then
  echo "❌ git is not installed. Install it first: https://git-scm.com/"
  exit 1
fi

# Create target dir
mkdir -p "$TARGET"

# Clone
echo "📥 Downloading ADGENTS…"
git clone --depth 1 --quiet "$REPO" "$TMPDIR/adgents"

# Backup existing files (if any)
EXISTING=$(find "$TARGET" -maxdepth 1 -name "adgent-*.md" 2>/dev/null | wc -l | tr -d ' ')
if [ "$EXISTING" -gt 0 ]; then
  BACKUP="$TARGET/.adgents-backup-$(date +%Y%m%d-%H%M%S)"
  mkdir -p "$BACKUP"
  mv "$TARGET"/adgent-*.md "$BACKUP/" 2>/dev/null || true
  [ -f "$TARGET/ADGENTS.md" ] && mv "$TARGET/ADGENTS.md" "$BACKUP/"
  echo "💾 Backed up existing adgent files to $BACKUP"
fi

# Install
cp "$TMPDIR/adgents/agents/"adgent-*.md "$TARGET/"
cp "$TMPDIR/adgents/ADGENTS.md" "$TARGET/"

# Cleanup
rm -rf "$TMPDIR"

# Count
COUNT=$(find "$TARGET" -maxdepth 1 -name "adgent-*.md" | wc -l | tr -d ' ')

echo ""
echo "✅ Installed $COUNT agents into $TARGET"
echo ""
echo "Next steps:"
echo "  1. Open Claude Code in any project"
echo "  2. Type a marketing/advertising task in plain language"
echo "  3. The right agent will be invoked automatically"
echo ""
echo "📖 Reference:    $TARGET/ADGENTS.md"
echo "🌐 Project page: https://github.com/FakeFlorist/adgents (Workhugs Adgents)"
echo ""
