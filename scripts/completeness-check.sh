#!/bin/bash
# completeness-check.sh — 對照 12 模組 + 8 強制檢查項，看某份提案文件覆蓋了哪些
#
# 用法：./scripts/completeness-check.sh <提案 markdown 路徑>
# 範例：./scripts/completeness-check.sh proposals/acme-cold-chain/proposal.md

set -euo pipefail

if [ "$#" -lt 1 ]; then
    echo "用法：$0 <提案 markdown 路徑>"
    exit 1
fi

PROPOSAL="$1"

if [ ! -f "$PROPOSAL" ]; then
    echo "錯誤：找不到 $PROPOSAL"
    exit 1
fi

uv run python3 <<PYEOF
from pathlib import Path

f = Path("$PROPOSAL")
content = f.read_text(encoding='utf-8').lower()

# 12 模組關鍵字（每個模組至少要有一個出現）
modules = {
    "01 產業市場": ["產業", "市場", "趨勢", "tam"],
    "02 競品替代": ["競品", "替代", "比較", "對手"],
    "03 問題目標": ["痛點", "問題", "目標", "kpi"],
    "04 流程藍圖": ["流程", "as-is", "to-be", "service blueprint"],
    "05 角色 RACI": ["角色", "raci", "決策鏈", "stakeholder"],
    "06 資料治理": ["資料來源", "資料治理", "整合", "api"],
    "07 合規資安": ["iso", "資安", "合規", "個資", "gdpr"],
    "08 架構 NFR": ["架構", "nfr", "非功能", "可用性", "效能"],
    "09 方案分階段": ["方案", "選項", "分階段", "phase"],
    "10 商務報價": ["報價", "tco", "付款", "預算"],
    "11 驗收維運": ["驗收", "sla", "效益追蹤", "變革"],
    "12 風險反方": ["風險", "假設", "限制", "責任邊界"],
}

# 8 強制檢查項
checks = {
    "A RTM": ["rtm", "需求追蹤"],
    "B 溝通計畫": ["溝通計畫", "communication plan"],
    "C 決策紀錄": ["決策紀錄", "adr", "變更紀錄"],
    "D Secure SDLC": ["sdlc", "secure development"],
    "E SBOM": ["sbom", "license", "供應鏈"],
    "F RTO/RPO": ["rto", "rpo", "備份"],
    "G 退出機制": ["退出機制", "資料匯出", "exit"],
    "H 證據包": ["案例", "reference", "證書"],
}

print(f"## 完整度檢查：{f.name}\n")
print("### 12 模組覆蓋")
mod_score = 0
for m, kws in modules.items():
    found = any(kw in content for kw in kws)
    mark = "✅" if found else "❌"
    print(f"  {mark} {m}")
    if found:
        mod_score += 1

print(f"\n  模組覆蓋：{mod_score}/12")

print("\n### 8 強制檢查項")
chk_score = 0
for c, kws in checks.items():
    found = any(kw in content for kw in kws)
    mark = "✅" if found else "❌"
    print(f"  {mark} {c}")
    if found:
        chk_score += 1

print(f"\n  檢查項覆蓋：{chk_score}/8")

# 紅旗檢查
print("\n### 紅旗檢查")
red_flags = {
    "用「絕對 / 100% / 完美」": ["絕對", "100%", "完美"],
    "沒有量化效益": ["roi", "節省", "%/年", "萬/年", "倍"],
    "沒有 RTO/RPO 數字": ["rto", "rpo"],
}

for flag, kws in red_flags.items():
    if flag.startswith("用"):
        found = any(kw in content for kw in kws)
        mark = "⚠️ 有" if found else "✅ 無"
    else:
        found = any(kw in content for kw in kws)
        mark = "✅ 有" if found else "⚠️ 缺"
    print(f"  {mark}：{flag}")

# 總分
total = mod_score + chk_score
max_total = 20
percentage = (total / max_total) * 100
print(f"\n### 總分")
print(f"{total}/{max_total} = {percentage:.0f}%")

if percentage >= 80:
    print("✅ 提案完整度 OK")
elif percentage >= 60:
    print("⚠️ 提案完整度 中，部分模組 / 檢查項待補")
else:
    print("❌ 提案完整度 不足，多項缺漏")
PYEOF
