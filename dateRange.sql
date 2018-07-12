/*
Snippet to Select a date Range For Alarms
By Matt Gambill, 7/12/2018
Synopsis:
Snippet Takes the record in a table with the latest date,
then filters the table for a date range between the latest date,
and a specified interval (3 days ago).

Platform: Microsoft SQL Server 2014
*/

  DECLARE @to_date datetime = (SELECT max(EventStamp) from [WWALMDB].[dbo].[v_AlarmEventHistory]);
  DECLARE @interval_length int  = -3; /* Must Be a negative integer */
  DECLARE @from_date datetime = DATEADD(day, @interval_length, @to_date);
  
  SELECT [EventStamp],[TagName],[Description] 
  FROM [WWALMDB].[dbo].[v_AlarmEventHistory]
  WHERE [EventStamp] <= @to_date AND [EventStamp] >= @from_date;
