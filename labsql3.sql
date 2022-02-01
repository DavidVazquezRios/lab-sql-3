use sakila;
-- How many distinct (different) actors' last names are there?
select count(distinct(last_name)) from actor;
-- How many movies were released with "PG-13" rating?
select count(rating) from film where rating = "PG-13";
-- Get 10 the longest movies from 2006.
select title from film order by length desc limit  10;
--  How many days has been the company operating (check DATEDIFF() function)?
select datediff(now(), min(rental_date)) as date_dif from rental;
-- Show rental info with additional columns month and weekday. Get 20.
select rental_id, DATE_FORMAT(rental_date,"%M") as "month", DATE_FORMAT(rental_date,"%W") as "Weekday" from rental limit 20;
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select rental_id, DATE_FORMAT(rental_date,"%M") as "month",DATE_FORMAT(rental_date,"%W") as "Weekday" , if(DATE_FORMAT(rental_date,"%w")=6 or DATE_FORMAT(rental_date,"%w")=0, "weekend", "workday") as "Workday" from rental; 
-- How many rentals were in the last month of activity?
select count(rental_id) as "Total rentals last month" from rental where DATE_FORMAT(rental_date,"%m%y")  = (select DATE_FORMAT(max(rental_date),"%m%y") from rental) ;
