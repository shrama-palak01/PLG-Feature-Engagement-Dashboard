SELECT
    COUNT(*) AS subscription_records,
    COUNT(DISTINCT user_id) AS unique_users,
    COUNT(*) FILTER (
        WHERE mrr > 0
    ) AS records_with_positive_mrr,
    ROUND(SUM(mrr), 2) AS total_recorded_mrr,
    ROUND(AVG(mrr), 2) AS avg_mrr_per_record
FROM subscriptions;

SELECT
    churned,
    COUNT(*) AS subscription_records,
    COUNT(DISTINCT user_id) AS unique_users
FROM subscriptions
GROUP BY churned
ORDER BY subscription_records DESC;

SELECT
    u.plan_type,
    COUNT(DISTINCT u.user_id) AS users,
    ROUND(SUM(s.mrr), 2) AS total_recorded_mrr,
    COUNT(DISTINCT s.user_id) FILTER (
        WHERE s.churned = 'yes'
    ) AS users_marked_churned
FROM users u
LEFT JOIN subscriptions s
    ON u.user_id = s.user_id
GROUP BY u.plan_type
ORDER BY total_recorded_mrr DESC NULLS LAST;