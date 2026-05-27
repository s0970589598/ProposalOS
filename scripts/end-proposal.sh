#!/bin/bash
# end-proposal.sh — 結案時跑、建立 retrospect 結構
#
# 用法：./scripts/end-proposal.sh <案件代號> <outcome:win|loss|paused|launched>
# 範例：./scripts/end-proposal.sh acme-cold-chain win

set -euo pipefail

if [ "$#" -lt 2 ]; then
    echo "用法：$0 <案件代號> <outcome:win|loss|paused|launched>"
    echo ""
    echo "outcome 選項："
    echo "  win      - 贏單、簽約"
    echo "  loss     - 輸單、客戶選別人"
    echo "  paused   - 中途暫停（客戶內部議題、預算等）"
    echo "  launched - 已上線、進入維運"
    echo ""
    echo "範例：./scripts/end-proposal.sh acme-cold-chain win"
    exit 1
fi

CASE="$1"
OUTCOME="$2"

case "$OUTCOME" in
    win|loss|paused|launched) ;;
    *) echo "❌ outcome 必須是 win / loss / paused / launched"; exit 1 ;;
esac

cd "$(dirname "$0")/.."

PROPOSAL_DIR="proposals/${CASE}"

if [ ! -d "$PROPOSAL_DIR" ]; then
    echo "❌ 找不到 $PROPOSAL_DIR"
    echo "提示：用 ./scripts/new-proposal.sh 建新案、或檢查代號是否拼錯"
    echo ""
    echo "現有 proposals/："
    ls -1 proposals/ 2>/dev/null || echo "  （無）"
    exit 1
fi

# 1. 建 END_STATUS.md
if [ -f "$PROPOSAL_DIR/END_STATUS.md" ]; then
    echo "⚠️  $PROPOSAL_DIR/END_STATUS.md 已存在、案件已結案"
    echo ""
    cat "$PROPOSAL_DIR/END_STATUS.md"
    exit 1
fi

cat > "$PROPOSAL_DIR/END_STATUS.md" <<EOF
# 結案紀錄

| 項目 | 內容 |
|---|---|
| 案件代號 | ${CASE} |
| 結果 | **${OUTCOME}** |
| 結案日期 | $(date '+%Y-%m-%d') |
| 結案者 | $(whoami) |

## 結案類型對應動作

| 類型 | 後續 |
|---|---|
| **win** | 上線交付期、上線後 30/60/90 天追蹤 KPI、3 個月後寫 case study |
| **loss** | 重要：訪客戶問「為什麼選別人」、最寶貴的學習 |
| **paused** | 設追蹤日（建議 1-3 個月後重啟）、不要當死案 |
| **launched** | 進維運期、上線後追 KPI、6 個月後完整 retrospect |
EOF

echo "✅ 已建 $PROPOSAL_DIR/END_STATUS.md"

# 2. 建 retrospect.md template
if [ -f "$PROPOSAL_DIR/retrospect.md" ]; then
    echo "ℹ️  retrospect.md 已存在、不覆蓋"
else
    cat > "$PROPOSAL_DIR/retrospect.md" <<RETRO_EOF
# Case [${CASE}] Retrospective

⚠️ **本檔不上 public repo**（在 proposals/ 內、已 git-ignore）。
⚠️ 去敏感版的 anti-patterns 才能 commit 到 framework/anti-patterns.md。

依 [playbook/retrospect-past-case.md](../../playbook/retrospect-past-case.md) 5-step 跑。

---

## 基本資料

| 項目 | 內容 |
|---|---|
| 案件 | ${CASE} |
| 產業 | |
| 規模（去敏感區間） | NT\$ ___ 萬 / \$ ___ K USD |
| 結果 | **${OUTCOME}** |
| 時程 | YYYY-MM ~ $(date '+%Y-%m') |
| Reviewer | |
| Review 日期 | $(date '+%Y-%m-%d') |
| 對方端窗口 | |
| 我方端 PM | |

---

## Step 1：蒐集材料（30 min）

- [ ] 提案書（含各版本）
- [ ] 訪談紀錄
- [ ] 報價單
- [ ] 合約（如有簽）
- [ ] 重要 Email 往來
- [ ] 變更紀錄（CR 流程）
- [ ] 上線後 30/60/90 天回饋
- [ ] 客戶事後回饋 / 問卷
- [ ] 內部當時的判斷紀錄

## Step 2：12 模組對照（60 min）

### 01 產業市場
- 當時做到什麼程度（無 / 表面 / 完整）：
- 缺什麼：
- 學到：

### 02 競品替代
- 當時做到：
- 缺：
- 學到：

### 03 問題目標
### 04 流程藍圖
### 05 角色 RACI
### 06 資料治理
### 07 合規資安
### 08 架構 NFR
### 09 方案分階段
### 10 商務報價
### 11 驗收維運
### 12 風險反方

## Step 3：8 強制檢查項對照

| Check | 做了？ | 評 |
|---|---|---|
| A RTM | | |
| B 溝通計畫 | | |
| C 決策紀錄 | | |
| D Secure SDLC | | |
| E SBOM | | |
| F RTO/RPO | | |
| G 退出機制 | | |
| H 證據包 | | |

## Step 4：抽 Anti-Patterns（30 min）

按 framework/anti-patterns.md 4 段格式：

### AP-NEW-XX：[標題]
- **產業**：
- **階段**：訪談 / 提案 / 商務 / 交付 / 維運
- **發生**：（具體事件、可含內部代號）
- **後果**：（直接 / 間接損失）
- **根因**：（為什麼會發生）
- **教訓**：（以後遇到類似情境怎麼做）
- **對應模組**：

### AP-NEW-XX：[標題]
（複製上面格式、加更多）

## Step 5：抽 Good Patterns（15 min）

### Good Pattern XX：[標題]
- **做法**：
- **為什麼有效**：
- **ProposalOS 應加進框架嗎**：是 / 否
- **加哪裡**：

## Step 6：對 ProposalOS 框架的改進建議

- 應該加：
- 應該改：
- 應該刪：

## 客戶端 / 對方端視角學到

（依 framework/client-perspective.md 格式）

| 對方角色 | 怎麼讀我方提案 | 我方對應好不好 |
|---|---|---|

## 結論（給未來自己 + ProposalOS）

最重要的 1-3 點學習：

1.
2.
3.

---

## 填完後

\`\`\`bash
# 抽出 AP 候選（會建 anti-patterns-candidates.md）
./scripts/extract-antipatterns.sh ${CASE}

# 編輯候選檔做去敏感、然後手動複製到 framework/anti-patterns.md
# 提交去敏感版的 anti-patterns + commit + push
\`\`\`
RETRO_EOF
    echo "✅ 已建 $PROPOSAL_DIR/retrospect.md"
fi

echo ""
echo "═══════════════════════════════════════════"
echo "接下來要做（90-120 分鐘）"
echo "═══════════════════════════════════════════"
echo ""
echo "1. 填 $PROPOSAL_DIR/retrospect.md"
echo "   參考 playbook/retrospect-past-case.md 5-step 流程"
echo ""
echo "2. 填完跑："
echo "   ./scripts/extract-antipatterns.sh ${CASE}"
echo ""
echo "3. 對候選做去敏感、合併到 framework/anti-patterns.md"
echo ""
echo "4. git commit + push"
echo ""
echo "提醒："
echo "  - proposals/ 在 .gitignore、不上 public repo（含敏感資料）"
echo "  - 只有去敏感版的 anti-patterns / good patterns 才上 framework/"
echo ""
echo "結案：$PROPOSAL_DIR/END_STATUS.md（outcome: ${OUTCOME}）"
