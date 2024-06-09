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


select * from customers

INSERT INTO Customers (customer_name, Old_Phone_Numer ,phone_number, address_line_1, address_line_2)
VALUES ('John Doe','6242738669', '6242738669', '123 Main St', 'Apt 4B');


-- Step 1: Identify Violating Records
SELECT *
FROM Tickets
WHERE price <= 0;

-- Step 2 Option 1: Update Violating Records to have a positive price
UPDATE Tickets
SET price = 1 -- Set to a positive value based on your requirements
WHERE price <= 0;
