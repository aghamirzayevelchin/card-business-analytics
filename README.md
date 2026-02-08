# Card Business Analytics Portfolio (Unibank-style Case)

## What this project demonstrates (aligned to Card Business Analyst role)
- Issuance (emission) revenue & cost analysis by product (P&L)
- Turnover trend analysis and channel mix optimization (POS / E-commerce / ATM / P2P)
- Category (MCC) opportunity discovery for campaigns/partners
- Payment scheme invoice control (drivers, disputes, anomaly checks)
- Power BI-ready model + DAX measures for regular reporting
- Data-driven optimization and management reporting

---

This repository is a simulated end-to-end **Card Business Analytics** case aligned with typical responsibilities in card issuing and merchant acquiring analytics.

It demonstrates how financial and transaction data can be transformed into actionable business insights for management and payment schemes.

---

## Datasets (in `/data`)
- `card_portfolio_monthly.csv` — active cards, new cards, churn by product & month
- `transactions_buckets.csv` — aggregated transactions by month/product/channel/MCC/country
- `revenue_cost_monthly.csv` — revenue, cost and profit by product & month
- `scheme_invoices.csv` — invoice lines from Visa/Mastercard by month, fee type and status

---

## How to use
1. Load CSVs into your SQL environment (PostgreSQL / MS SQL / MySQL).
2. Run `/sql/00_schema.sql` (optional) and `/sql/10_business_queries.sql`.
3. Build Power BI model:
   - `transactions_buckets` ↔ `revenue_cost_monthly` via `month, product`
   - `scheme_invoices` ↔ revenue tables via `month`
   - Add measures from `/powerbi/measures.dax.txt`
4. Create dashboards and reports:
   - Product P&L and margins
   - Turnover trends and channel mix
   - Foreign transaction share
   - Invoice monitoring and disputes

---

## Suggested dashboard pages
1. Executive Overview (KPIs & trends)
2. Product Profitability (Debit vs Credit)
3. Turnover & Channel Performance
4. Invoice Control & Optimization

---

## Notes
All data is synthetic and created for portfolio and demonstration purposes.
