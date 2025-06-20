/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID('bronze.aapl', 'U') IS NOT NULL
    DROP TABLE bronze.aapl;
GO

CREATE TABLE bronze.aapl (
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

IF OBJECT_ID('bronze.amzn', 'U') IS NOT NULL
    DROP TABLE bronze.amzn;
GO
CREATE TABLE bronze.amzn (
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

IF OBJECT_ID('bronze.googl', 'U') IS NOT NULL
    DROP TABLE bronze.googl;
GO
CREATE TABLE bronze.googl (
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

IF OBJECT_ID('bronze.meta', 'U') IS NOT NULL
    DROP TABLE bronze.meta;
GO

CREATE TABLE bronze.meta (
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

IF OBJECT_ID('bronze.msft', 'U') IS NOT NULL
    DROP TABLE bronze.msft;
GO

CREATE TABLE bronze.msft (
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

IF OBJECT_ID('bronze.nvda', 'U') IS NOT NULL
    DROP TABLE bronze.nvda;
GO

CREATE TABLE bronze.nvda (
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

IF OBJECT_ID('bronze.tsla', 'U') IS NOT NULL
    DROP TABLE bronze.tsla;
GO

CREATE TABLE bronze.tsla (
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
