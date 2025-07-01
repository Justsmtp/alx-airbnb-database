-- INNER JOIN: Retrieve all bookings and their respective users
SELECT
    bookings.booking_id,
    bookings.start_date,
    bookings.end_date,
    users.user_id,
    users.name,
    users.email
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id;


-- LEFT JOIN: Retrieve all properties and their reviews, including properties without reviews
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


-- FULL OUTER JOIN (emulated with UNION of LEFT and RIGHT JOINs): Retrieve all users and all bookings,
-- even if a user has no booking or a booking is not linked to a user
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
