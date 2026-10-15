SELECT
    device_type,
    COUNT(*) AS total_sessions,
    ROUND(AVG(duration_minutes), 2)
        AS avg_duration_minutes,
    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY duration_minutes)::NUMERIC,
        2
    ) AS median_duration_minutes
FROM sessions
WHERE duration_minutes IS NOT NULL
GROUP BY device_type
ORDER BY avg_duration_minutes DESC;

SELECT
    session_date,
    COUNT(*) AS total_sessions,
    COUNT(DISTINCT user_id) AS active_users,
    ROUND(AVG(duration_minutes), 2)
        AS avg_session_duration
FROM sessions
WHERE session_date IS NOT NULL
GROUP BY session_date
ORDER BY session_date;