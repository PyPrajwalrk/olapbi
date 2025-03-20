use ola;

### 1 retrieve all successful bookings
create view Successful_Bookings AS
SELECT * FROM bookings
where Booking_Status='Success';
select  * from  Successful_Bookings;




### 2 Find the avg  ride distnace for each vehicle type
create view ride_distance_for_each_vehicle_type as
select Vehicle_Type,Avg(Ride_Distance)
as avg_distnace from bookings
group by Vehicle_Type;

select * from ride_distance_for_each_vehicle_type;




### 3 Get the total number of cancelled rides by customers
create view canceled_rides_by_customers as
select Count(*) From bookings
where Booking_Status='Canceled by Customer';

select * from canceled_rides_by_customers;



### 4 List thee top 5 Customers who booked the highest number of rides;
create view booked_the_highest_number as
Select Customer_ID, Count(Booking_ID) as total_rides
from bookings
Group by Customer_ID
order by total_rides DESC LIMIT 5;
 
select * from booked_the_highest_number;



### 5 Get the number of rides canceled by drivers due to personal and car
Create view rides_canceled_by_driver as
select Count(*) from bookings
where Canceled_Rides_by_Driver ='Personal & Car related issue';

select * from rides_canceled_by_driver;   




### 6 Find the max and min driver rating for prime sedan bookings;
create view Max_Min_driver_rating as
SELECT MAX(Driver_Ratings) AS max_rating, 
       MIN(Driver_Ratings) AS min_rating 
FROM bookings 
WHERE Vehicle_Type = 'Prime Sedan';

select * from Max_Min_driver_rating;





###7 retrive all rides where payment was made using upi;
create view UPI_Payment as
select * from bookings
where Payment_Method= 'UPI';

select * from UPI_Payment;




###8 Find the avg customer rating per vehicle type;
create view Avg_cus_Rating as
select Vehicle_Type,Avg(Customer_Rating) as Customer_Rating
from bookings
group by Vehicle_Type;
 select * from Avg_cus_Rating;



###9 calculate the total booking value of rides completed successfully:
create view total_booking as
select Sum(Booking_value) as total_successful_ride_value
from bookings
where booking_status='Success';

select * from   total_booking;



###10 List all imcomplete rides along with the reason:
create view inc_rides as
Select  Booking_ID,Incomplete_Rides_Reason
from bookings
Where Incomplete_Rides = 'Yes';

select * from inc_rides;


