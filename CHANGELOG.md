# Changelog

依 [Keep a Changelog](https://keepachangelog.com/) 格式，[Semantic Versioning](https://semver.org/)。

## [Unreleased]

## [1.3.1] - 2026-05-27

### Added — 第一份真實案件 retrospective（含 7 個真實 anti-patterns）

- `examples/goodlinker-gcp-pitch-retrospective.md`：Goodlinker × GCP Pitch 真實案件回溯（去敏感版）
  - 12 模組對照 + 8 強制檢查項對照
  - 7 個 Good Patterns（71 修正方法論、Karpathy 三層架構、Schema propagation、7 問 sanity check、Cohort baseline + 跨產業驗證、Parking Lot、Human Review Gate）
  - 7 個真實 Anti-Patterns（AP-NEW-01 ~ 07）
  - 客戶端視角（Google Cloud 評委視角預測）
  - 對 ProposalOS 框架的具體改進建議
  - Meta-Lesson：真實 retrospect > 虛構案例

### Changed
- `framework/anti-patterns.md`：補進 7 個真實 anti-patterns + 7 問 sanity check 段（從真實 GCP pitch 案件提煉）
- `CHEAT-SHEET.md`：加 7 問 sanity check（寫具體數字 / 主張前）
- `examples/README.md`：加 retrospective 案例到清單

### 案件適用範圍擴展
- ProposalOS 適用範圍從「客戶提案」擴展到「investor / partnership pitch」
- 確認大部分原則跨用例適用、部分（DPA/SLA/退場）不適用

## [1.3.0] - 2026-05-27

### Changed — 重新定位（從 GoodLinker 內部工具 → 跨產業通用框架）

- 主 README、CLAUDE.md 改用 ProposalOS 跨產業定位（GoodLinker 是 origin、不是 owner）
- Claude Skill 改名：`goodlinker-proposal` → `proposal-os`
- Skill description 更新含 9 產業（製造 / 醫療 / 政府 / 金融 / 零售 / ESG / 食品物流 / SaaS / 營建）

### Added — 真正缺角補強

- `framework/client-perspective.md`：客戶端視角（從讀提案者角度反向設計）
- `framework/anti-patterns.md`：Anti-Patterns 庫（7 類、23 範例、待真實 case 累積）
- `framework/scoring-rubric.md`：100 分制提案品質評估（9 大項 + 加減分）

### Added — 新產業

- `framework/industry-addons/saas-software.md`：純軟體 / SaaS / 雲服務
- `framework/industry-addons/construction-realestate.md`：營建 / 不動產 / 工程
- MODULE-INDEX.md 更新含 9 產業

### Added — 真正能用

- `scripts/install-skill.sh`：安裝 proposal-os Claude Skill
- `scripts/setup-pre-commit.sh`：設定 pre-commit hook
- `playbook/retrospect-past-case.md`：過去案件 retrospective 指引

## [1.2.1] - 2026-05-27

### Added
- `DECISION-TREE.md`：5 個關鍵問題 + 自動推薦該用哪些工具 + 4 個實際案例配對

### Fixed（三層 net 驗證後事實修正）
- Shipley Associates 創立年 1985 → 1972
- 移除「McKinsey 內部訓練手冊（泄漏版）」reputational risk citation
- DORA Metrics 4 → 5（2021 加入 Reliability）+ MTTR 改為 Time to Restore Service
- 移除錯誤的《Sounds Like a Cult》Wardley 訪談 citation
- Double Diamond 5 階段 → 官方 4 階段 + 結構圖修正
- SWOT 起源修正：Albert Humphrey 1960s SRI、不是 Porter 同期
- SLSA L1-L4 → L1-L3（v1.0、2023）
- MITRE ATT&CK Tactics / Techniques 標籤對齊
- 押標金 / 履約保證金改用「法定上限」用語
- compliance-matrix 「應」歸類為強制（台灣政採實務）
- 移除《Crossing the Chasm》錯誤 Pilot Customer 歸屬
- 修正 PoC 合約 §6.2 數字與工作範例一致
- aws-serverless 修正為 plugin 含子 skill

## [1.2.0] - 2026-05-27

### Added
新增 `framework/methodologies/` 完整跨領域方法論（15 個）：

**提案方法論本身**：
- `shipley-apmp.md`：Shipley / APMP（Bid/No-Bid、Capture Plan、Win Themes、Ghosting、Pink/Red/Gold Team、Compliance Matrix、Storyboarding）
- `pyramid-principle.md`：Pyramid Principle + SCQA + MECE（McKinsey 寫作法）
- `cynefin.md`：Cynefin Framework（情境分類元方法、決定用什麼提案方法）

**需求 / 戰略分析**：
- `kano-model.md`：Kano Model（Must/Performance/Delight/Indifferent/Reverse 5 類）
- `jtbd.md`：Jobs to be Done（3 層 Job + 4 力分析）
- `pestel-swot.md`：PESTEL + SWOT + TOWS 戰略推導
- `wardley-mapping.md`：Wardley 戰略地圖
- `bmc-vpc.md`：Business Model Canvas + Value Proposition Canvas

**服務 / 體驗設計**：
- `service-design.md`：Service Design 5 階段（Discover/Define/Develop/Deliver/Operate）

**系統 / 架構**：
- `c4-model.md`：C4 Model（Context/Container/Component/Code）
- `dora-sre.md`：DORA Metrics + SRE（SLO/SLI/SLA、Error Budget、Toil、Blameless）
- `software-architecture-patterns.md`：12-Factor + DDD + Event Storming + Hexagonal + Microservices

**資安 / AI**：
- `cybersecurity-frameworks.md`：MITRE ATT&CK + Zero Trust + CIS Controls v8 + BSIMM + CSA CCM + SLSA
- `mlops-and-ai-governance.md`：MLOps Maturity + Model Cards + Datasheets + Responsible AI + RAG + AI Cost 控管

**商務**：
- `rfp-rfi-rfq.md`：三種詢問形式區分（RFI / RFP / RFQ）

新增 playbook：
- `playbook/skill-integration.md`：整合 30+ 既有 Claude Skills 到提案各階段

新增 templates：
- `templates/capture-plan-template.md`：Shipley Capture Plan
- `templates/compliance-matrix-template.md`：政府 RFP 對應
- `templates/poc-pilot-pricing-template.md`：階梯定價（PoC → Pilot → Production → Expansion）

### Changed
- 模組 01-04、07、08、10、11 加「推薦方法論」段落、連結到 methodologies/
- README.md 加 methodologies 與新 templates、playbook 章節

## [1.1.0] - 2026-05-27

### Added
- `CHEAT-SHEET.md`：一頁濃縮版（口訣 + 8 檢查項 + 流程 + 自我打分表）
- `GLOSSARY.md`：完整術語表（150+ 縮寫、中英對照、出處）
- `framework/MATRIX.md`：12 × 8 對應矩陣
- `framework/industry-addons/MODULE-INDEX.md`：從模組看 add-on 反向索引
- `examples/mingyang-cold-chain/`：完整虛構案例（明陽食品冷鏈監控）
- `templates/proposal-template-short.md`：小案版（< 50 萬）
- `templates/proposal-template-enterprise.md`：大案版（500 萬以上、政府、跨國）
- `skills/goodlinker-proposal/`：Claude Skill 化
- `scripts/check-links.sh`：自動 link check
- `scripts/new-proposal.sh`：從模板建新案
- `scripts/completeness-check.sh`：對照 12 × 8 自查
- `diagrams/`：圖檔範本與說明
- `LICENSE`（MIT）
- `CHANGELOG.md`
- `CONTRIBUTING.md`

### Changed
- `playbook/proposal-flow.md`：18 階段重組為 4 大段（準備 / 提案 / 商務 / 交付）
- `framework/12-modules/10-procurement-pricing.md`：加定價心理學（Anchor / Decoy / Bundle）
- `framework/12-modules/12-risk-assumptions-red-team.md`：釐清 vs 模組 05 RACI 的概念差異

### Fixed
- 修正 `framework/industry-addons/manufacturing.md` Purdue Model 分層錯誤（PLC、SCADA、MES、ERP 各層位置修正）
- 修正 `archive/version-history/v02-manufacturing-ai.md` 「5M1E」應為「4M1E」

## [1.0.0] - 2026-05-25

### Added
初始版本，V12 收斂自 11 版討論：

- 12 大模組（產業 / 競品 / 問題 / 流程 / 角色 / 資料 / 合規 / 架構 / 方案 / 商務 / 落地 / 風險）
- 8 強制檢查項（RTM / 溝通 / 決策 / SDLC / SBOM / RTO-RPO / 退出 / 證據）
- 7 產業加掛（製造 / 醫療 / 政府教育 / 金融 / 零售 / 能源 ESG / 食品物流）
- 5 提案範本（提案書 / RTM / 架構圖 / 前後差異 / 報價拆項）
- 5 操作 playbook（流程 / AI / 能力 / 訪談 / 反方審查）
- V1-V11 演化紀錄歸檔
- 工具評估方法論

V12 = V7 骨幹擴成 12 模組 + V11 八強制檢查 + V2/V5 產業議題 +
V3 AI 雙重角色 + V9 能力建構獨立 + V10 競品前移 + V1 視覺產出

### Added (Post-1.0 修正)
- 產銷人發財框架升級為跨產業業務功能盤點（不再綁在製造業）
- SaaS / AI Token / API 用量上限與成本控管段落
- 跨產業通用議題交叉索引（無障礙、多語、資料主權、稽核留痕等 8 項）
- 12 模組口訣補進 README
