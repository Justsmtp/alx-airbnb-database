# Partitioning Report: Booking Table

## Why Partitioning?

Since the `bookings` table grows rapidly as users make reservations, querying bookings by date range becomes slower over time. Partitioning the table by `start_date` allows MySQL to quickly prune partitions and only scan relevant data.

## How We Partitioned

- We used **RANGE partitioning** based on `YEAR(start_date)`.
- Five partitions: one for each year 2019-2022, plus one `pmax` for future data.

## Performance Observations

- Before partitioning: Queries scanning bookings for a specific year used to scan the entire table.
- After partitioning: The same queries scanned only the relevant partition(s), drastically reducing execution time in EXPLAIN ANALYZE.

Example:
EXPLAIN ANALYZE SELECT * FROM bookings WHERE start_date BETWEEN '2021-01-01' AND '2021-12-31';

pgsql

- Execution time dropped significantly for year-based searches.

## Conclusion

Partitioning by `start_date` greatly improved query performance when filtering by date range and will help keep performance stable as the dataset grows.
