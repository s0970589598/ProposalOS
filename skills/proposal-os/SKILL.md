---
name: proposal-os
description: 用 ProposalOS 框架引導完整顧問式系統提案流程 + 結案 retrospect 累積機制 + AI 模擬訪談 3 模式。跨產業通用（製造、醫療、政府、金融、零售、能源 ESG、食品物流、SaaS、營建）。從產業研究、競品分析、訪談（真實 / B 預判 / C 模擬）、RTM、架構、報價到反方審查；結案後引導 retrospect 累積 anti-patterns。觸發：「幫我寫提案」「新案件 kickoff」「ProposalOS」「proposal-os」「consultative proposal」「顧問式提案」「proposal flow」「系統提案規劃」「X 案結束了」「X 案輸了」「X 案贏了」「X 案簽約了」「X 案上線了」「X 案暫停了」「跑 retrospect」「結案復盤」「幫我預判 X 會怎麼回」「AI 模擬訪談」「沒訪到對象怎麼辦」「訪前準備」。
---

# ProposalOS Skill

引導使用者用 **12 大模組 + 8 強制檢查項** 完成一份顧問式系統提案。
跨產業通用、不限 GoodLinker 用。

## 啟動

當使用者輸入觸發詞、**先判斷案件類型**（不要 default 客戶提案、per AP-NEW-WRITE-5）：

### Step 1：判斷案件類型

| 類型 | 特徵 | 適用框架子集 |
|---|---|---|
| **客戶提案** | 我方賣 / 客戶買、有預算、有 RFP / RFI | 完整 12 模組 + 8 強制檢查項 |
| **投資 / Partnership pitch** | 申請投資 / startup credit、對方是投資方 | 12 模組部分 + Capture Plan 強 + Win Themes 強 |
| **聯名 / 合作 RFP** | 雙方對等、聯名產品、雙方共同擁有（如 Amafans × GoodLinker EAQS）| 模組 03/04/06/07/08/11/12 + 強制檢查 A/B/C/D/E/F + 17 待確認追蹤、**不**需競品 / 客戶引言 / 三方案 |
| **顧問報告** | 顧問 engagement 交付物 | 模組 03/04/06/07/08/11/12 + 強制檢查 A/B/C/H |
| **政府標案** | 公開招標、評選委員 | 完整 + Compliance Matrix + Shipley 全套 |
| **內部立案** | 公司內部新事業 / 預算申請 | 12 模組部分 + 商務 + 風險重 |

→ **錯誤套用 = 浪費 30% 工作量 + 章節不適用**（per AP-NEW-WRITE-5）。

### Step 2：問使用者背景

1. **案件類型**：上方哪一種？
2. **客戶 / 對方背景**：產業？規模？
3. **痛點 / 目標**：對方想達成什麼？
4. **預算 / 時程**：粗估 + deadline
5. **窗口**：誰是 Champion / 決策鏈？

### Step 3：依案件類型決定 template

**客戶提案**：
- < 50 萬 → [proposal-template-short.md](../../templates/proposal-template-short.md)
- 50-500 萬 → [proposal-template-standard.md](../../templates/proposal-template-standard.md)
- 500+ 萬 → [proposal-template-enterprise.md](../../templates/proposal-template-enterprise.md)

**投資 / Partnership pitch**：依規模類比客戶提案、Win Themes 段加重

**聯名 / 合作 RFP**：以**合作夥伴的 RFP 文件**為主、我方產 audit + 待確認追蹤 + 風險登記表

**顧問報告**：依顧問交付物格式

**政府標案**：必含 [compliance-matrix-template.md](../../templates/compliance-matrix-template.md)

## 引導流程

### Phase 1：準備期（產業 / 競品 / 訪談）

#### Phase 1.0：**WebSearch + 情報庫查詢**（per AP-NEW-WRITE-1 / 4）

⚠️ **寫 proposal 前必先跑、不可跳過、含小案**。

**動作依「未知度」決定、輸出分 3 層避免大刀小用**：

| 未知度 | 動作工作量 | 輸出格式 |
|---|---|---|
| 熟客 / 熟業界 | 5-15 min | Layer 1：5 facts 摘要 |
| 典型新客（中型案）| 15-30 min | Layer 2：完整 Capture Plan |
| 複雜 IT 整合 | 30-60 min | Layer 2 |
| 冷門 / 創新領域 | 60-90 min | Layer 3：完整 + Win Themes + 接觸計畫 |
| 政府 / 跨國集團 | 90+ min | Layer 3 |

