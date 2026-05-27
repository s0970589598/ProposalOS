# D｜Secure SDLC / AppSec

🔴 簽前必交（中大型客戶必問）

## 為什麼必有

客戶資安問「你們怎麼開發」，不是問你會不會加密，是問**從需求到上線的每個階段你怎麼做資安**。

只寫「我們加密、我們有權限」是不夠的。

## Secure SDLC 七階段

```
┌──────────────────────────────────────────┐
│ 1. Requirements    │ 資安需求、合規需求      │
├──────────────────────────────────────────┤
│ 2. Design          │ 威脅模型、架構審查      │
├──────────────────────────────────────────┤
│ 3. Implementation  │ Secure coding、Code Review │
├──────────────────────────────────────────┤
│ 4. Testing         │ SAST / DAST / SCA      │
├──────────────────────────────────────────┤
│ 5. Deployment      │ 部署檢查、密鑰管理      │
├──────────────────────────────────────────┤
│ 6. Operations      │ 監控、日誌、事件回應    │
├──────────────────────────────────────────┤
│ 7. Maintenance     │ 漏洞修補、版本更新      │
└──────────────────────────────────────────┘
```

## 每階段要寫什麼

### 1. Requirements

- 資安需求列入 NFR
- 合規需求對應（ISO 27001、SOC 2、個資、產業特定）
- Data classification 完成

### 2. Design

- **威脅模型**：用 STRIDE / PASTA 模擬攻擊
  - S - Spoofing 偽冒
  - T - Tampering 竄改
  - R - Repudiation 否認
  - I - Information Disclosure 資訊洩漏
  - D - Denial of Service DoS
  - E - Elevation of Privilege 提權
- **架構審查**：資安架構師看圖
- **Privacy by Design**：個資設計階段就嵌入

### 3. Implementation

- **Secure Coding Standard**：OWASP Top 10、CWE Top 25
- **Code Review**：每個 PR 必有審查者
- **Branch Protection**：main 不能直接推
- **Secrets Management**：不准 commit 密碼、API key
- **Dependency Pinning**：版本鎖死

### 4. Testing

| 工具類別 | 用途 | 範例 |
|---|---|---|
| SAST | 靜態程式分析 | Semgrep、SonarQube、CodeQL |
| DAST | 動態應用測試 | OWASP ZAP、Burp Suite |
| SCA | 第三方元件掃描 | Snyk、Dependabot、Trivy |
| Secret Scan | 密鑰外洩偵測 | Gitleaks、TruffleHog |
| Container Scan | 容器掃描 | Trivy、Grype |
| IaC Scan | 基礎設施掃描 | Checkov、Tfsec |
| Pen Test | 滲透測試 | 年度第三方 |

### 5. Deployment

- 密鑰管理：AWS Secrets Manager / KMS / HashiCorp Vault
- 最小權限：IAM 嚴格設計
- 網路隔離：VPC、Security Group、WAF
- 部署管道：CI/CD 內含資安檢查
- 不可變基礎設施：Immutable infrastructure

### 6. Operations

- 監控：應用層、系統層、網路層、資安事件層
- 日誌：集中收集、不可竄改、留存 90+ 天
- 告警：異常登入、異常資料存取、異常流量
- 事件回應：IR playbook、24/7 oncall

### 7. Maintenance

- 漏洞掃描：自動 / 每週
- 補丁節奏：Critical 48h、High 1 週、Medium 1 月
- 版本汰除：EOL 軟體下架計畫

## 提案中要附

| 項目 | 內容 |
|---|---|
| Secure SDLC 政策文件 | 公司層級政策 |
| 威脅模型（本案專屬） | STRIDE 表 |
| 資安測試計畫 | SAST/DAST/SCA 頻率 |
| 漏洞處理 SLA | Critical / High / Medium |
| 事件通報流程 | 含 72 小時 GDPR |
| 員工資安訓練 | 年度頻率、內容 |
| 第三方資安審查 | Pen test 報告（NDA 後給） |

## 常見地雷

- ❌ 「我們有資安」沒細節 → 客戶 IT 會繼續追
- ❌ Pen test 報告拒絕提供 → 大客戶會卡
- ❌ SAST/DAST 沒在 CI 裡 → 上線後才掃等於沒用
- ❌ 密鑰寫在 .env 裡 commit → 立刻 fail audit
- ❌ 員工沒做資安訓練 → 客戶會問

## 與其他模組的關係

- ← 模組 07：合規、資安、AI 風險
- → 強制檢查項 E：SBOM 是 SCA 的一部分
- → 強制檢查項 F：事件回應

## 反方審查問題

- 你們有 Secure SDLC 文件嗎？拿出來
- 威脅模型誰做的？多久 review 一次？
- SAST 工具是什麼？每個 PR 都跑嗎？
- Critical 漏洞修補 SLA 多久？
- 員工資安訓練年度幾小時？有考核嗎？
- 過去一年有過資安事件嗎？怎麼處理？
