---
name: goodlinker-proposal
description: 用 GoodLinker ProposalOS 框架引導完整顧問式系統提案流程。從產業研究、競品分析、訪談、RTM、架構、報價到反方審查 — 一步步帶完。觸發：「幫我寫提案」「新案件 kickoff」「ProposalOS」「goodlinker-proposal」「proposal flow」「系統提案規劃」。
---

# GoodLinker ProposalOS Skill

引導使用者用 **12 大模組 + 8 強制檢查項** 完成一份顧問式系統提案。

## 啟動

當使用者輸入觸發詞，先問：

1. **客戶背景**：產業？規模？
2. **痛點**：客戶嘴上說想做什麼？
3. **預算範圍**：粗估
4. **時程**：什麼時候要上線 / 簽約？
5. **窗口**：誰是 Champion？決策鏈？

然後判斷案件規模：

- < 50 萬 → 用 [templates/proposal-template-short.md](../../templates/proposal-template-short.md)
- 50-500 萬 → 用 [templates/proposal-template-standard.md](../../templates/proposal-template-standard.md)
- 500+ 萬 → 用 [templates/proposal-template-enterprise.md](../../templates/proposal-template-enterprise.md)

## 引導流程

### Phase 1：準備期（產業 / 競品 / 訪談）

1. 帶使用者讀 [模組 01 產業](../../framework/12-modules/01-industry-market.md)
2. 帶使用者讀 [模組 02 競品](../../framework/12-modules/02-competitors-alternatives.md)
3. 用 [interview-script.md](../../playbook/interview-script.md) 準備訪談
4. 訪談紀錄整理 → 對應 [模組 03 痛點](../../framework/12-modules/03-problem-business-goals.md)
5. **必檢查**：產銷人發財 5 個 function 是否都覆蓋

### Phase 2：分析期（流程 / 角色 / 資料）

6. As-Is / To-Be / 服務藍圖（[模組 04](../../framework/12-modules/04-as-is-to-be-service-blueprint.md)）
7. 角色與 RACI（[模組 05](../../framework/12-modules/05-stakeholders-raci.md)）
8. 資料盤點與整合（[模組 06](../../framework/12-modules/06-data-integration-governance.md)）

### Phase 3：設計期（合規 / 架構 / 方案）

9. 合規 + 資安 + AI 風險（[模組 07](../../framework/12-modules/07-compliance-security-ai-risk.md)）
10. 系統架構 + NFR（[模組 08](../../framework/12-modules/08-architecture-functional-nfr.md)）
11. 三方案 + 分階段（[模組 09](../../framework/12-modules/09-solution-options-phased-rollout.md)）
12. 依產業挑 [industry-addons/](../../framework/industry-addons/)

### Phase 4：商務期（報價 / 驗收 / 風險）

13. 報價 + 商務條款（[模組 10](../../framework/12-modules/10-procurement-pricing.md)）
14. 驗收 + 效益追蹤 + 維運（[模組 11](../../framework/12-modules/11-acceptance-benefits-operations.md)）
15. 風險 + 假設 + 責任邊界（[模組 12](../../framework/12-modules/12-risk-assumptions-red-team.md)）

### Phase 5：強制檢查項

對照 [framework/8-mandatory-checks/](../../framework/8-mandatory-checks/) 8 項：

- A RTM 雙向可追？
- B 溝通計畫？
- C 決策紀錄機制？
- D Secure SDLC？
- E SBOM + License？
- F RTO / RPO + 回滾？
- G 退出機制？
- H 證據包 ≥ 3 case？

### Phase 6：反方審查

跑一次 [playbook/red-team-questions.md](../../playbook/red-team-questions.md)：

- 客戶法務 視角 ≥ 10 題
- 客戶 IT / 資安 視角 ≥ 10 題
- 客戶老闆 視角 ≥ 10 題
- 客戶第一線 視角 ≥ 5 題

## 重要原則

### 引導風格

- ❌ 不要一次丟所有問題給使用者
- ❌ 不要直接幫使用者填答案（容易編造）
- ✅ 一次問 1-3 個關鍵問題、等使用者答
- ✅ 使用者回答模糊就追問（5 次「為什麼」）
- ✅ 提醒使用者哪些資料需要客戶端提供

### AI 紅線（從 ProposalOS CLAUDE.md 繼承）

- 不准編造案例、客戶名單、數字、引用源
- 不准編造法條編號、認證編號
- 客戶機敏資料不丟給無 DPA 的 AI 服務
- 用 WebSearch / WebFetch 驗證業界主張
- 過時的對話脈絡不能取代當下驗證

### 階段檢查

每階段結束、自動跑 checklist：

```
- [ ] 本階段必填項都有？
- [ ] 跟前面階段有對齊？（例：報價跟 RTM 對得起來）
- [ ] 引用的數字 / 廠商有 source？
- [ ] 進入下階段前，使用者確認紀錄了？
```

## 完成判定

提案完整的 9 個跡象：

1. RTM 雙向可追、覆蓋所有痛點
2. 至少 3 方案、有推薦
3. 報價拆項、有 TCO 3 年
4. 風險清單 ≥ 10 條、前 3 條有對策
5. 證據包 ≥ 3 個 case
6. 反方審查紀錄附在末尾
7. 退出機制寫清楚
8. RTO / RPO 有數字、有依據
9. 沒有任何沒驗的具體主張

## 相關資源

- 完整框架：[../../README.md](../../README.md)
- 一頁濃縮：[../../CHEAT-SHEET.md](../../CHEAT-SHEET.md)
- 術語：[../../GLOSSARY.md](../../GLOSSARY.md)
- 矩陣：[../../framework/MATRIX.md](../../framework/MATRIX.md)
- 案例：[../../examples/mingyang-cold-chain/](../../examples/mingyang-cold-chain/)

## 與其他 Skill 的關係

- 提案要驗證業界主張 → 用 `cove-verify`
- 寫完想找第二雙眼 → 用 `pair-review`
- 想多版本選最好 → 用 `best-version`
- 高 stakes 三層 net → 用 `verify-pipeline`
- 對外 deck / 文件最終定稿 → 用 `design-html` / `slides`
