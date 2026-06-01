# 產業加掛｜B2B2B Channel / 聯名 / 通路合作

> **Meta-framework upgrade**：本檔為 ProposalOS framework Day-1 consultant-question bank for B2B2B / 聯名 / 通路合作 / OEM × SaaS / ISV × Distributor case。Amafans × GoodLinker EAQS 聯名案 5 session 累積踩雷（per anti-patterns.md AP-NEW-WRITE-5.a/b/c/d/e + AP-NEW-ANTI-HALLUC-1~4 + 翻車 #12-#16）標準化成 30 題 Day-1 必過。
>
> **Scope**：B2B2B 案件 — 兩方對等聯名 / 通路加價 / OEM × SaaS / ISV × Distributor / 顧問 × 平台。**B2B-only**、不適用 B2C 通路（電商 / 零售 SKU）。本檔聚焦商務 / 法務 / 退出 split、不重複通用 IIoT 議題。
>
> **使用方式**：接到「聯名 / 通路 / partnership / OEM / channel」keyword 後啟用、跟 [iiot-deployment.md](iiot-deployment.md) 或其他 industry addon 並用。商務段 + 法務段必過 30 題。
>
> **Verification status**：SaaS reseller / channel partner 模板、revenue split formula、liability clause 都有 WebSearch verified industry baseline。具體合約條款仍需法務 case-by-case。
>
> **Last updated**：2026-05-29（initial draft v0.1）。

---

## §0 Scope — 何時觸發本 addon

### 0.1 Trigger keyword

| 中文 keyword | 英文 keyword |
|---|---|
| 聯名 / 共名 / 對等合作 | co-branding / joint / co-marketing |
| 通路合作 / 經銷 / 代理 | channel partner / reseller / distributor |
| OEM × SaaS / OEM × PaaS | OEM × SaaS |
| ISV × Distributor | ISV / VAR |
| 顧問 × 平台 | consulting × platform |
| MSA / Joint Spec / 聯名 RFP | joint spec / co-developed |
| White-label / 白牌 | white-label / private-label |
| 抽成 / revenue share / 利潤分潤 | revenue share / commission |

### 0.2 Case type 2D matrix（per anti-patterns.md AP-NEW-WRITE-5.e、翻車 #13/14 教訓）

**重要**：「聯名」+「RFP」是 **orthogonal 2 dimension**、不要 collapse 成 1 term、但也不要 over-correct 拆開。

| 商業關係 \ 文件類型 | 有 RFP | 沒 RFP（pitch / 口頭 / 合約 only）|
|---|---|---|
| **客戶提案**（賣家→客戶）| 客戶 RFP + 我方 Proposal 回應 | 一般 pitch deck |
| **聯名合作**（雙方對等）| **聯名 RFP / Joint Spec**（如 Amafans EAQS）| 聯名 pitch（如 GoodLinker × GCP）|
| **內部 review** | 內部 RFP（少見）| ADR / status update |

**本檔聚焦**：聯名 / 通路 / B2B2B 商業關係。RFP / pitch / 合約 文件類型都可能對應，本檔對所有文件類型都適用。

### 0.3 何時 NOT 用本 addon

- 純客戶提案（單向賣家→客戶）→ 用通用 13 模組、無需本 addon
- 純內部專案（單一公司內部 stakeholder）→ 不適用
- B2C 通路（電商 SKU 上架 / 經銷個人）→ ProposalOS 不適用

### 0.4 觸發後產出時機

| Phase | 對應段 |
|---|---|
| Phase 0 接案 24 hr | §1 Partnership structure（8 題）|
| Phase 1 商務段 | §2 Commercial split（8 題）|
| Phase 2 法務段 | §3 Legal / liability split（7 題）|
| Phase 2-4 聯名 deck / review | §4 Joint review meeting content（4 題）|
| Phase 6 反方審查 | §5 Anti-pattern self-check（3 題）|

---

## §1 Partnership structure（8 題）

### Q1.1 — 對等聯名 vs 主從通路 vs 白牌 OEM？

**為何問**：商業關係的 master 屬性、決定後續 split / brand / liability 全部 default。

**3 種 model 對比**：

