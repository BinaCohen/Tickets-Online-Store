-- Add constraint to Customers table for enshuring phone_number is unique
ALTER TABLE Customers
ADD CONSTRAINT unique_phone_number UNIQUE (phone_number);

-- Add constraint to Tickets table for ensuring price is greater than zero
ALTER TABLE Tickets
ADD CONSTRAINT positive_price CHECK (price > 0);

-- Set a default value for the valid_from date in the Tickets table:
ALTER TABLE Tickets
MODIFY valid_from DEFAULT SYSDATE;
