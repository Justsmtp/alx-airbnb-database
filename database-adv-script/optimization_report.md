# Optimization Report for Complex Query

## 📌 Initial Query Analysis

- The initial query retrieved bookings, user, property, and payment details with multiple INNER JOINs.
- Running `EXPLAIN ANALYZE` showed high cost due to full table scans on `users`, `properties`, and `payments`.
- Indexes on `bookings.user_id`, `bookings.property_id`, and `payments.booking_id` were missing, which caused inefficient join performance.

## ✅ Refactoring Steps

- Added indexes:
  - `CREATE INDEX idx_bookings_user_id ON bookings(user_id);`
  - `CREATE INDEX idx_bookings_property_id ON bookings(property_id);`
  - `CREATE INDEX idx_payments_booking_id ON payments(booking_id);`
- Reduced unnecessary selected columns; focused on only what was required for the final result.
- Used table aliases to improve readability.

## 🚀 Results

- After indexing and refactoring, `EXPLAIN ANALYZE` showed reduced execution time and more efficient join strategies using indexed lookups instead of full table scans.
- Query performance improved significantly, especially on larger datasets.

**Conclusion**: Proper indexing and limiting selected columns are effective optimizations for complex queries involving multiple joins.
