use sales_project;

show tables;

select * from sales_data
limit 50;

SELECT SUM(Sales) AS Total_Revenue
FROM sales_data;

SELECT SUM(Profit) AS Total_Profit
FROM sales_data;

SELECT Category,
       SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Category
ORDER BY Total_Sales DESC;

SELECT Category,
       SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Category
ORDER BY Total_Profit DESC;

SELECT `Product Name`,
       SUM(Sales) AS Revenue
FROM sales_data
GROUP BY `Product Name`
ORDER BY Revenue DESC
LIMIT 10;

SELECT Region,
       SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;

SELECT `Customer Name`,
       SUM(Sales) AS Total_Spent
FROM sales_data
GROUP BY `Customer Name`
ORDER BY Total_Spent DESC
LIMIT 10;

SELECT MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month,
       SUM(Sales) AS Monthly_Revenue
FROM sales_data
GROUP BY MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')),
         MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y'))
ORDER BY MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y'));


SELECT 
    `Product Name`,
    SUM(Sales) AS Total_Revenue,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS Revenue_Rank
FROM sales_data
GROUP BY `Product Name`
LIMIT 10;

SELECT 
    MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month,
    SUM(Sales) AS Monthly_Revenue,
    SUM(SUM(Sales)) OVER (
        ORDER BY MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y'))
    ) AS Running_Total
FROM sales_data
GROUP BY 
    MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')),
    MONTHNAME(STR_TO_DATE(`Order Date`, '%m/%d/%Y'));
