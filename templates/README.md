# 提案範本

## 三版本選擇

| 版本 | 適用 | 預算範圍 | 簽核複雜度 | 連結 |
|---|---|---|---|---|
| **Short** | 單一痛點、4-8 週上線 | < NT$ 50 萬 | 簡單（單一決策者）| [proposal-template-short.md](proposal-template-short.md) |
| **Standard** | 多模組、3-6 個月上線 | NT$ 50-500 萬 | 中（跨部門簽核）| [proposal-template-standard.md](proposal-template-standard.md) |
| **Enterprise** | 政府、跨國、上市櫃、金融、醫療 | NT$ 500 萬+ | 高（法務 / 資安 / 採購多輪）| [proposal-template-enterprise.md](proposal-template-enterprise.md) |

## 怎麼選

```
案件預算 < 50 萬？ → Short
   ↓ 否
是政府 / 跨國 / 金融 / 醫療？ → Enterprise
   ↓ 否
50-500 萬中型案？ → Standard
```

## 升級規則

寫到一半發現案件複雜度跟模板不符 → **升級**，不要硬塞：

| 信號 | 行動 |
|---|---|
| Short 寫一寫發現要寫 NFR、SBOM | 升 Standard |
| Standard 寫一寫客戶法務要求 DPA + BAA | 升 Enterprise |
| 對方要求政府採購格式 | 升 Enterprise（直接套用） |

## 其他輔助範本

| 範本 | 用途 |
|---|---|
| [rtm-template.md](rtm-template.md) | 需求追蹤矩陣 |
| [architecture-diagram-checklist.md](architecture-diagram-checklist.md) | 架構圖必有元素 |
| [before-after-diagram-template.md](before-after-diagram-template.md) | 導入前後差異圖 |
| [pricing-breakdown-template.md](pricing-breakdown-template.md) | 報價拆項 |
| [capture-plan-template.md](capture-plan-template.md) | 大標案的事前情報蒐集（Shipley）|
| [compliance-matrix-template.md](compliance-matrix-template.md) | 政府 RFP 逐條對應 |
| [poc-pilot-pricing-template.md](poc-pilot-pricing-template.md) | Complex 情境的階梯定價 |

## 完整填寫範例

→ [examples/mingyang-cold-chain/](../examples/mingyang-cold-chain/) 含填好的 RTM、架構、報價、反方審查
