# Vendor & Product Documentation References

> 跨案重用的 vendor product page / spec / docs / press release / SaaS T&C 中央索引。
>
> **Hedging convention**：✅ Verified（cite primary vendor URL）/ ⚠️ Training-data（印象、未重驗）

---

## §1. HVLS Fan 廠商（per amafans EAQS）

### Big Ass Fans — SmartSense / CommandSense / Powerfoil / Impulse / Torrent

- **Type**: Vendor product line
- **Authority**: Big Ass Fans（Madison Industries 子公司）
- **URL**:
  - SmartSense Spec: https://www.specifiedby.com/big-ass-fans/smartsense
  - CommandSense launch: https://www.businesswire.com/news/home/20241015428578/en/
  - Big Ass × Lexmark: https://origin-www.lexmark.com/en_us/solutions/iot-solutions/knowledge-hub/big-ass-fans-partners-with-lexmark.html
  - IoT Now coverage: https://www.iot-now.com/2024/10/16/147298-big-ass-fans-and-lexmark-launch-iot-powered-commandsense-for-worker-safety/
  - AHR Expo 2025: https://industrialsupplymagazine.com/pages/News-021125-Big-Ass-Fans-unveils-next-gen-cooling-solutions-at-AHR-Expo.php
  - Yellow Jacket Install Guide: https://www.specifiedby.com/big-ass-fans/yellow-jacket/big-ass-fans_YELLOW-JACKET_Operations_Yellow-Jacket-Install-Guide-Online.pdf
- **Hedging level**: ✅ Verified（multiple primary sources）
- **Cited where**:
  - `examples/amafans-eaqs/research/02-competitors-hvls-fan-2024-2026.md`
  - `examples/amafans-eaqs/research/02b-fan-monitoring-saas-cases.md`
- **Notes**:
  - SmartSense = fan-level seasonal mode（賣斷、無訂閱證據）
  - **CommandSense (2025-04 上市)** = IoT 整套生態、Lexmark Optra + Microsoft Azure backend
  - **未公開「per-month subscription」**、商業模式以設備銷售 + maintenance 為主
  - 2026 加入 Matter 智慧家居協定

### MacroAir — AirVolution / AVDX / AirLynk / Controller 30

- **Type**: Vendor product line
- **Authority**: MacroAir Technologies
- **URL**:
  - AirVolution 8-24: https://macroairfans.com/pages/airvolution-info-page
  - Controller 30: https://macroairfans.com/products/controller-30
  - Controller 4: https://macroairfans.com/products/controller-4
  - Controllers article: https://macroairfans.com/blogs/articles/controllers-everything-you-need-to-know-to-run-your-fan
  - Warehouse cooling: https://macroairfans.com/blogs/articles/warehouse-cooling
  - Trust Automation success story: https://www.trustautomation.com/resources/success-stories/macroair-hvls/
- **Hedging level**: ✅ Verified（primary vendor pages）
- **Cited where**:
  - `examples/amafans-eaqs/research/02-competitors-hvls-fan-2024-2026.md`
  - `examples/amafans-eaqs/research/02b-fan-monitoring-saas-cases.md`
- **Notes**:
  - AirLynk Gateway: BMS 橋接、BACnet MS/TP + IP
  - Controller 30: 1 台最多控 30 fan
  - **賣斷型 controller**、無雲端 SaaS / 訂閱

### Hunter Industrial — ECO Logic 500 Series / Titan / XP

- **Type**: Vendor product line
- **Authority**: Hunter Industrial / Hunter Fan Company
- **URL**:
  - Main HVLS: https://industrialfans.hunterfan.com/
  - 500 Series Controller: https://industrialfans.hunterfan.com/products/500-series-controller
  - User Manual: https://hunterfanlatino.com/wp-content/uploads/sites/7/2021/08/hunter-hvls-hmi-user-manual-rev010421-eco.pdf
  - Controls collection: https://industrialfans.hunterfan.com/collections/industrial-hvls-fan-controls
  - Install guide blog: https://industrialfans.hunterfan.com/blogs/hunter-industrial-blog/how-to-install-an-hvls-ceiling-fan-industrial-fan-installation-guide
