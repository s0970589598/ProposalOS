# Spine 模式 — 大型 Proposal 的 single-source-of-truth 架構

> per Amafans EAQS 2026-05 真實案例累積：proposal.md 主檔（312 行 spine）+ research/ folder（9 個 file）+ rfp-v07-section-A-IV 顧問版 755 行 — 主檔不爆炸、cross-ref 完整、reviewer 5 分鐘 navigate。

---

## 為什麼需要

大型 proposal（對等合作 RFP / 系統提案 / 顧問式提案）會產出：
- 1 個主 proposal.md
- 5-15 個 research / spec / draft / change-request file
- 多個 mockup / diagram / data file

**全部 inline 到主檔**：1000+ 行、難 review、改一處 cascade 多處
**完全分散**：沒 spine、別人讀不知道從哪看起、cross-ref 散

**Spine 模式**：主檔做 index + key finding bullet、details 放 research/ folder、必 cross-ref。

---

## 適用情境

- 大型 proposal（>5 個 research / spec 文件）
- 跨多 author / 多 session 並行 work
- 對外送（reviewer 要快 navigate）
- 內部 ship 前 cross-doc review
- 對等合作 RFP / 政府標案 / 顧問式提案 / 系統提案

## 不適用

- 簡單 1-page proposal
- < 5 supporting doc
- 1 author / 1 sitting / 趕案

---

## 目錄結構

```
proposal-name/
├── proposal.md          ← spine（300-500 行）
├── README.md            ← 案件 metadata
├── DESIGN.md            ← deck 用 brand spec（若有 deck）
├── outline.md           ← deck outline（若有 deck）
├── source-documents/    ← 對方提供的 input（RFP / PDF / spreadsheet）
├── research/            ← web research / 內部 spec / 對手分析
│   ├── 02-competitors.md
│   ├── 02b-fan-monitoring-saas-cases.md
│   ├── 03-kpi-benchmark.md
│   ├── 06-sensor-brand.md
│   ├── 07-security-compliance.md
│   ├── 08-nfr-sla.md
│   ├── cr002-tariff-ems.md
│   └── cr002-internal-spec.md
├── change-requests/     ← CR 紀錄
│   ├── CR-001-add-wind-speed.md
│   └── CR-002-add-power-box.md
├── system-design/       ← 技術 spec（data-flow / schema / fields / tech-stack）
├── architecture/        ← C4 / 架構圖
├── mockup/              ← UI mockup（HTML 純視覺、頂部標 ⚠️「MOCKUP 非真實系統」）
├── ai-handoff/          ← spec.md 給 AI codegen 接手
├── meeting-minutes/     ← 每次會議 minutes（不追溯改、歷史紀錄）
├── pending-items-tracker.md   ← 待確認事項追蹤 17 項+
├── rfp-audit.md         ← 對 RFP 跑 audit / scoring
├── rfp-v07-draft-additions.md ← V0.7 整合草稿
└── rfp-v07-section-A-IV-security-compliance.md  ← 顧問版 §A.IV
```

---

## proposal.md spine 結構（per ProposalOS 12 模組）

每 §N 模組節寫法：

1. **1-2 句 summary**（核心 finding）
2. **See:** 多個 cross-ref（既有 doc + 🆕 research file）
3. **🆕 Key finding bullet**（per research 摘要 3-5 條）
4. **⚠️ Open question / next action**（若有待解）

### 範例

```markdown
## §3. 問題定義與經營目標

**雙方共同 value prop**：環流大風場節能（per Amafans 既有定位）
- 體感降 6°C
- 年減 10,000 kg CO₂
- 可融資綠色金融

See:
- `change-requests/CR-002-add-power-box.md`
- 🆕 `research/03-kpi-benchmark-hvls-energy.md` — 2026-05-28 web research（22 sources）

**⚠️ Key finding（per 2026-05-28 research）— hero stat 需 downsize**：
- 「體感降 6°C」偏激進 — CBE Berkeley 學術 anchor 是 2-4°C / 廠商 marketing 3.3-4.4°C
- 「年減 10,000 kg CO₂」推導：台電 0.474 kgCO₂e/kWh → 反推需省 21,097 kWh/年
- 綠融資 PDF 不能單獨取代 — 要 SLL 第三方 Assurance 報告
- 建議補 KPI：Churn ≤ 10% Y1 / NPS ≥ 30 / 節能驗證準確度 ±5%
```

---

## Web Research Bundle table（主檔末尾）

主檔末尾加一個 Web Research Bundle table、列所有 research file + 一行 finding、方便 reviewer 一覽：

```markdown
## 🆕 Web Research Bundle

| # | File | 對應 § | 主要 finding |
|---|---|---|---|
| 02 | [02-competitors.md] | §2 | ... |
| 02b | [02b-fan-monitoring.md] | §2 | ... |
| 03 | [03-kpi-benchmark.md] | §3 | Amafans 6°C 偏激進、台電 0.474 ... |
| ... | ... | ... | ... |
```

---

## Anti-patterns

| AP | 描述 | 修正 |
|---|---|---|
| ❌ inline 全部 detail | 主檔 cascade 改、難維護 | 拆出去 research/ |
| ❌ 完全無 spine | reviewer 不知從哪看 | 主檔保留 spine + cross-ref |
| ❌ Cross-ref 不寫 key finding | reviewer 要點 link 才知道內容 | 每 cross-ref 配 3-5 bullet 摘要 |
| ❌ Research file 沒 §Conclusions / §Open questions | 主檔無法 summarize | 每 research file 必含結尾 2 段 |
| ❌ 主檔超過 800 行 | spine 失去 navigate 功能 | 拆 sub-doc、主檔回到 300-500 行 |

---

## 配套工具

- **spine 主檔維護**：每加一個 research → 更新主檔 cross-ref + key finding bullet
- **wiki-lint** 跨檔 sweep（情境 D / F、see `~/.claude/skills/goodlinker-wiki-lint/SKILL.md`）
- **[C-decision-log.md](../8-mandatory-checks/C-decision-log.md)** 影響範圍 list（避免漏 update）

---

## 真實案例

**Amafans × GoodLinker EAQS 2026-05**：
- proposal.md 312 行 spine + research/ 9 個 file（02 / 02b / 03 / 06 / 07 / 08 / cr002-tariff / cr002-spec / + 8 nfr）
- rfp-v07-section-A-IV 顧問版 755 行 separately
- system-design / architecture / change-requests / ai-handoff 拆 sub-folder
- pending-items-tracker.md 集中 17 待確認事項 + CR-002.a 追蹤

**Result**：
- Reviewer 5 分鐘 navigate proposal.md key findings
- Details 按需 drill-down to research/<file>
- 改一處 (e.g. 智能控制移除) sweep 5-10 file 仍可控（per wiki-lint 配套）
- 9 個 web research 平行 spawn agent、不撞 spine
