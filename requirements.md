# Database Specification - AirBnB
**Entities and Attributes**
# User
- **user_id:** Primary Key, UUID, Indexed </br>
- **first_name:** VARCHAR, NOT NULL </br>
- **last_name:** VARCHAR, NOT NULL </br>
- **email:** VARCHAR, UNIQUE, NOT NULL </br>
- **password_hash:** VARCHAR, NOT NULL </br>
- **phone_number:** VARCHAR, NULL </br>
- **role:** ENUM (<mark>guest</mark>, <mark>host</mark>, <mark>admin</mark>), NOT NULL </br>
- **created_at:** TIMESTAMP, DEFAULT CURRENT_TIMESTAMP </br>

# Property
- **property_id:** Primary Key, UUID, Indexed </br>
- **host_id:** Foreign Key, references <mark>User(user_id)</mark> </br>
- **name:** VARCHAR, NOT NULL </br>
- **description:** TEXT, NOT NULL </br>
- **location:** VARCHAR, NOT NULL </br>
- **pricepernight:** DECIMAL, NOT NULL </br>
- **created_at:** TIMESTAMP, DEFAULT CURRENT_TIMESTAMP </br>
- **updated_at:** TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP </br>

# Booking
- **booking_id:** Primary Key, UUID, Indexed </br>
- **property_id:** Foreign Key, references <mark>Property(property_id)</mark> </br>
- **user_id:** Foreign Key, references <mark>User(user_id)</mark> </br>
- **start_date:** DATE, NOT NULL </br>
- **end_date:** DATE, NOT NULL </br>
- **total_price:** DECIMAL, NOT NULL </br>
- **status:** ENUM (<mark>pending</mark>, <mark>confirmed</mark>, <mark>canceled</mark>), NOT NULL </br>
- **created_at:** TIMESTAMP, DEFAULT CURRENT_TIMESTAMP </br>

# Payment
- **payment_id:** Primary Key, UUID, Indexed </br>
- **booking_id:** Foreign Key, references <mark>Booking(booking_id)</mark> </br>
- **amount:** DECIMAL, NOT NULL </br>
- **payment_date:** TIMESTAMP, DEFAULT CURRENT_TIMESTAMP </br>
- **payment_method:** ENUM (<mark>credit_card, paypal, stripe</mark>), NOT NULL </br>

# Review
- **review_id:** Primary Key, UUID, Indexed </br>
- **property_id:** Foreign Key, references <mark>Property(property_id)</mark> </br>
- **user_id:** Foreign Key, references <mark>User(user_id)</mark> </br>
- **rating:** INTEGER, CHECK: <mark>rating >= 1 AND rating <= 5</mark>, NOT NULL </br>
- **comment:** TEXT, NOT NULL </br>
- **created_at:** TIMESTAMP, DEFAULT CURRENT_TIMESTAMP </br>

# Message
- **message_id:** Primary Key, UUID, Indexed </br>
- **sender_id:** Foreign Key, references <mark>User(user_id)</mark> </br>
- **recipient_id:** Foreign Key, references <mark>User(user_id)</mark> </br>
- **message_body:** TEXT, NOT NULL </br>
- **sent_at:** TIMESTAMP, DEFAULT CURRENT_TIMESTAMP </br>

# Constraints
# User Table
- Unique constraint on <mark>email</mark>. </br>
- Non-null constraints on required fields. </br>
# Property Table
- Foreign key constraint on <mark>host_id</mark>. </br>
- Non-null constraints on essential attributes. </br>
# Booking Table
- Foreign key constraints on <mark>property_id</mark> and <mark>user_id</mark>. </br>
- <mark>status</mark> must be one of <mark>pending</mark>, <mark>confirmed</mark>, or <mark>canceled</mark>. </br>
# Payment Table
- Foreign key constraint on <mark>booking_id</mark>, ensuring payment is linked to valid bookings. </br>
# Review Table
- Constraints on <mark>rating</mark> values (1-5). </br>
- Foreign key constraints on <mark>property_id</mark> and <mark>user_id</mark>. </br>
# Message Table
- Foreign key constraints on <mark>sender_id</mark> and <mark>recipient_id</mark>. </br>
# Indexing
- **Primary Keys:** Indexed automatically. </br>
- **Additional Indexes:**
    - <mark>email</mark> in the User table. </br>
    - <mark>property_id</mark> in the Property and Booking tables. </br>
    - <mark>booking_id</mark> in the Booking and Payment tables. </br>