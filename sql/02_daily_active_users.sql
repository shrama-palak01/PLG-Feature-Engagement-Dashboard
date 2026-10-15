SELECT
    session_date AS activity_date,
    COUNT(DISTINCT user_id) AS daily_active_users
FROM sessions
WHERE session_date IS NOT NULL
GROUP BY session_date
ORDER BY activity_date;

SELECT
    ROUND(AVG(daily_active_users), 2)
        AS average_daily_active_users
FROM (
    SELECT
        session_date,
        COUNT(DISTINCT user_id) AS daily_active_users
    FROM sessions
    WHERE session_date IS NOT NULL
    GROUP BY session_date
) AS daily_metrics;