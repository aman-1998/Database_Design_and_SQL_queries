/* 1. Given timestamps of logins, figure out how many people on Facebook were active all seven days of a week on a mobile phone from login info table? */
--Ans:
WITH user_id_with_days AS (
    SELECT
        user_id,
        TRIM(to_char(CAST(login_time AS DATE), 'Day')) AS day
    FROM
        login_info
), users_with_no_of_times_online_in_a_dayofweek AS (
    SELECT
        uiwd.user_id,
        uiwd.day,
        COUNT(*) AS no_of_times_in_a_day_of_week
    FROM
        user_id_with_days uiwd
    GROUP BY
        uiwd.user_id,
        uiwd.day
)
SELECT
    uwnotoiad.user_id,
    COUNT(*) AS no_of_days_of_week
FROM
    users_with_no_of_times_online_in_a_dayofweek uwnotoiad
GROUP BY
    uwnotoiad.user_id
HAVING 
    COUNT(*) = 7