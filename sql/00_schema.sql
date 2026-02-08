-- Schema (generic SQL)
-- Tables: card_portfolio_monthly, transactions_buckets, revenue_cost_monthly, scheme_invoices

CREATE TABLE card_portfolio_monthly (
  month VARCHAR(7),
  product VARCHAR(50),
  active_cards INT,
  new_cards INT,
  churn_cards INT
);

CREATE TABLE transactions_buckets (
  bucket_id BIGINT,
  month VARCHAR(7),
  product VARCHAR(50),
  segment VARCHAR(20),
  channel VARCHAR(20),
  mcc_group VARCHAR(30),
  country VARCHAR(2),
  tx_count INT,
  avg_ticket DECIMAL(10,2),
  amount_azn DECIMAL(18,2)
);

CREATE TABLE revenue_cost_monthly (
  month VARCHAR(7),
  product VARCHAR(50),
  interchange_revenue DECIMAL(18,2),
  card_fee_revenue DECIMAL(18,2),
  fx_markup_revenue DECIMAL(18,2),
  processing_cost DECIMAL(18,2),
  scheme_fees_cost DECIMAL(18,2),
  fraud_loss_cost DECIMAL(18,2),
  issuance_cost DECIMAL(18,2),
  total_revenue DECIMAL(18,2),
  total_cost DECIMAL(18,2),
  profit DECIMAL(18,2)
);

CREATE TABLE scheme_invoices (
  invoice_id BIGINT,
  month VARCHAR(7),
  scheme VARCHAR(20),
  fee_type VARCHAR(30),
  currency VARCHAR(3),
  amount_fc DECIMAL(18,2),
  fx_rate DECIMAL(10,4),
  amount_azn DECIMAL(18,2),
  status VARCHAR(20)
);
