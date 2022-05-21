CREATE PROCEDURE dbo.UpdateDimProductSubCategory
@Sub_CategoryID int,
@Sub_Category nvarchar(50),
@ProductCategoryKey int
AS
BEGIN
IF not exists ( SELECT ProductSubCategorySK
				FROM  dbo.DimProductSubCategory
				WHERE AlternateProductSubCaregoryID=@Sub_CategoryID)
BEGIN 
INSERT INTO dbo.DimProductSubCategory (AlternateProductSubCaregoryID,ProductSubCategoryName,ProductCategoryKey)
VALUES (@Sub_CategoryID,@Sub_Category,@ProductCategoryKey)
END;

IF exists( SELECT ProductSubCategorySK
				FROM  dbo.DimProductSubCategory
				WHERE AlternateProductSubCaregoryID=@Sub_CategoryID)
BEGIN 
update dbo.DimProductSubCategory 
set ProductSubCategoryName=@Sub_Category,ProductCategoryKey=@ProductCategoryKey
WHERE AlternateProductSubCaregoryID=@Sub_CategoryID
END;

END;