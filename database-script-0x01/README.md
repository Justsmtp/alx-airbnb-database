# ALX Airbnb Database Schema

## 📚 Overview

This directory contains the SQL DDL script for the normalized schema of the ALX Airbnb clone project. The schema defines:

- `User` table for application users.
- `Property` table for listings.
- `Amenity` table with join table `PropertyAmenity` for property amenities.
- `Booking` table for reservations.
- `Review` table for property reviews.

## 📌 Files

- **schema.sql**: SQL statements to create all tables, constraints, and indexes.
- **README.md**: This file.

## ✅ Features

- Uses proper data types for each column.
- Defines primary and foreign keys with `ON DELETE CASCADE` for referential integrity.
- Adds `CHECK` constraints on `price`, `total_amount`, and `rating`.
- Adds indexes to optimize frequent lookup queries.

