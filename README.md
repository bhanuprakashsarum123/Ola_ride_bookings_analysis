# Ola_ride_bookings_analysis

This project aims to analyze real booking data to identify patterns behind driver and customer cancellations, evaluate service quality through ratings, and understand operational inefficiencies. The insights will help stakeholders improve platform reliability, customer experience, and operational decision-making.

## Key Insights

- Majority of rides were successful (67% success rate)
- Driver cancellations were most often due to "More than permitted people in there"
- Customer cancellation were most often due to "Ac is not working" & "Driver is not moving towards pickup location"

## Tools Used

- Excel
- MySQL Workbench
- Python (Pandas, Matplotlib, Seaborn)
- PowerPoint

### Steps Followed
- Step 1 : Opened the data set in Excel,then loaded to mySQL workbench fastly with python
- Step 2 : Analysed the data with multiple SQL queries like How many rides were successful,cancelled and reasons for cancelling


        
        
        -- .Calcellation reasons by driver
        select `Reason for Cancelling by Driver`,count(*) as reason_count from ola_rides
        where `Cancelled Rides by Driver` = 1
        group by `Reason for Cancelling by Driver`;
        
        -- .Average Booking Value & Distance for Completed Rides
        select avg(`Booking Value`) as avg_booking_value, avg(`Ride Distance`) as avg_distance from ola_rides
        where `Booking Status` = "Success";