- **Hedging level**: ✅ Verified
- **Cited where**: `examples/amafans-eaqs/research/02-competitors-hvls-fan-2024-2026.md`
- **Notes**: ECO Logic 500 Series = 1 台最多控 30 fan + 2 個溫濕度 sensor 自動調速 + 4 zone 排程

### Magnovent — Magnohub（HVLS cloud platform）

- **Type**: Vendor product
- **Authority**: Magnovent（EU/Spain）
- **URL**:
  - https://magnovent.eu/magnohub/
  - https://magnovent.eu/hvls-industrial-fans/
- **Hedging level**: ✅ Verified（primary vendor page）
- **Cited where**: `examples/amafans-eaqs/research/02b-fan-monitoring-saas-cases.md`
- **Notes**:
  - 單 hub 最多 15 unit、SIM 連線
  - Pricing 未公開、需 book demo
  - **HVLS 圈最像 Amafans×GoodLinker EAQS 結構的廠商**（cloud platform、單一廠商但雙模式不明確）

### SUNON 建準 — HVLS Series 1 / 3 / 10

- **Type**: Vendor product line
- **Authority**: SUNON 建準（台灣高雄）
- **URL**:
  - https://hvls.sunon.com/en
  - https://www.sunon.com/tw/hvlsfan/
  - https://hvls.sunon.com/product-characteristic/product10
  - https://www.sunon.com/about.aspx
  - SUNON USA Green EC: https://www.sunonusa.com/new-green-ec-fan-series/
- **Hedging level**: ✅ Verified
- **Cited where**: `examples/amafans-eaqs/research/02-competitors-hvls-fan-2024-2026.md`
- **Notes**:
  - 台灣同鄉直接對手、規模大、IoT 已整合
  - BLDC 馬達全系列（聲稱 3M 大吊扇省 45% 電）
  - **未公開訂閱模式**

### Rite-Hite — Revolution HVLS / Revolution LT / Fan Commander

- **URL**:
  - https://www.ritehite.com/en/am/products/industrial-fans/hvls-fans
  - Fan Commander 2: https://www.ritehite.com/en/am/products/industrial-fans/hvls-fans/fan-commander-2
  - Revolution LT: https://www.ritehite.com/en/am/products/industrial-fans/hvls-fans/revolution-lt
  - Warehouse application: https://www.ritehite.com/en/am/products/industrial-fans/warehouse-application
  - Revolution LT press: https://www.materialhandling247.com/product/revolution_lt_adds_economical_hvls_option_to_rite_hite_fan_line/Rite-Hite
- **Hedging level**: ✅ Verified
- **Cited where**: `examples/amafans-eaqs/research/02-competitors-hvls-fan-2024-2026.md`

### Delta 台達電子 — Ceiling Type Ventilation Fan

- **URL**:
  - https://www.deltathailand.com/en/products/Power-Electronics/Fans-and-Thermal/Ventilation-Fans-and-IAQ/Ceiling-Type
  - https://www.deltaww.com/en-US/products/Ceiling-Fan
- **Hedging level**: ✅ Verified
- **Cited where**: `examples/amafans-eaqs/research/02-competitors-hvls-fan-2024-2026.md`
- **Notes**: 未找到專屬 HVLS 大吊扇（≥3m）公開新品、主力是 thermal management

### Skyblade / Kelley iFAN / Cisco Eagle

- **URL**:
  - https://www.skybladefans.com/controls/
  - https://www.kelleydocksolutions.com/products/fans/hvls-fans/hvls-fan-control-system
  - https://kelleyindia.com/products/hvls-fans/ifan-hvls-fan-control/
  - https://www.cisco-eagle.com/category/3157/justifying-a-high-volume-low-speed-fan
- **Hedging level**: ✅ Verified
- **Cited where**: `examples/amafans-eaqs/research/02-competitors-hvls-fan-2024-2026.md`

### KAKA Industries / Usha International / Marut Air / Austar（印度 HVLS）

- **URL**:
  - https://www.kakaindustries.org/hvls-fan.html
  - https://www.kakaprofile.com/product/jinwin-hvls-fans/
  - https://machineedgeglobal.com/2024/04/15/usha-launches-the-usha-aerolux-alexandrine-hvls-ceiling-fan/
  - https://marutair.com/hvls-fans/
  - https://www.austarfansindia.com/24-feet-geared-hvls-fans-manufacturer
