# Contributing to References Library

> 新增 / 更新 / deprecate reference 的 standard procedure。
>
> 對應 `~/.claude/CLAUDE.md` 的 verification protocol：cite 任何外部 source 前必過 multi-tool verification、本 library 是累積結果。

---

## §1. 加新 reference（最常見）

### Step 1 — Library hit check（先確認沒收過）

```bash
grep -i "<keyword or URL>" /Users/ylwu/code/ProposalOS/framework/references/*.md
```

- 找到 → 確認是否要 update / 加 cited-where 欄
- 找不到 → 繼續 Step 2

### Step 2 — Source verification

- **必驗 primary URL 可解析**（WebFetch / curl HEAD、避免引死連結）
- **若 paywall** → 標 `❌ Paywall secondary cite`、找 secondary（press release / vendor blog / 第三方分析）
- **若 vendor self-claim** → 標 `⚠️ Vendor-projected`、不可作為中立 fact

### Step 3 — 選對 category file

| 內容 | File |
|---|---|
| 標準 / 法規 / 合規 | `regulatory-standards.md` |
| 學術 paper / 研究 / 經典書 | `academic-papers.md` |
| Industry analyst report（Gartner / IDC / Forrester / Deloitte / MBB / 市場研究）| `industry-analyst-reports.md` |
| Vendor product page / SaaS T&C / spec doc | `vendor-product-docs.md` |
| 真實客戶部署 case | `case-studies-references.md` |

不確定 → 預設放 `vendor-product-docs.md`、未來分流。

### Step 4 — 填完整 metadata（必填 5 欄）

```markdown
### [Source Title or Standard Name]

- **Type**: <Regulatory standard | Academic paper | Vendor doc | Case study | ...>
- **Authority**: <ISO | IEC | NIST | arXiv | Gartner | <vendor> | <author>>
- **Year / Revision**: YYYY 或 YYYY-MM-DD（標準必標版本年）
- **URL**: https://... （primary 為主、secondary 為備）
- **Hedging level**: ✅ Verified | ⚠️ Training-data | ❌ Paywall secondary
- **Cited where**:
  - `/path/to/file.md §X`
  - `/path/to/another-file.md §Y`
- **Notes**:
  - <scope / latest changes / 注意事項>
```

**5 欄缺一不行**。若某欄不適用、寫「N/A — <理由>」、不要省略。

### Step 5 — 加 cross-ref 進 `INDEX.md`

`INDEX.md` 是 trigger 路由、新 reference 必加進對應段：

- §1 By Module Trigger
- §2 By Industry Addon Trigger
- §3 By Methodology Trigger
- §4 By 8-Mandatory-Check Trigger
- §5 By Case Type
- §6 By Hedging Status（✅ / ⚠️ / ❌ 對應段）
- §7 Top 10 引用（若該 reference 已被 4+ 處引用）

### Step 6 — Commit

```bash
cd /Users/ylwu/code/ProposalOS
git add framework/references/
git commit -m "refs: add <citation-name> per <case-name> §X discovery

- new entry in <category>.md
- cross-ref added in INDEX.md §<N>
- hedging level: <✅/⚠️/❌>"
```

---

## §2. Update 既有 reference（standard revise / URL 換）

### Standard 有新版本

1. **不刪舊 entry**、加 `_archived` 標籤、保留歷史
2. 新增「Latest revision」段：

```markdown
### ASHRAE 62.1-**2025**（latest）

- **Year / Revision**: 2025（前版 -2022 → archived below）
- **URL**: <新 URL>
- ...

#### Archived: ASHRAE 62.1-2022

- **Year / Revision**: 2022（superseded by 2025）
- ...
```

3. Grep 全 framework + 既有 case：
   ```bash
   grep -rn "ASHRAE 62.1-2022" /Users/ylwu/code/ProposalOS/ /Users/ylwu/code/amafans-eaqs-proposal/
   ```
4. 評估 migration 必要性（minor revise 不必、major revise 必補 migration notes）

### URL rot

- 舊 URL 404 → 找 archive.org snapshot 或新 URL、保留舊 URL 作 historical reference

---

## §3. Deprecate stale citation

當 reference 已 obsolete（例：GCP IoT Core 2023/8/16 終止）：

1. **不刪 entry**、加 `**STATUS: DEPRECATED**` header
2. 加 supersede 指向、引導未來人查替代方案
3. 保留歷史 cited-where、給未來 case 對照舊文件用

範例：

```markdown
### GCP IoT Core **STATUS: DEPRECATED 2023-08-16**

- **Year / Revision**: 終止 2023-08-16
- **Supersede by**: AWS IoT Core / Azure IoT Hub / EMQX / HiveMQ + GCP Pub/Sub
- **URL（deprecation notice）**: https://medium.com/@arman30600/google-cloud-iot-core-was-born-in-2017-and-died-in-2023-e5a43d4218a8
- **Notes**: 引用此項時必同時 cite 替代方案
```

---

## §4. Hedging level 判定流程

