/* Card Business Analytics — SQL Questions (examples)

1) Emission P&L by product (monthly and YTD)
2) Turnover trends and channel mix (POS/E-commerce/ATM/P2P)
3) Category (MCC) opportunities for optimization
4) Scheme invoice control: top drivers, anomalies, disputed amounts
*/

-- 1) Profit by month & product
SELECT month, product,
       SUM(total_revenue) AS revenue_azn,
       SUM(total_cost) AS cost_azn,
       SUM(profit) AS profit_azn
FROM revenue_cost_monthly
GROUP BY month, product
ORDER BY month, profit_azn DESC;

-- 2) YTD profit by product
SELECT product,
       SUM(total_revenue) AS revenue_azn,
       SUM(total_cost) AS cost_azn,
       SUM(profit) AS profit_azn
FROM revenue_cost_monthly
GROUP BY product
ORDER BY profit_azn DESC;

-- 3) Turnover trend (amount) and transactions (count)
SELECT month,
       SUM(amount_azn) AS turnover_azn,
       SUM(tx_count) AS transactions
FROM transactions_buckets
GROUP BY month
ORDER BY month;

-- 4) Channel mix (share of turnover)
SELECT month, channel,
       SUM(amount_azn) AS turnover_azn
FROM transactions_buckets
GROUP BY month, channel
ORDER BY month, turnover_azn DESC;

-- 5) Country / FX opportunity (foreign turnover)
SELECT month,
       SUM(CASE WHEN country <> 'AZ' THEN amount_azn ELSE 0 END) AS foreign_turnover_azn,
       SUM(amount_azn) AS total_turnover_azn,
       1.0 * SUM(CASE WHEN country <> 'AZ' THEN amount_azn ELSE 0 END) / NULLIF(SUM(amount_azn),0) AS foreign_share
FROM transactions_buckets
GROUP BY month
ORDER BY month;

-- 6) MCC (category) profitability proxy: high turnover categories (target for offers / optimization)
SELECT month, mcc_group,
       SUM(amount_azn) AS turnover_azn,
       SUM(tx_count) AS tx
FROM transactions_buckets
GROUP BY month, mcc_group
ORDER BY month, turnover_azn DESC;

-- 7) Invoice control: totals by scheme & fee_type
SELECT month, scheme, fee_type,
       SUM(amount_azn) AS invoice_amount_azn,
       COUNT(*) AS invoice_lines,
       SUM(CASE WHEN status='Disputed' THEN amount_azn ELSE 0 END) AS disputed_azn
FROM scheme_invoices
GROUP BY month, scheme, fee_type
ORDER BY month, invoice_amount_azn DESC;

-- 8) Invoice anomaly candidates: fee_type spikes vs 3-month average (simple)
WITH monthly AS (
  SELECT month, scheme, fee_type, SUM(amount_azn) AS amt
  FROM scheme_invoices
  GROUP BY month, scheme, fee_type
),
avg3 AS (
  SELECT m1.month, m1.scheme, m1.fee_type, m1.amt,
         (SELECT AVG(m2.amt) FROM monthly m2
          WHERE m2.scheme=m1.scheme AND m2.fee_type=m1.fee_type
            AND m2.month < m1.month
            AND m2.month >= (SELECT MIN(month) FROM monthly)) AS avg_prev
  FROM monthly m1
)
SELECT *
FROM avg3
WHERE avg_prev IS NOT NULL
  AND amt > 1.35 * avg_prev
ORDER BY (amt/avg_prev) DESC;
