# Database Index Optimization

## 📌 Objective
Identify high-usage columns in the `users`, `bookings`, and `properties` tables, and create indexes to improve query performance for common operations like `WHERE`, `JOIN`, and `ORDER BY`.

---

## 🔎 Indexes Created
The following indexes were added:

```sql
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_properties_property_id ON properties(property_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
🛠️ Why These Indexes?
users.user_id and bookings.user_id: frequently used in joins between users and bookings.

properties.property_id and bookings.property_id: important for queries joining properties with bookings or filtering by property.

Indexes on these columns help MySQL find rows faster, especially as data grows.

📈 Measuring Performance
Before and after adding the indexes, you should measure the query execution plan with EXPLAIN:


EXPLAIN SELECT users.name, COUNT(bookings.booking_id)
FROM users
LEFT JOIN bookings ON users.user_id = bookings.user_id
GROUP BY users.user_id;
After running the index creation script, rerun the same EXPLAIN. In the output, check the key column: it should now reference your new indexes (e.g., idx_users_user_id), confirming they are being used.

