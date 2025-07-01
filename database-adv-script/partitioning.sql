USE alx_airbnb;

-- Drop the existing Bookings table if it exists
DROP TABLE IF EXISTS bookings;

-- Recreate the Bookings table with PARTITION BY RANGE on start_date
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (property_id) REFERENCES properties(property_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2019 VALUES LESS THAN (2020),
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Analyze performance of a date range query on the partitioned table
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2021-01-01' AND '2021-12-31';
