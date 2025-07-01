-- Query: Total number of bookings made by each user
SELECT
    users.user_id,
    users.name,
    COUNT(bookings.booking_id) AS total_bookings
FROM users
LEFT JOIN bookings ON users.user_id = bookings.user_id
GROUP BY users.user_id, users.name
ORDER BY total_bookings DESC;


-- Query: Rank properties based on total number of bookings using ROW_NUMBER()
SELECT
    property_stats.property_id,
    property_stats.property_name,
    property_stats.total_bookings,
    ROW_NUMBER() OVER (ORDER BY property_stats.total_bookings DESC) AS row_number_rank
FROM (
    SELECT
        properties.property_id,
        properties.name AS property_name,
        COUNT(bookings.booking_id) AS total_bookings
    FROM properties
    LEFT JOIN bookings ON properties.property_id = bookings.property_id
    GROUP BY properties.property_id, properties.name
) AS property_stats
ORDER BY row_number_rank;


-- Query: Rank properties based on total number of bookings using RANK()
SELECT
    property_stats.property_id,
    property_stats.property_name,
    property_stats.total_bookings,
    RANK() OVER (ORDER BY property_stats.total_bookings DESC) AS rank_number
FROM (
    SELECT
        properties.property_id,
        properties.name AS property_name,
        COUNT(bookings.booking_id) AS total_bookings
    FROM properties
    LEFT JOIN bookings ON properties.property_id = bookings.property_id
    GROUP BY properties.property_id, properties.name
) AS property_stats
ORDER BY rank_number;
