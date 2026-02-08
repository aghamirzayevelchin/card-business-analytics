## What this project demonstrates (aligned to Card Business Analyst role)
- Issuance (emission) revenue & cost analysis by product (P&L)
- Turnover trend analysis and channel mix optimization (POS / E-com / ATM / P2P)
- Category (MCC) opportunity discovery for campaigns/partners
- Payment scheme invoice control (drivers, disputes, anomaly checks)
- Power BI-ready model + DAX measures for regular reporting


# Card Business Analytics Portfolio (Unibank-style Case)

This repository is a simulated end-to-end **Card Business Analytics** case aligned with typical responsibilities in card issuing/merchant acquiring analytics:
- Emission (issuing) revenue & cost analysis (P&L)
- Turnover trend analysis (POS / E-commerce / ATM / P2P)
- Opportunity discovery (MCC/category, FX, channel mix)
- Payment scheme invoice control & optimization recommendations
- Regular analytics and reporting outputs

## Datasets (in `/data`)
- `card_portfolio_monthly.csv` — active cards, new cards, churn by product & month
- `transactions_buckets.csv` — aggregated transactions by month/product/channel/MCC/country
- `revenue_cost_monthly.csv` — revenue/cost components and profit by product & month
- `scheme_invoices.csv` — invoice lines from payment schemes (Visa/Mastercard) by month/fee type/status

## How to use
1. Load CSVs into your SQL environment (PostgreSQL / MS SQL / MySQL).
2. Run `/sql/00_schema.sql` (optional) and `/sql/10_business_queries.sql`.
3. Build Power BI model:
   - `transactions_buckets` ↔ `revenue_cost_monthly` via `month, product`
   - `scheme_invoices` via `month`
   - Add measures from `/powerbi/measures.dax.txt`
4. Create visuals:
   - P&L by product (revenue, cost, profit, margin)
   - Turnover trend and channel mix
   - Foreign turnover share
   - Invoice totals and disputed amounts

## Suggested dashboard pages
1. Executive Overview (KPIs + trends)
2. Product Profitability (Debit vs Credit)
3. Turnover & Channel Mix
4. Invoice Control (drivers, disputes)

## Notes
All data is synthetic and created for portfolio/demo purposes.
