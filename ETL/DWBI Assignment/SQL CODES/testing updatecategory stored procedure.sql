select * from DimProductCategory
select * from DimProductSubCategory

Select * from superstore_Staging.dbo.ProductCategoryStaging
Select * from superstore_Staging.dbo.OrderStaging
Select* from superstore_Staging.dbo.ProductSubCatergory

insert into superstore_Staging.dbo.ProductCategoryStaging(CategoryID,Category) values (10,'TestCategory')
insert into superstore_Staging.dbo.ProductSubCatergory (Sub_CategoryID,Sub_Category,CategoryID) values (200,'TestSubCategory',20)

update superstore_Staging.dbo.ProductCategoryStaging set Category ='UpdatedTestCategory' where CategoryID=10

