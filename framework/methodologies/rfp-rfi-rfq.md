# RFP / RFI / RFQ — 三種詢問形式

客戶問我們提案、有 3 種正式形式。**搞錯就回錯東西**。

## 三種形式對比

| 縮寫 | 全名 | 客戶想知道 | 我方該給 | 通常階段 |
|---|---|---|---|---|
| **RFI** | Request for Information | 「市場上有什麼選項？」 | 公司介紹 + 能力概述 | 早期探勘 |
| **RFP** | Request for Proposal | 「給我完整方案 + 報價」 | 完整提案 | 正式評估 |
| **RFQ** | Request for Quotation | 「給我報價」 | 純報價 + 必要條款 | 規格已定、比價 |

## RFI（Request for Information）

### 特徵

- 客戶在「了解市場」階段
- 沒有明確需求書
- 通常給多家廠商
- 不一定會走到採購
- 回應通常 1-2 頁

### 我方該給

- 公司介紹（1 頁）
- 相關 case 2-3 個
- 能力概述
- **不要報價**（給了等於壓自己底）
- **不要寫完整提案**（白費功夫）

### 範例情境

> 「我們在評估冷鏈系統、想了解市場有什麼選項。能否提供你們公司簡介？」

→ 回 RFI、不要寫 40 頁提案。

### 戰略價值

- **抓 RFI 階段就贏一半**：因為你比後面參與 RFP 的廠商更早了解客戶
- 跟客戶建關係、爭取當 RFP 必邀廠商

## RFP（Request for Proposal）

### 特徵

- 客戶有明確需求書（Spec）
- 多家廠商競爭
- 通常 4-12 週準備期
- 評選委員會（評分表）
- 我方要寫完整提案
- 政府 / 國營是必走流程

### 我方該給

- 完整提案書（依規模 short / standard / enterprise）
- Compliance Matrix（逐條對應 RFP 規格）
- 報價（可分項可選 / 必選）
- 反方審查
- 證據包（case、認證、reference）

### 評選方式

| 評選 | 內容 |
|---|---|
| **最低標** | 符合規格中、價格最低 |
| **最有利標** | 技術、商務、價格加權 |
| **限制性招標** | 指定廠商（政府特殊）|

→ **最有利標**才有差異化空間。
→ **最低標**就是拼價格。

### Win 戰略

依[Shipley](shipley-apmp.md)的 Win Themes + Discriminators 設計。

## RFQ（Request for Quotation）

### 特徵

- 規格已定（spec book）
- 客戶要的是**價格**、不是方案
- 快速、可能 1-2 週
- 純比價

### 我方該給

- 對應規格的逐項報價
- 付款條件
- 交期
- 不要寫顧問式論述（客戶不看）

### 範例情境

> 「我們要 20 台溫度感測器、規格如附件，請報價」

→ 回 RFQ、別寫架構圖。

### 戰略價值

- RFQ 階段已經是商品化、利潤薄
- 想避免進入 RFQ → 早一點切入 RFI / 顧問式接觸

## 我方接觸客戶的理想路徑

```
理想：
  我方主動接觸 → 我方引導客戶定義需求 → 我方寫 RFP（協助客戶寫）
  → RFP 出來時我方規格契合度最高 → 贏

被動：
  客戶發 RFQ → 我方報價 → 拼價格 → 利潤薄
```

**Capture Plan**（[Shipley](shipley-apmp.md)）的目的就是把案件從「被動 RFQ」往「主動引導」推。

## 我方回應的判斷流程

```
收到客戶詢問
   ↓
是 RFI / RFP / RFQ？
   ↓
是 RFI：
   → 1-2 頁回 + 爭取下次見面
   → 別寫提案

是 RFP：
   → Bid/No-Bid 評分
   → No Bid：婉拒、留印象
   → Bid：跑完整 ProposalOS 12 模組
   → 政府 RFP 必含 Compliance Matrix

是 RFQ：
   → 看規格契合度
   → 契合：快速報價
   → 不契合：放棄、或建議客戶開 RFP
```

## 政府 RFP 特有

政府採購法下、RFP（公告招標）有嚴格格式：

- 公開招標 / 選擇性招標 / 限制性招標
- 押標金（招標金額 5%）
- 履約保證金（合約金額 5-10%）
- 評選委員（外部專家）
- 廠商資格限制
- 公文簽核、流程刻板

→ 政府案件用 [proposal-template-enterprise.md](../../templates/proposal-template-enterprise.md) + [Compliance Matrix](../../templates/compliance-matrix-template.md)。

## 跨國 / 大企業 RFP 特有

| 特殊要求 | 內容 |
|---|---|
| Vendor Code | 要先註冊成 vendor |
| Vendor Onboarding | 法律 / 財務 / 資安背調 |
| 集團採購框架 | Master Agreement、各子公司執行 |
| 母公司簽核 | 增加 4-12 週 |
| 多輪 Q&A | RFP 期間客戶問問題、廠商答 |
| 提案簡報 | 通常還要面對面簡報 |
| 議價 / BAFO | Best and Final Offer 階段 |

## 常見錯誤

| 錯誤 | 後果 |
|---|---|
| 把 RFI 當 RFP 寫 40 頁 | 白費功夫 |
| 把 RFQ 當 RFP 寫顧問論述 | 客戶不看、覺得脫離規格 |
| 政府 RFP 沒做 Compliance Matrix | 評委逐條扣分 |
| RFP 漏交押標金 | 直接 disqualify |
| BAFO 階段全部砍 30% | 利潤崩潰 |

## 跟 ProposalOS 整合

### 階段 0（判斷接不接）加 RFI/RFP/RFQ 判斷

```
線索進來
   ↓
是哪種詢問？
   ├── RFI → 簡短回 + 爭取見面
   ├── RFP → 評估 Bid/No-Bid → 跑完整 ProposalOS
   └── RFQ → 看規格契合度 → 快速報價 or 放棄
```

### 模板對應

| 詢問形式 | 對應模板 |
|---|---|
| RFI | 自製 1-2 頁公司簡介 |
| RFP（小）| proposal-template-short.md |
| RFP（中）| proposal-template-standard.md |
| RFP（大 / 政府）| proposal-template-enterprise.md + compliance-matrix-template.md |
| RFQ | 自製規格報價單 |

## 推薦讀物

- 政府電子採購網（gpn.gov.tw）操作指南
- APMP 對 RFP 回應的指引
- Shipley《Capturing & Proposal Guide》
