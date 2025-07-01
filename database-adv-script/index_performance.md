-- Create index on user_id in users table
CREATE INDEX idx_users_user_id ON users(user_id);

-- Create index on user_id in bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create index on property_id in properties table
CREATE INDEX idx_properties_property_id ON properties(property_id);

-- Create index on property_id in bookings table
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
