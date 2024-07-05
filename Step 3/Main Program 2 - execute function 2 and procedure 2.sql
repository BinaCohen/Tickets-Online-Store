DECLARE
  TYPE RevenueRecordType IS RECORD (
    ATTRACTION_NAME VARCHAR2(100),
    TOTAL_REVENUE NUMBER,
    REVENUE_OVER_1000 NUMBER,
    REVENUE_OVER_500 NUMBER,
    REVENUE_OVER_100 NUMBER,
    LOW_REVENUE NUMBER
  );

  v_attraction_name VARCHAR2(100) := &<name = "Attraction name" type = "string" list = "select attraction_name from attractions" hint = "Enter attraction name">; 
  v_area_name VARCHAR2(100) := &<name = "Area name" type = "string" list = "select area_id, area_name from areas" description = "yes" hint = "Enter area name">;
  v_total_revenue NUMBER;
  rev_over_1000_count NUMBER := 0;
  v_cursor sys_refcursor;
  v_revenue_table RevenueRecordType; -- Ensure this matches the structure returned by analyze_revenue_by_area
BEGIN
  -- Call function to calculate total revenue
  calculate_total_revenue(v_attraction_name, v_area_name, v_total_revenue);
  DBMS_OUTPUT.PUT_LINE('Total Revenue for ' || v_attraction_name || ': ' || v_total_revenue);
  DBMS_OUTPUT.PUT_LINE('');

  -- Open the SYS_REFCURSOR
  v_cursor := analyze_revenue_by_area(v_area_name);

  -- Fetch and process each record
  LOOP
    FETCH v_cursor INTO v_revenue_table;
    EXIT WHEN v_cursor%NOTFOUND;

    -- Output each row as a table format (you can format as needed)
    DBMS_OUTPUT.PUT_LINE(
      RPAD(v_revenue_table.attraction_name, 20) || ' | ' ||
      RPAD(v_revenue_table.revenue_over_1000, 15) || ' | ' ||
      RPAD(v_revenue_table.revenue_over_500, 15) || ' | ' ||
      RPAD(v_revenue_table.revenue_over_100, 15) || ' | ' ||
      RPAD(v_revenue_table.low_revenue, 15)
    );

    -- Example: Count attractions with revenue over 1000
    IF v_revenue_table.revenue_over_1000 > 0 THEN
      rev_over_1000_count := rev_over_1000_count + 1;
    END IF;
  END LOOP;

  -- Output count of attractions with high revenue
  DBMS_OUTPUT.PUT_LINE('');
  DBMS_OUTPUT.PUT_LINE('Count attractions with high revenue: ' || RPAD(rev_over_1000_count, 15));

  -- Close the SYS_REFCURSOR
  CLOSE v_cursor;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
