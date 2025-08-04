-- 1. Retrieve all successful bookings:
select count(*) from ola_rides
where `Booking Status` = "Success";

-- 2. Find the average ride distance for each vehicle type:
select `Vehicle Type`,round(avg(`Ride Distance`),2) as avg_Vehicle_distance from ola_rides
group by `Vehicle Type`
order by avg_Vehicle_distance desc;

-- 3. Get the total number of cancelled rides by customers:
select count(*) as rides_cancelled_by_customer from ola_rides
where `Cancelled  by Customer` = 1;

-- 4. List the top 5 customers who booked the highest number of rides:
select `Customer ID`,count(*) as no_of_bookings from ola_rides
group by `Customer ID`
order by no_of_bookings desc
limit 5;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select min(`Driver Ratings`),max(`Driver Ratings`) from ola_rides
where `Vehicle Type` = "Prime Sedan";

-- 7. Retrieve all rides where payment was made using UPI:
select * from ola_rides
where `Payment Method` = "UPI";

-- 8. Find the average customer rating,driver rating per vehicle type:
select `Vehicle Type`,avg(`Driver Ratings`) as avg_driver_rating,avg(`Customer Rating`) as avg_cust_rating from ola_rides
group by `Vehicle Type`;

-- 9. Calculate the total booking value of rides completed successfully:
select round(sum(`Booking Value`),0) as booking_value from ola_rides
where `Booking Status` = "Success";

-- 10. List all incomplete rides along with the reason
select `Booking ID`,
	 case 
			when `Cancelled  by Customer` = 1 then `Reason for Cancelling by Customer`
			when `Cancelled Rides by Driver` = 1 then `Reason for Cancelling by Driver`
			else `Incomplete Rides Reason` end as reason
	 from ola_rides
	where `Booking Status` in ("Cancelled by Driver","Cancelled by Customer","Incomplete");

-- All Incomplete Rides Reasons and their Count
with Cancel_reason as (
    select
	 case 
			when `Cancelled  by Customer` = 1 then `Reason for Cancelling by Customer`
			when `Cancelled Rides by Driver` = 1 then `Reason for Cancelling by Driver`
			else `Incomplete Rides Reason` end as Incomplete_Rides_reason
	 from ola_rides
	where `Booking Status` in ("Cancelled by Driver","Cancelled by Customer","Incomplete")
)
select Incomplete_Rides_reason,count(*) as reason_count from Cancel_reason
group by Incomplete_Rides_reason;


-- .Calcellation reasons by driver
select `Reason for Cancelling by ola_ridesola_ridesDriver`,count(*) as reason_count from ola_rides
where `Cancelled Rides by Driver` = 1
group by `Reason for Cancelling by Driver`;

-- .Calcellation reasons by Customer
select `Reason for Cancelling by Customer`,count(*) as reason_count from ola_rides
where `Cancelled  by Customer` = 1
group by `Reason for Cancelling by Customer`;

-- .Average Booking Value & Distance for Completed Rides
select avg(`Booking Value`) as avg_booking_value, avg(`Ride Distance`) as avg_distance from ola_rides
where `Booking Status` = "Success";
