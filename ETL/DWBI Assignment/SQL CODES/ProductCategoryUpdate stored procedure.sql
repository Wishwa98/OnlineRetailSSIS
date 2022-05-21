CREATE PROCEDURE dbo.UpdateDimProductCategory
@CategoryID int,
@Category nvarchar(50)
AS
BEGIN
IF not exists (	SELECT ProductCategorySK
				FROM dbo.DimProductCategory
				WHERE AlternateProductCategoryID=@CategoryID )
BEGIN
INSERT INTO dbo.DimProductCategory(AlternateProductCategoryID,ProductCategoryName)
VALUES(@CategoryID,@Category)
END;

IF exists (SELECT ProductCategorySK
				FROM dbo.DimProductCategory
				WHERE AlternateProductCategoryID=@CategoryID)
BEGIN
update dbo.DimProductCategory
set ProductCategoryName=@Category
WHERE AlternateProductCategoryID=@CategoryID
END;
END;