- **Hedging level**: ✅ Verified
- **Cited where**: `examples/amafans-eaqs/research/02-competitors-hvls-fan-2024-2026.md`

### Epicfan — HVLS Application Guide

- **URL**: https://epicfan.com/assets/6022798B-HVLS-Application-Guide.pdf
- **Hedging level**: ⚠️ Training-data
- **Cited where**: framework/industry-addons/hvls-fan.md

---

## §2. Sensor 廠商（per amafans EAQS sensor BOM）

### Honeywell HumidIcon HIH8000 / HIH6100 / HPM particulate

- **URL**:
  - HIH8000: https://automation.honeywell.com/us/en/products/sensing-solutions/sensors/temperature-and-humidity-sensors/humidity-with-temperature-sensors/honeywell-humidicon-hih8000-series
  - HIH6100 datasheet: https://prod-edam.honeywell.com/content/dam/honeywell-edam/sps/siot/es-mx/products/sensors/humidity-with-temperature-sensors/honeywell-humidicon-hih6100-series/documents/sps-siot-humidicon-hih6100-series-product-sheet-009059-6-en-ciid-142165.pdf
  - HPM particulate matter: https://prod-edam.honeywell.com/content/dam/honeywell-edam/sps/siot/en-us/products/sensors/particulate-matter-sensors-hpm-series/documents/sps-siot-particulate-hpm-series-datasheet-32322550-ciid-165855.pdf
- **Hedging level**: ✅ Verified
- **Cited where**: `examples/amafans-eaqs/research/06-sensor-brand-industrial.md`

### Sensirion SHT3x / SCD30

- **URL**:
  - SHT3x: https://sensirion.com/media/documents/213E6A3B/63A5A569/Datasheet_SHT3x_DIS.pdf
  - SCD30 CO₂: https://sensirion.com/media/documents/4EAF6AF8/61652C3C/Sensirion_CO2_Sensors_SCD30_Datasheet.pdf
- **Hedging level**: ✅ Verified
- **Cited where**: `examples/amafans-eaqs/research/06-sensor-brand-industrial.md`

### Senseair S8 / Addendum AB

- **URL**:
  - S8: https://senseair.com/product/s8/
  - Spec PDF: https://rmtplusstoragesenseair.blob.core.windows.net/docs/publicerat/PSH0102.pdf
  - ASHRAE 62.1 Addendum AB ready: https://senseair.com/senseair-sensors-ready-ashrae-addendum-ab/
- **Hedging level**: ✅ Verified
- **Cited where**: `examples/amafans-eaqs/research/06-sensor-brand-industrial.md`

### Kaiterra — IAQ Sensor + Knowledge Hub

