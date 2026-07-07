
CREATE TABLE superstore_project.Superstore (
    Row_ID INT,
    Order_ID VARCHAR(255),
    Order_Date VARCHAR(50),
    Ship_Date VARCHAR(50),
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(255),
    Customer_Name VARCHAR(255),
    Segment VARCHAR(255),
    Country VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    Postal_Code VARCHAR(50),
    Region VARCHAR(255),
    Product_ID VARCHAR(255),
    Category VARCHAR(255),
    Sub_Category VARCHAR(255),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,4),
    Quantity INT,
    Discount DECIMAL(4,2),
    Profit DECIMAL(10,4)
);

LOAD DATA LOCAL INFILE 'C:\\Users\\ARSHAD COMPUTER\\Downloads\\archive (14)\\Sample - Superstore.csv' 
INTO TABLE superstore_project.Superstore 
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS;

select * from superstore;

-- Remove Duplicate
create table superstore_staging
like superstore;

insert superstore_staging
select * 
from superstore;

select * from superstore_staging;

select *,
row_number() over ( partition by
Row_ID, Order_ID, `Order_Date`, `Ship_Date`, Ship_Mode, Customer_ID, 
Customer_Name, Segment, Country, City, State, Postal_Code, Region, 
Product_ID, Category, Sub_Category, Product_Name, Sales, Quantity, Discount, Profit) as row_num
from superstore_staging;

with duplicate_cte as
(
select *,
row_number() over ( partition by
Row_ID, Order_ID, `Order_Date`, `Ship_Date`, Ship_Mode, Customer_ID, 
Customer_Name, Segment, Country, City, State, Postal_Code, Region, 
Product_ID, Category, Sub_Category, Product_Name, Sales, Quantity, Discount, Profit) as row_num
from superstore_staging
)
select * 
from duplicate_cte
where row_num > 1;

-- Standardize Data
select * 
from superstore_staging;

select Ship_Mode,length(Ship_Mode), trim(Ship_Mode) , length(trim(Ship_Mode))
from superstore_staging;

select distinct Ship_Mode 
from superstore_staging;

select Customer_Name,length(Customer_Name), trim(Customer_Name) , length(trim(Customer_Name))
from superstore_staging;

select distinct Customer_Name
from superstore_staging
order by 1 ;

select Country ,length(Country), trim(Country) , length(trim(Country))
from superstore_staging;

select distinct Country
from superstore_staging;

select Segment,length(Segment), trim(Segment) , length(trim(Segment))
from superstore_staging;

select distinct Segment 
from superstore_staging;

select City,length(City), trim(City) , length(trim(City))
from superstore_staging;

select distinct City
from superstore_staging;

select State,length(State), trim(State) , length(trim(State)),
Region,length(Region), trim(Region) , length(trim(Region)),
Category,length(Category), trim(Category) , length(trim(Category)),
Sub_Category,length(Sub_Category), trim(Sub_Category) , length(trim(Sub_Category))
from superstore_staging;

select distinct State  
from superstore_staging;

select distinct Region  
from superstore_staging;

select distinct Category
from superstore_staging;

select distinct Sub_Category
from superstore_staging;

select `Order_Date`,
str_to_date(`Order_Date`,'%m/%d/%Y')
from superstore_staging;

update superstore_staging
set `Order_Date` = str_to_date(`Order_Date`,'%m/%d/%Y');

set sql_safe_updates = 0;

select `Order_Date`
from superstore_staging;

alter table superstore_staging
modify column `Order_Date` date; 

select `Ship_Date` , 
str_to_date(`Ship_Date`, '%m/%d/%Y')
from superstore_staging;

update superstore_staging
set `Ship_Date` = str_to_date(`Ship_Date`, '%m/%d/%Y');

select `Ship_Date`
from superstore_staging;

alter table superstore_staging
modify column `Ship_Date` date;

-- 3. Look at null values
select * 
from superstore_staging;

select *
from superstore_staging
where Order_ID is null
OR Customer_ID is null
OR Product_ID is null;

select *
from superstore_staging
where Order_ID = ''
OR Customer_ID = ''
OR Product_ID = '';

select *
from superstore_staging
where Sales is null OR 
Quantity is null OR 
Discount is null OR 
Profit is null ;

Select *
from superstore_staging
where Postal_Code is null 
OR Postal_Code = '';

select * 
from superstore_staging
where `Order_Date` is null OR 
`Ship_Date` is null;

select * 
from superstore_staging
where Ship_Mode is null 
or Ship_Mode = ''
OR Customer_Name is null
OR Customer_Name = ''
OR Segment is null
OR Segment = ''
OR Country is null
OR Country = ''
OR City is null
OR City = ''
OR State is null
OR State = ''
OR  Region is null
OR Region = '';

-- 4. remove any columns and rows that are not necessary 

alter table superstore_staging
drop column Row_ID;

select * from 
superstore_staging;
