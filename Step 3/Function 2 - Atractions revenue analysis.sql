
-- Create a pipelined function to analyze revenue by area
CREATE OR REPLACE FUNCTION analyze_revenue_by_area (
    p_area_id IN NUMBER DEFAULT NULL
)
RETURN RevenueTableType PIPELINED
IS
    -- Declare local variables
    v_revenue_record RevenueRecordType;
BEGIN
    -- Query to fetch revenue data based on area id and categorize it
    FOR rec IN (
      
        SELECT
            A.ATTRACTION_NAME,
            SUM(T.PRICE),
            (CASE WHEN SUM(T.PRICE) > 1000 THEN SUM(T.PRICE) ELSE 0 END) AS REVENUE_OVER_1000,
            (CASE WHEN SUM(T.PRICE) > 500 AND SUM(T.PRICE) <= 1000 THEN SUM(T.PRICE) ELSE 0 END) AS REVENUE_OVER_500,
            (CASE WHEN SUM(T.PRICE) > 100 AND SUM(T.PRICE) <= 500 THEN SUM(T.PRICE) ELSE 0 END) AS REVENUE_OVER_100,
            (CASE WHEN SUM(T.PRICE) <= 100 THEN SUM(T.PRICE) ELSE 0 END) AS LOW_REVENUE
        FROM ATTRACTIONS A
        INNER JOIN TICKETS T ON A.ATTRACTION_ID = T.ATTRACTION_ID
        INNER JOIN Order_Items oi ON oi.ticket_id = t.ticket_id
        INNER JOIN LOCATIONS L ON A.LOCATION_ID = L.LOCATION_ID
        WHERE (P_AREA_ID IS NULL OR L.AREA_ID = P_AREA_ID)
        GROUP BY A.ATTRACTION_NAME
        
    ) LOOP
        -- Populate the record type with fetched data
        v_revenue_record := RevenueRecordType(
            rec.ATTRACTION_NAME,
            rec.REVENUE_OVER_1000,
            rec.REVENUE_OVER_500,
            rec.REVENUE_OVER_100,
            rec.LOW_REVENUE
        );

        -- Pipe the record type to the result set
        PIPE ROW(v_revenue_record);
    END LOOP;

    -- Return the pipelined result set
    RETURN;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        NULL; -- Return NULL when no data found
    WHEN OTHERS THEN
        RAISE; -- Raise exception for other errors
END analyze_revenue_by_area;
/
