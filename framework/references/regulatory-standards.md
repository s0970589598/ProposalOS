# Regulatory Standards & Compliance References

> 跨案重複引用的法規、標準、合規框架中央索引。涵蓋資安、空品、健康安全、跨境資料、能源、IoT、智慧財產等。
>
> **Hedging convention**：✅ Verified（直接 WebFetch primary）/ ⚠️ Training-data（印象、未重驗）/ ❌ Paywall secondary cite
>
> **Format**：每筆 5 必填欄（Type / Authority / Year / URL / Hedging）+ Cited-where + Notes。

---

## §1. ISO / IEC 系列（資安、品質、雲端、IoT）

### ISO/IEC 27001:2022 — Information Security Management System (ISMS)

- **Type**: International Standard
- **Authority**: ISO/IEC JTC 1/SC 27
- **Year / Revision**: **2022**（前版 :2013）
- **URL**: https://www.iso.org/standard/27001 ; AWS cert list: https://aws.amazon.com/compliance/iso-certified/
- **Hedging level**: ✅ Verified（amafans research/07 + AWS cert page）
- **Cited where**:
  - `examples/amafans-eaqs/research/07-security-compliance-iot-2026.md`（雲端側 ISMS 框架）
  - `examples/amafans-eaqs/deliverable-13pdf-client/07-法遵資安與AI風險.md`
  - `framework/industry-addons/iiot-deployment.md`
  - `framework/8-mandatory-checks/D-secure-sdlc.md`
- **Notes**:
  - 6-12 個月、$30K-$100K（含 readiness、per amafans research/07）
  - 強適用 cloud/PaaS、IT 環境通用
  - AWS / Azure / GCP 都有 ISO 27001 inherit、客戶用 AWS 可繼承

### ISO/IEC 27017:2015 — Cloud Security

- **Type**: International Standard
- **Authority**: ISO/IEC JTC 1/SC 27
- **Year / Revision**: 2015
- **URL**: https://www.iso.org/standard/43757.html
- **Hedging level**: ⚠️ Training-data（cite 過 AWS compliance list、未直接 WebFetch 內文）
- **Cited where**: AWS 合規清單 reference（research/07）
- **Notes**: 雲端服務的 27001 延伸、AWS 有 cert

### ISO/IEC 27018:2019 — PII Protection in Public Cloud

- **Type**: International Standard
- **Authority**: ISO/IEC JTC 1/SC 27
- **Year / Revision**: 2019
- **URL**: https://www.iso.org/standard/76559.html
- **Hedging level**: ⚠️ Training-data
- **Cited where**: AWS 合規清單 reference（research/07）
- **Notes**: 雲端個資保護、適用 EU GDPR + 個資法

### ISO/IEC 27701:2019 — Privacy Information Management (PIMS)

- **Type**: International Standard
- **Authority**: ISO/IEC JTC 1/SC 27
- **Year / Revision**: 2019
- **URL**: https://www.iso.org/standard/71670.html
- **Hedging level**: ⚠️ Training-data
- **Cited where**: AWS 合規清單 reference（research/07）
- **Notes**: 27001 的隱私延伸

### ISO/IEC 22301:2019 — Business Continuity Management

- **Type**: International Standard
- **Authority**: ISO/IEC JTC 1/SC 232
- **Year / Revision**: 2019
- **URL**: https://www.iso.org/standard/75106.html
- **Hedging level**: ⚠️ Training-data
- **Cited where**: AWS 合規清單 reference（research/07）

### IEC 62443 Series — Industrial Automation & Control Systems (IACS) Security

- **Type**: International Standard（OT / 工控專用）
- **Authority**: IEC TC 65 / ISA-99 committee
- **Year / Revision**: 各子標準各有年份
  - **62443-4-1** SDLA（Secure Development Lifecycle Assurance）
  - **62443-3-3** System Security Requirements & Security Levels
  - **62443-4-2** Technical Security Requirements for IACS Components
  - **62443-2-1** Establishing IACS Security Program
- **URL**: https://gca.isa.org/applying-iso/iec-27001/2-and-the-isa/iec-62443-series-for-operational-technology-environments
- **Hedging level**: ✅ Verified（amafans research/07 + ISA GCA 2025 白皮書）
- **Cited where**:
  - `examples/amafans-eaqs/research/07-security-compliance-iot-2026.md`（B 風扇主控板 + C Gateway IACS device）
  - `examples/amafans-eaqs/deliverable-13pdf-client/07-法遵資安與AI風險.md`
  - `framework/industry-addons/iiot-deployment.md`
