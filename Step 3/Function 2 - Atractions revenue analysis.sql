-- Create a function to analyze revenue by area and return a REF CURSOR
CREATE OR REPLACE FUNCTION analyze_revenue_by_area (
    p_area_name IN VARCHAR2 DEFAULT NULL
)
RETURN SYS_REFCURSOR
IS
    -- Declare a REF CURSOR variable
    v_ref_cursor SYS_REFCURSOR;

BEGIN
    -- Open the REF CURSOR for the query results
    OPEN v_ref_cursor FOR
        SELECT
            A.ATTRACTION_NAME,
            SUM(T.PRICE) AS TOTAL_REVENUE,
            (CASE WHEN SUM(T.PRICE) > 1000 THEN SUM(T.PRICE) ELSE 0 END) AS REVENUE_OVER_1000,
            (CASE WHEN SUM(T.PRICE) > 500 AND SUM(T.PRICE) <= 1000 THEN SUM(T.PRICE) ELSE 0 END) AS REVENUE_OVER_500,
            (CASE WHEN SUM(T.PRICE) > 100 AND SUM(T.PRICE) <= 500 THEN SUM(T.PRICE) ELSE 0 END) AS REVENUE_OVER_100,
            (CASE WHEN SUM(T.PRICE) <= 100 THEN SUM(T.PRICE) ELSE 0 END) AS LOW_REVENUE
        FROM ATTRACTIONS A
        INNER JOIN TICKETS T ON A.ATTRACTION_ID = T.ATTRACTION_ID
        INNER JOIN Order_Items oi ON oi.ticket_id = t.ticket_id
        INNER JOIN LOCATIONS L ON A.LOCATION_ID = L.LOCATION_ID
        INNER JOIN AREAS AR ON AR.Area_Id = L.AREA_ID
        WHERE (p_area_name IS NULL OR AR.AREA_NAME = p_area_name)
        GROUP BY A.ATTRACTION_NAME;

    -- Return the opened REF CURSOR
    RETURN v_ref_cursor;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        NULL; -- Return NULL when no data found
    WHEN OTHERS THEN
        RAISE; -- Raise exception for other errors
END analyze_revenue_by_area;
/
