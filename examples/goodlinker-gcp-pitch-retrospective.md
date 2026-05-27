# Case：Goodlinker × GCP Pitch — Retrospective

⚠️ **真實案件回溯、客戶名去敏感化**（依原專案規範客戶名用「客戶 A / B / C」）。
本檔依 [playbook/retrospect-past-case.md](../playbook/retrospect-past-case.md) 5-step 框架跑。

---

## 基本資料

| 項目 | 內容 |
|---|---|
| 案件性質 | **Investor / Partnership Pitch**（非傳統客戶提案）|
| 標的方 | Google Cloud Startup Program |
| 提案方 | Goodlinker（IIoT SaaS 公司）|
| 提案內容 | 用 Vertex AI Gemini 提煉客戶 IoT know-how、申請 $350K USD credit / 2 年 |
| 規模 | $350K USD（~ NT$ 1000 萬）|
| 結果 | **In Progress**（pitch v3 完成、待 2026-06-10 前正式提交 Google PM）|
| Reviewer | Allen |
| Review 日期 | 2026-05-27 |
| 原專案路徑 | `~/code/goodlinker-gcp-pitch/` |

### 跟「客戶提案」的差異

| 維度 | 客戶提案 | 本案（investor pitch）|
|---|---|---|
| 對方買方 | 採購 / IT / 法務 / 老闆 | Google PM + Startup Program 委員 |
| 競爭 | 競品廠商 | 其他申請者 + 自己跟自己（信不信得過）|
| 決策因素 | ROI / SLA / DPA | startup-fit / 資料量 / 用 case 強度 |
| 合約類型 | MSA / DPA / SLA | Google Startup Program 標準條款 |
| 後續 | 簽約 → 交付 → 驗收 | Credit → PoC → Case Study |

→ **大部分 ProposalOS 原則仍適用**（產業、競品、問題、方案、商務、風險、反方審查）。
→ **部分不適用**：DPA / SLA / 退場機制（startup credit 沒這些）。

---

## 12 模組對照

### 01 產業市場
- **當時做到**：完整 ✅
- **內容**：IIoT 大廠退潮（Siemens MindSphere → Insights Hub、GE Predix → Vernova APM、PTC 賣 ThingWorx 給 TPG $725M）+ Vibecoding 興起（Replit Agent 4 / Lovable / Bolt.new）+ a16z 估 vertical SaaS 30-40% 受 AI agent 影響 2026-2028
- **學到**：PESTEL 完整、特別「為什麼是現在」論述強

### 02 競品替代
- **當時做到**：完整 ✅，6 類競品
- **內容**：國際大廠 / Cloud IoT PaaS / 台灣本土 / Vibecoding（新威脅）/ DIY 內部 IT / Goodlinker
- **學到**：**「Vibecoding 自建」是新興 deal-loser** — ProposalOS 競品方法論應加「emerging-tech 自建」類別

### 03 問題目標
- **當時做到**：完整 ✅
- **內容**：3 個標竿客戶 + 5 件具體解法
- **走得不夠**：客戶引言段全是 placeholder（待訪談）→ 嚴重缺角

### 04 流程藍圖
- **當時做到**：架構圖完整、無 As-Is / To-Be 對比圖
- **學到**：BIM-like 整合架構 mermaid 圖、但沒畫「客戶現況 vs 導入後」差異 — 對 Google 評委可能不夠視覺化

### 05 角色 RACI
- **當時做到**：簡略（user / 1 工程師 / 業務）
- **走得不夠**：沒有 Google 端 RACI（Google PM 是 Approver？Champion？）→ 不知道 Google 端決策鏈

### 06 資料治理
- **當時做到**：完整 ✅
- **內容**：DDB 30 表 / RDS 90 BASE TABLE / IoT shadow 三層 / 537 API
- **特別好**：明標「客戶資料留 AWS、AI advisory 走 GCP」邊界 — Google 端不能拿到客戶 raw 資料

