# How to build PBIX (when laptop available)

1) Power BI Desktop -> Get Data -> CSV:
   - data/transactions_buckets.csv
   - data/revenue_cost_monthly.csv
   - data/scheme_invoices.csv
   - data/card_portfolio_monthly.csv

2) Create relationships as in model_plan.md

3) Add measures from measures.dax.txt

4) Create pages as in dashboard_pages.md

5) Save as:
   powerbi/card_business_analytics.pbix

6) Export screenshots into /screenshots and upload both PBIX + screenshots to GitHub