- **Notes**:
  - SL1-SL4 Security Level、針對 physical safety threat
  - TÜV SÜD 大廠 SDLA < 1 年案例（Siemens Energy）
  - **與 ISO 27001 互補不互斥**：27001 IT/Cloud 治理、62443 OT 工程控制
  - CISA / FBI / UK NCSC 2025 公開呼籲 OT 組織同時對齊兩者
  - SMB 報價未公開、需個別詢 TÜV SÜD / Bureau Veritas / exida / SGS

### ISO 16000 系列 — Indoor Air Quality（室內空氣品質）

- **Type**: International Standard
- **Authority**: ISO TC 146/SC 6
- **Year / Revision**: 多個子標準（16000-1, -3, -6, -29 各有年份）
- **URL**: https://www.iso.org/standard/ico/16000.html
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/industry-addons/air-quality-system.md` reference
- **Notes**: 室內空氣 sample / measurement / VOC 測定方法

---

## §2. NIST 系列（資安、IoT、Cyber Resilience）

### NIST SP 800-213A — IoT Device Cybersecurity Guidance for the Federal Government

- **Type**: U.S. Federal Special Publication
- **Authority**: NIST CSD
- **Year / Revision**: 2021
- **URL**: https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-213A.pdf
- **Hedging level**: ✅ Verified（amafans research/07 cite primary PDF）
- **Cited where**:
  - `examples/amafans-eaqs/research/07-security-compliance-iot-2026.md`（TLS / mTLS / X.509 / AES-256 加密 baseline）
  - `examples/amafans-eaqs/deliverable-13pdf-client/07-法遵資安與AI風險.md`
- **Notes**:
  - 設備 ↔ Gateway: TLS 1.2+ minimum、TLS 1.3 recommended
  - Gateway ↔ Cloud: mTLS + X.509 per-device cert
  - Data at rest: AES-256
  - Log: encrypted at rest + in transit

### NIST SP 800-53 — Security and Privacy Controls

- **Type**: U.S. Federal Special Publication
- **Authority**: NIST CSD
- **Year / Revision**: Rev 5 (2020)
- **URL**: https://csrc.nist.gov/publications/detail/sp/800-53/rev-5/final
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/8-mandatory-checks/D-secure-sdlc.md` reference
- **Notes**: 美國聯邦 control baseline、影響 SOC 2 / FedRAMP

### NIST SP 800-171 — CUI Protection in Nonfederal Systems

- **Type**: U.S. Federal Special Publication
- **Authority**: NIST CSD
- **Year / Revision**: Rev 3 (2024)
- **URL**: https://csrc.nist.gov/publications/detail/sp/800-171/rev-3/final
- **Hedging level**: ⚠️ Training-data
- **Cited where**: DoD supplier 用、預期 framework 未來 healthcare / defense addon

### NIST Cyber Resilient Building Control Systems

- **Type**: NIST Cybersecurity Practice Guide
- **Authority**: NIST NCCoE
- **Year / Revision**: 進行中（2024-2026）
- **URL**: https://www.nccoe.nist.gov/projects/cyber-resilient-building-control-systems
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/industry-addons/iiot-deployment.md` reference（建築物 IoT）
- **Notes**: 建築物 IoT + OT 安全、與 ASHRAE 62.1 / 90.1 互補

---

## §3. ASHRAE 系列（HVAC / IAQ / 熱舒適）

### ASHRAE 62.1-2022 — Ventilation for Acceptable Indoor Air Quality

- **Type**: Industry Standard
- **Authority**: ASHRAE
- **Year / Revision**: **2022**（前版 -2019 / -2016）
- **URL**: https://www.ashrae.org/technical-resources/standards-and-guidelines
- **Hedging level**: ✅ Verified（amafans deliverable + Senseair / Kaiterra 對應 cite）
- **Cited where**:
  - `examples/amafans-eaqs/deliverable-13pdf-client/07-法遵資安與AI風險.md`（DCV / CO₂ 控制）
  - `framework/industry-addons/air-quality-system.md`
- **Notes**:
  - DCV (Demand-Controlled Ventilation) 標準
  - Addendum AB: CO₂ sensor 要求
  - Kaiterra / Senseair 對應產品線：https://learn.kaiterra.com/en/resources/ensuring-ashrae-62.1-compliance-for-co2-sensors-in-demand-controlled-ventilation-dcv

### ASHRAE 55-2020 — Thermal Environmental Conditions for Human Occupancy

- **Type**: Industry Standard
- **Authority**: ASHRAE
- **Year / Revision**: **2020**
- **URL**: https://www.ashrae.org/technical-resources/standards-and-guidelines
- **Hedging level**: ⚠️ Training-data（amafans 引用過 thermal comfort 概念、未引用具體 clause）
- **Cited where**: `framework/industry-addons/air-quality-system.md` + `framework/industry-addons/hvls-fan.md`
- **Notes**:
  - 熱舒適模型（PMV / PPD）、ceiling fan elevated air speed allowance
  - 與 CBE Berkeley Fans Guidebook 高度對齊

### ASHRAE 170 — Ventilation of Health Care Facilities

- **Type**: Industry Standard
- **Authority**: ASHRAE
- **Year / Revision**: 2021
- **URL**: https://www.ashrae.org/technical-resources/standards-and-guidelines
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/industry-addons/healthcare.md` reference
- **Notes**: 醫院通風標準