→ **金額是參考、不是決定因素**。30 萬小案若跨國集團子公司也可能要 60 min。

#### Phase 1.0.1：先查情報庫（如有）

⚠️ **動作開始前、先查 `~/code/proposal-intelligence/`**：

```bash
# 查看客戶過去資料
ls ~/code/proposal-intelligence/clients/[客戶代號]/

# 查看對手過去資料
ls ~/code/proposal-intelligence/competitors/

# 查看產業過去資料
ls ~/code/proposal-intelligence/industries/
```

→ 有資料 → 補新研究即可、不重做。
→ 無資料 → 從 0 跑 WebSearch、結束後記得整理進情報庫。

依客戶 / 案件、查以下 6 類公開資料：

| 類別 | 查什麼 | 目的 |
|---|---|---|
| 1. 客戶基本 | 員工 / 規模 / 業務 / 創立年 / 老闆 | 案件規模驗證 |
| 2. **客戶既有 IT** ⭐ | ERP / WMS / CRM 廠商名（找 SAP 案例 / Salesforce / Oracle / 鼎新 / 鼎捷 / 東捷 客戶名單）| **整個 framing 取決於此** |
| 3. 客戶通路 / 大客戶 | B2B 客戶誰、上市櫃狀態 | 客戶端壓力來源 |
| 4. 業界競品 | 同產業 MES / SaaS / 工具廠商 | §2 競品分析 |
| 5. 法規 / 認證 | CAS / HACCP / ISO / 食安法狀態 | 合規段 |
| 6. 業界趨勢 | PESTEL、新興威脅（Vibecoding 等）| §2.3 為什麼是現在 |

**輸出**：產 [Capture Plan](../../templates/capture-plan-template.md)（事實版、含 Sources）。

→ 真實案例：祥圃 MES proposal 跑 WebSearch 後發現「已用 SAP ERP」、整個 framing 從「零基礎」改為「SAP 互補」、避免 framing 過時。

#### Phase 1.1-1.5：正常流程

1. 帶使用者讀 [模組 01 產業](../../framework/12-modules/01-industry-market.md)（用 Phase 1.0 蒐集的資料）
2. 帶使用者讀 [模組 02 競品](../../framework/12-modules/02-competitors-alternatives.md)（**必寫**、不可「待補」、per AP-NEW-WRITE-2）
3. 用 [interview-script.md](../../playbook/interview-script.md) 準備訪談（補 Phase 1.0 查不到的）
4. 訪談紀錄整理 → 對應 [模組 03 痛點](../../framework/12-modules/03-problem-business-goals.md)
5. **必檢查**：產銷人發財 5 個 function 是否都覆蓋
6. **必有檔**：[Capture Plan](../../templates/capture-plan-template.md)（per AP-NEW-WRITE-3、中型案以上必做）

### Phase 2：分析期（流程 / 角色 / 資料）

6. As-Is / To-Be / 服務藍圖（[模組 04](../../framework/12-modules/04-as-is-to-be-service-blueprint.md)）
7. 角色與 RACI（[模組 05](../../framework/12-modules/05-stakeholders-raci.md)）
8. 資料盤點與整合（[模組 06](../../framework/12-modules/06-data-integration-governance.md)）

### Phase 3：設計期（合規 / 架構 / 方案）

9. 合規 + 資安 + AI 風險（[模組 07](../../framework/12-modules/07-compliance-security-ai-risk.md)）
10. 系統架構 + NFR（[模組 08](../../framework/12-modules/08-architecture-functional-nfr.md)）
11. 三方案 + 分階段（[模組 09](../../framework/12-modules/09-solution-options-phased-rollout.md)）
12. 依產業挑 [industry-addons/](../../framework/industry-addons/)

### Phase 4：商務期（報價 / 驗收 / 風險）

13. 報價 + 商務條款（[模組 10](../../framework/12-modules/10-procurement-pricing.md)）
14. 驗收 + 效益追蹤 + 維運（[模組 11](../../framework/12-modules/11-acceptance-benefits-operations.md)）
15. 風險 + 假設 + 責任邊界（[模組 12](../../framework/12-modules/12-risk-assumptions-red-team.md)）

