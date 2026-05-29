# UAT 驗收簽收書 Template

> UAT 期結束、雙方簽收用。
> 對應 [模組 11 §1.3](../framework/modules/11-acceptance-benefits-operations.md) 驗收成功判定 + [uat-script-template.md §3 Exit Criteria](uat-script-template.md)。

---

## 簽收書本文

---

**案件**：{案件名稱}
**Phase**：{Phase X 末 / Phase X 起跑前 Go/No-Go gate}
**驗收期間**：{YYYY-MM-DD ~ YYYY-MM-DD}（共 {N} 週）
**驗收層級**：L3 UAT（per [模組 11 §1.2](../framework/modules/11-acceptance-benefits-operations.md)）

---

### 1. UAT case 完成

| UAT Case | RTM R-ID | UI Page / 場景 | 結果 | 備註 |
|---|---|---|---|---|
| UAT-01 | R-XX | {Page} | ☐ Pass / ☐ Pass with notes / ☐ Deferred | |
| UAT-02 | R-XX | {Page} | ☐ Pass / ☐ Pass with notes / ☐ Deferred | |
| ... | ... | ... | ... | ... |
| UAT-N | R-XX | {Page} | ☐ Pass / ☐ Pass with notes / ☐ Deferred | |

**整體**：{N} case 中 ___ 個 Pass / ___ 個 Pass with notes / ___ 個 Deferred

---

### 2. Defect 統計

| Severity | Open | Fixed + Pass | Deferred to 後階段 | 雙方同意 deferred？|
|---|---|---|---|---|
| P1 嚴重 | ___ | ___ | ___ | ☐ Yes / ☐ N/A |
| P2 高 | ___ | ___ | ___ | ☐ Yes / ☐ No |
| P3 中 | ___ | ___ | ___ | — |
| P4 低 | ___ | ___ | ___ | — |

**Exit Criteria 達成判定**：
- ☐ P1 defect = 0 open
- ☐ P2 defect 雙方同意可進下階段
- ☐ Pass rate ≥ 95%
- ☐ UAT 參與者滿意度 ≥ 4/5
- ☐ 多語系覆蓋率 ≥ 95%（如適用）
- ☐ 效能驗證 pass（API P95 / UI load 達標）

---

### 3. 規格未定項補完狀況

per [uat-script-template.md §8](uat-script-template.md)：

| UAT Case | 規格未定 | 已補？|
|---|---|---|
| UAT-XX | {規格描述} | ☐ Yes / ☐ 推下階段 |
| ... | ... | ... |

---

### 4. 簽收結論

☐ **UAT 通過** — 可進下階段（Pilot / Go-Live）
☐ **UAT 通過 with conditions** — 進下階段、但 ___ 條件須同步解
☐ **UAT 未通過** — 啟動雙方檢討、下階段延後 ___ 週

**雙方簽署**：

| 角色 | 姓名 | 簽署 | 日期 |
|---|---|---|---|
| 我方 PM | ___ | ________ | YYYY-MM-DD |
| 客戶 / 對方 PM | ___ | ________ | YYYY-MM-DD |
| 我方 CTO（或指派代表）| ___ | ________ | YYYY-MM-DD |
| 客戶 / 對方代表 | ___ | ________ | YYYY-MM-DD |

---

### 5. 雙方共同備註

```
<UAT 過程觀察 / 下階段需特別注意項 / 商務條款是否需再對齊 / 等>
```

---

**文件版本**：v0.1（每案重 fork）
**適用案件類型**：聯名 SaaS / 客戶提案 / B2B2B / 內部 review

---

## Template 用法 Tips

1. **「Pass with notes」column 重要**：完全 Pass 跟「跑通但有發現可改進」分開、避免一律打 Pass 後客戶又翻舊帳
2. **簽署人數 4 位是 minimal**：雙方 PM + 雙方代表（業務 / 技術 / 法務 → 視案件權重選）
3. **「規格未定補完狀況」必含**：本欄目是 ProposalOS framework 強制（per 模組 11 §6 規格未定追蹤）— 客戶不能 retroactively 主張「沒驗的不算 Pass」
4. **「雙方共同備註」是 retrospect 起點**：寫進去的 observation 後續 retrospect 直接拿、不浪費
5. **deferred 必雙方同意**：P2 以上 deferred 而對方沒同意 → 不能簽結 / 不能進下階段
