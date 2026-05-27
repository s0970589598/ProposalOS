# Changelog

依 [Keep a Changelog](https://keepachangelog.com/) 格式，[Semantic Versioning](https://semver.org/)。

## [Unreleased]

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