### Phase 5：強制檢查項

對照 [framework/8-mandatory-checks/](../../framework/8-mandatory-checks/) 8 項：

- A RTM 雙向可追？
- B 溝通計畫？
- C 決策紀錄機制？
- D Secure SDLC？
- E SBOM + License？
- F RTO / RPO + 回滾？
- G 退出機制？
- H 證據包 ≥ 3 case？

### Phase 6：反方審查

跑一次 [playbook/red-team-questions.md](../../playbook/red-team-questions.md)：

- 客戶法務 視角 ≥ 10 題
- 客戶 IT / 資安 視角 ≥ 10 題
- 客戶老闆 視角 ≥ 10 題
- 客戶第一線 視角 ≥ 5 題

## 重要原則

### 引導風格

- ❌ 不要一次丟所有問題給使用者
- ❌ 不要直接幫使用者填答案（容易編造）
- ✅ 一次問 1-3 個關鍵問題、等使用者答
- ✅ 使用者回答模糊就追問（5 次「為什麼」）
- ✅ 提醒使用者哪些資料需要客戶端提供

### AI 紅線（從 ProposalOS CLAUDE.md 繼承）

- 不准編造案例、客戶名單、數字、引用源
- 不准編造法條編號、認證編號
- 客戶機敏資料不丟給無 DPA 的 AI 服務
- 用 WebSearch / WebFetch 驗證業界主張
- 過時的對話脈絡不能取代當下驗證

### 階段檢查

每階段結束、自動跑 checklist：

```
- [ ] 本階段必填項都有？
- [ ] 跟前面階段有對齊？（例：報價跟 RTM 對得起來）
- [ ] 引用的數字 / 廠商有 source？
- [ ] 進入下階段前，使用者確認紀錄了？
```

## AI 模擬訪談（3 模式分層）

當使用者話中出現以下訊號、引導到對應模式：

### 觸發詞偵測

| 使用者說 | 對應模式 | 動作 |
|---|---|---|
| 「幫我預判 X 會怎麼回」 | **B 模式**（AI 預判 + 真實訪談）| 用 [templates/ai-interview-simulation-template.md](../../templates/ai-interview-simulation-template.md) §B 段 |
| 「訪前準備」「訪前 drill」 | **B 模式** | 同上 |
| 「AI 模擬訪談」「沒訪到對象」 | 先問用途、判斷 C1 vs C2 | 看下方 |
| 「沒訪到 deadline 緊」 | **⚠️ C2 模式** | 必過 4 紅線、預設說服改用 B |
| 「內部 brainstorm 訪談題」 | **C1 模式** | 純內部用 |

### 模式判斷流程

```
有真實對象嗎？
├── 有 → 推 B 模式（AI 預判 + 真實訪談）
│       絕對推薦、AI 增強真實訪談
└── 沒有 →
    ├── 純內部準備 / brainstorm → C1（安全）
    └── 要寫進提案 →
        ├── 還有時間訪 → 強烈建議改用 B
        └── deadline 緊 → ⚠️ C2、必過 4 紅線
```

### 4 紅線（C2 模式）

1. 必含「⚠️ AI 推論、待真實訪談」警示標頭
2. 必有替換計畫（deadline + 負責人 + 動作）
3. 絕不用具體 quote 風格 → 改用清單形式
4. 絕不放在「客戶引言」段標題下 → 改放「Pending Customer Validation」

### B 模式標準流程

如使用者要 B 模式預判：

```
Step 1 訪前預判（AI 做）：
- 蒐集對象公開資料 + 內部 baseline
- 對每題 3 信度（H/M/L）預判
- 標反向預判（客戶會迴避的點）
- 標 ⭐ 高價值題

Step 2 訪前準備：
- H 預判題 → 表面確認
- M/L → 設計追問
- 反向預判 → 側面問
- ⭐ 高價值題 → 留時間

Step 3 真實訪談（依 interview-script.md）

Step 4 訪後比對：
- 填「實際」+「差異」欄
- 找 AI 預判錯的 → anti-pattern 候選

Step 5 累積：
- 加進 framework/anti-patterns.md
- B 模式累積 6-12 個月 → AI 預判 vs 實際的 pattern 庫
```