### 07 合規資安 AI
- **當時做到**：部分
- **內容**：客戶資料安全 AWS 主場、不過境
- **缺**：個資 / GDPR 跨境傳輸的合法基礎、客戶端是否簽 DPA 同意送 GCP 做 AI advisory

### 08 架構 NFR
- **當時做到**：架構強 ✅
- **內容**：mermaid 圖、shadow / DDB / Lambda / RDS 整合、GCS / BigQuery / Vertex AI 雙軌
- **學到**：4 層 TOGAF 角度沒明標、混在一張 mermaid

### 09 方案分階段
- **當時做到**：完整 ✅，Phase 0-3 timeline 含 token cost
- **特別好**：每 phase 標 owner + token cost + ADR 決策點（PL4 Go/No-Go）

### 10 商務報價
- **當時做到**：N/A（Google Startup Program 是固定 credit）
- **學到**：投資 / partnership pitch 沒有「報價」模組、但有「Phase cost」模組

### 11 驗收效益維運
- **當時做到**：完整 ✅
- **內容**：Phase 1 MVP 完成有 case study marketing 互惠、AI 採用度從 16% 月活 → 80% 目標
- **走得不夠**：沒寫 Google 端的「成功標準」是什麼（Google Cloud 怎麼算這 credit 投資成功）

### 12 風險反方
- **當時做到**：強 ✅
- **內容**：71 次自我修正 + AUDIT_unverified_claims.md + Parking Lot 概念（PL17 deal-loss、PL18 AI 月活率分母）
- **特別好**：明標「待 user review」的點、不假裝全部驗過

---

## 8 強制檢查項對照

| Check | 做了？ | 評 |
|---|---|---|
| A RTM | △ 部分 | 修正 → 主張 → 證據追蹤強，但沒做「痛點 → 功能 → 驗收」RTM |
| B 溝通計畫 | ❌ | 沒寫 Google PM 接觸節奏 |
| C 決策紀錄 | ✅ 強 | 9 個 ADR + 71 修正、業界級 |
| D Secure SDLC | N/A | 投資 pitch 不需要 |
| E SBOM | N/A | 同上 |
| F RTO/RPO | △ | 「能不能不依賴 Google」沒明寫、但 Bedrock 沉沒成本 0 算 implicit fallback |
| G 退出機制 | △ | Phase 0-3 每 phase 都有 Go/No-Go = 階段性退場 |
| H 證據包 | ✅ 強 | PROD 真實數字、cohort baseline、archive 演化紀錄 |

---

## ⭐ 走得特別好的（好 Pattern → 反向學習）

### Good Pattern 1：71 次自我修正紀錄方法論

**做法**：每修正記為 `### 修正 N：{標題}` + 「錯誤主張 / 真相 / meta-lesson / 修正動作」4 段格式。

**為什麼強**：
- 對讀者：知道你**踩過雷、不是憑空寫**
- 對自己：累積式知識、不會犯同樣錯
- 對團隊：新人接手能看演化軌跡

**ProposalOS 改進建議**：[anti-patterns.md](../framework/anti-patterns.md) 改用同樣 4 段格式（目前是條列）。

### Good Pattern 2：Karpathy LLM Wiki 三層架構

**做法**：
```
raw/         ← 證據（PROD query 結果、原始檔）
docs/+exploration/  ← synthesis（wiki page）
CLAUDE.md    ← schema（meta、規則）
```

**為什麼強**：
- raw 不可改、只能加（避免「事後改 fact」）
- wiki 可演化（LLM 持續 update）
- schema 跟 SOP 一起改

**ProposalOS 改進建議**：`examples/` 可分 `raw/`（不上 git，含敏感）+ `synthesis/`（去敏感、上 git）兩層。

### Good Pattern 3：Schema-content Propagation List

**做法**：變動 trigger → 必同步傳遍 8 個檔案、漏 1 個 = drift。

