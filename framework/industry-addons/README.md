# 產業加掛模組

不是每份提案都要寫。依產業挑選加掛。

## 怎麼選

| 客戶屬於 | 必看 |
|---|---|
| 製造業（工廠、組裝、自動化） | [manufacturing.md](manufacturing.md) |
| 醫療（醫院、診所、長照、生技） | [healthcare.md](healthcare.md) |
| 政府 / 教育 / 公共服務 | [government-education.md](government-education.md) |
| 金融（銀行、保險、證券、FinTech） | [finance.md](finance.md) |
| 零售 / 電商 / 餐飲 / 連鎖 | [retail-ecommerce.md](retail-ecommerce.md) |
| 能源 / ESG / 上市櫃永續報告 | [energy-esg.md](energy-esg.md) |
| 食品 / 冷鏈 / 物流 | [food-logistics.md](food-logistics.md) |
| **SaaS / 純軟體 / 雲服務** | [saas-software.md](saas-software.md) |
| **營建 / 不動產 / 工程** | [construction-realestate.md](construction-realestate.md) |

## 加掛原則

- 一份提案可以加掛多個（例：製造 + ESG + 食品）
- 每個加掛要對應 12 模組中的具體章節擴充
- 不要全部加上 → 提案會 bloat → 客戶看不下去
- 看客戶最痛的 1-2 個重點加掛即可

## 跨產業通用議題（交叉索引）

下列議題不限產業，但會因為**客戶屬性**而被觸發。看到觸發條件就要加進提案。

### 1. 無障礙 / 可及性（Accessibility）

| 觸發條件 | 必加 |
|---|---|
| 政府、教育、公共服務、長照 | WCAG 2.1 AA |
| 上市櫃網站 | 部分要求 |
| 客戶有高齡 / 障礙使用者 | WCAG 2.1 AA 起 |
| 跨國案件（歐美） | ADA、EAA、Section 508 |

主要 reference：[government-education.md](government-education.md)
影響模組：08 NFR、11 驗收

### 2. 多語系 / 國際化 / 在地化（i18n / l10n）

| 觸發條件 | 必加 |
|---|---|
| 跨國集團 | 至少中 / 英 |
| 工廠（東南亞勞工） | 加越 / 印 / 泰 |
| 觀光、零售 | 視客群 |
| 政府公共服務 | 客語、台語、原民語、新住民語 |

影響模組：08 架構（i18n 設計從一開始）、03 使用者

### 3. 跨國資料主權（Data Sovereignty）

| 觸發條件 | 必查 |
|---|---|
| 跨國集團 | 母國 / 子公司國 / 客戶國的資料保護法 |
| 雲端區域 | 哪個 region 合法 |
| 跨境傳輸 | GDPR Article 44-50、SCC、BCR |
| 中國市場 | PIPL、資料離境 |
| 美國市場 | CCPA、各州法規 |

主要 reference：[finance.md](finance.md)（雲端委外）、[government-education.md](government-education.md)（國家機密）
影響模組：06 資料治理、07 合規

### 4. 稽核留痕與不可竄改（Audit Trail / Immutability）

| 觸發條件 | 必加 |
|---|---|
| 食品履歷 | 批次、製程不可改 |
| 醫療病歷 | 法定 7 年 + 不可竄改 |
| 金融交易 | WORM 儲存、長期保存 |
| 政府公文 | 簽核留痕 |
| 品質系統 | 變更紀錄、ISO 稽核 |
| ESG 報告 | 排放係數、資料來源可追 |

實作方式：

- 應用層：寫入後不允許 update / delete
- 儲存層：WORM bucket（S3 Object Lock、Glacier Vault Lock）
- 區塊鏈 / hash chain（特殊產業）

影響模組：06 資料治理、07 合規、08 架構、11 維運

### 5. ESG / 碳盤查 / 永續

| 觸發條件 | 必加 |
|---|---|
| 上市櫃永續報告書 | 法定 |
| 出口歐盟（CBAM 商品）| 必加 |
| 客戶 / 銀行要求 | 供應鏈永續 |
| 評比應對（DJSI、MSCI）| 自願但越來越重要 |

主要 reference：[energy-esg.md](energy-esg.md)

### 6. 法務合約審查強度

| 客戶類型 | 強度 |
|---|---|
| 中小企業老闆說了算 | 弱（一週簽完） |
| 中大型上市櫃 | 中（法務一次審） |
| 跨國集團 | 強（母公司法務、多輪審查 4-8 週） |
| 政府 / 國營事業 | 極強（合約格式固定、不易改） |
| 金融、醫療 | 極強 + 監理單位看 |

影響模組：10 商務、12 責任邊界
特別加強：強制檢查項 [G 退出機制](../8-mandatory-checks/G-exit-plan.md)

### 7. 供應商 / 第三方風險

任何案件都要看，但這些情境特別嚴格：

| 觸發條件 | 必加 |
|---|---|
| 金融業 | 委外辦法、母公司核准 |
| 政府 | 信任應用清單、國產化 |
| 醫療 | BAA、HIPAA |
| 大客戶要 SLA | 上游 SaaS 也要承諾 |
| 用了開源套件 | SBOM、License |

主要 reference：[finance.md](finance.md)（金融委外）、強制檢查項 [E SBOM](../8-mandatory-checks/E-sbom-license-supply-chain.md)

### 8. 24/7 不停機

| 觸發條件 | 必加 |
|---|---|
| 醫療（病人安全）| Active-Active + 演練 |
| 金融（交易）| Active-Active + 異地 |
| 製造（24 小時運轉廠）| 雙機備援 |
| 零售（節慶高峰）| 自動擴展 + 容量規劃 |
| 食品冷鏈 | 邊緣告警 + 多通訊備援 |

影響：強制檢查項 [F RTO/RPO/回滾](../8-mandatory-checks/F-rto-rpo-rollback.md)

## 使用方式

提案開頭依**客戶屬性**勾選：

- [ ] 政府 / 教育 / 公共服務 → 無障礙 + 多語
- [ ] 跨國集團 → 多語 + 跨國資料主權 + 強法務
- [ ] 食品 / 醫療 / 金融 / 政府 → 稽核留痕
- [ ] 上市櫃 / 出口歐盟 → ESG
- [ ] 24 小時運轉客戶 → 不停機
- [ ] 用第三方套件 / 雲端 → 供應鏈風險

勾到的都要在 12 模組對應章節展開，**不要當作可選**。
