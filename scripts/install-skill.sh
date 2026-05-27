#!/bin/bash
# install-skill.sh — 安裝 proposal-os Claude Skill 到 ~/.claude/skills/
#
# 用法：./scripts/install-skill.sh

set -euo pipefail

cd "$(dirname "$0")/.."

SKILL_NAME="proposal-os"
SOURCE_DIR="$(pwd)/skills/${SKILL_NAME}"
TARGET_DIR="${HOME}/.claude/skills/${SKILL_NAME}"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "❌ 找不到來源：$SOURCE_DIR"
    exit 1
fi

if [ -d "$TARGET_DIR" ]; then
    echo "⚠️  目標已存在：$TARGET_DIR"
    read -p "覆蓋？[y/N] " -r
    [[ $REPLY =~ ^[Yy]$ ]] || exit 1
    rm -rf "$TARGET_DIR"
fi

mkdir -p "${HOME}/.claude/skills"

# 選用 symlink（更新源頭時自動同步、推薦給 ProposalOS 開發者）
# 或用 cp（穩定快照、推薦給純使用者）
read -p "用 symlink（隨 repo 更新）還是 cp（穩定快照）？[s/c] " -r SYMLINK_CHOICE
if [[ $SYMLINK_CHOICE =~ ^[Ss]$ ]]; then
    ln -s "$SOURCE_DIR" "$TARGET_DIR"
    echo "✅ Symlink 完成：$TARGET_DIR → $SOURCE_DIR"
    echo "   更新 ProposalOS 時、Skill 會自動跟著動"
else
    cp -r "$SOURCE_DIR" "$TARGET_DIR"
    echo "✅ Copy 完成：$TARGET_DIR"
    echo "   未來 ProposalOS 更新時、要重跑此腳本同步"
fi

echo ""
echo "下次 Claude Code 對話輸入以下任一觸發詞測試："
echo "  - 「幫我寫提案」"
echo "  - 「新案件 kickoff」"
echo "  - 「proposal-os」"
echo "  - 「ProposalOS」"
echo "  - 「顧問式提案」"
echo ""
echo "如果在 ~/.claude/ 是 git repo（cc-manager）、記得 commit："
echo "  cd ~/.claude && git add . && git commit -m 'add proposal-os skill' && git push"
