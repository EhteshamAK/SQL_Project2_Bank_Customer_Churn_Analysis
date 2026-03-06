SELECT * FROM bank_customer_churn.bank_churn;

-- ## Count customers by Geogrpahy

select geography, count(*) as NumOfCustomers
from bank_customer_churn.bank_churn
group by Geography;
-- Ans: France has more customers than spain and germany

-- ## Average Credit score by Gender;

select Gender, Round(avg(creditScore),2) as Average_Credit_Score
from bank_customer_churn.bank_churn
group by Gender;
-- Female has slightly high credit score than male

-- ## Total balance by Geoghraphy

select geography, round(sum(balance),2) as Total_Balance
from bank_customer_churn.bank_churn
group by Geography;
-- france has more banlance than spain and germany 

-- ## Customers by Num of Products 
select numofproducts, count(*) as  Num_of_Customers 
from bank_customer_churn.bank_churn
group by NumOfProducts
order by NumOfProducts;

-- ## Customers with credit cards
select 
CASE WHEN HasCrCard = 1 THEN 'Has Credit Card' ELSE 'No Credit Card' END AS Card_Status,
HasCrCard, count(*) as Total_creditCard from bank_customer_churn.bank_churn
group by HasCrCard;
-- 7055 customers has credit card and 2945 didn't have credit card

-- ## Top 10 customers with highest balance
 
 Select customerId, Surname, Balance
 from bank_customer_churn.bank_churn
 order by Balance desc
 limit 10;


-- ## Average Estimated Salary by Geography

select Geography, avg(EstimatedSalary) as Average_Salary
from bank_customer_churn.bank_churn
group by Geography;

-- ## Age Distribution (Group by Decade)

SELECT FLOOR(Age/10)*10 AS AgeGroup, COUNT(*) AS NumCustomers
FROM bank_customer_churn.bank_churn
GROUP BY AgeGroup
ORDER BY AgeGroup;

-- ## Churn Analysis( Exited Column)

SELECT Exited, COUNT(*) AS NumCustomers
FROM bank_customer_churn.bank_churn
GROUP BY Exited;

-- ## Churn rate by geogrpahy

SELECT 
Geography,
COUNT(*) AS Total_Customers,
SUM(Exited) AS Customers_Exited,
ROUND(SUM(Exited)/COUNT(*) * 100,2) AS Churn_Rate_Percentage
FROM bank_customer_churn.bank_churn
GROUP BY Geography;
