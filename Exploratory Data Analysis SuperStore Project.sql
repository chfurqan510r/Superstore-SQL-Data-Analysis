-- -- Exploratory Data Analysis

Select *
from superstore_staging;

select round(sum(Sales), 2) as Total_Sales , round(sum(Profit), 2) as Total_Profit , 
round((sum(Profit)/sum(Sales))* 100, 2) As  Profit_Margin_Percentage
 from superstore_staging;
 
 Select City , State, round(sum(Profit),2) As Total_Profit
 from superstore_staging
 group by City, State
 Order by Total_Profit desc Limit 5;
 
 
 Select Product_Name , Category , Round(sum(Profit),2) As Loss_Profit
 from superstore_staging
 group by Product_Name, Category
 having Loss_Profit < 0
 order by Loss_Profit asc Limit 5 ;
 
 select Year(`Order_Date`), round(sum(Sales), 2) As Total_Sales
from superstore_staging
group by Year(`Order_Date`)
order by Total_Sales desc ;

select substring(`Order_Date`,1,7) As Month , 
round(sum(Profit),2) as Total_Profit
 from superstore_staging
 group by Month
 order by 1 Asc;
 
 with ROlling_Profit as
 (
select substring(`Order_Date`,1,7) As Month , 
round(sum(Profit),2) as Total_Profit
 from superstore_staging
 group by Month
 order by 1 Asc
 )
 select  Month , Total_Profit , Round(sum(Total_Profit) over (order by Month ),2) as Rolling_Profit
 from ROlling_Profit
 order by Month Asc;
 
 
 select Segment , count(Distinct Customer_ID) as Total_Customer,
Round(sum(Sales), 2) As Total_Sales,
Round(sum(Profit), 2) As Total_Profit,
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2)as Profit_Margin_Percentage
 from superstore_staging
 group by 1
 order by Total_Profit Desc ;
 
 
 select  Ship_Mode,
 Round(Avg(datediff(Ship_Date, Order_Date)),1) As Delivery_Time,
 Round(sum(Sales),2) as Total_Sales
 from superstore_staging
 group by 1
 order by 2 desc;
 
 select Year(`Order_Date`) as Year,Sub_Category,
 ROund(sum(Sales),2) as Total_Sales
 from superstore_staging
 group by 1, 2;
 
 with SubCat_Sales as
 (
 select Year(`Order_Date`) as Year,Sub_Category,
 ROund(sum(Sales),2) as Total_Sales
 from superstore_staging
 group by 1, 2
 ),
 Dense_SubCat_Sales as(
 select Year, Sub_Category, Total_Sales , dense_rank() over(partition by Year order by Total_Sales desc) as Sales_Rank
 from SubCat_Sales
 )
 select * 
 from Dense_SubCat_Sales
 where Sales_Rank <= 3;
 
 select Category,
 Round(sum(Sales),2) as Total_Sales,
 Round(sum(Profit),2) as Total_Profit
 from superstore_staging
 group by 1;
 
 
 select State,
 Round(sum(Sales),2) as Total_Sales,
 Round(sum(Profit),2) as Total_Profit
 from superstore_staging
 group by 1
 order by 3 Desc limit 10;
 
 
 select State,
 Round(sum(Sales),2) as Total_Sales,
 Round(sum(Profit),2) as Total_Profit
 from superstore_staging
 group by 1
 order by 3 Asc limit 10;
 
 select round(Discount,2) as Discount,
 round(Avg(Profit),2) as Profit
 from superstore_staging
 group by 1
 order by 1;
 
 select Customer_Name,
 Round(sum(Sales),2) as Total_Sales,
 Round(sum(Profit),2) as Total_Profit
 from superstore_staging
 group by 1
 order by 3 desc limit 10;
 
 select substring(`Order_Date`,6,2) as Month,
  Round(sum(Sales),2) as Total_Sales
  from superstore_staging
  group by 1
  order by 2 desc;
  
  select Customer_Name , count(Distinct Order_ID)  as Total_Orders
  from superstore_staging
  group by 1
  order by 2 desc;
  
  select round(sum(Sales)/ count(Distinct Order_ID),2)
  as Avg_Order_Value
  from superstore_staging;
  
  select Product_Name,
 Round(sum(Sales),2) as Total_Sales,
 Round(sum(Profit),2) as Total_Profit,
 round((sum(Profit)/ sum(Sales)) * 100,2) as Profit_Margin_Percentage
 from superstore_staging
 group by 1
 order by 3 desc limit 10;
 

 