# Database Normalization: Achieving 3NF

## 🎯 Objective
Ensure the database schema for the **ALX Airbnb Clone** project is fully normalized up to **Third Normal Form (3NF)** to reduce redundancy and improve data integrity.

---

## ✅ Current Entities Identified
- **User** (id, name, email, password_hash, etc.)
- **Property** (id, owner_id, name, description, price, address, etc.)
- **Booking** (id, user_id, property_id, start_date, end_date, total_amount)
- **Review** (id, user_id, property_id, rating, comment, created_at)
- **Amenity** (id, name, description)
- **PropertyAmenity** (property_id, amenity_id) – join table for many-to-many relationship

---

## 🔎 Redundancy & Violations Found
1. **Owner info duplication** – if property owner details were stored directly in `Property`, it could cause redundancy if a user owns multiple properties.
2. **Booking details containing user or property data** – if booking rows included repeating user or property information (e.g., usernames or property addresses), it would violate normalization.
3. **Amenities as comma-separated lists in `Property`** – a common mistake that violates 1NF (atomicity).

---

## ✅ Normalization Steps

### 📌 First Normal Form (1NF)
- Ensure every field contains only **atomic values** (no lists, arrays, or nested structures).
- **Action**: Replace any comma-separated amenity lists in `Property` with a separate `PropertyAmenity` join table.

### 📌 Second Normal Form (2NF)
- Remove **partial dependencies** (where non-key attributes depend only on part of a composite primary key).
- **Action**: Confirm `Booking` and `Review` tables do not have fields depending on a single part of their composite foreign keys.

### 📌 Third Normal Form (3NF)
- Remove **transitive dependencies** (where non-key attributes depend on other non-key attributes).
- **Actions**:
  - Make sure `Property` references `owner_id` as a foreign key to `User` instead of duplicating owner info.
  - Keep `Booking` referencing `user_id` and `property_id`, without repeating user or property details.
  - Confirm `Review` references `user_id` and `property_id` only, with rating/comment fields depending solely on the primary key.

---

## ✅ Updated Schema Overview

- **User**:
  - `id (PK)`, `name`, `email`, `password_hash`, ...

- **Property**:
  - `id (PK)`, `owner_id (FK → User.id)`, `name`, `description`, `price`, `address`, ...

- **Booking**:
  - `id (PK)`, `user_id (FK → User.id)`, `property_id (FK → Property.id)`, `start_date`, `end_date`, `total_amount`

- **Review**:
  - `id (PK)`, `user_id (FK → User.id)`, `property_id (FK → Property.id)`, `rating`, `comment`, `created_at`

- **Amenity**:
  - `id (PK)`, `name`, `description`

- **PropertyAmenity**:
  - `property_id (FK → Property.id)`, `amenity_id (FK → Amenity.id)`

---

## ✅ Conclusion

All entities and relationships have been reviewed and adjusted to:
✔ Store only atomic values (1NF)  
✔ Remove partial dependencies (2NF)  
✔ Eliminate transitive dependencies (3NF)

The schema is now fully normalized up to **Third Normal Form (3NF)**.

---

