SELECT amount_billed,
    CASE WHEN amount_billed > 15 AND amount_billed <= 30 THEN 'Normal Day' --This case statement will run for every record in orders table checking what the amount_billed column value is for each record and then using the logic in the when else statements to determine the column (a newly day_type column created on the fly) value it would assign for each record that would then be returned with the query result. 
         WHEN amount_billed > 30 THEN 'Good Day'
         ELSE 'Bad Day'
    END AS day_type
FROM orders;

SELECT weekday_nr,
    CASE WHEN weekday_nr = 1 THEN 'Monday'
         WHEN weekday_nr = 2 THEN 'Tuesday'
         WHEN weekday_nr = 3 THEN 'Wednesday'
         WHEN weekday_nr = 4 THEN 'Thursday'
         WHEN weekday_nr = 5 THEN 'Friday'
         WHEN weekday_nr = 6 THEN 'Saturday'
         ELSE 'Sunday'
    END
FROM (
    SELECT WEEKDAY(last_checkin) + 1 AS weekday_nr
    FROM memberships
) AS weekday_numbers;

