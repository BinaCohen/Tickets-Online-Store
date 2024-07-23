UPDATE Branch b
SET location_id = (
    SELECT l.location_id
    FROM Locations l
    WHERE b.BranchAddress LIKE '%' || l.location_name || '%' and l.location_name is not null AND ROWNUM = 1
)
WHERE EXISTS (
    SELECT 1
    FROM Locations l
    WHERE b.BranchAddress LIKE '%' || l.location_name || '%'
);

INSERT INTO Customers (customer_name, old_phone_numer, address_line_1, address_line_2, phone_number)
SELECT ClientName || ' ' || ClientLastName AS customer_name,
       '0000000000' AS phone_numer,
       ClientAddress AS address_line_1,
       NULL AS address_line_2,
       NULL AS phone_number
FROM Client;



UPDATE activity a
SET customer_id = (
    SELECT c.customer_id
    FROM Customers c
    WHERE c.customer_id = a.ClientId
)
WHERE EXISTS (
    SELECT 1
    FROM Customers c
    WHERE c.customer_id = a.ClientId
);




UPDATE Orders o
SET AccountId =  (
    SELECT (a.AccountId
    FROM activity a
    WHERE o.customer_id = a.ClientId
    AND ROWNUM = 1
)
WHERE EXISTS (
    SELECT 1
    FROM activity a
    WHERE o.customer_id = a.ClientId
);

