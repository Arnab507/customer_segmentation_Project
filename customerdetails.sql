use retail_data;

select * from customerdetails limit 30;

# Q1- find total revenue
select round(sum(TotalPrice),2) as total_revenue from customerdetails;

# Q2 - find top 10 customer based on total money spent
select CustomerID , round(sum(TotalPrice),2) as total_spent 
	from customerdetails
	group by CustomerID 
    order by total_spent desc limit 10;
 
# Q3 - find the Country-wise Sales
select Country , round(sum(TotalPrice),2) as Country_sales 
	from customerdetails
    group by Country 
    order by Country_sales desc;
    
# Q4 - find the sales based on month
select month(InvoiceDate) as month_date,
	monthname(InvoiceDate) as month_name,
	round(sum(TotalPrice),2) as total_sales from customerdetails
	group by month_date,month_name 
	order by month_date;

# Q5 - find top 10 most purchased product
select Description , sum(Quantity) as total_quantity 
	from customerdetails 
    group by Description 
	order by total_quantity desc limit 10;

# Q6 - find most popular product in each Country
 select * from(select Country, Description, sum(Quantity) as total_quantity, 
	rank() over(partition by country order by sum(Quantity) desc) as ranking
    from customerdetails group by Country, Description ) ranked where ranking=1;
	