### ASHRAE 90.1 — Energy Standard for Buildings

- **Type**: Industry Standard
- **Authority**: ASHRAE
- **Year / Revision**: 2022
- **URL**: https://www.ashrae.org/technical-resources/standards-and-guidelines
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/industry-addons/energy-esg.md` reference

---

## §4. 台灣 CNS / 經濟部 / 法規

### CNS 3612 — 室內空氣品質標準

- **Type**: 台灣國家標準
- **Authority**: 環境部（前環保署）
- **Year / Revision**: 2017
- **URL**: https://oaout.epa.gov.tw/law/LawContent.aspx（環境部法規檢索）
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/industry-addons/air-quality-system.md` reference
- **Notes**: 對應 PM2.5 / CO₂ / TVOC / HCHO 等室內標準值

### 個人資料保護法（PDPA Taiwan）

- **Type**: National Law（台灣）
- **Authority**: 立法院 / 個人資料保護委員會（PDPC、2025/10/17 修法通過、預計 2026 上路）
- **Year / Revision**: 最新修法 **2025-10-17 通過**
- **URL**:
  - 法源：https://law.moj.gov.tw/LawClass/LawAll.aspx?pcode=I0050021
  - ICLG TW 2025-26: https://iclg.com/practice-areas/data-protection-laws-and-regulations/taiwan
  - Baker McKenzie 分析: https://www.globalcompliancenews.com/2025/11/12/https-insightplus-bakermckenzie-com-bm-investigations-compliance-ethics-taiwan-amendment-to-personal-data-protection-act_10292025/
- **Hedging level**: ✅ Verified（amafans research/07 cite primary law + ICLG 2025 secondary）
- **Cited where**:
  - `examples/amafans-eaqs/research/07-security-compliance-iot-2026.md`（§10-14, §20 跨境）
  - `examples/amafans-eaqs/deliverable-13pdf-client/07-法遵資安與AI風險.md`
- **Notes**:
  - §10-14 個資蒐集 / 處理 / 利用
  - §20 跨境傳輸限制（PDPC 修法後 Art. 21）
  - 競合主管機關得限制；國家重大利益 / 接受國缺乏規範 / 規避 PDPA 時可被禁
  - **EAQS 環境資料通常非個資**；若蒐集員工 SSO/access log 屬個資、應走 DPA

### 經濟部能源署 — 電力排碳係數

- **Type**: 政府公告
- **Authority**: 經濟部能源署
- **Year / Revision**: **2024 全年 0.474 kgCO₂e/kWh、2025-04-14 公告**
- **URL**:
  - https://www.moeaea.gov.tw/ECW/populace/Law/Content.aspx
  - https://tcan2050.org.tw/en/chart/taiwans-electricity-emission-factor-over-the-past-decade/
- **Hedging level**: ✅ Verified（amafans CR-002 / deliverable 都 cite）
- **Cited where**:
  - `examples/amafans-eaqs/research/cr002-tariff-ems-taiwan.md`
  - `examples/amafans-eaqs/deliverable-13pdf-client/01-產業與市場.md`
  - `framework/industry-addons/energy-esg.md`
- **Notes**:
  - 每年 4-5 月公告前一年數字
  - 趨勢：2022 = 0.495 → 2023 = 0.495 → 2024 = 0.474（下降約 4.2%）
  - ESG 報告 / 碳盤查必用

### 經濟部 — 114 年「提升產業競爭力-研發轉型支持」個案補助

