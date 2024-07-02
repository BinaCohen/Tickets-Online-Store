CREATE OR REPLACE PROCEDURE apply_discount_to_high_value_customer (
  p_customer_id IN Customers.customer_id%TYPE,
  p_total_value IN NUMBER
)
IS
BEGIN
  -- Check if the total value exceeds 1000
  IF p_total_value > 1000 THEN
    -- Apply 10% discount to all orders of the customer
    UPDATE Orders
    SET discount = 10
    WHERE customer_id = p_customer_id;
    
    DBMS_OUTPUT.PUT_LINE('Discount applied to orders for customer ID: ' || p_customer_id);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Total value is less than 1000. No discount applied.');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END apply_discount_to_high_value_customer;
/
