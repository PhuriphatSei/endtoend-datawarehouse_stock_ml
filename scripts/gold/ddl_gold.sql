IF OBJECT_ID('gold.dim_aapl', 'V') IS NOT NULL
    DROP VIEW gold.dim_aapl;
GO

CREATE VIEW gold.dim_aapl AS
SELECT
    ROW_NUMBER() OVER (ORDER BY Date, Symbol) AS aapl_sk,  -- Surrogate key
    Close_value,
    High_value,
    Low_value,
    Open_value,
    Volume,
    Symbol,
    Company_Name,
    Date

FROM silver.aapl si;
GO

IF OBJECT_ID('gold.dim_amzn', 'V') IS NOT NULL
    DROP VIEW gold.dim_amzn;
GO


CREATE VIEW gold.dim_amzn AS
SELECT
    ROW_NUMBER() OVER (ORDER BY Date, Symbol) AS amzn_sk,  -- Surrogate key
    Close_value,
    High_value,
    Low_value,
    Open_value,
    Volume,
    Symbol,
    Company_Name,
    Date
   
FROM silver.amzn si;
GO


IF OBJECT_ID('gold.dim_googl', 'V') IS NOT NULL
    DROP VIEW gold.dim_googl;
GO


CREATE VIEW gold.dim_googl AS
SELECT
    ROW_NUMBER() OVER (ORDER BY Date, Symbol) AS googl_sk,  -- Surrogate key
    Close_value,
    High_value,
    Low_value,
    Open_value,
    Volume,
    Symbol,
    Company_Name,
    Date
   
FROM silver.googl si;
GO


IF OBJECT_ID('gold.dim_meta', 'V') IS NOT NULL
    DROP VIEW gold.dim_meta;
GO


CREATE VIEW gold.dim_meta AS
SELECT
    ROW_NUMBER() OVER (ORDER BY Date, Symbol) AS meta_sk,  -- Surrogate key
    Close_value,
    High_value,
    Low_value,
    Open_value,
    Volume,
    Symbol,
    Company_Name,
    Date
   
FROM silver.meta si;
GO


IF OBJECT_ID('gold.dim_msft', 'V') IS NOT NULL
    DROP VIEW gold.dim_msft;
GO


CREATE VIEW gold.dim_msft AS
SELECT
    ROW_NUMBER() OVER (ORDER BY Date, Symbol) AS msft_sk,  -- Surrogate key
    Close_value,
    High_value,
    Low_value,
    Open_value,
    Volume,
    Symbol,
    Company_Name,
    Date
      
FROM silver.msft si;
GO



IF OBJECT_ID('gold.dim_nvda', 'V') IS NOT NULL
    DROP VIEW gold.dim_nvda;
GO


CREATE VIEW gold.dim_nvda AS
SELECT
    ROW_NUMBER() OVER (ORDER BY Date, Symbol) AS nvda_sk,  -- Surrogate key
    Close_value,
    High_value,
    Low_value,
    Open_value,
    Volume,
    Symbol,
    Company_Name,
    Date

FROM silver.nvda si;
GO


IF OBJECT_ID('gold.dim_tsla', 'V') IS NOT NULL
    DROP VIEW gold.dim_tsla;
GO


CREATE VIEW gold.dim_tsla AS
SELECT
    ROW_NUMBER() OVER (ORDER BY Date, Symbol) AS tsla_sk,  -- Surrogate key
    Close_value,
    High_value,
    Low_value,
    Open_value,
    Volume,
    Symbol,
    Company_Name,
    Date
 
FROM silver.tsla si;
GO
