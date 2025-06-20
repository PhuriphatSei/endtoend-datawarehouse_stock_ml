/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID('silver.aapl', 'U') IS NOT NULL
    DROP TABLE silver.aapl;
GO

CREATE TABLE silver.aapl (
    Close_value     NVARCHAR(20),
    High_value      NVARCHAR(20),
    Low_value       NVARCHAR(20),
    Open_value      NVARCHAR(20),
    Volume          NVARCHAR(100),
    Symbol          NVARCHAR(20),
    Company_Name    NVARCHAR(100),
    Date            NVARCHAR(100),

);
GO

IF OBJECT_ID('silver.amzn', 'U') IS NOT NULL
    DROP TABLE silver.amzn;
GO
CREATE TABLE silver.amzn (
    Close_value     NVARCHAR(20),
    High_value      NVARCHAR(20),
    Low_value       NVARCHAR(20),
    Open_value      NVARCHAR(20),
    Volume          NVARCHAR(100),
    Symbol          NVARCHAR(20),
    Company_Name    NVARCHAR(100),
    Date            NVARCHAR(100),

);
GO

IF OBJECT_ID('silver.googl', 'U') IS NOT NULL
    DROP TABLE silver.googl;
GO
CREATE TABLE silver.googl (
    Close_value     NVARCHAR(20),
    High_value      NVARCHAR(20),
    Low_value       NVARCHAR(20),
    Open_value      NVARCHAR(20),
    Volume          NVARCHAR(100),
    Symbol          NVARCHAR(20),
    Company_Name    NVARCHAR(100),
    Date            NVARCHAR(100),

);
GO

IF OBJECT_ID('silver.meta', 'U') IS NOT NULL
    DROP TABLE silver.meta;
GO

CREATE TABLE silver.meta (
    Close_value     NVARCHAR(20),
    High_value      NVARCHAR(20),
    Low_value       NVARCHAR(20),
    Open_value      NVARCHAR(20),
    Volume          NVARCHAR(100),
    Symbol          NVARCHAR(20),
    Company_Name    NVARCHAR(100),
    Date            NVARCHAR(100),


);
GO

IF OBJECT_ID('silver.msft', 'U') IS NOT NULL
    DROP TABLE silver.msft;
GO

CREATE TABLE silver.msft (
    Close_value     NVARCHAR(20),
    High_value      NVARCHAR(20),
    Low_value       NVARCHAR(20),
    Open_value      NVARCHAR(20),
    Volume          NVARCHAR(100),
    Symbol          NVARCHAR(20),
    Company_Name    NVARCHAR(100),
    Date            NVARCHAR(100),


);
GO

IF OBJECT_ID('silver.nvda', 'U') IS NOT NULL
    DROP TABLE silver.nvda;
GO

CREATE TABLE silver.nvda (
    Close_value     NVARCHAR(20),
    High_value      NVARCHAR(20),
    Low_value       NVARCHAR(20),
    Open_value      NVARCHAR(20),
    Volume          NVARCHAR(100),
    Symbol          NVARCHAR(20),
    Company_Name    NVARCHAR(100),
    Date            NVARCHAR(100),


);
GO

IF OBJECT_ID('silver.tsla', 'U') IS NOT NULL
    DROP TABLE silver.tsla;
GO

CREATE TABLE silver.tsla (
    Close_value     NVARCHAR(20),
    High_value      NVARCHAR(20),
    Low_value       NVARCHAR(20),
    Open_value      NVARCHAR(20),
    Volume          NVARCHAR(100),
    Symbol          NVARCHAR(20),
    Company_Name    NVARCHAR(100),
    Date            NVARCHAR(100),

);
GO
