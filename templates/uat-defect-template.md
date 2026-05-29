# UAT Defect Template

> UAT 期間發現問題 → 開 ticket（Jira / Linear / 雙方共用工具、簽約後確定）。
> 對應 [uat-script-template.md §6 缺陷管理](uat-script-template.md) + [模組 11 §4 維運 SLA](../framework/12-modules/11-acceptance-benefits-operations.md)。

---

## Ticket 欄位

```yaml
# Defect ID（auto 由 ticketing 工具產）
defect_id: {案件代號}-UAT-XXX

# 發現
discovered_by: <UAT 參與者姓名>
discovered_at: <YYYY-MM-DD HH:MM>
uat_case_id: UAT-XX
ui_page: <對應 UI page>
environment: staging-{案件}

# 描述
title: <一句話描述>
description: |
  <Step by step 重現>
  - Pre-condition
  - Steps to reproduce（按 UAT case 跑、第幾 step 出問題）
  - Expected
  - Actual

# 嚴重度 + 優先級
severity: P1 / P2 / P3 / P4
priority: high / medium / low
business_impact: |
  <如不修對哪些 user / 場景有影響>

# 證據
screenshots: <附圖>
console_logs: <browser console / network tab>
http_trace_id: <如有 trace_id from API response header>
user_id: <UAT 帳號 ID>
entity_id: <如跟特定資源有關、例 sensor_id / order_id / user_id>

# 指派
assigned_to: <我方 engineer>
assigned_at: <auto>
sla_due: <per severity 自動>
  # P1: discovered_at + 24 hr
  # P2: discovered_at + 3 工作天
  # P3: discovered_at + 1 週
  # P4: backlog

# Workflow status
status: OPEN / IN_PROGRESS / FIXED_PENDING_RETEST / RETEST_FAIL / CLOSED / DEFERRED

# 修復
fixed_by: <engineer>
fixed_at: <date>
fix_commit: <git sha>
fix_description: |
  <修了什麼、為什麼>

# Re-test
retest_by: <UAT case 原 user>
retest_at: <date>
retest_result: PASS / FAIL
retest_notes: |
  <實際結果跟 expected 對得起來嗎>

# Close
closed_at: <date>
closed_by: <雙方 PM 共同 close>
```

---

## 嚴重度判定範例

| Severity | 範例 |
|---|---|
| **P1 嚴重** | 登入失敗（全部 user）/ 核心報表全部生成失敗 / 告警完全不觸發 / 跨客戶資料外洩 / 後台無法存取 / 控制指令完全失效 |
| **P2 高** | 單一 page 主功能異常但其他 OK / 特定權限角色不能用 / 多語系一語完全壞 / 某資料 type 不能上傳 / chart render 失敗 |
| **P3 中** | UI 字串錯字 / chart 顏色不對 / 排序 / 篩選異常 / tooltip 不顯示 / 標點半形全形不一致 |
| **P4 低** | 改善建議 / 「希望加 X 功能」/ 「希望加 Y 整合」/ 報表客製需求 |

---

## 雙方 review 頻率

- **每日 standup**（UAT 期、雙方各 1 人 15 min）：過 new defect + in-progress 進度
- **每週 sync**（30 min）：看 SLA 違約 / 趨勢 / 是否阻 UAT exit
- **UAT 期末總 review**（1 hr）：確認 P1/P2 全清 + P3/P4 backlog 雙方同意

---

## UAT defect vs 正式 incident 差異

| | UAT defect | 正式 incident（Go-Live 後）|
|---|---|---|
| 觸發 SLA 罰金 | ❌ 不啟動（測試期） | ✅ 啟動（per 模組 11 §4.2 P1-P4 SLA）|
| 處理時程 | 同 P1-P4 嚴重度判定 | 同 |
| Re-test 義務 | 必 | 必 |
| 客戶通知 | 不對 end-user、雙方內部處理 | end-user 必通知 |
| Root cause analysis | rare | P1/P2 必做 |

正式上線後（Go-Live 之後）才套正式 incident SLA + 罰金條款。

---

**起草**：本 template 由 ProposalOS framework 維護
**版本**：v0.1
**適用案件類型**：聯名 SaaS / 客戶提案 / B2B2B / 內部 review，均可用此 ticket 結構
