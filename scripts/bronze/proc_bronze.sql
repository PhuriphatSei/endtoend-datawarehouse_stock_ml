/*
===============================================================================
Stored Procedure: Load Bronze Layer - Simplified Version
===============================================================================
This version removes the problematic ERRORFILE parameter and focuses on 
handling the data conversion overflow issue.
===============================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME;
    DECLARE @row_count INT;
    
    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT '================================================';
        PRINT 'Loading Bronze Layer';
        PRINT '================================================';
        PRINT '------------------------------------------------';
        PRINT 'Loading Result Tables';
        PRINT '------------------------------------------------';
        
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.aapl';
        TRUNCATE TABLE bronze.aapl;
        
        PRINT '>> Inserting Data Into: bronze.aapl';
        
        -- Simplified BULK INSERT without ERRORFILE
        BULK INSERT bronze.aapl
        FROM 'AAPL_raw_data.csv'
        WITH (
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            FIRSTROW = 2,
            CODEPAGE = '65001',
            MAXERRORS = 100
        );

        
        -- Get row count for verification
        SELECT @row_count = COUNT(*) FROM bronze.aapl;
        
        SET @end_time = GETDATE();
        PRINT '>> Records Loaded: ' + CAST(@row_count AS NVARCHAR);
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> Status: SUCCESS';
        PRINT '>> -------------';

        
        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.amzn';
		TRUNCATE TABLE bronze.amzn;

		PRINT '>> Inserting Data Into: bronze.amzn';
		BULK INSERT bronze.amzn
		FROM 'AMZN_raw_data.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
            CODEPAGE = '65001',
            MAXERRORS = 100,
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

                -- Get row count for verification
        SELECT @row_count = COUNT(*) FROM bronze.googl;

        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.googl';
		TRUNCATE TABLE bronze.googl;

		PRINT '>> Inserting Data Into: bronze.googl';
		BULK INSERT bronze.googl
		FROM 'GOOGL_raw_data.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
            CODEPAGE = '65001',
            MAXERRORS = 100,
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

                -- Get row count for verification
        SELECT @row_count = COUNT(*) FROM bronze.googl;

        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.meta';
		TRUNCATE TABLE bronze.meta;

		PRINT '>> Inserting Data Into: bronze.meta';
		BULK INSERT bronze.meta
		FROM 'GOOGL_raw_data.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
            CODEPAGE = '65001',
            MAXERRORS = 100,
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

                -- Get row count for verification
        SELECT @row_count = COUNT(*) FROM bronze.meta;

        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.meta';
		TRUNCATE TABLE bronze.meta;

		PRINT '>> Inserting Data Into: bronze.meta';
		BULK INSERT bronze.meta
		FROM 'META_raw_data.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
            CODEPAGE = '65001',
            MAXERRORS = 100,
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

                -- Get row count for verification
        SELECT @row_count = COUNT(*) FROM bronze.meta;


        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.msft';
		TRUNCATE TABLE bronze.msft;

		PRINT '>> Inserting Data Into: bronze.msft';
		BULK INSERT bronze.msft
		FROM 'MSFT_raw_data.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
            CODEPAGE = '65001',
            MAXERRORS = 100,
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

                -- Get row count for verification
        SELECT @row_count = COUNT(*) FROM bronze.msft;

        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.nvda';
		TRUNCATE TABLE bronze.nvda;

		PRINT '>> Inserting Data Into: bronze.nvda';
		BULK INSERT bronze.nvda
		FROM 'NVDA_raw_data.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
            CODEPAGE = '65001',
            MAXERRORS = 100,
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

                -- Get row count for verification
        SELECT @row_count = COUNT(*) FROM bronze.nvda;

        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.tsla';
		TRUNCATE TABLE bronze.tsla;

		PRINT '>> Inserting Data Into: bronze.tsla';
		BULK INSERT bronze.tsla
		FROM 'TSLA_raw_data.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
            CODEPAGE = '65001',
            MAXERRORS = 100,
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

                -- Get row count for verification
        SELECT @row_count = COUNT(*) FROM bronze.tsla;


    END TRY
    BEGIN CATCH
        PRINT '==========================================';
        PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
        PRINT '==========================================';
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS NVARCHAR);
        PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT 'Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR);
        PRINT '==========================================';
        
        -- Re-throw the error
        THROW;
    END CATCH
END;
