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

INSERT INTO Customers (customer_id, customer_name, address_line_1, address_line_2, phone_number)
SELECT clientId + 400, ClientName || ' ' || ClientLastName AS customer_name,
       ClientAddress AS address_line_1,
       NULL AS address_line_2,
       NULL AS phone_number
FROM Client;



UPDATE activity a
SET customer_id = clientId + 400


select * from orders

update orders 
set accountid = 124

SELECT * FROM Acount A
LEFT JOIN ACTIVITY AC ON A.ACCOUNTID = AC.ACCOUNTID
WHERE AC.ACCOUNTID IS NULL
    AND ROWNUM = 1


UPDATE Orders o
SET AccountId = (
    SELECT (a.AccountId
    FROM activity a
    WHERE o.customer_id = a.customer_id
    AND ROWNUM = 1
)
WHERE EXISTS (
    SELECT 1
    FROM activity a
    WHERE o.customer_id = a.customer_id
);
