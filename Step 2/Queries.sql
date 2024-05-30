-- Query 1: Select all attractions along with the total number of tickets contains each attraction
SELECT Attractions.attraction_name, COUNT(Tickets.ticket_id) AS total_tickets_sold
FROM Attractions
LEFT JOIN Tickets ON Attractions.attraction_id = Tickets.attraction_id
GROUP BY Attractions.attraction_id, Attractions.attraction_name
ORDER BY total_tickets_sold DESC;

/*
   It uses a LEFT JOIN to ensure all attractions are included, even if they haven't included in any tickets.
*/

-- Query to find attractions located in both 'Delaware' and 'UT'
SELECT attraction_name
FROM Attractions
WHERE location_id IN (
    SELECT location_id
    FROM Locations
    WHERE area_id in (SELECT area_id FROM Areas WHERE area_name = 'Delaware')
)
INTERSECT
SELECT attraction_name
FROM Attractions
WHERE location_id IN (
    SELECT location_id
    FROM Locations
    WHERE area_id in (SELECT area_id FROM Areas WHERE area_name = 'UT' )
);


-- Query 3: Select all orders placed on or after 2024-01-01, along with the customer name and total order amount
SELECT c.customer_name, o.order_id, o.order_date, SUM(t.price) AS total_order_amount
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Order_Items oi ON o.order_id = oi.order_id
INNER JOIN Tickets t ON oi.ticket_id = t.ticket_id
WHERE o.order_date >= TO_DATE('2024-01-01', 'YYYY-MM-DD')
GROUP BY c.customer_name, o.order_id, o.order_date
ORDER BY total_order_amount DESC;

/*
   This query selects all orders placed on or after a specific date, along with the customer name and total order amount.
*/


-- Query 4: Select all attractions that have not included by any tickets yet
SELECT Attractions.Attraction_Id, Attractions.attraction_name
FROM Attractions
LEFT JOIN Tickets ON Attractions.attraction_id = Tickets.attraction_id
WHERE Tickets.ticket_id IS NULL;

/*
   It utilizes a LEFT JOIN to include attractions that haven't included by any tickets.
*/

-- Query 5: Update the opening hours of all the Botanical Garden attractions
UPDATE Attractions
SET opening_hours = '09:00 AM - 06:00 PM'
WHERE attraction_id in (
    SELECT attraction_id
    FROM Attractions
    WHERE attraction_name = 'Botanical Garden'
);

/*
   It uses a subquery to find the attraction_id based on the attraction name.
*/

-- Query 6: Update the phone number of customer with the id 1
UPDATE Customers
SET phone_numer = '1234567890'
WHERE customer_id = 1


-- Query 7: Delete all orders older than a specific date
DELETE FROM Orders
WHERE order_date < TO_DATE('2008-01-01', 'YYYY-MM-DD');

/*
   This query deletes all orders older than a specific date.
   It removes historical data from the Orders table.
*/

INSERT INTO Tickets (price, valid_from, valid_until, category_id, attraction_id)
VALUES (50.00, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'), 1, 401);

-- Query 8: Delete all tickets for a specific attraction
DELETE FROM Tickets
WHERE attraction_id in (
    SELECT attraction_id
    FROM Attractions
    WHERE attraction_name = 'Golden Gate Bridge'
);

/*
   This query deletes all tickets for Golden Gate Bridge attraction.
   It uses a subquery to find the attraction_id based on the attraction name.
*/
