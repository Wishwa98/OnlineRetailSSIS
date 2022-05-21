drop table if exists FactOrder;
create table FactOrder(
	CustomerKey int foreign key references DimCustomer(CustomerSK),
	ProductKey int foreign key references DimProduct(ProductSK),
	OrderDateKey int foreign key references DimDate(DateKey),
	ShipDateKey	int foreign key references DimDate(DateKey),
	Row_Order_ID int ,
	Market nvarchar(50),
	OrderPriority nvarchar(50),
	OrderQuantity smallint,
	Sales money,
	Discount money,
	ShippingCost money,
	Profit money,
	Cost AS ([Sales]+[ShippingCost]),
	TotalCostPerItem AS (([Sales]-[discount])*[OrderQuantity]+[ShippingCost]),
	accm_txn_create_time datetime,
	accm_txn_complete_time datetime,
	txn_process_time_hours int,
	
)