- **Type**: 政府補助案
- **Authority**: 經濟部產業發展署
- **Year / Revision**: 2025（民國 114 年）
- **URL**: https://www.essc.org.tw/subsidy/change_apply/info.aspx
- **Hedging level**: ⚠️ Training-data（cite 過、未驗 2026 fiscal year 是否續辦）
- **Cited where**: `examples/amafans-eaqs/deliverable-13pdf-client/10-採購與訂價.md` reference
- **Notes**: 提案中可作為產業升級補助 source

### 台電 — 契約用電辦法 / 三段式時間電價

- **Type**: 公用事業辦法
- **Authority**: 台電
- **Year / Revision**: 持續更新（每年費率調整）
- **URL**: https://www.taipower.com.tw/（最新時段電價需查台電官網）
- **Hedging level**: ✅ Verified（amafans CR-002 cite 過實際 EMS / 時段電價邏輯）
- **Cited where**:
  - `examples/amafans-eaqs/research/cr002-tariff-ems-taiwan.md`
  - `examples/amafans-eaqs/research/cr002-goodlinker-electricity-spec.md`

### 能源管理法

- **Type**: National Law（台灣）
- **Authority**: 經濟部能源署
- **URL**: https://law.moea.gov.tw/LawContent.aspx
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/industry-addons/energy-esg.md` reference

---

## §5. 跨境資料保護（GDPR / APPI / PDPA Singapore）

### EU GDPR — General Data Protection Regulation

- **Type**: EU Regulation
- **Authority**: European Commission
- **Year / Revision**: 2016/679（自 2018-05-25 生效）
- **URL**:
  - 全文：https://eur-lex.europa.eu/eli/reg/2016/679/oj
  - SCC: https://commission.europa.eu/law/law-topic/data-protection/international-dimension-data-protection/new-standard-contractual-clauses-questions-and-answers-overview_en
- **Hedging level**: ✅ Verified（amafans research/07 cite + EU Commission primary）
- **Cited where**:
  - `examples/amafans-eaqs/research/07-security-compliance-iot-2026.md`
  - `framework/8-mandatory-checks/D-secure-sdlc.md`
- **Notes**:
  - Art. 5 個資處理原則
  - Art. 15 主體存取權
  - Art. 28 處理者責任 + DPA
  - Art. 33 資料外洩 72 小時通報
  - **SCC 2021 版**（取代 2010 版）+ TIA 是台灣 → EU 跨境必備
  - 台灣 **尚未取得 GDPR adequacy decision**（2025 仍審查中）

### 日本 APPI — Act on Protection of Personal Information

- **Type**: National Law（日本）
- **Authority**: 個人情報保護委員会 (PPC)
- **Year / Revision**: 2022/4 修法生效（最新版）
- **URL**:
  - Baker McKenzie JP: https://resourcehub.bakermckenzie.com/en/resources/global-data-and-cyber-handbook/asia-pacific/japan/topics/international-data-transfer
  - ICLG JP 2025-26: https://iclg.com/practice-areas/data-protection-laws-and-regulations/japan
- **Hedging level**: ✅ Verified（amafans research/07）
- **Cited where**: `examples/amafans-eaqs/research/07-security-compliance-iot-2026.md`
- **Notes**:
  - Article 28 跨境傳輸要求
  - (1) opt-in 個人同意 或 (2) 接收方 adequate protection（每年 monitor）
  - EU / UK 在 white list

### 新加坡 PDPA — Personal Data Protection Act

- **Type**: National Law（新加坡）
- **Authority**: PDPC（Personal Data Protection Commission）
- **Year / Revision**: 最新 2020 修法
- **URL**:
  - PDPC Guide: https://www.pdpc.gov.sg/organisations/resources/guidance-by-topic/guide-to-cross-border-data-transfers
  - ICLG SG: https://iclg.com/practice-areas/data-protection-laws-and-regulations/singapore/
- **Hedging level**: ✅ Verified（amafans research/07）
- **Cited where**: `examples/amafans-eaqs/research/07-security-compliance-iot-2026.md`
- **Notes**:
  - **Section 26** 跨境限制
  - 機制：(1) APEC CBPR/PRP (2) Global CBPR (3) ASEAN Model Contractual Clauses (4) consent
  - Singapore 2024 末取得 EU adequacy

---

## §6. OSHA / ACGIH（職業安全）

### OSHA Z-1 — Air Contaminants

- **Type**: U.S. Federal Regulation
- **Authority**: U.S. OSHA
- **URL**: https://www.osha.gov/laws-regs/regulations/standardnumber/1910/1910.1000
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/industry-addons/air-quality-system.md` reference
- **Notes**: PEL / TLV 上限值

