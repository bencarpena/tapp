# All duckdb
> - SQL statements and notes on duckdb

## get temperature <= -10
SELECT * FROM t_pr_hagrid_analytics
WHERE TRY_CAST(temperature_in_celsius AS DOUBLE) <= -10;
