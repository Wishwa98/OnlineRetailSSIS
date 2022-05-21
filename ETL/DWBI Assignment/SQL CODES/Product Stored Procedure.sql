CREATE PROCEDURE dbo.UpdateDimProduct
@Product_ID nvarchar(50),
@Product_Name nvarchar(50),
@Sub_Category int
AS
BEGIN

IF not exists ( SELECT ProductSK
				FROM dbo.DimProduct
				WHERE AlternateProductID=@Product_ID)
BEGIN
INSERT INTO dbo.DimProduct(AlternateProductID,ProductName,ProductSubCategoryKey)
VALUES (@Product_ID,@Product_Name,@Sub_Category)
END;

IF exists (		SELECT ProductSK
				FROM dbo.DimProduct
				WHERE AlternateProductID=@Product_ID)
BEGIN
update dbo.DimProduct
set ProductName=@Product_Name,ProductSubCategoryKey=@Sub_Category
WHERE AlternateProductID=@Product_ID
END;

END;
 