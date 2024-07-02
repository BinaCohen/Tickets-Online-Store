CREATE OR REPLACE TYPE OrderDetailsType AS OBJECT (
  total_value NUMBER,
  total_orders NUMBER
);
/

CREATE OR REPLACE FUNCTION calculate_order_details(p_customer_id IN NUMBER)
RETURN OrderDetailsType
IS
  -- Variable to store the total value of orders
  v_total_value NUMBER := 0; 
  -- Variable to store the total number of orders
  v_total_orders NUMBER := 0;
  
  -- Cursor to iterate over orders of the specified customer
  CURSOR orders_cursor IS
    SELECT o.order_id
    FROM Orders o
    WHERE o.customer_id = p_customer_id;

  -- Variable to hold the order ID fetched from the cursor
  v_order_id Orders.order_id%TYPE;

  -- Variable to hold the total value of tickets for the current order
  v_order_value NUMBER;
BEGIN
  -- Open the orders cursor
  OPEN orders_cursor;
  LOOP
    -- Fetch each order ID from the cursor
    FETCH orders_cursor INTO v_order_id;
    EXIT WHEN orders_cursor%NOTFOUND; -- Exit loop when no more rows are found
    
      -- Cursor to fetch the total value of tickets for a specific order
    SELECT SUM(t.price) INTO v_order_value
    FROM Order_Items oi
    JOIN Tickets t ON oi.ticket_id = t.ticket_id
    WHERE oi.order_id = v_order_id;

    -- Add the current order value to the total value
    v_total_value := v_total_value + v_order_value;

    -- Increment the total number of orders
    v_total_orders := v_total_orders + 1;
  END LOOP;
  -- Close the orders cursor
  CLOSE orders_cursor;

  -- Return the total value and total number of orders as an object
  RETURN OrderDetailsType(v_total_value, v_total_orders);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN OrderDetailsType(0, 0);
  WHEN OTHERS THEN
    RAISE;
END calculate_order_details;
/

