# SQL Joins Queries

This project demonstrates advanced use of SQL joins for an Airbnb-style database. The goal is to master different types of joins to retrieve meaningful information from multiple tables.

## Files
- **joins_queries.sql**: Contains SQL queries using INNER JOIN, LEFT JOIN, and an emulated FULL OUTER JOIN.

## Queries Included

### 1. INNER JOIN
Retrieves all bookings along with the users who made those bookings.  
- Combines data from the `bookings` and `users` tables.
- Only includes rows where there is a match between `bookings.user_id` and `users.user_id`.

```sql
SELECT
    bookings.booking_id,
    bookings.start_date,
    bookings.end_date,
    users.user_id,
    users.name,
    users.email
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id;
2. LEFT JOIN
Retrieves all properties and their reviews, including properties without any reviews.

Uses LEFT JOIN to include properties even if there are no matching rows in the reviews table.

Orders results by property_id for better readability.

sql
Copy
Edit
SELECT
    properties.property_id,
    properties.name AS property_name,
    properties.address,
    reviews.review_id,
    reviews.review_text,
    reviews.rating
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id
ORDER BY properties.property_id;
3. FULL OUTER JOIN (emulated)
Retrieves all users and all bookings, even if a user has no booking or a booking is not linked to a user.

MySQL does not support FULL OUTER JOIN directly, so it is emulated using a UNION of a LEFT JOIN and a RIGHT JOIN.

sql
Copy
Edit
(
    SELECT
        users.user_id,
        users.name,
        users.email,
        bookings.booking_id,
        bookings.start_date,
        bookings.end_date
    FROM users
    LEFT JOIN bookings ON users.user_id = bookings.user_id
)
UNION
(
    SELECT
        users.user_id,
        users.name,
        users.email,
        bookings.booking_id,
        bookings.start_date,
        bookings.end_date
    FROM users
    RIGHT JOIN bookings ON users.user_id = bookings.user_id
);
How to Use
Import your Airbnb database schema into MySQL.

Run the joins_queries.sql script using your preferred MySQL client.

Review the outputs to understand how each join type works.

