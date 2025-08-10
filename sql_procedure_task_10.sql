--1. sales_monthly_report

CREATE or replace PROCEDURE sales_monthly_report()
LANGUAGE plpgsql
AS $$
BEGIN
create table sales_monthly_report as select
to_char(order_date,'Month')as sales_month,
round(sum(sales)) as total_sales,
sum(qty) as total_quantity,round(sum(profit))as total_profit,avg(sales)as avg_sales from sales
group by sales_month order by  sales_month asc;
END;
$$;

call sales_monthly_report();

select * from sales_monthly_report;

-------------------------------------------------------------------------------------------------------------

--2. sales_yearly_report

CREATE or replace PROCEDURE sales_yearly_report()
LANGUAGE plpgsql
AS $$
BEGIN
create table sales_yearly_report as select
to_char(order_date,'YYYY') as sales_year,
round(sum(sales)) as total_sales,
sum(qty) as total_quantity,round(sum(profit))as total_profit,avg(sales)as avg_sales from sales
group by sales_year order by sales_year asc;
END;
$$;

call sales_yearly_report();

select * from sales_yearly_report;

-----------------------------------------------------------------------------------------------------------

--3. city_sales_report

CREATE or replace PROCEDURE city_sales_report()
LANGUAGE plpgsql
AS $$
BEGIN
create table city_sales_report as
select city,
round(sum(sales)) as total_sales,
sum(qty) as total_quantity,round(sum(profit))as total_profit,avg(sales)as avg_sales
from ecom_data
group by city ;
END;
$$;

call city_sales_report();

select * from city_sales_report;

-----------------------------------------------------------------------------------------------------------