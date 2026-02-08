# Power BI Data Model Plan

## Tables
- transactions_buckets (fact)
- revenue_cost_monthly (fact)
- scheme_invoices (fact)
- card_portfolio_monthly (dim-ish)

## Relationships
1) transactions_buckets[month]  -> revenue_cost_monthly[month]   (Many-to-One)
2) transactions_buckets[product] -> revenue_cost_monthly[product] (Many-to-One)
3) scheme_invoices[month] -> revenue_cost_monthly[month] (Many-to-One)
4) card_portfolio_monthly[month] -> revenue_cost_monthly[month] (Many-to-One)
5) card_portfolio_monthly[product] -> revenue_cost_monthly[product] (Many-to-One)

## Date Table (recommended)
Create Calendar table by month and relate it to all tables via [month].
