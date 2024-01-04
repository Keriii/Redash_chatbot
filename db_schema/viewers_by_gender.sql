WITH ViewerData AS (
    SELECT
        "Viewer gender",
        "Views (%)" AS ViewsPercentage,
        "Average view duration" AS AverageViewDuration,
        "Average percentage viewed (%)" AS AveragePercentageViewed,
        "Watch time (hours) (%)" AS WatchTimePercentage
    FROM "viewer gender_Table data"
)
SELECT
    "Viewer gender",
    MAX(ViewsPercentage) AS MaxViewsPercentage,
    MIN(ViewsPercentage) AS MinViewsPercentage,
    AVG(ViewsPercentage) AS AvgViewsPercentage,
    MAX(AverageViewDuration) AS MaxAverageViewDuration,
    MIN(AverageViewDuration) AS MinAverageViewDuration,
    AVG(AveragePercentageViewed) AS AvgAveragePercentageViewed,
    MAX(WatchTimePercentage) AS MaxWatchTimePercentage,
    MIN(WatchTimePercentage) AS MinWatchTimePercentage
FROM ViewerData
GROUP BY "Viewer gender";