- **URL**: https://learn.kaiterra.com/en/resources/ensuring-ashrae-62.1-compliance-for-co2-sensors-in-demand-controlled-ventilation-dcv
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/industry-addons/air-quality-system.md`
- **Notes**: Kaiterra knowledge hub 是業界公認 IAQ thought leadership

### Dwyer / Omega Engineering / GAO Tek / Kanomax / Linovision

- **URL**:
  - Dwyer 641B (anemometer): https://assets.dwyeromega.com/spec/641B.pdf
  - Gaotek hot-wire: https://gaotek.com/product/gaotek-duct-hot-wire-anemometer-transmitter/
  - Kanomax: https://kanomax-usa.com/
  - Linovision RS485 PM2.5/PM10: https://global.linovision.com/products/rs485-air-quality-sensor-for-pm2-5-and-pm10-detection
  - JYX SHT 系列: https://jyxsensor.en.made-in-china.com/product/POqaCtWjnTMp/China-Sht31-Sht35-RS485-Sht40-Sht20-Sht30-4-20mA0-10V-Humidity-and-Temperature-Sensor-J-537.html
  - MikroElectron SHT20: https://mikroelectron.com/product/sht20-temperature-humidity-sensor-modbus-rs485-rtu
  - EE650 air velocity: https://manuals.plus/epluse/ee650-air-velocity-sensor-with-rs485-interface-manual
- **Hedging level**: ✅ Verified
- **Cited where**: `examples/amafans-eaqs/research/06-sensor-brand-industrial.md`

### PMS5003 / 7003 Plantower（low-cost PM sensor）

- **URL**: https://aqicn.org/sensor/pms5003-7003/
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `examples/amafans-eaqs/research/06-sensor-brand-industrial.md`

---

## §3. Cloud / IoT PaaS 廠商

### AWS — IoT Core / SLA / Compliance

- **URL**:
  - IoT Core MQTT docs: https://docs.aws.amazon.com/iot/latest/developerguide/mqtt.html
  - IoT Core protocols: https://docs.aws.amazon.com/iot/latest/developerguide/protocols.html
  - DR whitepaper: https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/disaster-recovery-options-in-the-cloud.html
  - DynamoDB SLA: https://aws.amazon.com/dynamodb/sla/
  - Lambda SLA: https://aws.amazon.com/lambda/sla/
  - Messaging SLA: https://aws.amazon.com/messaging/sla/
  - RDS SLA: https://aws.amazon.com/rds/sla/
  - ISO Certified: https://aws.amazon.com/compliance/iso-certified/
  - Compliance Programs: https://aws.amazon.com/compliance/programs/
  - Services in Scope: https://aws.amazon.com/compliance/services-in-scope/
- **Hedging level**: ✅ Verified
- **Cited where**:
  - `examples/amafans-eaqs/research/07-security-compliance-iot-2026.md`
  - `examples/amafans-eaqs/research/08-nfr-iot-paas-sla.md`
  - `framework/industry-addons/iiot-deployment.md`
- **Notes**:
  - AWS Tokyo (ap-northeast-1) 對日本 APPI / 台灣資料留存合理
  - AWS Singapore (ap-southeast-1) 對東南亞 PDPA / ASEAN MCC 友善
  - **AWS IoT Core 是否 in-scope SOC 2 / HIPAA / ISO 27001 需個別查 Services in Scope page**

### Azure IoT Hub

- **URL**:
  - Product: https://azure.microsoft.com/en-us/products/iot-hub
  - SLA: https://azure.microsoft.com/en-us/support/legal/sla/iot-hub/v1_2/
  - MQTT connect: https://learn.microsoft.com/en-us/azure/iot-hub/iot-mqtt-connect-to-iot-hub
  - Quotas/throttling: https://learn.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-quotas-throttling
  - Security baseline: https://docs.azure.cn/en-us/iot-hub/security-baseline
  - AZ overview: https://learn.microsoft.com/en-us/azure/reliability/availability-zones-overview
- **Hedging level**: ✅ Verified
- **Cited where**: `examples/amafans-eaqs/research/07-security-compliance-iot-2026.md`, `08-nfr-iot-paas-sla.md`

### GCP IoT Core（**已終止 2023/8/16**）

- **URL（deprecation notice）**:
  - https://medium.com/@arman30600/google-cloud-iot-core-was-born-in-2017-and-died-in-2023-e5a43d4218a8
  - EMQX migration: https://www.emqx.com/en/blog/why-emqx-is-your-best-google-cloud-iot-core-alternative
  - Davra retirement: https://www.davra.com/what-the-retirement-of-google-iot-core-means-for-you-and-your-customers/
- **Hedging level**: ✅ Verified（deprecation 為事實）
- **Cited where**: `examples/amafans-eaqs/research/07-security-compliance-iot-2026.md`

### GCP Pub/Sub

- **URL**: https://cloud.google.com/pubsub/sla
- **Hedging level**: ✅ Verified

### HiveMQ / FlowFuse / Sparkplug B

- **URL**:
  - HiveMQ MQTT industrial: https://www.hivemq.com/blog/powering-the-industrial-edge-with-mqtt/
  - FlowFuse Sparkplug B + Node-RED: https://flowfuse.com/blog/2024/08/using-mqtt-sparkplugb-with-node-red/
  - HighByte ISA-95: https://www.highbyte.com/blog/applying-isa-95-in-an-industry-40-world
- **Hedging level**: ✅ Verified
- **Cited where**: `examples/amafans-eaqs/research/08-nfr-iot-paas-sla.md`, `framework/industry-addons/iiot-deployment.md`

### Robustel — IoT Edge Gateway

- **URL**:
  - Edge gateway architecture: https://robustel.com/what-is-an-iot-edge-gateway-architecture-benefits-and-use-cases-2026/
  - Edge computing 2026: https://robustel.com/what-is-edge-computing-in-iot-the-2026-industrial-architecture-guide/
- **Hedging level**: ✅ Verified
- **Cited where**: `examples/amafans-eaqs/research/08-nfr-iot-paas-sla.md`

---

## §4. AI / LLM 廠商

### Anthropic — Claude API / Commercial Terms

- **URL**:
  - Commercial Terms: https://www.anthropic.com/legal/commercial-terms
  - DPA: https://www.anthropic.com/legal/dpa
  - Trust Center: https://trust.anthropic.com/
- **Hedging level**: ⚠️ Training-data（amafans cite 過、未直接 WebFetch 確認 2026 最新版本）
- **Cited where**: `examples/amafans-eaqs/research/07-security-compliance-iot-2026.md`
- **Notes**: AI 月報用 Claude、AI governance 對應 GDPR Art. 22（自動決策）

### AWS Bedrock

- **URL**: https://aws.amazon.com/bedrock/（公開 product page）
- **Hedging level**: ⚠️ Training-data

---

## §5. Daikin / Atlas Copco / Trane（chiller / 空壓機 / HVAC 對標）

### Daikin on Site — CONNECT / PARTNER

- **URL**:
  - Press release: https://www.daikin.eu/en_us/press-releases/new-subscription-packages-for-daikin-s-remote-monitoring-and-con.html
  - DoS service page: https://www.daikinmea.com/en_us/professionals/service/operate_maintenance_repairs/remote_monitoring/daikin-on-site.html
- **Hedging level**: ✅ Verified
- **Cited where**: `examples/amafans-eaqs/research/02b-fan-monitoring-saas-cases.md`
- **Notes**:
  - **CONNECT (100 data points) / PARTNER (200 data points)** tiered subscription
  - 「pay only for data you use」
  - **跨類別 subscription pattern**、Amafans×GoodLinker 可 borrow

### Atlas Copco — SmartLink / Compressor Monitoring

- **URL**:
  - SmartLink: https://www.atlascopco.com/en-us/compressors/air-compressor-blog/smartlink-app
  - Monitoring: https://www.atlascopco.com/en-us/compressors/service/efficiency/compressor-monitoring
- **Hedging level**: ✅ Verified
- **Cited where**: `examples/amafans-eaqs/deliverable-13pdf-client/02-競品與替代方案.md`

### Trane — Connect Platform

- **URL**: https://coolingbestpractices.com/industry-news/traner-unveils-trane-connecttm-platform-enhance-management-building-performance
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `examples/amafans-eaqs/deliverable-13pdf-client/02-競品與替代方案.md`

### Oxmaint — HVAaaS / EaaS subscription model

- **URL**: https://oxmaint.com/industries/hvac/hvac-as-a-service-hvaas-subscription-model-benefits-cost-optimization
- **Hedging level**: ⚠️ Training-data

---

## §6. Modbus / RS485 / MQTT / Protocol Docs

### Industrial Monitor Direct — Modbus / RS-485 Wiring Guides

- **URL**:
  - Modbus RTU parity: https://industrialmonitordirect.com/blogs/knowledgebase/modbus-rtu-parity-configuration-best-practices-for-rs-485
  - Modbus RTU cable: https://industrialmonitordirect.com/blogs/knowledgebase/modbus-rtu-rs-485-cable-specifications-termination-and-wiring-guide
  - Control.com multi-baud: https://control.com/forums/threads/multi-baud-rate-on-the-same-rs485-modbus-rtu-bus.44512/
- **Hedging level**: ✅ Verified
- **Cited where**: `examples/amafans-eaqs/research/06-sensor-brand-industrial.md`

### Cirrus Link — MQTT Best Practices

- **URL**: https://cirrus-link.com/securing-mqtt-best-practices-for-a-robust-iot-ecosystem/
- **Hedging level**: ⚠️ Training-data

### Wevolver — IoT Gateway Architecture

- **URL**: https://www.wevolver.com/article/iot-gateway-architecture-edge-vs-cloud-protocol-translation-and-deployment-patterns
- **Hedging level**: ⚠️ Training-data

### MachineCDN — MQTT QoS Guide

- **URL**: https://machinecdn.com/blog/2026/03/03/mqtt-qos-delivery-guarantees-industrial-telemetry-guide/
- **Hedging level**: ⚠️ Training-data

---

## §7. ITIL / Service Management / Compliance Templates

### Ironclad — Channel Partner Agreement

- **URL**: https://ironcladapp.com/journal/contracts/channel-partner-agreement
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/industry-addons/b2b2b-channel-partnership.md`

