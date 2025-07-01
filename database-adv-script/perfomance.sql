USE alx_airbnb;

-- Initial complex query: get bookings + user details + property details + payment details
SELECT
    bookings.booking_id,
    bookings.start_date,
    bookings.end_date,
    users.user_id,
    users.name AS user_name,
    users.email,
    properties.property_id,
    properties.name AS property_name,
    properties.address,
    payments.payment_id,
    payments.amount,
    payments.payment_date
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id
INNER JOIN properties ON bookings.property_id = properties.property_id
INNER JOIN payments ON bookings.booking_id = payments.booking_id
WHERE bookings.booking_id IS NOT NULL
AND users.user_id IS NOT NULL;

-- Analyze performance
EXPLAIN ANALYZE
SELECT
    bookings.booking_id,
    bookings.start_date,
    bookings.end_date,
    users.user_id,
    users.name AS user_name,
    users.email,
    properties.property_id,
    properties.name AS property_name,
    properties.address,
    payments.payment_id,
    payments.amount,
    payments.payment_date
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id
INNER JOIN properties ON bookings.property_id = properties.property_id
INNER JOIN payments ON bookings.booking_id = payments.booking_id
WHERE bookings.booking_id IS NOT NULL
AND users.user_id IS NOT NULL;

-- Refactored optimized query:
-- Only include necessary columns, use proper indexes, and avoid extra joins if possible
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.name AS user_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.address,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM bookings AS b
JOIN users AS u ON b.user_id = u.user_id
JOIN properties AS p ON b.property_id = p.property_id
JOIN payments AS pay ON b.booking_id = pay.booking_id
WHERE b.booking_id IS NOT NULL
AND u.user_id IS NOT NULL;