### ACGIH TLV 2024 — Threshold Limit Values for Chemical Substances

- **Type**: Industry Guideline
- **Authority**: American Conference of Governmental Industrial Hygienists
- **Year / Revision**: **2024 版**
- **URL**: https://www.acgih.org/science/tlv-bei-guidelines/
- **Hedging level**: ⚠️ Training-data（cite 過、未驗 2024 vs 2025 版差異）
- **Cited where**: `framework/industry-addons/air-quality-system.md` reference

---

## §7. IoT / OT 安全 vendor-neutral standards

### OWASP Top 10 — Web Application Security Risks

- **Type**: Industry Best Practice
- **Authority**: OWASP Foundation
- **Year / Revision**: 2021（next update planned）
- **URL**: https://owasp.org/Top10/
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/8-mandatory-checks/D-secure-sdlc.md` reference

### OWASP ASVS Level 2 — Application Security Verification Standard

- **Type**: Industry Best Practice
- **Authority**: OWASP Foundation
- **Year / Revision**: 4.0
- **URL**: https://owasp.org/www-project-application-security-verification-standard/
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/8-mandatory-checks/D-secure-sdlc.md` reference

### RFC 9116 — security.txt

- **Type**: IETF RFC
- **Authority**: IETF
- **Year / Revision**: 2022
- **URL**: https://www.rfc-editor.org/rfc/rfc9116
- **Hedging level**: ⚠️ Training-data

### RFC 9325 — Recommendations for Secure Use of TLS and DTLS

- **Type**: IETF RFC（BCP 195）
- **Authority**: IETF
- **Year / Revision**: 2022
- **URL**: https://www.rfc-editor.org/rfc/rfc9325
- **Hedging level**: ⚠️ Training-data

---

## §8. 其他常用 standards（mention only）

| Standard | Authority | Domain | Cited-where |
|---|---|---|---|
| **NFPA 72** | NFPA | Smoke / Fire Alarm Code | air quality fire-safety adjacency |
| **API 670** | American Petroleum Institute | Machinery Protection（vibration sensor）| `framework/industry-addons/iiot-deployment.md` |
| **ASME MFC** | ASME | Flow measurement | iiot |
| **USP 1079.4** | U.S. Pharmacopeia | Temperature mapping for storage | healthcare addon |
| **IEC 60079-29** | IEC | Explosive atmosphere gas detector | ⚠️ Training-data |
| **IEC 60364** | IEC | Low-voltage electrical installation | ⚠️ Training-data |
| **NCC / BSMI（台灣）** | 台灣 NCC / 標檢局 | 設備認證 | `examples/amafans-eaqs/research/07` 提及 |
| **CE / FCC** | EU / U.S. | 出口認證 | `examples/amafans-eaqs/research/07` 提及 |
| **CB Scheme（IECEE）** | IECEE | 跨國認證互認 | nice-to-have |

---

## §9. ITIL / 治理 framework references（標準層 mention）

| Standard | Authority | URL | Cited-where |
|---|---|---|---|
| **ITIL 4 Foundation** | AXELOS | https://www.axelos.com/certifications/propath/itil-4-foundation | `examples/amafans-eaqs/deliverable-13pdf-client/11-驗收與維運.md` |
| **CMMI** | ISACA | https://cmmiinstitute.com/ | `framework/methodologies/cr-handling-protocol.md` |

---

## §10. 美國 / 國際食品藥品（healthcare addon 預備）

- **FDA 21 CFR Part 11** — Electronic Records / Signatures
- **HIPAA / HITECH** — U.S. health privacy
- **GxP** — Good Practice family

⚠️ 全部 Training-data、實際引用前必 WebFetch。

---

## §11. 累計 citation 數

| Category | 已索引 | ✅ Verified | ⚠️ Training-data |
|---|---|---|---|
| ISO/IEC | 7 | 2 | 5 |
| NIST | 5 | 1 | 4 |
| ASHRAE | 4 | 1 | 3 |
| 台灣 CNS / 經濟部 / 個資 | 5 | 3 | 2 |
| 跨境（GDPR / APPI / SG-PDPA）| 3 | 3 | 0 |
| OSHA / ACGIH | 2 | 0 | 2 |
| OWASP / RFC | 4 | 0 | 4 |
| Misc standards | 12 | 0 | 12 |
| ITIL / CMMI | 2 | 0 | 2 |
| **Total** | **44** | **10** | **34** |

**Goal**：未來案件每次 WebFetch verify 一個 ⚠️ → 升級成 ✅、逐步提升 library verified ratio。
