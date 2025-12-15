-- 1. Sales performance overview
CREATE VIEW vw_sales_overview AS
SELECT
    s.date,
    r.regionname,
    SUM(s.quantity * s.unitprice * (1 - s.discount)) AS total_revenue,
    SUM((s.unitprice - s.cost_per_unit) * s.quantity) AS total_profit
FROM sales s
JOIN regions r
    ON s.regionid = r.regionid
GROUP BY s.date, r.regionname;


-- 2. Product performance
CREATE VIEW vw_product_performance AS
SELECT
    p.productname,
    p.category,
    SUM(s.quantity) AS total_units_sold,
    SUM(s.quantity * s.unitprice * (1 - s.discount)) AS product_revenue
FROM sales s
JOIN products p
    ON s.productid = p.productid
GROUP BY p.productname, p.category;


-- 3. Customer value analysis
CREATE VIEW vw_customer_value AS
SELECT
    c.customerid,
    c.customername,
    COUNT(DISTINCT s.saleid) AS order_count,
    SUM(s.quantity * s.unitprice * (1 - s.discount)) AS total_revenue
FROM sales s
JOIN customers c
    ON s.customerid = c.customerid
GROUP BY c.customerid, c.customername;


-- 4. Customer purchase frequency
CREATE VIEW vw_customer_purchase_frequency AS
SELECT
    customerid,
    COUNT(DISTINCT saleid) AS purchase_frequency
FROM sales
GROUP BY customerid;


-- 5. Customer retention trend
CREATE VIEW vw_customer_retention AS
SELECT
    DATENAME(month, date) AS purchase_month,
    COUNT(DISTINCT customerid) AS active_customers
FROM sales
GROUP BY DATENAME(month, date), MONTH(date);

