-- creating database
create database foodapp;

-- use database
use foodapp;

-- show the structure of table
desc zomato;

-- adding primary key constraint
ALTER TABLE zomato
ADD PRIMARY KEY (restaurant_id);

-- view all records of the table
select * from zomato;

-- view first ten records of the table
select * from zomato limit 10;

-- how many total rows are there in zomato table
SELECT COUNT(*) FROM zomato;

/*What are the minimum, maximum, average ratings for 
the restaurants?*/
SELECT
ROUND(MIN(rating), 2) AS min_rating,
ROUND(MAX(rating), 2) AS max_rating,
ROUND(AVG(rating), 2) AS avg_rating
FROM zomato;


SELECT
MIN(rating) AS min_rating,
MAX(rating) AS max_rating,
AVG(rating) AS avg_rating
FROM zomato;

/*What are the minimum, maximum, average of the 
number of ratings for the restaurants?*/
SELECT
 ROUND(MIN(num_of_ratings),2) AS min_num_of_ratings,
 ROUND(MAX(num_of_ratings),2) AS max_num_of_ratings,
 ROUND(AVG(num_of_ratings),2) AS avg_num_of_ratings
FROM zomato;

/*What are the minimum, maximum, average of the average 
cost for two people at the restaurants?*/
SELECT
 ROUND(MIN(avg_cost),2) AS min_avg_cost,
 ROUND(MAX(avg_cost),2) AS max_avg_cost,
 ROUND(AVG(avg_cost),2) AS avg_avg_cost
FROM zomato;

-- What is the distribution of ratings for the restaurants?
SELECT rating, COUNT(*) AS frequency
FROM zomato
GROUP BY rating
ORDER BY rating DESC;

-- What are the top 10 most frequent ratings for the restaurants?
SELECT rating, COUNT(*) AS frequency
FROM zomato
GROUP BY rating
ORDER BY frequency DESC
LIMIT 10;

/* Show the restaurant names and ratings where 
rating is greater than 4.5*/
Select restaurant_name,rating from zomato where rating>4.5; 

/*What is the distribution of the average cost for
 two people at the restaurants?*/
SELECT avg_cost, COUNT(*) AS frequency
FROM zomato
GROUP BY avg_cost
ORDER BY avg_cost desc;

/*Show the top ten restaurant names and ratings 
where rating is greater than 4.5*/
Select restaurant_name,rating from zomato 
where rating>4.5 order by rating desc limit 10; 

/*Show all the restaurant details which provide 
online order facility*/
SELECT * FROM zomato
WHERE Online_order = 'Yes';

/*What are the average rating and average cost 
for restaurants that offer online orders compared to
 those that don't?*/
SELECT online_order, ROUND(AVG(rating),2) AS avg_rate, 
ROUND(AVG(avg_cost),2) AS avg_cost
FROM zomato
GROUP BY online_order;

/*What are the average rating and average cost for 
restaurants that offer table booking compared to those that don't?*/
SELECT table_booking, ROUND(AVG(rating),2) AS avg_rate, 
ROUND(AVG(avg_cost),2) AS avg_cost
FROM zomato
GROUP BY table_booking;

/*What are the average rating and average cost for
 the top 10 most common cuisines types?*/
SELECT cuisines_type, ROUND(AVG(rating),2) AS avg_rate, 
ROUND(AVG(avg_cost),2) AS avg_cost
FROM zomato
GROUP BY cuisines_type
ORDER BY COUNT(*) DESC
LIMIT 10;


/*Show the top ratings according to restaurant type*/
SELECT restaurant_type, round(AVG(rating),2) AS Avg_Rating
FROM zomato
GROUP BY restaurant_type
ORDER BY Avg_Rating DESC;

-- Show the top ratings according to area
SELECT area, round(AVG(rating),2) AS Avg_Rating
FROM zomato
GROUP BY area
ORDER BY Avg_Rating DESC;

/*What are the average rating, average cost, and 
the number of restaurants in the top 10 areas with the most restaurants?*/
SELECT area, ROUND(AVG(rating),2) AS avg_rate, 
ROUND(AVG(avg_cost),2) AS avg_cost, 
COUNT(*) AS num_restaurants
FROM zomato
GROUP BY area
ORDER BY num_restaurants DESC
LIMIT 10;

/*What are the top 10 highest-rated restaurants, 
considering both rating and number of ratings?*/
SELECT restaurant_name, rating, num_of_ratings, avg_cost, 
area FROM zomato ORDER BY rating DESC, num_of_ratings DESC LIMIT 10;

/*What are the top 10 most expensive restaurants based 
on the average cost for two people?*/
SELECT restaurant_name, avg_cost, rating, num_of_ratings, area
FROM zomato
ORDER BY avg_cost DESC
LIMIT 10;

-- What are the top 10 restaurants with the highest number of ratings?
SELECT restaurant_name, num_of_ratings, rating, avg_cost, area
FROM zomato
ORDER BY num_of_ratings DESC
LIMIT 10;

/*List restaurants where the average cost for two people is higher than the overall 
average cost, but the rating is below the overall average rating*/
SELECT restaurant_name, avg_cost, rating
FROM zomato
WHERE avg_cost > (SELECT AVG(avg_cost) FROM 
zomato)
 AND rating < (SELECT AVG(rating) FROM zomato);
 
/*Find the top 5 areas with the highest number of restaurants that have online 
ordering available*/
SELECT area, COUNT(*) as num_of_restaurants
FROM zomato
WHERE online_order = 'Yes'
GROUP BY area
ORDER BY num_of_restaurants DESC
LIMIT 5;

/*Identify the average rating of restaurants in each area that offer a 
specific cuisine type, e.g., 'Chinese'.*/
SELECT area, ROUND(AVG(rating),2) as avg_rating
FROM zomato
WHERE cuisines_type LIKE '%Chinese%'
GROUP BY area
ORDER BY avg_rating DESC;