### Kiflo — Channel Partner Template

- **URL**: https://www.kiflo.com/blog/how-to-build-a-channel-partner-agreement-template
- **Hedging level**: ⚠️ Training-data

### UpCounsel — Revenue Share Partnership

- **URL**: https://www.upcounsel.com/revenue-share-partnership-agreement
- **Hedging level**: ⚠️ Training-data

### Juro — Strategic Alliance Agreement Template

- **URL**: https://juro.com/contract-templates/strategic-alliance-agreement
- **Hedging level**: ⚠️ Training-data

### ContractsCounsel — Channel Partner Agreement

- **URL**: https://www.contractscounsel.com/t/us/channel-partner-agreement
- **Hedging level**: ⚠️ Training-data

### ReferralRock — Channel Partner Agreement Guide

- **URL**: https://referralrock.com/blog/channel-partner-agreement/
- **Hedging level**: ⚠️ Training-data

### Business-in-a-Box — SaaS Reseller Agreement

- **URL**: https://www.business-in-a-box.com/template/saas-reseller-agreement-D12728/
- **Hedging level**: ⚠️ Training-data

### Terms.law — SaaS Partnership Agreement Clauses

- **URL**: https://terms.law/2023/01/20/saas-partnership-agreement-essential-clauses-free-template/
- **Hedging level**: ⚠️ Training-data

