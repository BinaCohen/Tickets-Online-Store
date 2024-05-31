-- Add constraint to Customers table for phone number uniqueness
ALTER TABLE Customers 
ADD CONSTRAINT unique_phone_number UNIQUE (phone_numer);

ALTER TABLE Customers
ADD phone_number VARCHAR2(10);

update customers
set phone_number = phone_numer
where phone_numer in (
select phone_numer from (
SELECT phone_numer, COUNT(*)
FROM Customers
GROUP BY phone_numer
HAVING COUNT(*) > 1))

select * from customers

ALTER TABLE Customers
RENAME COLUMN phone_numer TO old_phone_numer;

ALTER TABLE Customers
ADD CONSTRAINT unique_phone_number UNIQUE (phone_number);

SELECT phone_number, COUNT(*)
FROM Customers
GROUP BY phone_number
HAVING COUNT(*) > 1;

DELETE FROM Order_Items
WHERE order_id IN (
  SELECT order_id
  FROM Orders
  WHERE customer_id IN (
    SELECT customer_id
    FROM Customers
    WHERE phone_number IN (
      SELECT phone_number
      FROM Customers
      GROUP BY phone_number
      HAVING COUNT(*) > 1
    )
  )
);

DELETE FROM Orders
WHERE customer_id IN (
  SELECT customer_id
  FROM Customers
  WHERE phone_number IN (
    SELECT phone_number
    FROM Customers
    GROUP BY phone_number
    HAVING COUNT(*) > 1
  )
);

-- Delete duplicate records, keeping only the first occurrence
DELETE FROM Customers
WHERE ROWID NOT IN (
  SELECT MIN(ROWID)
  FROM Customers
  GROUP BY phone_number
);

delete from orders where order_id = 97

