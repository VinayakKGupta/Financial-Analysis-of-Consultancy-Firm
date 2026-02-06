DELETE FROM [dbo].[dim_city];

DBCC CHECKIDENT ('[dbo].[dim_city]', RESEED, 0);

INSERT INTO [dbo].[dim_city] (city_name)
SELECT DISTINCT city_name
FROM stg_finance;

SELECT *
FROM [dbo].[dim_city]




