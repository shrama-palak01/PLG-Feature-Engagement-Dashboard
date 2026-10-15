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