# 📊 BPO Operations Analytics: SLA Performance & Systemic Bottlenecks

**🔗 [Click Here to View the Interactive Tableau Dashboard](https://public.tableau.com/app/profile/danish.khan8472/viz/BPOOperationsSLAPerformanceSystemicBottlenecks/BPOOperationsSLAPerformanceSystemicBottlenecks)**

## 📌 Project Overview
This end-to-end data analytics project investigates the operational efficiency of a BPO (Business Process Outsourcing) customer support floor. By analyzing over 200,000 historical support interactions, the goal was to evaluate compliance with a strict 48-hour Service Level Agreement (SLA), measure its impact on Customer Satisfaction (CSAT), and identify the root causes of systemic bottlenecks.

**Role:** Data Analyst  
**Tools Used:** Google BigQuery (Standard SQL), Tableau, Canva, Markdown  
**Dataset:** 200,000+ Customer Support Tickets (Sourced via Kaggle)
**(Note: raw CSVs excluded from GitHub due to file size limits)**

---

## 🚀 Executive Summary & Key Insights
Through rigorous SQL data transformation and Tableau visualization, four critical operational failures were identified:

1. **Massive Operational Deficit (80% Breach Rate):** Exactly 80.08% of all closed tickets failed to meet the 48-hour SLA target, leaving over 32,000 interactions in breached status.
2. **Systemic Floor Bottlenecks (2.5x Delays):** The failure is not isolated to a single department. Every communication channel (Phone, Email, Chat, Web) averages ~120 hours to resolve tickets, indicating a severe, floor-wide headcount shortage.
3. **Inverted IT Routing System:** The automated priority routing is actively failing. "Urgent" tickets take the longest to resolve (121.1 hours), while "Low" priority tickets are resolved faster (119.9 hours). Agents are bypassing priority protocols to cherry-pick easier tickets.
4. **High-Value Revenue Risk:** "Corporate" VIP clients wait exactly as long as standard individuals (~120 hours). The lack of an expedited VIP protocol places lucrative contract renewals at immediate risk.

---

## 🛠️ Project Methodology (The Data Analytics Phases)

### 1. Ask
* **Business Task:** Quantify the exact SLA breach rate, correlate resolution speeds with CSAT scores, and locate specific departmental bottlenecks to design targeted routing adjustments.

### 2. Prepare
* **Data Source:** Ingested a verified Kaggle dataset containing 200,000+ customer support records.
* **Environment:** Securely staged in Google BigQuery Sandbox for high-volume querying.

### 3. Process (Data Cleaning via SQL)
* **Integrity Audit:** Ran BigQuery audits confirming 0 duplicate records and 0 missing core metrics (CSAT/Timestamps).
* **Filtration:** Excluded "Open" tickets to prevent skewed, mathematically inaccurate resolution averages.
* **Feature Engineering:** Utilized `CASE WHEN` statements to engineer custom binary SLA flags (`Breached SLA (>48h)` vs `Met SLA (<48h)`) directly into the database.

### 4. Analyze (Aggregation via SQL)
* Executed targeted queries to group data by channel, priority, and customer segment, establishing the 120-hour universal baseline and the inverted priority routing anomaly. 

### 5. Share (Visualization)
* **Dashboarding:** Built a fully interactive Tableau dashboard using a dual-axis Donut Chart, stark color psychology (Red vs. Grey), and cross-filtering funnel logic.
* **Reporting:** Designed an Executive Slide Deck (McKinsey/BCG style layout) to present the findings to non-technical stakeholders.

### 6. Act (Strategic Implementation)
* **Process Engineering:** Recommended an immediate audit of CRM logic to enforce "Force-Routing" and eliminate agent cherry-picking.
* **Structural Scaling:** Proposed the creation of a dedicated VIP "Corporate" queue staffed by top-tier agents, alongside an immediate budget review to scale general headcount and eliminate the 120-hour baseline delay.

---

## 📂 Repository Structure
* `/01_ASK/` - Business task definitions and key metric questions.
* `/02_PREPARE/` - Dataset origins, licensing, and metadata limits.
* `/03_PROCESS/` - SQL cleaning logs, data integrity audits, and feature engineering code.
* `/04_ANALYZE/` - SQL aggregation queries and statistical findings summaries.
* `/05_SHARE/` - Tableau dashboard files, visualization design logs, and the Executive Presentation deck.
* `/06_ACT/` - Final executive summary and 90-day strategic implementation plan.

---
*If you have any questions about this analysis or the SQL/Tableau methodologies used, please feel free to reach out!*
