WITH DeviceTypeDailyAverage AS (
    SELECT
        "Device type",
        TO_DATE("Date", 'YYYY-MM-DD') AS Date,
        AVG("Views") AS AvgViewsPerDay
    FROM
        "Device type_Chart data"
    GROUP BY
        "Device type",
        TO_DATE("Date", 'YYYY-MM-DD')
),
DeviceTypeDailyStats AS (
    SELECT
        "Device type",
        TO_DATE("Date", 'YYYY-MM-DD') AS Date,
        "Views",
        AvgViewsPerDay,
        RANK() OVER (PARTITION BY "Device type", TO_DATE("Date", 'YYYY-MM-DD') ORDER BY "Views" DESC) AS ViewsRank
    FROM
        DeviceTypeDailyAverage
)
SELECT
    "Device type",
    TO_DATE("Date", 'YYYY-MM-DD') AS Date,
    "Views",
    AvgViewsPerDay
FROM
    DeviceTypeDailyStats
WHERE
    ViewsRank = 1;
