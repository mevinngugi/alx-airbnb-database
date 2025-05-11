-- USER DATA
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('uuid-1', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '254721234567', 'guest'),
('uuid-2', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '254729876543', 'host'),
('uuid-3', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_pw3', '254720112233', 'guest'),
('uuid-4', 'Diana', 'Otieno', 'diana@example.com', 'hashed_pw4', '254728765432', 'guest'),
('uuid-5', 'Elijah', 'Mwangi', 'elijah@example.com', 'hashed_pw5', '254721998877', 'host');

-- PROPERTY DATA
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
VALUES 
('prop-1', 'uuid-2', 'Sunny Apartment', 'A bright and cozy place.', 'Nairobi, Kenya', 50.00),
('prop-2', 'uuid-2', 'Beach House', 'Relaxing home by the ocean.', 'Mombasa, Kenya', 120.00),
('prop-3', 'uuid-5', 'Mountain Cabin', 'Peaceful retreat in the mountains.', 'Mt. Kenya, Kenya', 80.00),
('prop-4', 'uuid-5', 'City Loft', 'Modern loft in Nairobi CBD.', 'Nairobi, Kenya', 70.00);

-- BOOKING DATA
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status)
VALUES 
('book-1', 'prop-1', 'uuid-1', '2025-06-01', '2025-06-05', 'confirmed'),
('book-2', 'prop-2', 'uuid-3', '2025-07-10', '2025-07-15', 'pending'),
('book-3', 'prop-3', 'uuid-4', '2025-08-05', '2025-08-10', 'confirmed'),
('book-4', 'prop-4', 'uuid-1', '2025-09-01', '2025-09-03', 'canceled');

-- PAYMENT DATA
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES 
('pay-1', 'book-1', 200.00, 'credit_card'),
('pay-2', 'book-2', 600.00, 'paypal'),
('pay-3', 'book-3', 400.00, 'stripe');

-- REVIEW DATA
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES 
('rev-1', 'prop-1', 'uuid-1', 5, 'Amazing stay! Very clean and cozy.'),
('rev-2', 'prop-2', 'uuid-3', 4, 'Nice house, but a bit far from city.'),
('rev-3', 'prop-3', 'uuid-4', 5, 'Perfect getaway spot! Loved the view.');

-- MESSAGE DATA
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES 
('msg-1', 'uuid-1', 'uuid-2', 'Hi Bob, is the apartment available on June 1st?'),
('msg-2', 'uuid-2', 'uuid-1', 'Yes, it is available. Looking forward to hosting you!'),
('msg-3', 'uuid-4', 'uuid-5', 'Hello Elijah, can I book the cabin for August?');
