#!/bin/bash
# extract-antipatterns.sh — 從填好的 retrospect 抽 AP 候選
#
# 用法：./scripts/extract-antipatterns.sh <案件代號>
# 範例：./scripts/extract-antipatterns.sh acme-cold-chain
#
# 注意：anti-patterns 需要 user 去敏感後才能 commit 到 public repo

set -euo pipefail

if [ "$#" -lt 1 ]; then
    echo "用法：$0 <案件代號>"
    exit 1
fi

CASE="$1"
cd "$(dirname "$0")/.."

RETROSPECT="proposals/${CASE}/retrospect.md"
CANDIDATES="proposals/${CASE}/anti-patterns-candidates.md"

if [ ! -f "$RETROSPECT" ]; then
    echo "❌ 找不到 $RETROSPECT"
    echo "提示：先跑 ./scripts/end-proposal.sh ${CASE} <outcome>"
    exit 1
fi

# 用 awk 抽出 Step 4 段內的所有 ### AP-NEW- block
uv run python3 <<PYEOF
import re
import sys
from pathlib import Path

retro = Path("$RETROSPECT").read_text(encoding='utf-8')

# 找 Step 4 段、抓所有 ### AP-NEW- subsections
step4_match = re.search(r'## Step 4：.*?(?=## Step 5：|## Step 6|## 客戶端|## 結論|\Z)', retro, re.DOTALL)
if not step4_match:
    print("⚠️ 找不到 Step 4 段", file=sys.stderr)
    sys.exit(1)

step4 = step4_match.group(0)

# 抓所有 ### AP-NEW- block（直到下個 ### 或段結束）
ap_blocks = re.findall(r'### AP-NEW-.*?(?=### AP-NEW-|\Z)', step4, re.DOTALL)

# 過濾掉純 template（沒填內容的）
real_blocks = []
for block in ap_blocks:
    # 簡單 heuristic：標題後面有實際內容（非 placeholder）
    title_line = block.split('\n')[0]
    body = '\n'.join(block.split('\n')[1:])
    # 如果發生 / 後果 / 根因 / 教訓 都是空、跳過
    has_content = False
    for line in body.split('\n'):
        if line.startswith('- **') and ':' in line:
            after_colon = line.split(':', 1)[1].strip()
            # 不只剩 markdown 修飾符 / 空字串
            if after_colon and after_colon != '（具體事件、可含內部代號）' and len(after_colon.strip('*（）')) > 3:
                has_content = True
                break
    if has_content or '[標題]' not in title_line:
        real_blocks.append(block.strip())

if not real_blocks:
    print("⚠️ 沒找到實際填寫的 AP 段（都還是 template）", file=sys.stderr)
    print("   先填好 retrospect.md 的 Step 4 再跑", file=sys.stderr)
    sys.exit(1)

# 輸出 candidates 檔
header = """# Anti-Patterns 候選（從 ${CASE} retrospect 抽出）

⚠️ 以下是 RAW 候選、**需要 user 去敏感才能 commit 到 framework/anti-patterns.md**。

## 去敏感檢查 checklist

對下方每個 AP block 確認：

- [ ] 客戶名 → 改成「客戶 A / 食品業客戶 / 中型製造客戶」
- [ ] 具體金額 → 改成「NT\$ X 萬」區間
- [ ] 可識別人名（職位、稱呼） → 移除或抽象化
- [ ] 內部代號 / Lambda 名 / 表名 → 移除或抽象化
- [ ] 過度具體場景 → 抽象化為通用 pattern
- [ ] 同產業可識別細節 → 概括

## 去敏感後的合併方式

1. 編輯下方 AP block、做去敏感
2. 確認後、複製到 \`framework/anti-patterns.md\` 「真實案例累積的 Anti-Patterns」段
3. 更新 anti-patterns.md 的 Index 索引段
4. git commit + push（pre-commit hook 會跑 link check）

---

## 候選 Anti-Patterns

"""

print(header)
for block in real_blocks:
    print(block)
    print()

# 寫到 candidates 檔
Path("$CANDIDATES").write_text(header + '\n\n'.join(real_blocks) + '\n', encoding='utf-8')
print(f"\n（已寫到 $CANDIDATES）", file=sys.stderr)
PYEOF

echo ""
echo "═══════════════════════════════════════════"
echo "下一步"
echo "═══════════════════════════════════════════"
echo ""
echo "1. 開 $CANDIDATES、跑去敏感 checklist"
echo "2. 確認後、把每個 AP 複製到："
echo "   framework/anti-patterns.md 「真實案例累積的 Anti-Patterns」段"
echo "3. 更新 anti-patterns.md「Index 索引」段（對應模組）"
echo "4. 跑：./scripts/check-links.sh 確認連結通"
echo "5. git commit + push"
echo ""
echo "提醒：候選檔在 proposals/ 內、不會被 commit（已 git-ignore）。"
echo "只有去敏感過的版本進 framework/anti-patterns.md 才會 commit。"
