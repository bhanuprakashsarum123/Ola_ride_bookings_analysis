# Ola_ride_bookings_analysis

## Problem Statement

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
- Step 3 : Opened Jupytor notebook for deep analysis and visuals,Read the data from SQL database
- Step 4 : Converted the Date and Time columns from Object datatype to  Datetime[64]ns , Int then After added Day,Hour columns to the dataframe

  
                df['Date'] = pd.to_datetime(df['Date'],errors="coerce")
                df['Time'] = pd.to_datetime(df['Time'],errors="coerce")
                df['Day'] = df['Date'].dt.day
                df['hour'] = df['Time'].dt.hour

- Step 5 : Then created some visuals with Pandas,Matplotlib,Seaborn tools ,the Notebook file uploaded to the repository
- Step 6 : Based on the Visuals, Created a PowerPoint Presentation uploaded to the repository
