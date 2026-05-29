# 13 × 9 對應矩陣

13 大模組 × 9 強制檢查項的對應關係（原 8 項 A–H + 新加 I deployment model、per 2026-05-29 Amafans EAQS retro 升級）。
**每個檢查項都跨多個模組**，所以容易被埋。這張矩陣可以一眼看出每個模組要過哪些檢查。

## 主矩陣

✅ = 主要對應、⭕ = 部分相關、空白 = 不直接相關

| 模組 \ 檢查項 | A RTM | B 溝通 | C 決策 | D SDLC | E SBOM | F RTO/RPO | G 退出 | H 證據 | I 部署模型 |
|---|---|---|---|---|---|---|---|---|---|
| **01 產業市場** | | | | | | | | ✅ | |
| **02 競品替代** | | | | | | | | ✅ | ⭕ |
| **03 問題目標** | ✅ | | | | | | | ✅ | |
| **04 流程藍圖** | ✅ | ⭕ | | | | | | | ⭕ |
| **05 角色 RACI** | | ✅ | ⭕ | | | | | | |
| **06 資料治理** | ⭕ | | | ⭕ | | ⭕ | ✅ | | ✅ |
| **07 合規資安 AI** | | | | ✅ | ✅ | ⭕ | ⭕ | ✅ | ✅ |
| **08 架構 NFR** | ✅ | | ✅ | ✅ | ✅ | ✅ | | | ✅ |
| **09 方案分階段** | ⭕ | | ✅ | | | ⭕ | | | ✅ |
| **10 商務報價** | ✅ | ⭕ | ✅ | | | | ✅ | | ✅ |
| **11 驗收維運** | ✅ | ✅ | | ✅ | ⭕ | ✅ | ⭕ | | ⭕ |
| **12 風險反方** | | ✅ | ✅ | ⭕ | ⭕ | ⭕ | ⭕ | ✅ | ⭕ |
| **13 系統設計 MVP**（含 §9 Sensor Scheme Decision Matrix）| ✅ | | ✅ | ⭕ | ⭕ | | | | ✅ |

## 模組 13 §9 Sensor Scheme Decision Matrix 觸發 add-on

IoT / 感測 / 資料採集案件 → 模組 13 §9 必跑、同步觸發以下 add-on：

| 觸發 keyword | 必跑 add-on | 必跑 methodology |
|---|---|---|
| factory / sensor / OT / MQTT | `industry-addons/iiot-deployment.md`（50 題 Day-1 question bank）| `methodologies/cr-handling-protocol.md`（新 sensor CR 5 問必過）|
| HVLS / 工業風扇 / 大型風扇 | `industry-addons/hvls-fan.md` | 同上 |
| 空品 / PM2.5 / CO₂ / IAQ | `industry-addons/air-quality-system.md` | 同上 |
| 聯名 / 通路 / OEM × PaaS × 終端 | `industry-addons/b2b2b-channel-partnership.md` | `methodologies/phase-0-discovery.md` Q1.6 B2B/B2B2B scope 必先標 |

## 用法

### 從模組找檢查項

寫完模組 08（架構 NFR）→ 看橫列 → 知道要過 RTM、決策紀錄、Secure SDLC、SBOM、RTO/RPO、部署模型 六個檢查。

### 從檢查項找模組

要寫 SBOM（E）→ 看直欄 → 知道牽動模組 07（合規）、08（架構）、11（驗收）、12（風險）。寫的時候四個地方都要對齊。

新加 **I 部署模型** → 看直欄 → 牽動模組 06 / 07 / 08 / 09 / 10 / 13、必在這幾個段落都對齊「Cloud-only / Edge / Hybrid / On-prem」決策。

## 高密度交叉點（最容易出事）

| 模組 + 檢查項 | 為什麼重要 |
|---|---|
| 06 資料 × G 退出 | 客戶不續約時資料怎麼帶走 — 最容易被法務卡 |
| 07 合規 × D SDLC + E SBOM | 客戶資安問「你們怎麼開發」、「用了什麼套件」 |
| 08 架構 × F RTO/RPO | 災難復原承諾要寫在架構，不能只寫 SLA |
| 08 架構 × I 部署模型 | 「Cloud-only」default 假設踩 12 case Day-1 翻車（per Amafans EAQS retro）|
| 10 商務 × C 決策 × G 退出 | 合約條款必寫清楚（CR、退場）|
| 11 驗收 × F RTO/RPO | 驗收測試要含災難演練 |
| 12 風險 × 所有檢查項 | 風險登記表要 cover 每個檢查項的失效情境 |
| **13 §9 × I 部署模型** | Sensor scheme + edge gateway + 雲端 ingest 三件事必 align（per Amafans EAQS dogfood）|

## Anti-Pattern cross-ref

新加 10 個 anti-pattern 對應矩陣交叉點：

| AP 系列 | 來源 | 對映 module / check |
|---|---|---|
| AP-NEW-SENSOR-1 ~ 5 | 模組 13 §9 dogfood | 模組 13 + I 部署模型 + add-on iiot-deployment |
| AP-NEW-SESSION-RETRO-1 ~ 5 | `methodologies/session-retrospective.md` | 全 framework upgrade loop |
| AP-P0-1 ~ 10 | `methodologies/phase-0-discovery.md` §5 | Phase 0 → 模組 01-13 fill 前 gate |
| AP-CR-1 ~ 5 | `methodologies/cr-handling-protocol.md` §5 | C 決策紀錄 + 模組 13 §9 + 新 sensor CR |

完整 → [`anti-patterns.md`](anti-patterns.md) §Anti-Pattern Index 索引

## 自我審查

提案送出前用這張矩陣自查：

```
□ 每個 ✅ 格子都在提案中有對應段落
□ 每個 ⭕ 格子至少在風險或假設裡提到
□ 跨多個 ✅ 的檢查項，前後說法一致（沒矛盾）
□ I 部署模型決策已在 Phase 0 logged（不是 default cloud-only）
□ IoT 案：模組 13 §9 Sensor Scheme Decision Matrix 已套 S/M/L tier
```

## 與其他索引的關係

- 從**模組**看細節 → [framework/modules/](modules/)
- 從**檢查項**看細節 → [framework/8-mandatory-checks/](8-mandatory-checks/)
- 從**產業**看擴充 → [framework/industry-addons/](industry-addons/)（13 個）
- 從**方法論**看 HOW → [framework/methodologies/](methodologies/)（23 個）
- 從**模組看哪些 add-on 擴充它** → [industry-addons/MODULE-INDEX.md](industry-addons/MODULE-INDEX.md)
- Anti-patterns 索引 → [anti-patterns.md](anti-patterns.md)
