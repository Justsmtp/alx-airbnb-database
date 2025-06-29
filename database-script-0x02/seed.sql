-- -------------------------------------------------
-- Seed Script for ALX Airbnb Clone Database
-- -------------------------------------------------

-- Insert sample users
INSERT INTO Users (name, email, password_hash)
VALUES 
    ('Alice Johnson', 'alice@example.com', 'hashed_password_1'),
    ('Bob Smith', 'bob@example.com', 'hashed_password_2'),
    ('Carol Lee', 'carol@example.com', 'hashed_password_3');

-- Insert sample properties owned by users
INSERT INTO Property (owner_id, name, description, price, address)
VALUES
    (1, 'Cozy Cottage', 'A cozy cottage with mountain views.', 120.00, '123 Hill Road'),
    (2, 'Modern Apartment', 'Spacious apartment in the city center.', 200.00, '456 Downtown Ave'),
    (1, 'Beachfront Villa', 'Luxury villa with ocean views.', 500.00, '789 Beach Lane');

-- Insert sample amenities
INSERT INTO Amenity (name, description)
VALUES
    ('WiFi', 'High-speed wireless internet'),
    ('Air Conditioning', 'Cooling for hot days'),
    ('Swimming Pool', 'Outdoor pool available'),
    ('Kitchen', 'Fully equipped kitchen');

-- Assign amenities to properties
INSERT INTO PropertyAmenity (property_id, amenity_id)
VALUES
    (1, 1), (1, 2), (2, 1), (2, 4), (3, 1), (3, 2), (3, 3), (3, 4);

-- Insert sample bookings
INSERT INTO Booking (user_id, property_id, start_date, end_date, total_amount)
VALUES
    (2, 1, '2025-07-01', '2025-07-05', 480.00),
    (3, 2, '2025-07-10', '2025-07-12', 400.00),
    (3, 3, '2025-07-20', '2025-07-25', 2500.00);

-- Insert sample reviews
INSERT INTO Review (user_id, property_id, rating, comment)
VALUES
    (2, 1, 4, 'Great stay, very comfortable!'),
    (3, 2, 5, 'Amazing location and clean apartment.'),
    (3, 3, 5, 'The villa was incredible, would book again.');
