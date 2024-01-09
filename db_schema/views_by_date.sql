WITH daily_stats AS (
    SELECT 
        "Date",
        SUM("Views") AS total_views,
        COUNT(*) AS total_days,
        SUM("Views") / COUNT(*) AS avg_views_per_day,
        100.0 * SUM("Views") / SUM(SUM("Views")) OVER() AS percent_total_views,
        RANK() OVER (ORDER BY SUM("Views") DESC) AS views_rank
    FROM  "Viewership by Date_Totals"
    WHERE "Date" <> 'Total'
    GROUP BY "Date"
)

SELECT 
    "Date",
    total_views,
    total_days,
    avg_views_per_day,
    percent_total_views,
    views_rank
FROM daily_stats;
