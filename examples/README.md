# Examples — 完整填寫範例

⚠️ **本目錄所有內容為虛構案例**，用於教學示範。
客戶名稱、數字、引述全部為示意，**非真實案件**。

## 目的

`templates/` 是空殼，看不出實際長相。本目錄提供**完整填好的範例**，新人可以對照學怎麼用。

## 案例列表

| 案例 | 產業 | 規模 | 核心議題 | 路徑 |
|---|---|---|---|---|
| **明陽食品冷鏈監控** | 食品 / 冷鏈 / 物流 | 中（300-500 萬）| IoT 監控、食品履歷、冷鏈追溯 | [mingyang-cold-chain/](mingyang-cold-chain/) |

> 未來會加：醫療診所、製造業 OEE、政府專案、零售多通路等案例。

## 怎麼用

每個案例都按 ProposalOS 標準流程跑過一次，產出物對應到框架的對應檔案：

| 範例檔 | 對應 framework / template |
|---|---|
| `README.md`（案例背景） | 模組 01-05 |
| `01-interview-notes.md` | [playbook/interview-script.md](../playbook/interview-script.md) |
| `02-rtm.md` | [templates/rtm-template.md](../templates/rtm-template.md) + [8-mandatory-checks/A-rtm.md](../framework/8-mandatory-checks/A-rtm.md) |
| `03-architecture.md` | [模組 08](../framework/12-modules/08-architecture-functional-nfr.md) + [templates/architecture-diagram-checklist.md](../templates/architecture-diagram-checklist.md) |
| `04-pricing.md` | [模組 10](../framework/12-modules/10-procurement-pricing.md) + [templates/pricing-breakdown-template.md](../templates/pricing-breakdown-template.md) |
| `05-red-team-review.md` | [playbook/red-team-questions.md](../playbook/red-team-questions.md) |

## 注意

- ❌ 不准抄這些**數字**到真實提案 — 都是示意
- ❌ 不准用這些客戶名跟外人講
- ✅ 可以學**結構**、**對話風格**、**怎麼從訪談變 RTM**
- ✅ 寫真實提案時用同樣結構，但內容必須是真客戶資料
