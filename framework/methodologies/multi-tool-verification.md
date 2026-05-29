# Multi-Tool Verification Protocol — 對「外部狀態事實主張」的預設工具 sequence

> per Amafans EAQS 2026-05-29 retro（本 session 累計 4 次 anti-hallucination 翻車後提煉）。對應 [AP-NEW-ANTI-HALLUC-4 Single-tool over-confidence](../anti-patterns.md)。

---

## 為什麼需要

「外部狀態事實主張」（程式碼行為 / git 歷史 / API spec / 雲端資源 / 客戶數據 / 業界採用）**不能靠單一工具下結論**：

| Layer | authoritative tool | 反證例 |
|---|---|---|
| **abstraction 文件層** | api-nexus / OpenAPI / Postman collection | 文件登記 17 支、PHP grep 找 0 |
| **implementation 實作層** | git branch + grep code | grep ElectricityController 4 支、漏 6 共用跨多 controller |
| **runtime 運行層** | PROD query / DDB / RDS scan | grep code 沒處理、但 production raw data 在收 |
| **business 商業層** | user confirm / 合約 / 會議紀錄 | 我加日期戳當新決議、實際是既有沿用 |

**單一工具 evidence scope 只 cover 1 層、claim 卻 inflate 到全部**、必翻車。

---

## 適用情境

- 寫 doc / commit / 報告中**任何具體 claim**（數字 / 識別符 / 行為 / 時序 / 配置 / 存在性）
- High-stakes 對外 deliverable（pitch / RFP / 客戶 email / ADR / blog）
- 內部 review 卡到精準度問題
- User 提反證後 root cause 分析

## 不適用

- Trivial UI tweak（顏色 / 字大小）
- 純執行 task（「跑這個指令」）
- 對話中閒聊推論

---

## 預設工具 sequence（per claim type）

### 1. API 數量 / spec / endpoint 行為

| 順序 | 工具 | 目的 |
|---|---|---|
| **1st** | api-nexus **search_apis** (`q=<keyword>`) / OpenAPI / Postman collection | **不知 module_id 時必先 search**、authoritative for 文件層 / 公開 spec |
| **1st-alt** | api-nexus **list_module_apis** (`module_id=N`) | 已知 module 時用、完整 list |
| **2nd** | git branch check + repo path（dev / uat-main / main） | 確認 implementation 對齊哪個 branch |
| **3rd** | grep PHP / TypeScript / Lambda handler（用 api-nexus return 的 `lambda_handler` 字串、不要用印象 keyword） | implementation layer 細節 |
| **4th**（optional）| PROD query / DDB scan | runtime 真實 traffic 確認 |

**規則**：
- 1st + 2nd 缺一 → claim 標「⚠️ partial-verified、需 [missing tool]」
- **search_apis 比 list_module_apis 廣**：search 涵蓋全 projects + 全 modules、適合「找某 keyword 對應 API」；list_module_apis 只 cover 指定 module
- **grep PHP 時 keyword 用 api-nexus return 的 `lambda_handler`** 而非自己想的 method 名（避免 keyword 想錯 → grep 0 → 過度推論「實作不存在」）
- 案例（per Amafans EAQS 2026-05-29 翻車 #4 + #6）：grep `energyMonthlyReport / meterKpis` 0 result、實際 controller 名 `EnergyMonthlyReportController` — api-nexus search_apis 才 reveal、grep 自己想的 keyword 必漏

### 2. Production data state（客戶 X 有 N 個 sensor / 平台收 Y 量）

| 順序 | 工具 | 目的 |
|---|---|---|
| **1st** | PROD query（DDB / RDS / shadow scan） | authoritative for runtime 真實 |
| **2nd** | DB schema grep + migration history | 結構層 evidence |
| **3rd** | controller / Lambda handler grep | process 邏輯 evidence |

**規則**：沒 PROD query → claim 一律 hedged「per [source]、PROD 待 query 驗」

### 3. 既有 default state（region / stack / version 沿用）

| 順序 | 工具 | 目的 |
|---|---|---|
| **1st** | git log first-commit 找起源 | 區分「today 決議」vs「歷史沿用」 |
| **2nd** | CLAUDE.md / README / config file 找既有聲明 | 結構層 confirm |
| **3rd** | user confirm「沿用既有 vs today 新決議」| 商業層 confirm |

**規則**：缺 git log 起源 → phrasing 用「沿用 [system X] 既有架構」、不用「YYYY-MM-DD 決議」

### 4. 業界 / 公司主張（X 公司用 Y 技術 / Z 是業界 #1）

| 順序 | 工具 | 目的 |
|---|---|---|
| **1st** | WebSearch + WebFetch 廠商官網 | authoritative for 公司公開聲明 |
| **2nd** | 第三方 industry report URL | cross-check |
| **3rd**（optional）| 業務管道打聽 / LinkedIn | 補 marketing claim 真實度 |

