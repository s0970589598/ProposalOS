# V8｜工具 / Skill 研究版

## 主題

「有沒有現成工具可以幫忙做提案？」

## V8 提到的方向

### 可能的工具來源

| 類別 | 來源 |
|---|---|
| 銷售 CRM | HubSpot、Salesforce、Pipedrive |
| 提案管理 | Proposify、PandaDoc、Loopio |
| 訪談紀錄 | Otter.ai、Grain、Tactiq |
| 流程繪圖 | Lucidchart、Miro、Excalidraw |
| RTM | JIRA、Azure DevOps、Notion |
| 文件協作 | Notion、Confluence、Google Docs |
| AI 助手 | Claude、ChatGPT、自家 RAG |
| 公司內部 Skill | Claude Skills 模板化 |

### Skill 化的想法

- `/goodlinker-proposal` 啟動完整提案引導流程
- `/proposal-review` 反方審查
- `/rtm-generate` 從訪談紀錄生成 RTM
- `/competitor-research` 競品研究

## V8 自我承認的缺口

- 沒做 GitHub 大量抓取
- 沒做 Skill 評分表
- 沒做 PoC 比較
- 沒做 License / 維護狀態檢查

實務上應該做：

```
GitHub API 掃描 → 候選 repo 清單
   ↓
Repo 評分表（star、commit 頻率、issue 處理、License、文件）
   ↓
PoC 比較（裝起來實測）
   ↓
License / 維護狀態檢查
   ↓
評估報告 → 決定要不要採用
```

## 對應到 V12

→ [research/tools-evaluation.md](../../research/tools-evaluation.md) 保留 V8 工具評估方法
→ Claude Skill 化是後續行動項，不在 V12 框架本體內

## 保留的價值

- 工具評估方法論
- 「Skill 化」這個未來方向的種子
- 提醒不要每件事自己寫，先看有沒有現成
