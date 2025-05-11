# 1. Normalize Your Database Design
**Objective:** Apply normalization principles to ensure the database is in the third normal form (3NF).

**Instructions:**

- Review your schema and identify any potential redundancies or violations of normalization principles.
    - Yes. The current schema violates normalization principles on the booking table. Here the total_price is in violation of the 3NF rule which states that 
    > All non-key columns should depend only on the primary key and nothing else. i.e No transitive dependencies.
    
    - total_price is dependent on start_date and end_date from the booking table and the pricepernight from the property_id. 

    - Do you see the problem here? If someone chooses to update the end_date by one day then the total_price will not be updated as it had been calculated beforehand. 

    - On the other hand if someone updates the price per night, there will be data inconsistencies with the calculation. So to solve this you can remove the total_price and calculate it on the fly as well as use a historical table to track the changes in prices for the rental property.

- Adjust your database design to achieve 3NF, if necessary.
    - Adjusting by removing the total_price column and calculating it on the fly
    - Adding a historical_pricing table to track the change in price

- Provide an explanation of your normalization steps in a Markdown file.
    - 1NF: Every table has primary key and all columns have atomic values
    - 2NF: All non key columns are dependent on the primary key *other than the total_price column that I have updated
    - 3NF: I removed the total_price which was dependent on the start_date, end_date and pricepernight. This will be calculated on the fly. This makes sure that all attributes only depend on their own table's primary key