SELECT
    feature_name,
    COUNT(DISTINCT user_id) AS unique_users,
    SUM(usage_count) AS total_usage,
    ROUND(AVG(usage_count), 2) AS avg_usage_per_record
FROM feature_usage
WHERE feature_name IS NOT NULL
GROUP BY feature_name
ORDER BY unique_users DESC;

WITH total_users AS (
    SELECT COUNT(DISTINCT user_id) AS user_count
    FROM users
),
feature_adoption AS (
    SELECT
        feature_name,
        COUNT(DISTINCT user_id) AS adopting_users
    FROM feature_usage
    WHERE feature_name IS NOT NULL
    GROUP BY feature_name
)
SELECT
    f.feature_name,
    f.adopting_users,
    t.user_count AS total_users,
    ROUND(
        100.0 * f.adopting_users
        / NULLIF(t.user_count, 0),
        2
    ) AS adoption_rate_pct
FROM feature_adoption f
CROSS JOIN total_users t
ORDER BY adoption_rate_pct DESC;

SELECT
    feature_name,
    COUNT(DISTINCT user_id) AS unique_users,
    SUM(usage_count) AS total_usage
FROM feature_usage
WHERE feature_name IS NOT NULL
GROUP BY feature_name
ORDER BY unique_users ASC, total_usage ASC;