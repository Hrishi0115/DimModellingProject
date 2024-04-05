-- Create Date table 

--SELECT MIN(date), MAX(date) FROM cleanedTotalSocialSales;

-- 01/03/2023 - 30/05/2023 

-- Step 1: Create the date dimension table with a simple DateID

--CREATE TABLE hrishisingh.dimension_date (
--    DateID INT IDENTITY(1,1) PRIMARY KEY, -- Auto-incremented integer as DateID
--    FullDate DATE,
--    Day INT,
--    Month INT,
--    Year INT,
--    Quarter INT,
--    WeekOfYear INT,
--    DayOfWeek INT,
--    MonthName VARCHAR(20),
--    DayOfWeekName VARCHAR(20)
--);

---- Step 2: Generate the date range and insert into the table without specifying DateID
--;WITH DateRange AS (
--    SELECT CAST('2023-03-01' AS DATE) AS DateValue
--    UNION ALL
--    SELECT DATEADD(DAY, 1, DateValue)
--    FROM DateRange
--    WHERE DateValue < '2023-05-30'
--)
--INSERT INTO dimension_date (FullDate, Day, Month, Year, Quarter, WeekOfYear, DayOfWeek, MonthName, DayOfWeekName)
--SELECT
--    DateValue,
--    DAY(DateValue),
--    MONTH(DateValue),
--    YEAR(DateValue),
--    DATEPART(QUARTER, DateValue),
--    DATEPART(WEEK, DateValue),
--    DATEPART(WEEKDAY, DateValue),
--    DATENAME(MONTH, DateValue),
--    DATENAME(WEEKDAY, DateValue)
--FROM DateRange
--OPTION (MAXRECURSION 0);

---- Step 3: Query to verify the data
--SELECT * FROM dimension_date;

-- create dimension_product

-- product_id, product_name  

--SELECT * FROM [datalab_de35].[hrishisingh].[cleanedTotalSocialSales]; 

SELECT DISTINCT Product FROM [datalab_de35].[hrishisingh].[cleanedTotalSocialSales]; 

SELECT * FROM dimension_date; 

--CREATE TABLE dimension_product (
--	ProductID INT IDENTITY(1,1) PRIMARY KEY,
--	ProductName VARCHAR(50) 
--)

--SELECT * FROM dimension_product;

--INSERT INTO dimension_product (ProductName)
--SELECT DISTINCT Product FROM [datalab_de35].[hrishisingh].[cleanedTotalSocialSales]

SELECT platform, likes, shares, comments from cleanedTotalSocialSales; 

-- socialID 

--CREATE TABLE dimension_socialMedia (
--    SocialMediaID INT IDENTITY(1,1) PRIMARY KEY,
--    Platform VARCHAR(50),
--    Likes INT,
--    Shares INT,
--    Comments INT
--);

SELECT * FROM dimension_socialMedia;
SELECT * FROM dimension_date; 
SELECT * FROM dimension_product; 
SELECT * FROM cleanedTotalSocialSales;

--INSERT INTO dimension_socialMedia (Platform, Likes, Shares, Comments)
--SELECT DISTINCT platform, likes, shares, comments from cleanedTotalSocialSales; 


--CREATE TABLE FactSales (
--    FactSalesID INT IDENTITY(1,1) PRIMARY KEY,
--    DateID INT,
--    ProductID INT,
--    SocialMediaID INT,
--    SalePrice DECIMAL(10,2),
--	  Quantity INT,
--    Inquiries INT,
--    FOREIGN KEY (DateID) REFERENCES dimension_date(DateID),
--    FOREIGN KEY (ProductID) REFERENCES dimension_product(ProductID),
--    FOREIGN KEY (SocialMediaID) REFERENCES dimension_socialMedia(SocialMediaID)
--);

SELECT * FROM FactSales;

--INSERT INTO FactSales (DateID, ProductID, SocialMediaID, SalePrice, Inquiries, Quantity)
--SELECT 
--    d.DateID, 
--    p.ProductID, 
--    sm.SocialMediaID, 
--    o.Sale_Price, 
--    o.Inquiries, 
--    o.Sales
--FROM 
--    cleanedTotalSocialSales AS o 
--JOIN 
--    dimension_date d ON o.Date = d.FullDate
--JOIN 
--    dimension_product p ON o.Product = p.ProductName
--JOIN 
--    dimension_socialMedia sm ON o.Platform = sm.Platform AND o.Likes = sm.Likes AND o.Shares = sm.Shares AND o.Comments = sm.Comments;

