# 怎麼貢獻

ProposalOS 是 GoodLinker 內部顧問式系統提案框架。歡迎團隊成員與合作夥伴貢獻。

## 三種貢獻

### 1. 內容修正 / 補強

發現錯字、事實錯誤、過時內容、可以更好的寫法。

**流程**：
1. 開 issue 或直接 PR
2. PR 描述含：哪個檔、什麼問題、改成什麼、為什麼
3. 至少一位 reviewer

### 2. 新增 / 修改框架

對 12 模組、8 檢查項、產業 add-on 提出結構性修改。

**流程**：
1. **先開 issue 討論**（不要直接 PR）
2. 影響範圍超過 3 個檔的修改要做 ADR（架構決策紀錄）
3. 同步更新：CHANGELOG.md、README.md、相關交叉索引

### 3. 真實案例貢獻

把真實做過的案件去敏感化後變成 case study。

**流程**：
1. 客戶端必須明確授權
2. 客戶姓名、公司名、產品名、數字全部脫敏
3. 放 `examples/` 下
4. 檔頭明標「⚠️ 案例授權使用 — YYYY-MM」與「⚠️ 數字已脫敏」

## 改動原則

### ✅ 鼓勵

- 修正事實錯誤
- 補上漏掉的視角
- 加正向範例（不只是 ❌）
- 對齊國際成熟框架（IIBA / NIST / TOGAF 等）
- 提案後復盤的學習

### ❌ 避免

- 編造案例、數字、廠商引用
- 一次改太多檔（PR 難審）
- 沒對應到 12 模組或 8 檢查項的新章節
- 沒驗證的「業界都這樣做」主張

## 驗證 checklist

提 PR 前自查：

- [ ] 跑過 `scripts/check-links.sh`，所有內部 link 通
- [ ] 引用的法規 / 標準有官方來源
- [ ] 引用的廠商 / 公司有公開可驗 source
- [ ] CHANGELOG.md 有更新
- [ ] 跨檔引用一致（命名、編號）
- [ ] 沒有破壞 12 × 8 矩陣（[framework/MATRIX.md](framework/MATRIX.md)）

## 風格規約

### Markdown

- 標題用 `#`（不用底線）
- 強調用 `**粗體**`（不用 `_斜體_`）
- 列表用 `-`（不用 `*`）
- 表格欄寬不必對齊（Markdown 渲染會自動處理）

### 中英文

- 中文段落英文夾在裡面用半形空格分隔（例：「我們用 NIST CSF 2.0」）
- 縮寫第一次出現要有全名（例：`Software Bill of Materials (SBOM)`）
- 對應 [GLOSSARY.md](GLOSSARY.md) 命名一致

### 語氣

- 直接、具體
- 多用正向範例
- 紅線用 ❌ 標出，但不要每段都有
- 給數字 / 範圍勝過抽象描述

## 提交格式

### Commit message

```
類型: 簡短描述

詳細說明（可選）

Co-Authored-By: ...
```

類型：
- `add`：新功能 / 新檔
- `fix`：修正錯誤
- `update`：更新既有內容
- `refactor`：結構調整
- `docs`：純文件
- `chore`：雜項

### PR title

對應 commit message 類型。例：
- `add: examples/medical-clinic case study`
- `fix: Purdue Model levels in manufacturing.md`
- `update: 模組 10 加定價心理學`

## 內部聯絡

- 提案經驗交流：找 Allen / PM 團隊
- 框架結構問題：找 ProposalOS maintainer
- AI / Claude Skill 相關：對應 `~/.claude/` 維護者
