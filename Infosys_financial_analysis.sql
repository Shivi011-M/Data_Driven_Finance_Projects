CREATE DATABASE FINANCE_PROJECT;

USE FINANCE_PROJECT;

CREATE TABLE INFOSYS_FINANCIALS (
YEAR INT,
REVENUE DECIMAL(12,2),
OPPROFIT DECIMAL(12,2),
NETPROFIT DECIMAL(12,2),
EXPENSES DECIMAL(12,2),
EPS DECIMAL(10,2)
);

SELECT * FROM INFOSYS_FINANCIALS;

SELECT YEAR, REVENUE
FROM INFOSYS_FINANCIALS
ORDER BY YEAR;
-- Infosys revenue shows steady upward growth, indicating consistent business expansion.

SELECT YEAR,
REVENUE, LAG(REVENUE) OVER (ORDER BY YEAR) AS PREVREVENUE,
((REVENUE - LAG(REVENUE) OVER (ORDER BY YEAR))
/ LAG(REVENUE) OVER (ORDER BY YEAR))* 100 AS YOYGROWTH
fROM INFOSYS_FINANCIALS;
-- Revenue growth accelerated post-FY21, reflecting increased global demand for digital and cloud services.

SELECT YEAR, NETPROFIT
FROM INFOSYS_FINANCIALS
ORDER BY YEAR;
-- Net profit growth tracked revenue expansion, indicating sustainable and scalable profitability.

SELECT YEAR,
ROUND((OPPROFIT / REVENUE)* 100 , 2 ) AS OPERATINGMARGIN
FROM INFOSYS_FINANCIALS;
-- Operating margins remained stable around ~24%, highlighting strong operational efficiency despite scale expansion.

SELECT YEAR,
ROUND((EXPENSES / REVENUE)* 100, 2) AS EXPENSERATIO
FROM INFOSYS_FINANCIALS;
-- Expense growth remained proportional to revenue expansion, indicating disciplined cost scaling.

SELECT YEAR, NETPROFIT
FROM INFOSYS_FINANCIALS
ORDER BY NETPROFIT DESC
LIMIT 1;
-- The company recorded its strongest profitability in FY25, indicating continued growth momentum.

SELECT YEAR , EPS
FROM INFOSYS_FINANCIALS
ORDER BY YEAR;
-- Consistent EPS growth reflects strong shareholder value creation and efficient capital utilization.

-- REVENUE CAGR
SELECT
MIN(YEAR) AS STARTYEAR,
MAX(YEAR) AS ENDYEAR,
MIN(REVENUE) AS STARTREVENUE,
MAX(REVENUE) AS ENDREVENUE,
ROUND(
(POW(MAX(REVENUE)/MIN(REVENUE),
1.0/(MAX(YEAR)-MIN(YEAR)))-1) * 100,
2) AS REVENUECAGR
FROM INFOSYS_FINANCIALS;

-- NET PROFIT CAGR
SELECT ROUND(
(POW(MAX(NETPROFIT)/MIN(NETPROFIT),
1.0/(MAX(YEAR)-MIN(YEAR)))-1) * 100,
2) AS PROFITCAGR
FROM INFOSYS_FINANCIALS;
-- Revenue is growing strongly, but profit is growing slightly slower, indicating stable but non-expanding margins — typical of a mature, large-cap IT services company.

-- NET MARGIN STABILITY
SELECT YEAR,
ROUND((NETPROFIT / REVENUE) * 100, 2) AS NETMARGIN
FROM INFOSYS_FINANCIALS;
-- Infosys maintains strong but slightly moderating net margins, reflecting stable profitability with mild margin compression typical of mature IT firms.

-- profit conversion ratio
SELECT 
    Year,
    ROUND((NetProfit / OpProfit) * 100, 2) AS ProfitConversion
FROM infosys_financials;
-- High and stable profit conversion indicates strong financial health with low leverage and efficient earnings translation.

