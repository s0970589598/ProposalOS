# Claude Skills

ProposalOS 提供的 Claude Skill。

## 已有 Skill

| Skill | 用途 |
|---|---|
| [goodlinker-proposal](goodlinker-proposal/SKILL.md) | 引導完整 ProposalOS 提案流程 |

## 安裝

把 `skills/` 下的 skill 複製到 `~/.claude/skills/`：

```bash
# 全域安裝（兩台機器共用）
cp -r skills/goodlinker-proposal ~/.claude/skills/

# 或 symlink（要求 ~/.claude 是 git 同步的話）
ln -s "$(pwd)/skills/goodlinker-proposal" ~/.claude/skills/goodlinker-proposal
```

下次 Claude Code 對話輸入 `/goodlinker-proposal` 或自然語言觸發詞即可使用。

## 維護

- Skill 內容變更 → 記得 commit + push
- Skill 跨多個專案使用 → 適合放 ~/.claude/skills/（如全域 SKILL_PATH 設定）
- Skill 只在 ProposalOS 範圍 → 放這裡

## 未來 Skill 規劃

| Skill | 用途 | 狀態 |
|---|---|---|
| `proposal-review` | 對既有提案做 12 × 8 自查 | 規劃 |
| `competitor-research` | 對指定產業 / 公司做競品分析 | 規劃 |
| `rtm-from-interview` | 訪談逐字稿 → RTM | 規劃 |
| `proposal-red-team` | 對提案自動跑反方審查 | 規劃 |
