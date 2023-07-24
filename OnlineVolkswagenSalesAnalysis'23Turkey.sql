--Data Retrieved from Kaggle: Online Automotive Sales Statistics'23 (Volkswagen)----
--I select top 1000 rows prior to starting this Analysis

---inspecting data retrieved---

select * from [dbo].[VW_Carsales_data$]

---checking for unique values --- 

select distinct advertisement_number from [dbo].[VW_Carsales_data$] 
select distinct customer_id from [dbo].[VW_Carsales_data$]
select distinct variant from [dbo].[VW_Carsales_data$]
select distinct city from [dbo].[VW_Carsales_data$]
select distinct year from [dbo].[VW_Carsales_data$]
select distinct AdDateConverted from [dbo].[VW_Carsales_data$]

---Analysis---
---Aggragate function--
---Sum of price in USD [United States Dollar] --

select model, ROUND(SUM ([priceUSD]), 2, 1) Revenue
from [dbo].[VW_Carsales_data$]
group by model
order by 2 desc --passat gained more revenue

select year, ROUND(SUM ([priceUSD]), 2, 1) Revenue
from [dbo].[VW_Carsales_data$]
group by year
order by 2 desc --- brand year 2015 gained more revenue

select AdDateConverted, ROUND(SUM ([priceUSD]), 2, 1) Revenue, COUNT(model) Frequency
from [dbo].[VW_Carsales_data$]
group by AdDateConverted
order by 3 desc --- 03/28 sold the most 

select year, ROUND(SUM ([priceUSD]), 2, 1) Revenue, COUNT(model) Frequency
from [dbo].[VW_Carsales_data$]
group by year
order by 3 desc --- 2015 brand sold at 680 quantity

-----Retreiving more detail from 3/28

select AdDateConverted, model, variant, year,  ROUND(SUM ([priceUSD]), 2, 1) Revenue, COUNT(model) frequency_model , COUNT(variant) frequency_variant
from [dbo].[VW_Carsales_data$]
where AdDateConverted = '2023-03-28' 
group by AdDateConverted, model, variant, year
order by 7 desc




