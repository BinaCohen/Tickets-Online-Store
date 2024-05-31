-- Query 1: Select all attractions along with the total number of tickets contains each attraction
SELECT A.attraction_id, A.attraction_name, L.location_name, COUNT(Tickets.ticket_id) AS total_tickets
FROM ATTRACTIONS A
LEFT JOIN Tickets ON A.attraction_id = Tickets.attraction_id
JOIN LOCATIONS L on L.LOCATION_ID = A.LOCATION_ID
GROUP BY A.attraction_id, a.attraction_name, L.location_name
ORDER BY total_tickets DESC;
/*
   It uses a LEFT JOIN to ensure all attractions are included, even if they haven't included in any tickets.
*/

-- Query 2: Find tickets of attractions located in both 'Delaware' and 'UT'
select distinct A2.attraction_name, category_name, A2.opening_hours, location_name, area_name
from (
SELECT attraction_name, opening_hours, category_name
FROM tickets T
join Attractions A ON T.attraction_id = A.attraction_id
join categories C ON C.category_id = T.category_id
WHERE location_id IN (
    SELECT location_id
    FROM Locations
    WHERE area_id in (SELECT area_id FROM Areas WHERE area_name = 'Delaware')
)
INTERSECT
SELECT attraction_name, opening_hours, category_name
FROM tickets T
join Attractions A ON T.attraction_id = A.attraction_id
join categories C ON C.category_id = T.category_id
WHERE location_id IN (
    SELECT location_id
    FROM Locations
    WHERE area_id in (SELECT area_id FROM Areas WHERE area_name = 'UT' )
)) A1
JOIN Attractions A2 ON A1.attraction_name = A2.attraction_name
join LOCATIONS L ON L.location_id = A2.location_id
join Areas A ON A.area_id = L.area_id
where area_name in ('UT', 'Delaware')

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
SELECT A.Attraction_Id, A.attraction_name, location_name, area_name
FROM Attractions A
JOIN Locations L ON A.location_id = L.location_id
JOIN AREAS AR ON AR.area_id = L.area_id
LEFT JOIN Tickets T ON A.attraction_id = T.attraction_id
WHERE T.ticket_id IS NULL;

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

-- Query 6: Update the price of all tickets for attractions located in the Delaware area and classified into teanager category
-- BEFORE.
UPDATE Tickets t
SET t.price = t.price * 1.10
WHERE t.category_id = (
    SELECT c.category_id
    FROM Categories c
    WHERE c.category_name = 'Teenager'
)
AND t.attraction_id IN (
    SELECT a.attraction_id
    FROM Attractions a
    JOIN Locations l ON a.location_id = l.location_id
    JOIN Areas ar ON l.area_id = ar.area_id
    WHERE ar.area_name = 'Delaware'
);

-- Query 7: Delete all orders older than a specific date
-- delete order items
delete from ORDER_ITEMS where order_id in (
WITH ThirdOrderDates AS (
    SELECT customer_id, order_date AS third_order_date
    FROM (
        SELECT customer_id, order_date, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rn
        FROM orders
    )
    WHERE rn = 3
)

select order_id FROM orders
WHERE (customer_id, order_date) IN (
    SELECT o.customer_id, o.order_date
    FROM orders o
    JOIN ThirdOrderDates t ON o.customer_id = t.customer_id
    WHERE o.order_date < t.third_order_date
))

-- delete orders
delete from orders where order_id in (
WITH ThirdOrderDates AS (
    SELECT customer_id, order_date AS third_order_date
    FROM (
        SELECT customer_id, order_date, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rn
        FROM orders
    )
    WHERE rn = 3
)

select count(order_id) FROM orders
WHERE (customer_id, order_date) IN (
    SELECT o.customer_id, o.order_date
    FROM orders o
    JOIN ThirdOrderDates t ON o.customer_id = t.customer_id
    WHERE o.order_date < t.third_order_date
))

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
