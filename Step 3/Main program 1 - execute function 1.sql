DECLARE
  v_customer_id NUMBER := &customer_id; -- Input parameter for customer_id
  v_order_details OrderDetailsType;
BEGIN

  -- Call function to calculate total orders
  v_order_details := calculate_order_details(v_customer_id);
  DBMS_OUTPUT.PUT_LINE('Total Value for Customer ' || v_customer_id || ': ' || v_order_details.total_value);
  DBMS_OUTPUT.PUT_LINE('Total Orders for Customer ' || v_customer_id || ': ' || v_order_details.total_orders);

  -- Apply discount to high-value customers
  apply_discount_to_high_value_customer(v_customer_id, v_order_details.total_value);

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
