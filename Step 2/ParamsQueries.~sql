-- Query 1: Retrieve orders with details for a specific customer and their purchased tickets
SELECT O.order_id, o.customer_id, O.order_date, T.ticket_id, T.price, T.valid_from, T.valid_until
FROM Orders O
JOIN Order_Items OI ON O.order_id = OI.order_id
JOIN Tickets T ON OI.ticket_id = T.ticket_id
WHERE O.customer_id = &<name = "Customer id" type = "integer" hint = "Enter customer id">;

/*
Parameter: customer_id - The identifier of the customer whose orders and tickets are to be retrieved.
*/

-- Query 2: This query retrieves tickets of attractions located in a specific area along with their associated location and category details.
SELECT Ticket_Id, A.attraction_name, A.Description, L.location_name, C.category_name
FROM Tickets T
JOIN Attractions A ON T.ATTRACTION_ID = A.Attraction_id
JOIN Locations L ON A.location_id = L.location_id
JOIN Categories C ON T.category_id = C.category_id
JOIN Areas AR ON L.area_id = AR.area_id
WHERE AR.area_name = &<name = "Area name" type = "string" hint = "Enter area name"> 
AND C.Category_name = &<name = "Category name" type = "string" list = "Adult, Teenager, Child" hint = "Select category">

/*
Parameter: area_name - The name of the area where attractions are located.
*/

-- Query 3: Retrieve customers who have placed orders within a specific date range
SELECT DISTINCT C.customer_id, C.customer_name
FROM Customers C
JOIN Orders O ON C.customer_id = O.customer_id
WHERE O.order_date 
  BETWEEN TO_DATE(&<name = "Start date" type = "string" hint = "Enter start date">, 'YYYY-MM-DD') 
  AND TO_DATE(&<name = "End date" type = "string" hint = "Enter end date">, 'YYYY-MM-DD');

/*
Parameters: 
- start_date: The start date of the date range (format: YYYY-MM-DD).
- end_date: The end date of the date range (format: YYYY-MM-DD).
*/

-- Query 5: Retrieve attractions with their total sales count and revenue within a specific year range
SELECT A.attraction_id, A.attraction_name, COUNT(OI.ticket_id) AS total_sales_count, SUM(T.price) AS total_revenue
FROM Attractions A
JOIN Locations L ON A.location_id = L.location_id
JOIN Tickets T ON A.Attraction_Id = T.Attraction_Id
JOIN Order_Items OI ON OI.Ticket_Id = T.Ticket_Id
JOIN Orders O ON OI.order_id = O.order_id
WHERE EXTRACT(YEAR FROM O.order_date)
 BETWEEN &<name = "Start year" type = "integer" list = "2024, 2023, 2022, 2021, 2020" hint = "Enter start year"> 
 AND &<name = "End year"  list = "2024, 2023, 2022, 2021, 2020" type = "integer" hint = "Enter end year">
 AND
 EXTRACT(MONTH FROM O.order_date)
 BETWEEN &<name = "Start month" type = "integer" list = "1,2,3,4,5,6,7,8,9,10,11,12" hint = "Enter start month"> 
 AND &<name = "End month"  list = "1,2,3,4,5,6,7,8,9,10,11,12" type = "integer" hint = "Enter end month">
GROUP BY A.attraction_id, A.attraction_name;

/*
Parameters: 
- start_date: The start date of the date range (format: YYYY-MM-DD).
- end_date: The end date of the date range (format: YYYY-MM-DD).
*/
