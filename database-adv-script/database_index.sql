USE alx_book_store;

-- Measure before adding indexes
EXPLAIN SELECT users.user_id, COUNT(bookings.booking_id)
FROM users
LEFT JOIN bookings ON users.user_id = bookings.user_id
GROUP BY users.user_id;

-- Add indexes
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Measure after adding indexes
EXPLAIN SELECT users.user_id, COUNT(bookings.booking_id)
FROM users
LEFT JOIN bookings ON users.user_id = bookings.user_id
GROUP BY users.user_id;