**規則**：純訓練資料印象 → 一律「❓ unverified、訓練資料印象、需 [tool] 查」

---

## 預檢 3 問（寫 claim 前 30 秒問完）

```
Q1: 我的 evidence 哪一層？
   - abstraction 文件層 / implementation 實作層 / runtime 運行層 / business 商業層

Q2: 我的 claim 哪一層？
   - 同上

Q3: 兩者 scope match 嗎？
   - Match → 可用對應 hedging language
   - Mismatch → claim scope 縮到 evidence 真涵蓋的範圍、或補 missing layer tool 再 claim
```

---

## Hedging language（per evidence 完整度）

| 證據完整度 | phrasing | 範例 |
|---|---|---|
| ≥ 2 tool 交叉 verified | ✅ 「per [source A] + [source B] verified」 | 「per api-nexus module 12 + war_room ElectricityController PHP grep verified」 |
| 1 tool verified、其他 layer 未查 | ⚠️ 「[source A] 顯示 X、[layer B] 未驗、需 [tool] 補」 | 「api-nexus 文件層 17 支、PHP 實作層只 grep 到 4 支、需 PROD 查 deployed 數」 |
| 推測 / 印象 | ❓ 「unverified、訓練資料印象、需 [tool] 查」 | 「Big Ass CommandSense 60% / 50% 數字 unverified vendor claim、需第三方 case study 對照」 |

---

## Numbers 必含 source 標籤

❌ 「10 支 API」
✅ 「10 支 API `[source: api-nexus module 12 / project_key=warroom / 2026-05-29]`」

❌ 「客戶留存率 95%」
✅ 「客戶留存率 95% `[source: PROD RDS retention_metrics query / 2026-05-29]`」

❌ 「平台 production-ready」
✅ 「平台 production-ready（kW + kWh backfill verified）/ power quality dashboard 即時顯示有、historical chart 待 backfill `[source: war_room ElectricityController grep + EM01 sensor data]`」

---

## Commit 前 final checkpoint（對 user-facing deliverable）

6 條自問必過：

1. ✅ 這 claim 有 **≥ 2 個 evidence**？
2. ✅ Evidence scope **match** claim scope？
3. ✅ 數字 / 識別符 / 時序 / 引用都 cite **source 標籤**？
4. ✅ Hedging language **對齊** evidence 完整度？
5. ✅ 「per X 決策」phrasing 都含 **cite source + 日期 + 決策人**？
6. ✅ **Multi-step edit 完無舊段殘留**（grep header count / search 關鍵字、避免 add new section 但忘刪 old section、造成 file 同主題重複多段、reviewer / future-you 不知哪個是 truth）— per Amafans EAQS 2026-05-29 翻車 #5

任一 ❌ → 退回去驗、不 commit。

**Tip for checkpoint #6**：
```bash
# Multi-step edit 後跑這些 quick check
grep -c "^### " <file>                # header count 對嗎
grep -n "^### " <file>                # 看是否有同 § 編號重複
git diff --stat <file>                # add line >> delete line 表示舊段沒刪
```

---

## 真實案例 dogfood（Amafans EAQS 2026-05-29 本 session）

| # | 翻車類型 | Single-tool used | Authoritative missed | Fix |
|---|---|---|---|---|
| 1 | 「不存中國境內」當 today 決議 | 抄 rfp-v07-draft 既有 phrasing | git archaeology（找起源 commit） | 拿掉 + AP-NEW-ANTI-HALLUC-2 |
| 2 | 「Tokyo 確認」當新決議 | user 一句話 | git log first-commit + CLAUDE.md 既有聲明 | 改「沿用既有」+ AP-NEW-ANTI-HALLUC-1 |
| 3 | grep code 0 推「production 不收」 | grep ElectricityController PHP | PROD raw data query | hedged 改 + AP-NEW-ANTI-HALLUC-3 |
| 4 | grep PHP 4 支推「implementation 只 4 支」| grep 1 controller | api-nexus MCP（module 12 reveal 17 支 / 10 warroom）+ user 補 dev branch context | api-nexus 解 + AP-NEW-ANTI-HALLUC-4（本檔） |
| 5 | multi-step edit 加新 §4.0-4.5 但沒刪舊 §4.2/4.3、file 同主題重複多段 | 假設 Edit 是 in-place 替換 | edit 後 grep header count / file diff stat 驗無殘留 | commit checkpoint #6 + bash quick check |

→ **預防 = multi-tool sequence + hedging default + Numbers cite + commit checkpoint (6 條)**。Single-tool answer + confident phrasing + multi-step edit 沒 final cleanup = 高 risk anti-hallucination + redundancy。
