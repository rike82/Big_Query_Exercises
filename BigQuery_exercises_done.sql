-- Using the NYC Taxi public dataset (Yellow Trips), "new_york_taxi_trips" from Google BigQuery, complete the following exercises:



-- Exercise 1: Count the number of trips in January 2021

SELECT COUNT(data_file_month) AS count FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021` 
WHERE data_file_month = 1;


-- Exercise 2: Calculate the total revenue generated by taxi trips in 2021

SELECT COUNT(total_amount)
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021` LIMIT 1000;

-- Exercise 3: Find the most popular pickup location

SELECT pickup_location_id, COUNT(pickup_location_id) AS count FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021` 
GROUP BY pickup_location_id
ORDER BY count DESC
LIMIT 1;

-- Exercise 4: Analyze the number of trips per hour of the day

SELECT EXTRACT(HOUR FROM pickup_datetime) AS the_hour, COUNT(*) as count 
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
GROUP BY the_hour
ORDER BY count DESC
LIMIT 1;

-- Exercise 5: Calculate the average trip distance

SELECT AVG(trip_distance) as average FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021` 
LIMIT 1000;


-- Exercise 6: Find the longest trip by distance

SELECT trip_distance FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021` 
ORDER BY trip_distance DESC
LIMIT 1;

-- Exercise 7: Calculate the total number of passengers by payment type

SELECT payment_type, count(passenger_count) as total_passenger FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021` 
GROUP BY payment_type
ORDER BY total_passenger DESC
LIMIT 1000;

-- Exercise 8: Find the most common drop-off location for trips paid by credit card

SELECT dropoff_location_id, COUNT(dropoff_location_id) as most_common FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021` 
WHERE payment_type = "1"
GROUP BY dropoff_location_id
ORDER BY most_common DESC
LIMIT 1;

-- Exercise 9: Calculate the total number of trips that had more than 4 passengers

SELECT COUNT(*) as count FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021` 
WHERE passenger_count > 4;

-- Exercise 10: Subquery - Find the average fare for trips longer than the average trip distance

SELECT AVG(fare_amount) AS avg_fare FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021` 
WHERE trip_distance > (SELECT AVG(trip_distance) FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021` )
LIMIT 1000;