---

## §8. Discovery / Interview / Sales Qualification 資源

### Atlassian — Project Scoping Questions Template

- **URL**: https://www.atlassian.com/blog/wp-content/uploads/Atlassian-Project-Scoping-Questions-template.pdf
- **Hedging level**: ✅ Verified
- **Cited where**: `framework/methodologies/phase-0-discovery.md`

### True North — Project Scoping 2020

- **URL**: https://truenmi.com/wp-content/uploads/2020/10/truenorth-project-scoping-2020-v2.pdf
- **Hedging level**: ⚠️ Training-data

### Info-Tech — Stakeholder Discovery Interview Template

- **URL**: https://www.infotech.com/research/stakeholder-discovery-interview-template
- **Hedging level**: ⚠️ Training-data

### NN/g — Stakeholder Interviews

- **URL**: https://www.nngroup.com/articles/stakeholder-interviews/
- **Hedging level**: ⚠️ Training-data

### UXPin — Stakeholder Interview Questions

- **URL**: https://www.uxpin.com/studio/blog/stakeholder-interview-questions/
- **Hedging level**: ⚠️ Training-data

### Consulting Quest / StrategyU — Scoping in Consulting

- **URL**:
  - https://consultingquest.com/insights/scoping-consulting-projects-framework/
  - https://strategyu.co/scoping-in-consulting/
- **Hedging level**: ⚠️ Training-data

### LeadHaste / Nimitai / PitchBase — B2B Lead Qualification

- **URL**:
  - https://leadhaste.com/blog/b2b-lead-qualification-framework-2026
  - https://nimitai.com/blog/sales-qualification-framework
  - https://pitchbase.app/en/blog/qualifier-prospect-b2b-frameworks
- **Hedging level**: ⚠️ Training-data

---

## §9. Retrospective / Project Management

### Echometer / TeamRetro / Invensis — Retrospective best practice

