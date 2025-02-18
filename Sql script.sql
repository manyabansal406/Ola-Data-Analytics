Create database Ola;
use Ola;
#1. Retrive all successful bookings:
create view Successful_bookings As
select * from bookings where Booking_status= "Success";
select * from Successful_bookings;

#2.Find the average ride distance for each vehicle type:

create view ride_distance_from_each_vehicle As
Select Vehicle_Type , AVG(Ride_Distance)
as avg_distance From Bookings
group by Vehicle_Type;

#3 Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers As
Select count(*) From Bookings
where Booking_status = 'Canceled by customer';

#4.List the top 5 customers who booked the highest number of rides:
create view top_5_customers as 
Select customer_id,count(Booking_id) as total_rides
from bookings group by customer_id  
Order by total_rides desc limit 5;

#5  Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_canceled as 
Select count(*) From bookings
where Canceled_Rides_by_Driver = 'Personal & Car-related issues';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view min_max_driver_rating as 
Select min(Driver_ratings) as min_rating ,max(Driver_ratings) as max_rating
From bookings 
where vehicle_type ='prime sedan';

#7. Retrieve all rides where payment was made using UPI:
create view payment_as_upi as 
Select * from bookings 
where payment_method='upi'; 

#8. Find the average customer rating per vehicle type:
create view customer_rating as 
Select vehicle_type ,avg(customer_rating) as avg_rating 
from bookings group by vehicle_type;

#9. Calculate the total booking value of rides completed successfully:
create view total_booking_value as 
select sum(booking_value) from bookings where incomplete_rides ='no';

#10. List all incomplete rides along with the reason:
 create view incomplete_rides_reason as
Select booking_id,incomplete_rides_reason from bookings
where incomplete_rides='yes';
