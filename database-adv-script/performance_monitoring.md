# Monitoring and Refinement Report

## Queries Monitored

1. Bookings joined with users and properties filtered by start_date.
2. Properties joined with reviews to compute average ratings.

## Bottlenecks Identified

- Full table scans in bookings query due to missing index on `start_date`.
- Inefficient joins with reviews due to lack of index on `property_id`.

## Improvements Implemented

- Added index on `bookings.start_date`.
- Added index on `reviews.property_id`.

## Results After Improvements

- Execution time reduced significantly for both queries (as seen in EXPLAIN ANALYZE).
- Number of rows scanned dropped from hundreds of thousands to thousands or fewer.
- Queries now leverage indexes, improving performance especially on large datasets.

## Conclusion

Continuous monitoring and indexing of high-usage columns dramatically improved performance for key queries in our application.
