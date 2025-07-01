USE alx_book_store;

-- Measure BEFORE adding indexes
EXPLAIN ANALYZE
SELECT users.user_id, COUNT(bookings.booking_id) AS total_bookings
FROM users
LEFT JOIN bookings ON users.user_id = bookings.user_id
GROUP BY users.user_id;

-- Create indexes
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_properties_property_id ON properties(property_id);

-- Measure AFTER adding indexes
EXPLAIN ANALYZE
SELECT users.user_id, COUNT(bookings.booking_id) AS total_bookings
FROM users
LEFT JOIN bookings ON users.user_id = bookings.user_id
GROUP BY users.user_id;
