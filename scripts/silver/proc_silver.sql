/*
===============================================================================
Stored Procedure: Load Silver Layer (Bronze -> Silver)
===============================================================================
Script Purpose:
    This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema tables from the 'bronze' schema.
	Actions Performed:
		- Truncates Silver tables.
		- Inserts transformed and cleansed data from Bronze into Silver tables.
		
Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC Silver.load_silver;
===============================================================================
*/

CREATE OR ALTER PROCEDURE silver.load_silver AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT '================================================';
        PRINT 'Loading Silver Layer';
        PRINT '================================================';

		PRINT '------------------------------------------------';
		PRINT 'Loading result Tables';
		PRINT '------------------------------------------------';

		-- Loading silver.aapl
        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: silver.aapl';
		TRUNCATE TABLE silver.aapl;
		PRINT '>> Inserting Data Into: silver.aapl';
        INSERT INTO silver.aapl (
            Close_value,
            High_value,
            Low_value,
            Open_value,
            Volume,
            Symbol,
            Company_Name,
            Date

        )
        SELECT
            CAST(Close_value AS FLOAT) AS Close_value,
            CAST(High_value AS FLOAT) AS High_value,
            CAST(Low_value AS FLOAT) AS Low_value,
            CAST(Open_value AS FLOAT) AS Open_value,
            CAST(Volume AS BIGINT) AS Volume,
            Symbol,
            Company_Name,
            CAST(Date AS datetime) AS Date

        FROM bronze.aapl;  -- ดึงข้อมูลจาก bronze.aapl


        SET @end_time = GETDATE();
        PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';

		-- Loading silver.amzn
        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: silver.amzn';
		TRUNCATE TABLE silver.amzn;
		PRINT '>> Inserting Data Into: silver.amzn';
        INSERT INTO silver.amzn (
            Close_value,
            High_value,
            Low_value,
            Open_value,
            Volume,
            Symbol,
            Company_Name,
            Date

        )
        SELECT
            CAST(Close_value AS FLOAT) AS Close_value,
            CAST(High_value AS FLOAT) AS High_value,
            CAST(Low_value AS FLOAT) AS Low_value,
            CAST(Open_value AS FLOAT) AS Open_value,
            CAST(Volume AS BIGINT) AS Volume,
            Symbol,
            Company_Name,
            CAST(Date AS datetime) AS Date

        FROM bronze.amzn;  -- ดึงข้อมูลจาก bronze.amzn

        SET @end_time = GETDATE();
        PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';

        SET @end_time = GETDATE();
        PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';

		-- Loading silver.googl
        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: silver.googl';
		TRUNCATE TABLE silver.googl;
		PRINT '>> Inserting Data Into: silver.googl';
        INSERT INTO silver.googl (
            Close_value,
            High_value,
            Low_value,
            Open_value,
            Volume,
            Symbol,
            Company_Name,
            Date

        )
        SELECT
            CAST(Close_value AS FLOAT) AS Close_value,
            CAST(High_value AS FLOAT) AS High_value,
            CAST(Low_value AS FLOAT) AS Low_value,
            CAST(Open_value AS FLOAT) AS Open_value,
            CAST(Volume AS BIGINT) AS Volume,
            Symbol,
            Company_Name,
            CAST(Date AS datetime) AS Date

        FROM bronze.googl;  -- ดึงข้อมูลจาก bronze.googl

        SET @end_time = GETDATE();
        PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';

		-- Loading silver.meta
        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: silver.meta';
		TRUNCATE TABLE silver.meta;
		PRINT '>> Inserting Data Into: silver.meta';
        INSERT INTO silver.meta (
            Close_value,
            High_value,
            Low_value,
            Open_value,
            Volume,
            Symbol,
            Company_Name,
            Date

        )
        SELECT
            CAST(Close_value AS FLOAT) AS Close_value,
            CAST(High_value AS FLOAT) AS High_value,
            CAST(Low_value AS FLOAT) AS Low_value,
            CAST(Open_value AS FLOAT) AS Open_value,
            CAST(Volume AS BIGINT) AS Volume,
            Symbol,
            Company_Name,
            CAST(Date AS datetime) AS Date

        FROM bronze.meta;  -- ดึงข้อมูลจาก bronze.meta

        SET @end_time = GETDATE();
        PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';

		-- Loading silver.msft
        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: silver.msft';
		TRUNCATE TABLE silver.msft;
		PRINT '>> Inserting Data Into: silver.msft';
        INSERT INTO silver.msft (
            Close_value,
            High_value,
            Low_value,
            Open_value,
            Volume,
            Symbol,
            Company_Name,
            Date

        )
        SELECT
            CAST(Close_value AS FLOAT) AS Close_value,
            CAST(High_value AS FLOAT) AS High_value,
            CAST(Low_value AS FLOAT) AS Low_value,
            CAST(Open_value AS FLOAT) AS Open_value,
            CAST(Volume AS BIGINT) AS Volume,
            Symbol,
            Company_Name,
            CAST(Date AS datetime) AS Date

        FROM bronze.msft;  -- ดึงข้อมูลจาก bronze.msft

        SET @end_time = GETDATE();
        PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';


		-- Loading silver.nvda
        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: silver.nvda';
		TRUNCATE TABLE silver.nvda;
		PRINT '>> Inserting Data Into: silver.nvda';
        INSERT INTO silver.nvda (
            Close_value,
            High_value,
            Low_value,
            Open_value,
            Volume,
            Symbol,
            Company_Name,
            Date

        )
        SELECT
            CAST(Close_value AS FLOAT) AS Close_value,
            CAST(High_value AS FLOAT) AS High_value,
            CAST(Low_value AS FLOAT) AS Low_value,
            CAST(Open_value AS FLOAT) AS Open_value,
            CAST(Volume AS BIGINT) AS Volume,
            Symbol,
            Company_Name,
            CAST(Date AS datetime) AS Date

        FROM bronze.nvda;  -- ดึงข้อมูลจาก bronze.nvda

        SET @end_time = GETDATE();
        PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';

		-- Loading silver.tsla
        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: silver.tsla';
		TRUNCATE TABLE silver.tsla;
		PRINT '>> Inserting Data Into: silver.tsla';
        INSERT INTO silver.tsla (
            Close_value,
            High_value,
            Low_value,
            Open_value,
            Volume,
            Symbol,
            Company_Name,
            Date

        )
        SELECT
            CAST(Close_value AS FLOAT) AS Close_value,
            CAST(High_value AS FLOAT) AS High_value,
            CAST(Low_value AS FLOAT) AS Low_value,
            CAST(Open_value AS FLOAT) AS Open_value,
            CAST(Volume AS BIGINT) AS Volume,
            Symbol,
            Company_Name,
            CAST(Date AS datetime) AS Date

        FROM bronze.tsla;  -- ดึงข้อมูลจาก bronze.tsla

        SET @end_time = GETDATE();
        PRINT 'Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';


    END TRY
    BEGIN CATCH
        PRINT '==================  ERROR LOADING SILVER  ==================';
        PRINT 'Message : ' + ERROR_MESSAGE();
        PRINT 'Number  : ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'State   : ' + CAST(ERROR_STATE()  AS NVARCHAR);
        THROW;   -- bubble ขึ้นไปให้ผู้เรียกเห็น
    END CATCH
END;
GO