**為什麼強**：強制 cross-file 一致性、用 `scripts/lint-stale.sh` pre-commit hook 自動檢查。

**ProposalOS 改進建議**：v1.3.0 已有 `check-links.sh`，可進化成「跨檔關鍵主張一致性 lint」。

### Good Pattern 4：寫每個數字前 7 問 Sanity Check

**做法**：

```
1. 欄位真的在被 update 嗎？
2. 數字背後有業務邏輯嗎？
3. cohort 樣本同 plan / 同用途嗎？
4. 客戶 plan 歷史完整看了嗎？
5. 0% / 100% 極端值藏多層次嗎？
6. 這數字當下 query 過嗎？基數定義明寫嗎？
7. 「客戶用 X 技術」推論前驗過嗎？
```

**為什麼強**：把「驗證紀律」具體化成 checklist。

**ProposalOS 改進建議**：[CHEAT-SHEET.md](../CHEAT-SHEET.md) 可加類似「寫具體 claim 前 7 問」。

### Good Pattern 5：客戶 Cohort Baseline + 跨產業驗證

**做法**：單客戶完整挖（海瑞 8 維度）→ 同產業比較（食品 8 家）→ 跨產業遷移（橡膠 / 塑膠 / 鑄造）。

**為什麼強**：從「個案」推到「範式」、增強說服力。

**ProposalOS 改進建議**：[JTBD](../framework/methodologies/jtbd.md) + [Service Design](../framework/methodologies/service-design.md) 可整合這個「3 階段挖深」流程。

### Good Pattern 6：Parking Lot 機制

**做法**：未必會做的想法 → 不寫 ADR、寫進「Parking Lot」段（含觸發條件 + 不做的原因）。

**為什麼強**：避免 ADR 變成 backlog、ADR 只記真實決策。

**ProposalOS 改進建議**：[CONTRIBUTING.md](../CONTRIBUTING.md) 加 Parking Lot 規則。

### Good Pattern 7：Human Review Gate

**做法**：AI 產生 / 修改文件後、user 必檢查項目化（新 ADR / 數字 / 時序 / 客戶技術主張）。

**為什麼強**：明確 AI vs 人的責任邊界。

**ProposalOS 改進建議**：[playbook/ai-assistance.md](../playbook/ai-assistance.md) 加類似 review gate。

---

## ❌ 走不好的（新 Anti-Patterns）

### AP-NEW-01：客戶引言段是 Placeholder（未訪談）

- **發生**：3 個標竿客戶（A / B / C）引言全為 `> 「___（待訪談 ___）___」`
- **後果**：Google 評委會覺得 immature、提案缺真實聲音
- **根因**：訪談優先級被擱、寫 pitch 時還沒做
- **教訓**：**訪談是必修不是 nice-to-have**、提案送出前**至少 1 個真實引言**
- **對應模組**：[強制檢查項 H 證據包](../framework/8-mandatory-checks/H-evidence-pack.md)

### AP-NEW-02：對方端決策鏈不明（Google PM RACI 空白）

- **發生**：pitch 寫了 user / 工程師 / 業務 RACI、**Google 端 0 個角色**
- **後果**：不知道 Google PM 簽核流程、會跟哪些 stakeholder 講
- **根因**：投資 / partnership pitch 容易忽略對方組織
- **教訓**：投資 / partnership pitch 也要做對方端 stakeholder mapping
- **對應模組**：[模組 05 stakeholders-raci](../framework/12-modules/05-stakeholders-raci.md)

### AP-NEW-03：累積 71 修正、其中大半發生在 v1/v2

- **發生**：v1 → v2 → v3 累積 71 修正、大部分是早期就該驗
- **後果**：耗大量時間在「修錯」、不在「往前推進」
- **根因**：早期沒有 7 問 sanity check、寫了再說
- **教訓**：**事前 7 問 > 事後修 71 次**
- **對應模組**：應加入 [CHEAT-SHEET.md](../CHEAT-SHEET.md) 強制步驟