| Model | 雙方地位 | brand presence | 客戶歸屬 | 適合 case |
|---|---|---|---|---|
| **對等聯名** | 對等、共擔風險 | 雙方 brand front-and-center | 共同 | Amafans × GoodLinker、GoodLinker × GCP |
| **主從通路** | A 是主、B 是 channel partner | A brand 主、B 輕 | A | reseller 模式、典型 SaaS 通路 |
| **白牌 OEM** | A 是 hidden、B 是表面客戶 | A 無 brand presence | B（A invisible）| white-label SaaS、ODM hardware |

**WebSearch verified**：per [Ironclad Channel Partner Agreement 文章](https://ironcladapp.com/journal/contracts/channel-partner-agreement)、不同 channel partner 結構對 IP / liability / 客戶 ownership 影響不同。

**Trigger**：所有 B2B2B 案、Phase 0 必填。

**期望答**：(a) 屬哪個 model (b) 為何選此 model (c) 競品 case 對標。

**Anti-pattern 避**：AP-NEW-WRITE-5.e 把「聯名」+「RFP」collapse 1 term；本檔保留「聯名 RFP」accurate phrasing、但明示是 2 dimension 複合。

### Q1.2 — 雙方 brand presence — front-and-center / behind / hidden？

**為何問**：(a) 對外文件 / 合約 / 客戶 facing 介面 brand 用哪一個？(b) marketing 物料雙方審否？(c) 排他 brand 規範。

**Trigger**：所有 B2B2B 案、商務 + 法務段。

**期望答**：(a) 雙方 brand 在客戶 facing 出現位置（合約 / 平台 dashboard / 客服 / marketing）(b) 排他規則（如 A 跟 B 合作期內不能跟競品聯名）(c) brand asset 使用授權書。

### Q1.3 — 客戶歸屬 — partner A / partner B / shared / 跨界共同 nurture？

**為何問**：(a) 客戶 ownership 決定 (a-1) 客戶資料誰持有 (a-2) 客戶溝通主要窗口 (a-3) 跨業務員 commission 歸誰 (a-4) 客戶不續訂雙方損失分擔。(b) 跨界 case — 雙方 sales 共同 nurture 客戶 → split 規則必明確。

**WebSearch verified**：per [Referral Rock channel partner agreement](https://referralrock.com/blog/channel-partner-agreement/)、客戶 ownership clause 是 channel partner 合約核心、若不寫死後期必爭執。

**Trigger**：所有 B2B2B 案、合約段必填。

**期望答**：(a) 客戶歸屬規則（含跨界 case）(b) 客戶資料雙方 access 規範 (c) 客戶溝通主要窗口 (d) 業務員 commission split formula。

### Q1.4 — Revenue split mechanism — 一次性 / 訂閱 / 抽成 / 階梯 / hybrid？

**為何問**：(a) 一次性 hardware → 通常按 cost + markup % 拆 (b) 訂閱 SaaS → 按 % split（典型 25-50%）(c) 抽成 → 按客戶 LTV 抽 (d) 階梯 → 量越大某方拿越多 (e) hybrid — hardware 歸 A / SaaS 歸 B + 互拿 referral fee。

**WebSearch verified**：per [Terms.Law SaaS Partnership template](https://terms.law/2023/01/20/saas-partnership-agreement-essential-clauses-free-template/)、SaaS partner 典型 split 20-50%、affiliate 10-30%、joint venture 50/50。

**Trigger**：所有 B2B2B 案、商務段必填。

**期望答**：(a) split formula (b) 觸發階梯條件 (c) hybrid case 規則 (d) reconciliation 頻率（月 / 季 / 年）。

**Cross-ref**：§2 Commercial split deep dive。

### Q1.5 — Co-marketing budget split — 各出 / 共同 pool / one-sided？

**為何問**：(a) marketing campaign（展會 / 廣告 / 案例 / blog）成本誰付？(b) 共同 pool → 雙方各出比例、ROI 共享 (c) one-sided（A 出 marketing budget、B 配合）→ A 主導 brand。

**Trigger**：聯名 marketing 案。

**期望答**：(a) marketing budget 來源 (b) 預算決策 process (c) 個別 campaign 規則。

### Q1.6 — Co-sell incentive — partner A sales 賣 partner B 產品的 commission？

**為何問**：(a) 沒 commission → A sales 沒動機賣 B 產品 (b) commission rate 與 internal sales 對比（避免 cannibalize）(c) reporting / verification process。

**WebSearch verified**：per [Kiflo channel partner](https://www.kiflo.com/blog/how-to-build-a-channel-partner-agreement-template)、co-sell incentive 是 channel partner agreement 核心 enable 條款。

**Trigger**：聯名 + 共同 sales 案。

**期望答**：(a) commission rate (b) trigger（per deal / per renewal / per upsell）(c) reporting (d) clawback（客戶退款時 commission 回收）。

### Q1.7 — 退出機制 — 一方退出對客戶影響？

**為何問**：(a) A 退出 → 已賣客戶的 hardware/software 還能用嗎？保固由誰？(b) B 退出 → 平台還能 access 嗎？資料怎麼帶？ (c) 客戶 facing 通知 SOP。

**Trigger**：所有 B2B2B 案、合約段必填。

**期望答**：(a) 退出觸發條件 (b) 過渡期長度（典型 6-12 月）(c) 客戶 handoff plan (d) IP escrow（如 firmware open-source、client 可繼續維護）(e) liability cap 終止後仍 effective。

**Cross-ref**：[強制檢查項 G 退出機制](../8-mandatory-checks/G-exit-plan.md) + [anti-patterns.md AP-22](../anti-patterns.md#ap-22)。

### Q1.8 — 競業條款 — 排他性 vs 非排他？

**為何問**：(a) 排他 — A 在某 segment / region / vertical 不可跟競品聯名 → A 失靈活、報價需 premium (b) 非排他 — 雙方都可 multi-partner → 商業靈活、但風險競合 (c) partial — 某 vertical 排他、其他開放。

**Trigger**：所有 B2B2B 案、合約段。

**期望答**：(a) 排他範圍（vertical / region / segment / time）(b) 補償（如排他 → premium revenue split）(c) 違約罰則。

---

## §2 Commercial split（8 題）

### Q2.1 — Per-deal split formula — fixed % / tiered / volume-based / margin-based？

**為何問**：(a) fixed % → 簡單、適合 commodity SaaS (b) tiered → 量越大某方拿越多、適合 scale partnership (c) margin-based → 按毛利分、避免低 margin 案被 squeeze。

**Trigger**：所有 B2B2B 案、商務段必填。

**期望答**：(a) split formula (b) tier breakpoint (c) 邊際成本計算規則。

### Q2.2 — Onboarding cost — 誰付？

**為何問**：(a) 客戶 onboarding（site survey / 安裝 / 訓練 / 整合）有 fixed cost (b) 誰付直接影響 unit economics (c) 通常 — hardware OEM 含安裝、SaaS provider 含平台 onboarding、客戶選裝 service。

**Trigger**：所有 B2B2B 案、商務段。

**期望答**：(a) onboarding cost breakdown (b) 雙方分擔 (c) 客戶選裝 service 加價規則。

### Q2.3 — Implementation / 整合 — 誰做 / 多少 effort？

**為何問**：(a) 雙方 system integration 工程量（API / SDK / firmware bridge / data sync）通常 underestimated → AP-NEW-WRITE-1 (b) 誰主導整合決定平台架構 (c) 整合工程量 budget。

**WebSearch verified**：per [SaaS Reseller template](https://www.business-in-a-box.com/template/saas-reseller-agreement-D12728/)、SaaS reseller 必含 implementation responsibility clause。

**Trigger**：所有 B2B2B 案、技術段。

**期望答**：(a) 整合 scope (b) 工程量 + budget (c) 雙方責任 (d) 變更 process（per IIoT addon CR 流程）。

### Q2.4 — 售後支援 — 誰收第一通電話？Tier 1 / 2 / 3 split？

**為何問**：(a) Tier 1 — 客戶端 helpdesk、誰接？(b) Tier 2 — 技術問題、誰主導 diagnostic？(c) Tier 3 — 工程 escalation、誰負責 root cause？(d) 不明確 → 客戶被 ping-pong、爆怒。

**Trigger**：所有 B2B2B 案、合約 + 維運段。

**期望答**：(a) Tier 1/2/3 owner (b) escalation SLA (c) handoff SOP (d) joint training（避免 Tier 1 推球）。

### Q2.5 — SLA 賠償 — 誰賠 / 多少 cap？

**為何問**：(a) 客戶 SLA breach claim、向誰要錢？(b) 雙方分賠 vs 一方主賠 vs 按 root cause 歸 (c) liability cap。

**Trigger**：所有 B2B2B 案、合約段。

**期望答**：(a) SLA breach 賠償 formula (b) 雙方 cap (c) 保險覆蓋 (d) 客戶 facing 流程（誰收 claim、誰回應）。

**Cross-ref**：§3.2 Liability cap per partner。

### Q2.6 — Pricing transparency to customer — 客戶看到雙方價格 vs bundled？

**為何問**：(a) bundled price → 客戶看單一價、雙方內部 split (b) itemized → 客戶看 hardware / SaaS / service 分項、可挑減項 (c) 客戶 procurement 偏好 itemized 但聯名 simplicity 偏 bundled。

**Trigger**：所有 B2B2B 案、商務段。

**期望答**：(a) bundled / itemized 策略 (b) 客戶 procurement preference (c) discount 透明度。

### Q2.7 — Pricing tier — joint or independent？

**為何問**：(a) joint tier — S/M/L bundle、雙方統一定價 (b) independent — 各自有 tier、合 deal 時臨時拼 (c) joint tier 對 channel sales 好教育 / 報價快、但 less flexible。

**Trigger**：所有 B2B2B 案、商務段。

**期望答**：(a) pricing tier 策略 (b) 同步機制（價格更新雙方同步）(c) discount approval matrix。

### Q2.8 — Discount authority — 雙方獨立 / 聯合審 / 一方主審？

**為何問**：(a) 雙方獨立 → 客戶可玩雙方 (b) 聯合審 → 慢、但 unified (c) 一方主審 → 通常 SaaS 主審（因為 SaaS 是 recurring）。

**Trigger**：所有 B2B2B 案、商務段。

**期望答**：(a) discount authority matrix (b) approval workflow (c) emergency clause（大客戶 fast-track）。

---

## §3 Legal / liability split（7 題）

### Q3.1 — 合約結構 — 三方 vs 雙方 vs MSA + 子合約？

**為何問**：(a) 三方合約（A + B + 客戶）→ 法律最清、但 negotiation 慢 3× (b) 雙方合約 + B 是 A 的 sub-contractor → 客戶只跟 A 簽、A 跟 B 內部背對 (c) MSA + 子合約 → 雙方先簽 MSA、客戶 SOW per case 簽。

**WebSearch verified**：per [Ironclad Channel Partner](https://ironcladapp.com/journal/contracts/channel-partner-agreement) + [Terms.Law SaaS](https://terms.law/2023/01/20/saas-partnership-agreement-essential-clauses-free-template/)、合約結構是 partnership 法務基石。

**Trigger**：所有 B2B2B 案、Phase 0 法務段。

**期望答**：(a) 合約結構選 (b) 為何選此 (c) 客戶法務 preference (d) negotiation timeline。

### Q3.2 — Liability cap per partner — joint and several / proportional / individual？

**為何問**：(a) joint and several → 任一 partner 對客戶整損賠 100%、partner 間 internal split (b) proportional → 按 root cause / 責任比例分賠 (c) individual cap — 各自賠各自 portion、客戶可能要分頭追。

**Trigger**：所有 B2B2B 案、合約段。

**期望答**：(a) liability model (b) cap per partner (c) joint defense fund (d) 保險 cover。

### Q3.3 — IP ownership — joint IP / unilateral / licensed？

**為何問**：(a) joint development 的 IP（如雙方 co-design 的 firmware）歸誰？(b) 共有 IP → license back 給對方使用 (c) 單方 IP + license 給對方 (d) 客戶 customization 的 IP 歸客戶 / 雙方 / 一方？

**WebSearch verified**：per [UpCounsel Revenue Share Partnership](https://www.upcounsel.com/revenue-share-partnership-agreement)、IP ownership 是 partnership 法務最常爭議點。

**Trigger**：所有有 co-development 案、合約段。

**期望答**：(a) 既有 IP（partner A / B 各自帶來）背景授權 (b) joint IP 歸屬 (c) 客戶 customization IP (d) 退出時 IP handoff。

**Cross-ref**：[anti-patterns.md AP-23 智財權含糊](../anti-patterns.md#ap-23)。

### Q3.4 — 個資 / DPA — controller vs processor 角色？

**為何問**：(a) GDPR / 台灣個資法 — controller（決定處理目的）vs processor（受託處理）角色不同 (b) B2B2B 案 — partner A 可能是 controller、partner B 是 processor （或共同 controllers）(c) 客戶 individual user 個資處理規範。

**Trigger**：跨國 / 涉個資 case、合約段。

**期望答**：(a) 角色定義 (b) DPA 簽 (c) sub-processor 規範 (d) 通報義務。

**Cross-ref**：[anti-patterns.md AP-21 DPA 沒準備](../anti-patterns.md#ap-21)。

### Q3.5 — Cross-border — 各 partner region constraint？

**為何問**：(a) 一方在中國 → 個資不出境（PIPL）(b) 一方在歐盟 → GDPR + SCC (c) 雙方在台灣 + 客戶在歐盟 → 仍需處理跨境傳輸 (d) data residency 規範。

**Trigger**：跨國 partner / 客戶 case。

**期望答**：(a) 雙方 entity location (b) 客戶 region (c) data residency 規範 (d) cross-border transfer mechanism（SCC / BCR / adequacy decision）。

### Q3.6 — Termination clause — 觸發條件 + 過渡期？

**為何問**：(a) 何時可終止（material breach / change of control / insolvency / convenience）(b) 過渡期內客戶服務維持 (c) 終止後 IP / data / 客戶歸屬。

**Trigger**：所有 B2B2B 案、合約段。

**期望答**：(a) termination trigger (b) 過渡期長度 (c) 過渡期內責任 (d) 終止後 wind-down SOP。

### Q3.7 — 爭議解決 — 仲裁 / 法院 / mediator / 哪個 jurisdiction？

**為何問**：(a) 跨國 case — 仲裁通常優於法院 (b) jurisdiction 選擇對 cost / time / 結果預測度都不同 (c) mediator 是 escalation 前的 soft 解。

**Trigger**：跨國 case / 大金額 case、合約段。

**期望答**：(a) 爭議解決機制 (b) jurisdiction (c) arbitration body（如 ICC / HKIAC / SIAC）(d) 適用法律。

---

## §4 Joint review meeting deck content（4 題、per Amafans EAQS Phase 1D audience needs analysis）

**Why**：聯名 case 的 review meeting 不是「sales pitch 對方」、是「雙方共同對齊」— audience-centric framing。Amafans EAQS 案踩過 AP-NEW-WRITE-5.a/b/c 教訓。

### Q4.1 — 雙方 leadership 想看到什麼 vs 工程 vs 法務？

**為何問**：(a) leadership — 商業 outcome / 戰略對齊 / 風險高層 view (b) 工程 — 技術細節 / 整合 spec / SLA / 變更 process (c) 法務 — 合約條款 / liability / IP / 退出。

**Trigger**：聯名 joint review meeting 前。

**期望答**：每 audience 對應 deck section + 詳細度 + 強調重點。

### Q4.2 — Status / blockers / actions split per audience？

**為何問**：(a) leadership — 高層 status + 重大 blocker + 戰略 action (b) 工程 — 技術 blocker + 雙方 work item (c) 法務 — 合約 open item + sign-off action。

**Trigger**：聯名 joint review meeting 前。

**期望答**：(a) status 分層 (b) blocker triage (c) action item owner + deadline。

### Q4.3 — Commercial / 商務承諾必 explicit？

**為何問**：(a) 聯名 case 的 joint review 不是 sales pitch、商務承諾必 explicit 寫 (b) split / cap / pricing 在 deck 明示、避免後期歧義 (c) 不要 over-promise（避免 AP-07 NFR 寫太嚴）。

**Trigger**：聯名 joint review meeting 前。

**期望答**：(a) 商務承諾清單 (b) cap / exclusion 寫明 (c) 雙方 sign-off。

**Anti-pattern 避**：AP-NEW-WRITE-5.a 聯名 RFP §10 商務照 client-proposal 模板寫具體報價 / 三方案 — 聯名商務在合約 / appendix、不在 RFP / pitch 主文。

### Q4.4 — Liability split visualized — 雙方責任邊界圖？

**為何問**：(a) 文字 liability clause 客戶讀不下 (b) 視覺 split 圖（如「A 負責 fan + firmware、B 負責 platform + SaaS、共擔 SLA 賠償」）一目瞭然 (c) joint review meeting 必含。

**Trigger**：聯名 joint review meeting 前。

**期望答**：(a) 視覺 split 圖（雙方責任邊界 + 灰色地帶 + 共擔）(b) escalation routing 圖 (c) 客戶 facing 簡化版。

---

## §5 Anti-pattern self-check（3 題、per Amafans EAQS 翻車 #12-#16 累積教訓）

### Q5.1 — 聯名 ≠ RFP — 不是先有 RFP 才有聯名？

**為何問**：per anti-patterns.md AP-NEW-WRITE-5.e + 翻車 #13/14 — 「聯名」是商業關係、「RFP」是文件類型、orthogonal 2 dimension。本案可能：
- 聯名 + 有 RFP（如 Amafans EAQS）→ 聯名 RFP / Joint Spec
- 聯名 + 沒 RFP → 聯名 pitch deck（如 GoodLinker × GCP）+ MSA
- 沒聯名 + 有 RFP → 客戶 RFP + 我方 proposal response（標準 B2B 客戶提案）

**Trigger**：所有 B2B2B 案、Phase 0 必過。

**期望答**：(a) 本案商業關係 dimension 是哪個（聯名 / 通路 / 客戶提案）(b) 本案文件類型 dimension 是哪個（RFP / pitch / MSA only）(c) 兩個 dimension 對應的 framework 使用。

**Cross-ref**：[anti-patterns.md AP-NEW-WRITE-5.e](../anti-patterns.md#ap-new-write-5)。

### Q5.2 — 對方視角 vs 我方視角 — joint review 不是 sales pitch？

**為何問**：per anti-patterns.md 翻車 #12 — 把「模組 01-02 對聯名 RFP N/A」過度簡化、忽略 Intelligence 維度。聯名 case：
- **Marketing 任務（外向、說服客戶）**→ 聯名 case N/A（雙方都是內部、不需互相 sell）
- **Intelligence 任務（內向、產業 / 競品 / 客戶 deployment / 文章報導 / 法規動態作為規格設計輸入）**→ 聯名 case 仍 **mandatory**

**Trigger**：聯名 joint review meeting 前 + 寫聯名 deck 前。

**期望答**：(a) joint review 不是 sales pitch (b) Intelligence 維度仍需做（產業 / 競品 / 客戶 deployment / 法規）— 寫進 research/ 不寫進 RFP / pitch 主文 (c) audience-centric framing — 對方想看什麼。

### Q5.3 — Audit 內部分數 ≠ partner 想看 — audience-centric framing？

**為何問**：(a) 我方內部 audit / scoring（如 ProposalOS 框架完整度）≠ partner 想看 — partner 看的是商務 / 法務 / 技術風險 (b) audit-centric deck 對 partner 反而 confusing (c) 對 partner 必精簡 + 視覺化 + 商務 implication 明示。

**Trigger**：聯名 joint review meeting 前。

**期望答**：(a) 內部 audit 留內部、不放 partner deck (b) partner deck 對齊 partner audience 需求 (c) cite 內部 audit 結論、不展開過程。

---

## §6 Trigger conditions table

| 題號 | Critical 觸發條件 | 不 critical |
|---|---|---|
| Q1.1 | 所有 B2B2B 案、Phase 0 必填 | — |
| Q1.2 | 聯名 case | 純通路 reseller |
| Q1.3 | 所有 B2B2B 案、合約段 | — |
| Q1.4 | 所有 B2B2B 案、商務段 | — |
| Q1.5 | 聯名 marketing case | reseller、無 co-marketing |
| Q1.6 | 共同 sales case | 純通路 transactional |
| Q1.7 | 所有 B2B2B 案、合約段 | — |
| Q1.8 | 排他 case / 競爭敏感 | 純合作 |
| Q2.1-2.4 | 所有 B2B2B 案、商務段 | — |
| Q2.5 | 有 SLA 案 | 純一次性 hardware |
| Q2.6-2.8 | 所有 B2B2B 案、商務段 | — |
| Q3.1-3.2 | 所有 B2B2B 案、法務段 | — |
| Q3.3 | co-development case | 純 reseller |
| Q3.4 | 涉個資 / GDPR case | 純 B2B 機器 monitoring |
| Q3.5 | 跨國 case | 純台灣 |
| Q3.6-3.7 | 所有 B2B2B 案、合約段 | — |
| Q4.1-4.4 | 聯名 joint review meeting 前 | 純 reseller、無 joint review |
| Q5.1-5.3 | 所有 B2B2B 案、Phase 0 + 聯名 deck 前 | — |

---

## §7 Concrete dogfood references

### 7.1 Amafans × GoodLinker EAQS 案（2026-05-28 ~ 2026-05-29）— 本檔催生案

**Why dogfood**：本檔 §5 anti-pattern self-check 3 題全源於 Amafans EAQS 案 5 session 累積踩雷（per anti-patterns.md AP-NEW-WRITE-5.a/b/c/d/e + AP-NEW-ANTI-HALLUC-1~4 + 翻車 #12-#16）。

**核心 dogfood**：
- 翻車 #13/14 — 「聯名」+「RFP」orthogonal 2 dimension、不要 collapse、也不要 over-correct（→ §0.2 2D matrix + Q5.1）
- 翻車 #12 — 模組 01-02 N/A 過度簡化、忽略 Intelligence 維度（→ Q5.2）
- 翻車 #5 — 商務照 client-proposal 模板寫進 RFP 主文（→ Q4.3）
- AP-NEW-WRITE-5.b/c — 跨檔差異 Demo vs RFP vs 內部決議 3 維（→ §1 partnership structure 對應方）

**對應 Amafans EAQS deliverable**：
- [proposal.md](../../examples/amafans-eaqs/proposal.md)（聯名 RFP / Joint Spec 結構）
- [pending-items-tracker.md](../../examples/amafans-eaqs/pending-items-tracker.md)（多維 pending 追蹤）
- [meeting-minutes](../../examples/amafans-eaqs/meeting-minutes/)（雙方會議紀錄）

### 7.2 GoodLinker × GCP（無 RFP 聯名 pitch）— 對照組

**Why dogfood**：聯名 case 但 no RFP — 走 pitch deck + MSA only。對照 §0.2 2D matrix 的「聯名 + 沒 RFP」cell。

### 7.3 一般 SaaS reseller — 主從通路對照組

**Why dogfood**：主從通路（非對等聯名）case — 對照 §1.1 三種 model 中的「主從通路」row。

---

## §8 Anti-pattern callouts

對應本檔的 anti-pattern（per [anti-patterns.md](../anti-patterns.md)）：

| 本檔段 | 對應 anti-pattern | 教訓 |
|---|---|---|
| §0.2 2D matrix | AP-NEW-WRITE-5.e + 翻車 #13/14 | 「聯名」+「RFP」orthogonal、不要 collapse / over-correct |
| §1.1 model | AP-NEW-WRITE-5（聯名 RFP 套錯框架）| 案件類型先判斷 |
| §1.3 客戶歸屬 | AP-NEW-02 對方端決策鏈不明 | partnership 也要做對方端 stakeholder |
| §1.7 退出 | AP-22 退出機制不清 | 退出機制是讓客戶敢簽 |
| §2.3 implementation | AP-NEW-WRITE-1 WebSearch 沒做 | 整合工程量必查既有 IT |
| §3.3 IP | AP-23 智財權含糊 | 合約附錄 IP 條款必寫死 |
| §3.4 DPA | AP-21 DPA 沒準備 | 中英文事前定稿 |
| §4.3 商務承諾 | AP-NEW-WRITE-5.a 聯名 §10 客戶提案模板 | 商務在合約 / appendix |
| §5.2 Intelligence 維度 | AP-NEW-WRITE-5.d 模組 01-02 過度簡化 | Intelligence 仍 mandatory |
| §5.3 audience-centric | 翻車 #16-18 | 對 partner 用 partner 視角 |

---

## §9 Cross-ref — 對應 13 模組 / 9 強制檢查 / 其他 addon / methodologies

### 9.1 對應 13 模組

| 本檔段 | 對應模組 |
|---|---|
| §1 Partnership structure | [05 Stakeholders RACI](../modules/05-stakeholders-raci.md) |
| §2 Commercial split | [10 商務報價](../modules/10-procurement-pricing.md) + [09 方案分階段](../modules/09-solution-options-phased-rollout.md) |
| §3 Legal / liability | [07 合規](../modules/07-compliance-security-ai-risk.md) + [10 商務](../modules/10-procurement-pricing.md) + [12 風險反方](../modules/12-risk-assumptions-red-team.md) |
| §4 Joint review | [03 問題 / 目標](../modules/03-problem-business-goals.md) + [模組 05 RACI](../modules/05-stakeholders-raci.md) |
| §5 Anti-pattern | [12 風險反方](../modules/12-risk-assumptions-red-team.md) |

### 9.2 對應 9 強制檢查

| 本檔段 | 強制檢查 |
|---|---|
| §1-§2 商務 | [C 決策紀錄](../8-mandatory-checks/C-decision-log.md) |
| §1.7 + §3.6 退出 | [G 退出機制](../8-mandatory-checks/G-exit-plan.md) |
| §2.5 SLA | [F RTO/RPO/回滾](../8-mandatory-checks/F-rto-rpo-rollback.md) |
| §3 法務 | [B 溝通計畫](../8-mandatory-checks/B-communication-plan.md)（雙方 sign-off）|
| §4 audience-centric | [B 溝通計畫](../8-mandatory-checks/B-communication-plan.md) |

### 9.3 對應其他 addon

| 本檔段 | 相關 addon |
|---|---|
| 跨 addon 通用 | [iiot-deployment.md](iiot-deployment.md)（IIoT 案聯名）+ [hvls-fan.md §4](hvls-fan.md)（HVLS 聯名 5 題）|
| §3.4 個資 / DPA | [finance.md](finance.md)（金融委外）+ [healthcare.md](healthcare.md)（HIPAA / BAA）|
| §3.5 跨國 | [saas-software.md](saas-software.md)（SaaS 跨國資料）|

### 9.4 對應 methodologies

- [multi-tool-verification.md](../methodologies/multi-tool-verification.md) — 聯名 case 雙方 claim 必交叉 source verify
- [c4-model.md](../methodologies/c4-model.md) — 雙方系統責任邊界視覺化（§4.4）

---

## §10 結論

### 10.1 解決什麼

1. **B2B2B / 聯名 / 通路 Day 1 question bank** — 30 題、商業 / 法務 / 退出 / audience 4 大特殊議題
2. **Amafans EAQS 5 session 累積踩雷標準化** — 翻車 #12-#16 + AP-NEW-WRITE-5.a-e 進 framework
3. **跨產業 reusable** — IIoT × OEM × SaaS / hardware × cloud / consulting × platform / ISV × distributor 都適用

### 10.2 用法 SOP

| 階段 | 動作 |
|---|---|
| Phase 0 接案 24 hr | §0.2 2D matrix + §1 8 題 |
| Phase 1 商務段 | §2 8 題 |
| Phase 2 法務段 | §3 7 題 |
| Phase 2-4 聯名 deck / review | §4 4 題 |
| Phase 6 反方審查 | §5 3 題 self-check |

### 10.3 與其他 addon 並用

聯名 IIoT 案 = 本檔（B2B2B 結構）+ iiot-deployment.md（技術 IIoT）+ hvls-fan.md / air-quality-system.md（domain-specific）。三檔對應不同層次、不衝突。

---

**作者**：ProposalOS framework upgrade（per Amafans EAQS 2026-05-29 retro）
**版本**：v0.1 draft、2026-05-29
**Cite source**：
1. [Terms.Law SaaS Partnership Agreement template](https://terms.law/2023/01/20/saas-partnership-agreement-essential-clauses-free-template/) — SaaS partner split 20-50%
2. [Kiflo Channel Partner Agreement template](https://www.kiflo.com/blog/how-to-build-a-channel-partner-agreement-template) — channel partner clauses
3. [Ironclad Channel Partner Agreement](https://ironcladapp.com/journal/contracts/channel-partner-agreement) — 合約結構
4. [Referral Rock Channel Partner Agreement 10 parts](https://referralrock.com/blog/channel-partner-agreement/) — 客戶 ownership / commission
5. [UpCounsel Revenue Share Partnership](https://www.upcounsel.com/revenue-share-partnership-agreement) — revenue share legal
6. [ContractsCounsel Channel Partner Agreement](https://www.contractscounsel.com/t/us/channel-partner-agreement) — key terms
7. [SaaS Reseller Agreement template (Business-in-a-box)](https://www.business-in-a-box.com/template/saas-reseller-agreement-D12728/) — SaaS reseller specifics

**驗證狀態**：6 個 verified URL（commerce / legal industry baseline）+ 3 個 ⚠️ training-data hedged claim（具體 split % 行情 / liability cap 行情 / 過渡期長度行情、case-by-case 仍需法務 verify）。
