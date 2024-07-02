DECLARE
  TYPE RevenueRecordType IS RECORD (
    attraction_name VARCHAR2(100),
    revenue_over_1000 NUMBER,
    revenue_over_500 NUMBER,
    revenue_over_100 NUMBER,
    low_revenue NUMBER
  );
  v_attraction_name VARCHAR2(100) := '&attraction_name'; -- Example attraction_name
  v_total_revenue NUMBER;

  -- Define a cursor to fetch data from the pipelined function
  CURSOR c_revenue_records IS
    SELECT * FROM TABLE(analyze_revenue_by_area('&area_name'));
  
  v_revenue_table RevenueRecordType;
BEGIN
  
  -- Call function to calculate total revenue
  calculate_total_revenue(v_attraction_name, '&area_name', v_total_revenue);
  DBMS_OUTPUT.PUT_LINE('Total Revenue for ' || v_attraction_name || ': ' || v_total_revenue);
  DBMS_OUTPUT.PUT_LINE('');
  
  -- Open the cursor
  OPEN c_revenue_records;

  -- Fetch and process each record
  LOOP
    FETCH c_revenue_records INTO v_revenue_table;
    EXIT WHEN c_revenue_records%NOTFOUND;

    -- Output each row as a table format (you can format as needed)
    DBMS_OUTPUT.PUT_LINE(
      RPAD(v_revenue_table.attraction_name, 20) || ' | ' ||
      RPAD(v_revenue_table.revenue_over_1000, 15) || ' | ' ||
      RPAD(v_revenue_table.revenue_over_500, 15) || ' | ' ||
      RPAD(v_revenue_table.revenue_over_100, 15) || ' | ' ||
      RPAD(v_revenue_table.low_revenue, 15)
    );
  END LOOP;

  -- Close the cursor
  CLOSE c_revenue_records;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
