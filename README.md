# 🏦 Banking Customer Churn & Capital Retention Intelligence Platform

[![Python](https://img.shields.io/badge/Python-3.10%2B-blue?logo=python&logoColor=white)](https://www.python.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15.0-336791?logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Power BI](https://img.shields.io/badge/Power_BI-Desktop-F2C811?logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> An end-to-end analytics platform diagnosing a **20.37% baseline customer churn rate** across 10,000 retail banking accounts. By linking customer demographics and engagement to balance sheet capital, this project reveals how **$185.59M in lost balance** is concentrated in specific customer segments and provides data-driven retention strategies to mitigate capital loss.

---

## 📌 Executive Summary & Macro KPIs

| Metric | Portfolio Value | Context & Strategic Significance |
| :--- | :--- | :--- |
| **Total Customers** | **10,000** | Full retail census audited with 100% data completeness |
| **Retained Customers** | **7,963 (79.63%)** | Core operating base across France, Germany, and Spain |
| **Churned Customers** | **2,037 (20.37%)** | Baseline customer exit volume |
| **Total Balance Lost** | **$185,588,095** | Total capital lost from churned accounts |
| **Avg Lost Balance** | **$91,109** | Churned customers held 19.1% higher balances than average ($76,486) |
| **Critical Segment Loss** | **$101.64M (54.8%)** | 1,113 inactive customers with balances > $100,000 |

```
                       TOTAL PORTFOLIO ATTRITION BREAKDOWN
  ┌────────────────────────────────────────────────────────────────────────┐
  │ Total Deposited Capital Audited: $764.86M                              │
  │ Total Capital Lost to Churn:     $185.59M (24.26% Balance Sheet Drain) │
  └────────────────────────────────────────────────────────────────────────┘
          │
          ├── Germany:         $97.97M  (52.8% of all lost capital)
          ├── France:          $57.67M  (31.1% of all lost capital)
          └── Spain:           $29.95M  (16.1% of all lost capital)
```

---

## 🔍 Core Analytical Insights

### 1. Geographic Capital Concentration (The German Market Risk)
* **Finding:** While France comprises 50.14% of the customer base, **Germany accounts for 52.8% of all lost capital ($97.97M)**.
* **Driver:** German churn is **32.44%** (814 exits / 2,509 accounts)—double that of France (16.15%) and Spain (16.67%). In addition, German accounts maintain higher average balances (~$119k), increasing the balance sheet impact of every departure.

### 2. The Product Concentration Paradox (82%–100% Churn Cliff)
* **Finding:** Cross-selling beyond two products results in severe attrition:
  * **1 Product:** 27.71% Churn (1,409 / 5,084) — High volume risk; accounts switch due to low relationship depth.
  * **2 Products:** **7.58% Churn (348 / 4,590) — Optimal retention sweet spot.**
  * **3 Products:** **82.71% Churn (220 / 266) — Severe product fatigue.**
  * **4 Products:** **100.00% Churn (60 / 60) — Complete customer attrition.**
* **Driver:** Product proliferation without unified servicing creates operational friction, fee complexity, and poor customer experience.

### 3. Midlife Wealth Demographic Risk (Ages 41–60)
* **Finding:** Customers aged 18–30 exhibit low churn (7.52%), but attrition accelerates rapidly to **33.97% in ages 41–50** and peaks at **56.21% in ages 51–60**.
* **Driver:** The 41–60 cohort accounts for **$111M in lost capital**. This group represents prime wealth accumulation years where customers seek competitive investment yields and responsive advisory services.

### 4. Engagement as a Capital Shield
* **Finding:** Active membership reduces churn across every demographic and geographic segment (**14.27% Active vs. 26.85% Inactive**).
* **Driver:** Digital dormancy strongly precedes account departure by 60–90 days. High-balance customers who stop logging in represent the single highest financial risk.

### 5. Invariant Factors (Credit Scores, Salary & Credit Cards)
* **Credit Score:** Churn remains flat across all credit rating tiers (~18.6% to 22.0%), from Poor (<580) to Excellent (800+).
* **Estimated Salary:** Uniform attrition (~19.8% to 21.5%) across all income brackets ($0 to $150k+).
* **Credit Card Ownership:** 69.91% of churned clients held a credit card, mirroring the general population (70.55%). A card alone provides zero lock-in retention benefit.

---

## 📊 Power BI Dashboard Architecture

The interactive business intelligence reporting suite (`.pbix` / `.pbip`) consists of 3 synchronized analytical views:

### Page 1: Executive Overview
* **KPI Header Cards:** Total Accounts (10,000), Retained (7,963), Churned (2,037), and Global Churn Rate (20.37%).
* **Visual Grid (2×3):**
  * Donut Chart: Churned Customers by Country (France: 810, Germany: 814, Spain: 413).
  * Clustered Bar: Churn Rate by Age Cohort & Gender.
  * Clustered Column: Retention vs. Churn by Activity Status (Active vs. Inactive).
  * Column Chart: Churn Rate by Number of Products (1 to 4).
  * Area Trend: Churn Rate across Customer Tenure (0 to 10 years).
  * Horizontal Bar: Total Balance Lost by Country (Germany: $98M, France: $58M, Spain: $30M).

### Page 2: Customer Behavior & Engagement
* **Heatmap Matrix 1:** Age Group vs. Customer Tenure (highlighting the 50%–61% churn rate in the 51–60 demographic).
* **Heatmap Matrix 2:** Product Count vs. Activity Status (showing the 88.24% churn rate for inactive 3-product holders).
* **Financial Distribution:** Churn Rate by Balance Category ($0, <$50k, $50k–$100k, $100k–$150k, $150k+).
* **Credit & Salary Evaluation:** Controlled scales showing flat churn across Credit Tiers and Salary Brackets.
* **Credit Card Ownership:** Volume breakdown for cardholders vs. non-cardholders.
* **Executive Insights Card:** Bulleted summary of product fatigue and engagement rules.

### Page 3: Risk Segmentation & Capital Loss
* **Financial Risk KPI Cards:** Total Balance Lost ($186M), Avg Lost Balance ($91.1K), Critical Segment Loss ($101.6M).
* **Geographic Demographic Heatmap:** 3×5 Matrix tracking capital loss by Country across Age Groups (identifying the $39.7M loss in German accounts aged 41–50).
* **Capital Lost by Balance Tier:** Column chart showing that accounts with $100k–$150k account for $121M in lost capital.
* **Risk Segment Breakdown:** Horizontal bar chart of capital loss across the 4 core risk tiers.
* **Strategic Retention & Action Matrix:** Prescriptive intervention plan for executive leadership.

---

## 🛠️ Tech Stack & Directory Structure

```
Banking_Customer_churn&_Retention/
│
├── .gitignore                                 <- Git tracking exclusions
├── README.md                                  <- Project documentation
│
├── Data/
│   ├── raw/
│   │   └── Churn_Modelling.csv                <- Raw Kaggle dataset (10,000 rows)
│   └── processed/
│       └── bank_churn_clean.csv               <- Standardized, cleaned dataset
│
├── Notebook/
│   ├── 01_data_quality_and_cleaning.ipynb     <- Ingestion, audit & schema hygiene
│   └── 02_exploratory_data_analysis.ipynb     <- Visual EDA, statistical aggregations
│
├── sql_queries/
│   ├── 01_table_creation.sql                  <- DDL schema definition & constraints
│   ├── 02_kpi_and_churn_analysis.sql          <- Baseline portfolio & dimensional queries
│   └── 03_customer_segmentation.sql           <- Advanced risk matrices, CTEs & rankings
│
├── Dashboard/
│   ├── bank_customer_churn_dashboard.pbix     <- Power BI Desktop production report
│   ├── bank_customer_churn_dashboard.pbip     <- Git-friendly Power BI project file
│   ├── bank_customer_churn_dashboard.Report/  <- Power BI visual layout JSON definitions
│   └── bank_customer_churn_dashboard.SemanticModel/ <- Data model metadata
│
└── Reports/
    ├── Banking_Customer_Churn_Report.pdf      <- Formatted executive project report
    └── assets/                                <- Screenshots of dashboard pages
        ├── 01_executive_overview.png
        ├── 02_customer_behavior.png
        └── 03_risk_segmentation.png
```

---

## 💡 Strategic Retention Action Matrix

| Pillar | Focus Cohort | Operational Protocol | Projected Impact |
| :--- | :--- | :--- | :--- |
| **I. German Wealth Defense** | German clients aged 40–55 with balances > $100k | Assign dedicated Relationship Managers (1:120 ratio). Offer competitive term deposit yields and wealth advisory services to mitigate sovereign rate sensitivity. | Safeguard **$35M–$45M** in at-risk balances; reduce German regional churn from 32.4% to <22%. |
| **II. Dormancy Triggers** | Inactive accounts with balances > $100k | Deploy automated alerts: 30 days of inactivity triggers concierge engagement; 60 days triggers RM outreach with fee waivers or investment reviews. | Target **30% reduction** in dormancy-to-exit conversions, protecting ~$30.5M in high-balance accounts. |
| **III. Product Catalog Audit** | Clients holding 3+ products | Audit multi-product bundles to eliminate compounding fees. Unify digital banking logins across products and introduce satisfaction gates prior to cross-selling. | Reduce 3-product churn from **82.7% to <35%**; reverse product fatigue. |
| **IV. Demographic Focus** | Affluent female accumulators | Provide tailored wealth planning, credit lines, and retirement programs. Host client roundtables in Munich, Frankfurt, and Berlin to diagnose service friction. | Close the **8.6% gender churn gap**, retaining ~$18M in deposits. |

---

## 🚀 How to Run & Replicate

1. **Clone the repository:**
   ```bash
   git clone https://github.com/<your-username>/Banking-Customer-Churn-Retention-Analysis.git
   cd Banking-Customer-Churn-Retention-Analysis
   ```

2. **Python Environment Setup:**
   ```bash
   pip install pandas matplotlib seaborn jupyter
   jupyter notebook Notebook/01_data_quality_and_cleaning.ipynb
   ```

3. **PostgreSQL Database Setup:**
   * Create database `bank_churn_db`.
   * Run scripts in order: `01_table_creation.sql` $\rightarrow$ `02_kpi_and_churn_analysis.sql` $\rightarrow$ `03_customer_segmentation.sql`.

4. **Power BI Dashboard:**
   * Open `Dashboard/bank_customer_churn_dashboard.pbix` in Power BI Desktop.
   * If prompted, verify the data source path points to `Data/processed/bank_churn_clean.csv`.