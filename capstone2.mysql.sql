CREATE DATABASE hotel;
USE hotel;
SELECT * FROM bookings;
SELECT * FROM cancellations;
SELECT * FROM `customer reviews`;
SELECT * FROM `hotel amenities`;
SELECT * FROM hotels;
SELECT * FROM customers;
SELECT * FROM payments;
SELECT * FROM rooms;
SELECT * FROM staff;
SHOW TABLES;

# Task 1: See all your hotels
SELECT * FROM hotels;

# Task 2: List hotel name and city only
SELECT hotel_Name, city FROM hotels;

# Task 3: Find hotels with a star rating of 5
SELECT hotel_Name, city, star_rating 
FROM hotels 
WHERE star_rating = 5;

# Task 4: Count how many bookings are "Completed"
SELECT COUNT(*) AS completed_bookings 
FROM Bookings 
WHERE booking_status = 'Completed';

# Task 5: Find the top 5 highest-paying payments
DESCRIBE payments;
SELECT booking_id, amount_paid
FROM payments
ORDER BY amount_paid DESC
LIMIT 5;

# Task 6: Count customers by membership tier
SELECT Membership_tier, COUNT(*) AS total_customers 
FROM Customers 
GROUP BY Membership_tier;

# Task 7: Find rooms priced above ₹15,000 per night
DESCRIBE rooms;
SELECT hotel_id, room_type, price_per_night
FROM rooms
WHERE price_per_night > 15000;

# Task 8: List all cancellations with "Pending" refund status
DESCRIBE cancellations;

SELECT cancellation_id, booking_id, reason, refund_status
FROM cancellations
WHERE refund_status = 'Pending';

# Task 9: Find average rating per hotel from reviews
SHOW TABLES;
SELECT * FROM `customer reviews` LIMIT 5;
SELECT hotel_id, AVG(rating) AS avg_rating
FROM `customer reviews`
GROUP BY hotel_id
ORDER BY avg_rating DESC;

# Task 10: Join Bookings with Customers to see who booked what
DESCRIBE Customers;
DESCRIBE Bookings;

SELECT b.booking_id, c.`Full Name`, b.check_in_date, b.check_out_date
FROM Bookings b
JOIN Customers c ON b.customer_id = c.`ï»¿customer_id`
LIMIT 10;