### AP-NEW-04：macOS sed 清空中文檔案（兩次踩雷）

- **發生**：`sed -i '' 's/中文 pattern/中文 replacement/g'` 對含中文檔案 = 整個檔案變 0 bytes
- **後果**：重要文件被清空（CLAUDE.md、INDEX.md）
- **根因**：macOS BSD sed 多 byte char 編碼 bug
- **教訓**：**禁用** `sed -i ''` on 含中文 / multi-byte char 檔、用 Edit tool / perl / uv python3
- **對應模組**：超出 ProposalOS 範圍、但屬於「AI / 工具使用紅線」、可加進 [CLAUDE.md](../CLAUDE.md)

### AP-NEW-05：早期 exploration 檔被 retract 後沒清乾淨

- **發生**：`exploration/A_* 到 O_*` 多個檔被後續 P/Q/W/X/Y/Z 取代、但檔案還在
- **後果**：新人看了會用錯資訊、CLAUDE.md 要寫「不要看 A-O」warning
- **根因**：怕刪掉萬一還有用、deprecation policy 不嚴
- **教訓**：retract 的檔應該**移到 archive/**、不要留原位
- **對應模組**：[CONTRIBUTING.md](../CONTRIBUTING.md) 加 deprecation 規則

### AP-NEW-06：deal-loss 對手寫不出（WebSearch 結果有限）

- **發生**：競品段對「真實 deal-loss 對手」標 PL17、待 user 內部 review
- **後果**：競品段缺最關鍵的「真實對手」資訊
- **根因**：沒做業務員訪談、台灣中小 IIoT 公開資訊有限
- **教訓**：競品分析不能只靠 WebSearch、**必訪業務員拉真實 deal-loss 紀錄**
- **對應模組**：[模組 02 competitors-alternatives](../framework/12-modules/02-competitors-alternatives.md)

### AP-NEW-07：時序 hero stat 沒標日期（「971 hr」漂移成 733 hr）

- **發生**：嘉楠 IQF false positive「971 hr」是寫 pitch 當下 30d 滑動值、查同 30d 已變 733 hr
- **後果**：數字漂移、提案外傳後客戶查不到
- **根因**：sliding window 數字沒標 query 日期
- **教訓**：**時序型 hero stat 必標**「(截至 YYYY-MM-DD)」
- **對應模組**：已寫進原專案 ADR-007、ProposalOS [CLAUDE.md](../CLAUDE.md) 「外部事實主張」段已有類似規則

---

## 客戶端視角學到（從 Google Cloud 評委角度）

依 [framework/client-perspective.md](../framework/client-perspective.md) 框架：

| 客戶角色 | 怎麼讀 pitch | 我方對應 |
|---|---|---|
| **Google PM** | 5 分鐘掃、看「startup-fit」 | Executive Summary 一頁、ONE clear ask 明確 |
| **Google Startup Program 委員** | 15-30 分鐘、看「資料量 + 用 case」 | 平台規模、cohort baseline、Phase timeline |
| **Vertex AI 技術 PM** | 30-60 分鐘、看「真的用得到 Vertex 嗎」 | 整合架構圖、Phase 0 PoC 具體 |
| **法務 / 採購** | 不在 startup program 流程 | N/A |

### 30 秒掃描注意力地圖（Google PM 視角預測）

```
1 秒 ─ 「Goodlinker × GCP」標題
3 秒 ─ 「$350K credit / 2 年」金額
5 秒 ─ 「Vertex AI Gemini」技術契合
8 秒 ─ 「98 paid 客戶 / 8.4 年 know-how」資料量
15 秒 ─ 看 mermaid 架構圖（AWS → GCP migration）
30 秒 ─ 跳到 ONE clear ask、看具體要什麼
```

→ 評估：v3 pitch 在這 30 秒抓住 PM 應該 OK。

### 客戶（Google）讀完後會做什麼

| 動作 | 機率 | 我方準備 |
|---|---|---|
| 給 Vertex AI 技術 PM 看 | 高 | 架構圖已準備 |
| 內部評選會議 | 高 | Phase timeline 清楚 |
| 跟 Bedrock 比 | 中 | 已答（Bedrock 0 真實使用）|
| 問「為什麼是 startup」（資格認定）| 中 | 沒明寫公司規模 / 募資階段 |
| 要 follow-up demo | 高 | Phase 0 PoC 6/30 前可 demo |

---

## 對 ProposalOS 框架的具體改進建議

### 應該加

1. **修正紀錄 4 段格式**：[anti-patterns.md](../framework/anti-patterns.md) 改用「錯誤主張 / 真相 / meta-lesson / 修正動作」
2. **寫具體 claim 前 7 問 sanity check**：補進 [CHEAT-SHEET.md](../CHEAT-SHEET.md)
3. **Karpathy 三層架構**：[examples/](.) 分 raw / synthesis 兩層、raw 不上 git
4. **Schema-content propagation list**：跨檔關鍵主張變動時必傳檔案清單
5. **Investor / Partnership pitch 範本**：[templates/](../templates/) 加新模板（跟客戶提案不同的子類別）
6. **「emerging-tech 自建」競品類別**：[模組 02](../framework/12-modules/02-competitors-alternatives.md) 補 Vibecoding / AI agent 自建威脅

### 應該改

1. [anti-patterns.md](../framework/anti-patterns.md) 改用 4 段格式
2. [模組 02](../framework/12-modules/02-competitors-alternatives.md) 加「業務員 deal-loss 訪談」強制步驟
3. [client-perspective.md](../framework/client-perspective.md) 加 investor / partnership pitch 視角（不只客戶採購）

### 應該刪

無

---

## 結論（給 ProposalOS）

GCP Pitch 案件給 ProposalOS 帶來的**最重要學習**：

1. **71 修正方法論 > 任何書本框架** — 真實「我以為對、實際錯」累積比任何抽象 best practice 都更值錢。ProposalOS anti-patterns.md 必須從**空模板** 進化成**真實累積**。

2. **早期 7 問 sanity check 可省一半修正** — 應該變成 ProposalOS **強制步驟**、不是 nice-to-have。

3. **客戶引言 placeholder 不可上 prod** — 訪談 ≥ 1 個真實客戶引言是**送 pitch 的最低門檻**。

4. **Karpathy 三層架構（raw / synthesis / schema）跟 ProposalOS 完全契合** — `examples/` 可重整成這個結構。

5. **ProposalOS 適用範圍比想像廣** — 不只「客戶提案」、也適用 investor / partnership pitch（雖部分條款不適用）。

---

## 結論（給原 GCP Pitch 專案）

| 動作 | 優先 |
|---|---|
| 訪談 ≥ 1 個標竿客戶、補真實引言到 pitch | 🔴 必做 |
| 補 Google 端 stakeholder mapping | 🟡 應做 |
| 補真實 deal-loss 對手（訪業務員）| 🟡 應做 |
| 改 sed 工具用法（已寫進 CLAUDE.md）| ✅ 完成 |
| 6/10 前送 Google PM | 🔴 deadline |

---

## 跟其他文件的關係

- 用 [retrospect-past-case.md](../playbook/retrospect-past-case.md) 框架跑
- 抽出的 anti-pattern 應反哺 [anti-patterns.md](../framework/anti-patterns.md)
- 客戶視角發現應反哺 [client-perspective.md](../framework/client-perspective.md)
- Good Pattern 應反哺對應模組 / methodology

## Meta-Lesson（最重要）

> **真實 retrospect 比寫 10 個虛構案例更有價值。**
>
> 從這份 retrospect 跑出的 7 個 anti-pattern 都是**虛構案例寫不出來的真實雷**。
> ProposalOS 應該往「累積真實 retrospect」方向走、不是「累積虛構範例」。
