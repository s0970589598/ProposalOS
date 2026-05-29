# 強制檢查項（9 項：原 8 + I 部署模型）

13 大模組是「面向」，強制檢查項是「細節」。
這些東西概念上會被埋在某個模組裡，**但不單獨列出來就會被漏**。

> ⚠️ 原命名「8 mandatory checks」、2026-05-29 Amafans EAQS retrospective 後加入 I「部署模型決策」、目前 9 項。資料夾名與部分 cross-ref 仍保留「8-mandatory-checks」歷史路徑、文字索引以 9 項為準。

| 代號 | 項目 | 主要對應模組 | 簽前必交 |
|---|---|---|---|
| A | RTM 需求追蹤矩陣 | 03 / 08 / 11 | 是 |
| B | 專案溝通計畫 | 05 | 是 |
| C | 變更紀錄與決策紀錄 | 12 | 過程持續 |
| D | Secure SDLC / AppSec | 07 / 08 | 是 |
| E | SBOM、License、供應鏈風險 | 07 | 是 |
| F | RTO / RPO、備份還原、版本回滾 | 11 | 是 |
| G | 退出機制 | 10 / 11 | 是 |
| H | 提案證據包 | 全部 | 提案時 |
| **I** | **部署模型決策**（Cloud / Edge / Hybrid / On-prem）| **06 / 07 / 08 / 09 / 10 / 13** | **Phase 0 + 簽前** |

## 怎麼用

- **Phase 0**：必跑 I.1-I.5 5 問、決定部署模型基本盤
- 提案中段：用每個檢查項對照 13 模組，找漏洞
- 提案末段：把 9 個檢查項做成附錄章節
- 簽約前：法務、IT 會逐項問，每項都要有答案

## 為什麼原本是 8 個 + 為什麼新加 I

原 A-H 從 V11 落地補強版抽出來、每個對應一個「過去案件曾經出事」的情境：

| 檢查項 | 過去出事的情境 |
|---|---|
| A RTM | 簽約後客戶說「我以為包含 X」，沒法追溯需求源頭 |
| B 溝通計畫 | PM 異動 / 客戶部門協調不到，case 卡住 |
| C 決策紀錄 | 半年後爭執「當初為什麼這樣設計」 |
| D Secure SDLC | 客戶資安問「你們怎麼開發」答不出來 |
| E SBOM | log4j 等漏洞爆出來，客戶問「我們系統用了嗎」 |
| F RTO/RPO | 客戶問「壞了多久能回來」，沒有承諾 |
| G 退出機制 | 客戶法務卡「資料怎麼帶走」 |
| H 證據包 | 客戶老闆問「你做過幾個」，拿不出案例 |

新加 **I 部署模型決策**（2026-05-29 Amafans EAQS retro）對應的新出事情境：

| 檢查項 | 過去出事的情境 |
|---|---|
| **I 部署模型** | Day-1 default「Cloud-only」、Phase 5 才發現客戶 OT air-gap / 法規禁雲 / 既有 edge gateway → 重新報價、改架構、補 BOM、爆預算（per 12 HIGH stakes case Amafans EAQS retro） |

## 為何 I 必獨立、不放回 C 決策紀錄

| 觀點 | 論述 |
|---|---|
| C 是通用 ADR 格式 | 任何重大決策都該記 — 但 default 不會 force「部署模型」必記 |
| I 是 forcing function | 強制 Phase 0 過 5 問、不允許跳 |
| 簽前 deliverable 差異 | C = decision log（過程持續）；I = 部署模型決策表 + 網路架構圖 + 部署模型風險登記（簽前一次性交付）|
| 跨模組影響範圍 | I 跨 模組 06 / 07 / 08 / 09 / 10 / 13 — 比 C 個別決策影響範圍大 |

## 為何沒加 J 「Sensor scheme verified」

考量過 J「Sensor scheme verified」per 模組 13 §9，但：

| 論述 | 結論 |
|---|---|
| Sensor scheme **trigger 條件 narrow**（只 IoT / 資料採集案件）| 「Mandatory」層是「每案必過」、不適合 trigger-conditional |
| 模組 13 §9 已有完整 Decision Matrix + S/M/L tier | 已在 module 層覆蓋、不需再 mandatory check 重複 |
| Add-on `iiot-deployment.md` + `air-quality-system.md` + `hvls-fan.md` 已有 50 + 28 + 30 = 100+ 題 question bank | 場景 add-on 已 force surface、不需 mandatory check 再 force |
| AP-NEW-SENSOR-1 ~ 5 已 cross-ref 模組 13 §9 | Anti-pattern 層已 cover |

→ 結論：J「Sensor scheme」由**模組 13 §9 + add-on iiot-deployment** 三方覆蓋、不獨立成 mandatory check。

## Cross-ref

- 詳細 9 個 check → 本資料夾各 `[A-I]-*.md` 檔
- 13 模組 × 9 check 矩陣 → [`../MATRIX.md`](../MATRIX.md)
- Anti-pattern 索引 → [`../anti-patterns.md`](../anti-patterns.md)
- I 部署模型 Phase 0 連動 → [`../methodologies/phase-0-discovery.md`](../methodologies/phase-0-discovery.md) Layer 5
