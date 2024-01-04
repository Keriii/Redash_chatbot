WITH DailyCityViews AS (
    SELECT
        "City name",
        DATE("Date") AS day_date,
        SUM(Views) AS daily_views
    FROM
        "Cities_chart data"
    GROUP BY
        "City name",
        day_date
)

SELECT
    "City name",
    AVG(daily_views) AS avg_daily_views,
    MAX(daily_views) AS max_daily_views,
    MIN(daily_views) AS min_daily_views,
    COUNT(DISTINCT day_date) AS total_days_with_views
FROM
    DailyCityViews
GROUP BY
    "City name";