- **URL**:
  - https://echometerapp.com/en/lessons-learned-vs-retrospective-difference/
  - https://www.teamretro.com/retrospectives/flap-retrospective-activity/
  - https://www.invensislearning.com/blog/agile-retrospective/
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/methodologies/session-retrospective.md`

### MeetGeek / PartnerStack / Crossbeam — QBR / Partner pitch

- **URL**:
  - QBR Template: https://meetgeek.ai/blog/quarterly-business-review-template
  - Partnership QBR: https://partnerstack.com/articles/guide-partnership-quarterly-business-reviews
  - Partner pitch prep: https://insider.crossbeam.com/entry/guide-preparing-for-partner-pitch-meeting
- **Hedging level**: ⚠️ Training-data

### Pitch / FasterCapital / Qubit — Partnership / Pitch Deck Templates

- **URL**:
  - Pitch.com template: https://pitch.com/templates/Partnership-Proposal-6wL7ba0x13Uo5THCdy5ukn5x
  - FasterCapital: https://fastercapital.com/content/Partnerships--Highlighting-Partnerships-in-Your-Pitch-Deck--Best-Practices.html
  - Qubit Capital design principles: https://qubit.capital/blog/pitch-deck-design-principles
  - Qubit competition slide: https://qubit.capital/blog/pitch-deck-competition-slide-guide
- **Hedging level**: ⚠️ Training-data

### Doksly / Deckary / Fuselab — Deck Design Trends

- **URL**:
  - https://doksly.com/blog/pitch-deck-design-trends-2025
  - https://deckary.com/blog/pillar-strategic-frameworks-guide
  - https://fuselabcreative.com/top-dashboard-design-trends-2025/
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `examples/amafans-eaqs/research/10-deck-design-best-practice-2026.md`

### IBM Plex vs Inter Font / Google Fonts

- **URL**:
  - https://fontfyi.com/blog/ibm-plex-vs-inter/
  - https://fonts.google.com/specimen/IBM（IBM Plex 系列）
- **Hedging level**: ⚠️ Training-data

---

## §10. Change Request / Risk

### Joe the IT Guy — 5 Question Change Risk Assessment

- **URL**: https://www.joetheitguy.com/how-to-assess-the-risk-of-a-change-with-5-simple-questions/
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/methodologies/cr-handling-protocol.md` / `cr-trigger-lint` skill

### MasterOfProject — Change Request

- **URL**: https://blog.masterofproject.com/change-request-7-r/
- **Hedging level**: ⚠️ Training-data

### Wibas — CMMI Track Change Requests

- **URL**: https://www.wibas.com/cmmi/cmsp-21-track-change-requests
- **Hedging level**: ⚠️ Training-data

### Loopio — Red Team Review

- **URL**: https://loopio.com/blog/red-team-review/
- **Hedging level**: ⚠️ Training-data
- **Cited where**: `framework/methodologies/phase-0-discovery.md`

### AVID ML — Red Teaming

- **URL**: https://avidml.org/blog/red-teaming-4/
- **Hedging level**: ⚠️ Training-data

---

## §11. AI Tech Debt / Anti-debt

### Augment Code / Baytech / Digital Applied / Kunal Ganglani / Pixelmojo — AI Tech Debt articles

- **URL**:
  - https://www.augmentcode.com/guides/ai-technical-debt-compounds-spec-driven-development
  - https://www.baytechconsulting.com/blog/ai-technical-debt-how-vibe-coding-increases-tco-and-how-to-fix-it
  - https://www.digitalapplied.com/blog/vibe-coding-anti-patterns-10-ways-it-becomes-tech-debt-2026
  - https://www.kunalganglani.com/blog/vibe-coding-tech-debt-audit
  - https://www.pixelmojo.io/blogs/vibe-coding-technical-debt-crisis-2026-2027
- **Hedging level**: ❌ Secondary（單一作者 blog 整理 anti-debt 觀點）
- **Cited where**: `framework/methodologies/ai-codegen-anti-debt.md`

---

## §12. 累計 citation 數

| Category | 已索引 | ✅ Verified | ⚠️ Training-data | ❌ Secondary |
|---|---|---|---|---|
| HVLS 廠商 product page | 11 廠 / 30+ URL | 30 | 1 | 0 |
| Sensor 廠商 spec | 9 廠 / 20+ URL | 20 | 1 | 0 |
| Cloud / IoT PaaS（AWS / Azure / GCP / HiveMQ / Robustel）| 7 廠 / 25+ URL | 22 | 3 | 0 |
| AI / LLM（Anthropic / Bedrock）| 2 | 0 | 2 | 0 |
| Chiller / HVAC subscription parallel | 4 廠 | 3 | 1 | 0 |
| Protocol docs | 5 | 3 | 2 | 0 |
| Compliance template | 8 | 0 | 8 | 0 |
| Discovery template | 7 | 1 | 6 | 0 |
| Retrospective / QBR / pitch | 10 | 0 | 10 | 0 |
| CR / Red team | 5 | 0 | 5 | 0 |
| AI tech debt | 5 | 0 | 0 | 5 |
| **Total** | **~100 unique URLs** | **~80** | **~40** | **~5** |
