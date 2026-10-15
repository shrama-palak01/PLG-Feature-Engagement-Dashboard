SELECT 'users' AS table_name, COUNT(*) AS total_rows
FROM users

UNION ALL

SELECT 'sessions', COUNT(*)
FROM sessions

UNION ALL

SELECT 'feature_usage', COUNT(*)
FROM feature_usage

UNION ALL

SELECT 'subscriptions', COUNT(*)
FROM subscriptions;

SELECT
    COUNT(*) AS total_users,
    COUNT(*) FILTER (
        WHERE signup_date IS NULL
    ) AS missing_signup_dates,
    COUNT(*) FILTER (
        WHERE plan_type IS NULL
    ) AS missing_plan_types
FROM users;

SELECT
    COUNT(*) AS total_sessions,
    COUNT(*) FILTER (
        WHERE session_date IS NULL
    ) AS missing_dates,
    COUNT(*) FILTER (
        WHERE duration_minutes IS NULL
    ) AS missing_durations
FROM sessions;