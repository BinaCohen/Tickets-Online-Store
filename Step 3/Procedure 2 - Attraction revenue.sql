CREATE OR REPLACE PROCEDURE calculate_total_revenue (
    p_attraction_name IN VARCHAR2,
    p_area_name IN VARCHAR2,
    p_total_revenue OUT NUMBER
)
IS
  v_total_revenue NUMBER := 0;
  CURSOR revenue_cursor IS
    SELECT price
    FROM ATTRACTIONS A
    INNER JOIN TICKETS T ON A.ATTRACTION_ID = T.ATTRACTION_ID
    INNER JOIN Order_Items oi ON oi.ticket_id = t.ticket_id
    INNER JOIN LOCATIONS L ON A.LOCATION_ID = L.LOCATION_ID
    INNER JOIN AREAS AR ON AR.Area_Id = L.AREA_ID
    WHERE attraction_name = p_attraction_name AND (p_area_name IS NULL OR AR.AREA_NAME = p_area_name);
  v_price NUMBER;
BEGIN
  OPEN revenue_cursor;
  LOOP
    FETCH revenue_cursor INTO v_price;
    EXIT WHEN revenue_cursor%NOTFOUND;
    v_total_revenue := v_total_revenue + v_price;
  END LOOP;
  CLOSE revenue_cursor;
  
  -- Store the calculated total revenue in the output parameter
  p_total_revenue := v_total_revenue;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    p_total_revenue := 0;
  WHEN OTHERS THEN
    RAISE;
END calculate_total_revenue;
/