### 紅線（任何模式都不可）

❌ 把 AI 模擬內容**直接當客戶 quote 寫進 pitch**、沒標 unverified
❌ AI 推論的「業界主張」（「Stripe / Shopify 都這樣做」）沒驗證寫進提案
❌ C2 placeholder 永久未替換（必 14 天追蹤）

→ 詳見 [playbook/ai-simulated-interview.md](../../playbook/ai-simulated-interview.md)

範例：見 [`examples/goodlinker-gcp-pitch-retrospective.md`](../../examples/goodlinker-gcp-pitch-retrospective.md)（ProposalOS 端 retrospect）+ 對應的真實 case 內部檔 `~/code/goodlinker-gcp-pitch/exploration/2026-05-27_haiui_interview_PREDICTED.md`（B 模式 demo）

## 結案 Retrospect 累積機制（重要）

當使用者話中出現結案訊號、**主動提醒跑 retrospect**：

### 觸發詞偵測

| 使用者說 | 動作 |
|---|---|
| 「X 案結束了 / 輸了 / 贏了 / 簽了 / 上線了 / 暫停了」 | 提醒：「要不要跑 retrospect？」|
| 「跑 retrospect」「結案復盤」 | 直接進入 retrospect 流程 |
| 「上次那個案子...怎樣怎樣」 | 注意聽是否在分享經驗、抓 anti-pattern 候選 |

### 提醒話術範例

```
「[X 案] 結束了？要不要跑 retrospect 把學習累積進 anti-patterns 庫？
跑：./scripts/end-proposal.sh [案件代號] [win|loss|paused|launched]
腳本會建好 retrospect.md template、引導 5-step 流程。」
```

### 跑 retrospect 的引導

如果使用者同意跑、依 [playbook/retrospect-past-case.md](../../playbook/retrospect-past-case.md) 5-step：

1. Step 1：蒐集材料（30 min）
2. Step 2：12 模組對照（60 min）
3. Step 3：8 強制檢查項對照（15 min）
4. Step 4：抽 Anti-Patterns（30 min）
5. Step 5：抽 Good Patterns（15 min）
6. Step 6：對 ProposalOS 改進建議

跑完後提醒：

```
「跑完了。下一步：
1. ./scripts/extract-antipatterns.sh [案件代號]
2. 對候選做去敏感
3. 合併到 framework/anti-patterns.md
4. git commit + push」
```

### 為什麼這個機制重要

- **手動會忘**：結案後忙下個案、忘記 retrospect、教訓沒累積
- **真實 retrospect > 虛構範例**：累積真實 anti-patterns 比寫 100 個虛構範例值錢
- **每結案 +1**：6 個月後 anti-patterns 庫從 7 個變 15-25 個

→ 詳見 [examples/goodlinker-gcp-pitch-retrospective.md](../../examples/goodlinker-gcp-pitch-retrospective.md) 第一份真實案例的 meta-lesson。

## 完成判定

提案完整的 9 個跡象：

1. RTM 雙向可追、覆蓋所有痛點
2. 至少 3 方案、有推薦
3. 報價拆項、有 TCO 3 年
4. 風險清單 ≥ 10 條、前 3 條有對策
5. 證據包 ≥ 3 個 case
6. 反方審查紀錄附在末尾
7. 退出機制寫清楚
8. RTO / RPO 有數字、有依據
9. 沒有任何沒驗的具體主張

## 相關資源

- 完整框架：[../../README.md](../../README.md)
- 一頁濃縮：[../../CHEAT-SHEET.md](../../CHEAT-SHEET.md)
- 術語：[../../GLOSSARY.md](../../GLOSSARY.md)
- 矩陣：[../../framework/MATRIX.md](../../framework/MATRIX.md)
- 案例：[../../examples/mingyang-cold-chain/](../../examples/mingyang-cold-chain/)

## 與其他 Skill 的關係

- 提案要驗證業界主張 → 用 `cove-verify`
- 寫完想找第二雙眼 → 用 `pair-review`
- 想多版本選最好 → 用 `best-version`
- 高 stakes 三層 net → 用 `verify-pipeline`
- 對外 deck / 文件最終定稿 → 用 `design-html` / `slides`
