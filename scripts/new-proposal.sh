#!/bin/bash
# new-proposal.sh — 從模板建立一份新提案資料夾
#
# 用法：./scripts/new-proposal.sh <客戶代號> <案件名稱> <規模:short|standard|enterprise>
# 範例：./scripts/new-proposal.sh acme cold-chain standard

set -euo pipefail

if [ "$#" -lt 3 ]; then
    echo "用法：$0 <客戶代號> <案件名稱> <規模:short|standard|enterprise>"
    echo "範例：$0 acme cold-chain standard"
    exit 1
fi

CLIENT="$1"
PROJECT="$2"
SIZE="$3"

cd "$(dirname "$0")/.."

case "$SIZE" in
    short|standard|enterprise) ;;
    *) echo "錯誤：規模必須是 short / standard / enterprise"; exit 1 ;;
esac

PROPOSAL_DIR="proposals/${CLIENT}-${PROJECT}"

if [ -d "$PROPOSAL_DIR" ]; then
    echo "錯誤：目錄已存在 $PROPOSAL_DIR"
    exit 1
fi

mkdir -p "$PROPOSAL_DIR"

# 複製模板
cp "templates/proposal-template-${SIZE}.md" "$PROPOSAL_DIR/proposal.md"
cp "templates/rtm-template.md" "$PROPOSAL_DIR/rtm.md"
cp "templates/architecture-diagram-checklist.md" "$PROPOSAL_DIR/architecture.md"
cp "templates/pricing-breakdown-template.md" "$PROPOSAL_DIR/pricing.md"

# 建立 README
cat > "$PROPOSAL_DIR/README.md" <<EOF
# ${CLIENT} ${PROJECT} 提案

提案規模：${SIZE}
建立日期：$(date '+%Y-%m-%d')

## 檔案

- proposal.md — 主提案書（已從 ${SIZE} 模板複製）
- rtm.md — 需求追蹤矩陣
- architecture.md — 架構規劃
- pricing.md — 報價拆項
- interview-notes/ — 訪談紀錄（按日期建檔）
- correspondence/ — 客戶往來信件

## 階段追蹤

- [ ] 階段 0：判斷接不接
- [ ] 階段 1-2：產業 + 競品
- [ ] 階段 3：第一次客戶會議
- [ ] 階段 4：訪談 + 流程
- [ ] 階段 5：資料盤點
- [ ] 階段 6：合規 + 風險
- [ ] 階段 7：架構 + 方案 + 報價
- [ ] 階段 8：提案書產出
- [ ] 階段 9：內部反方審查
- [ ] 階段 10：提案說明會
- [ ] 階段 11-12：客戶評估 + 商務
- [ ] 階段 13：簽約
- [ ] 階段 14+：交付期

## 客戶資訊

- 客戶名稱：
- 產業：
- 規模：
- Champion：
- Economic Buyer：
- Technical Buyer：
- Decision deadline：
EOF

mkdir -p "$PROPOSAL_DIR/interview-notes" "$PROPOSAL_DIR/correspondence"

echo "建立完成：$PROPOSAL_DIR"
echo ""
echo "下一步："
echo "  1. cd $PROPOSAL_DIR"
echo "  2. 編輯 README.md 填客戶基本資訊"
echo "  3. 跑 playbook/proposal-flow.md 階段 0-3"

# 提醒：proposals/ 已在 .gitignore，內含客戶資料不上 public repo
echo ""
echo "⚠️ proposals/ 已在 .gitignore，本次提案內容不會被推上 git remote"
