# framework/ — 框架核心

ProposalOS 的本體。四層架構：

```
framework/
├── 12-modules/              ← 必選骨幹（每案都要過一次）— WHAT
├── 8-mandatory-checks/      ← 強制檢查項（容易被埋的細節）— WHAT
├── industry-addons/         ← 產業加掛（依案件選用）
├── methodologies/           ← 跨領域方法論（業界成熟框架）— HOW
└── MATRIX.md                ← 12 × 8 對應矩陣
```

**WHAT vs HOW**：12 模組 / 8 檢查項 / Add-ons = **要寫什麼**；methodologies = **用什麼方法寫**。

## 使用順序

1. 先讀 `12-modules/` 確認 12 個面向有沒有大方向漏項
2. 用 `8-mandatory-checks/` 過 checklist，找出落地會爆炸的地方
3. 依產業挑選 `industry-addons/` 補強

## 怎麼判斷某個檢查項要不要做

| 標記 | 意思 |
|---|---|
| 🔴 必做 | 任何案件都不能跳過 |
| 🟡 視規模 | 小案可簡化、大案必做 |
| 🟢 看產業 | 依 industry-addons 觸發 |

每個模組與檢查項檔案內都會標出。