```
新 source 加進來時自問：

1. 我是否 WebFetch 過 primary URL 並 read content？
   是 → ✅ Verified
   否 → 2

2. 我是 cite training-data 印象、未 WebSearch / WebFetch？
   是 → ⚠️ Training-data
   否 → 3

3. 我 cite 的是 third-party / press release / vendor blog / secondary article？
   是 → ❌ Secondary（再分 paywall vs vendor-biased）
   否 → 重新考慮上面 1-2
```

**自檢句**：cite 寫進 deliverable 時、library 標 ✅ 對應 deliverable 可寫 ✅、library 標 ⚠️ deliverable 對應段加 hedging phrasing「per training data, recommend re-verify」、library 標 ❌ deliverable 必標「secondary cite via [source A]、原報告 paywall / 非中立」。

---

## §5. Anti-patterns（不要做）

### ❌ AP-CONTRIB-1：library cite 跟 deliverable cite 不對齊 hedging

範例：
- library 標 `❌ Paywall secondary`
- deliverable 寫成「per Gartner 2025 預測 80% manufacturing on hybrid」（沒標 secondary）
- → 違反 ~/.claude/CLAUDE.md 「Hedging language must align evidence completeness」

**對策**：deliverable cite 時必複製 library hedging level、不可升 level

### ❌ AP-CONTRIB-2：URL 沒 verify 就加

範例：
- 收到「ISO 27001 連結 https://www.iso.org/standard/<wrong-number>.html」
- 沒 WebFetch 確認、直接加 library
- 未來案件引用該 URL → 客戶點開發現是錯的標準

**對策**：每筆 URL 加 library 前、必 WebFetch 至少一次（即使是 standard org 官網）

### ❌ AP-CONTRIB-3：把 vendor testimonial 當第三方 verified

範例：
- IKEA × MacroAir case 從 MacroAir testimonial 引
- library 標 ✅ Verified（錯）
- 應標 `⚠️ Vendor-projected`

**對策**：第三方 = third-party press / 客戶自家公告 / 政府 / 學術；vendor 自家 testimonial = vendor self-claim

### ❌ AP-CONTRIB-4：把 standard 跨類別硬塞（ASHRAE 塞 healthcare、HIPAA 塞 manufacturing）

範例：
- HIPAA 不適用於台灣 manufacturing 客戶、library 加進 manufacturing addon trigger 段
- → 未來新案誤引

**對策**：cross-ref `INDEX.md` 嚴格按實際適用範圍、不貪 keyword match

### ❌ AP-CONTRIB-5：忘了同步 cross-ref（加新 entry 但 INDEX.md 沒更新）

**對策**：commit message 必含「`cross-ref added in INDEX.md §N`」、否則 commit blocked

---

## §6. Library 維護 cadence

| Cadence | 動作 |
|---|---|
| **每新案結尾** | session-retrospective 跑時、append 本案新引 reference 到 library |
| **季度** | 跑 `cove-verify` pipeline 對 library 全部 ✅ Verified entry 驗 URL 是否仍可解析、URL rot 標出來 |
| **年度** | 跑 standard revision check（ISO / ASHRAE / NIST / GDPR 是否有新版）、archive 舊版 |
| **特殊 trigger** | user push「我看到 X 標準有新版了」/「這個 URL 失效了」→ 立刻 update |

---

## §7. Library 範圍 boundary

✅ **library 收**：
- 跨案可重用的外部 citation（standard / paper / vendor doc / case）
- 政府公告 / 業界白皮書 / 學術 paper
- 業界 thought leadership blog（標 ❌ secondary）

❌ **library 不收**：
- Case-specific PROD data（屬該案 deliverable scope）
- 個人 / 公司內部 confidential 資料（屬該案 ground truth folder）
- 同事 / 業務 spoken claim（屬該案訪談記錄）

**自檢**：「這個 reference 下次別的案件可能會用到嗎？」是 → 收 library；只本案用 → 不收 library、留 case folder。

---

## §8. Library 與其他 framework 文件的職責分工

| 我要做什麼 | 應該改哪個檔 |
|---|---|
| 加 citation index | `references/` 對應 category .md |
| 加 cross-ref trigger | `references/INDEX.md` |
| 改方法（怎麼做）| `methodologies/` |
| 改 module fill template | `modules/0?-*.md` |
| 加產業 specific 延伸 | `industry-addons/` |
| 加 mandatory check | `8-mandatory-checks/` |
| Anti-pattern 累積 | `framework/anti-patterns.md`（session-retrospective auto-append）|

**不混淆**：references 只管 citation、不管 method / template / addon。

---

## §9. Quick checklist（加新 reference 前最後自問）

- [ ] 已 grep library 確認沒收過
- [ ] Primary URL WebFetch 過、可解析
- [ ] 對的 category file 選對了
- [ ] 5 必填欄都填了
- [ ] Hedging level 判定正確（✅/⚠️/❌）
- [ ] Cited-where 寫明 framework / case file path + §
- [ ] `INDEX.md` 對應 trigger 段加 cross-ref
- [ ] Commit message 標明 category + cross-ref §

全 checked → ship。任一缺 → 退回完成。
