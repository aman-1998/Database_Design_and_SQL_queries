/* 1. Find the store with 3rd highest sale. */
--Ans:
WITH total_sale_store_wise AS (
    SELECT
        st.store_id,
        st.store_name,
        SUM(st.quantity * st.cost) AS total_sale
    FROM
        store st
    GROUP BY
        st.store_id,
        st.store_name
), sale_wise_rank AS (
    SELECT
        tssw.*,
        DENSE_RANK() OVER(
            ORDER BY
                tssw.total_sale DESC
        ) AS rank
    FROM
        total_sale_store_wise tssw
)
SELECT
    swr.*
FROM
    sale_wise_rank swr
WHERE
   swr.rank = 3;
   
---------------------------------------------------------------------------
/* 2. Find the sum of odd and even rows for COST column in STORE table. */
--Ans:
WITH store_with_rownum AS (
    SELECT
        ROWNUM AS row_number,
        st.*
    FROM
        store st
)
SELECT
    (
        CASE
            WHEN mod(swr.row_number, 2) = 0 THEN
                'Sum of even rows for COST column'
            ELSE
                'Sum of odd rows for COST column'
        END
    )
    || ' = '
    || SUM(swr.cost) AS sum
FROM
    store_with_rownum swr
GROUP BY
    mod(swr.row_number, 2);

-- or (second solution),

WITH store_with_rownum AS (
    SELECT
        ROWNUM AS row_number,
        st.*
    FROM
        store st
)
SELECT DISTINCT
    (
        CASE
            WHEN mod(swr.row_number, 2) = 0 THEN
                'Sum of even rows for COST column'
            ELSE
                'Sum of odd rows for COST column'
        END
    ) AS description,
    SUM(swr.cost) OVER( PARTITION BY mod(swr.row_number, 2) ) AS sum
FROM
    store_with_rownum swr;
	
-------------------------------------------------------------------------
/* 3. Find the first and last row in STORE table. */
--Ans: 
WITH store_with_rownum AS (
    SELECT
        st.*,
        ROWNUM AS row_number
    FROM
        store st
), min_max AS (
    SELECT
        MAX(swr.row_number) AS max_row_num,
        MIN(swr.row_number) AS min_row_num
    FROM
        store_with_rownum swr
)
SELECT
    swr.store_id,
    swr.store_name,
    swr.product,
    swr.quantity,
    swr.cost
FROM
    store_with_rownum swr,
    min_max mm
WHERE
    swr.row_number IN (mm.max_row_num, mm.min_row_num);
   
----------------------------------------------------------------
/* 4. How do you copy all rows of a tale using SQL query ? */
--Ans:
CREATE TABLE shop
    AS
        ( SELECT
            *
        FROM
            store
        );

----------------------------------------------------------------------------------
/* 5. How do you copy the structure of a table but not the rows(i.e., data) ? */
--Ans:
CREATE TABLE shop
    AS
        ( SELECT
            *
        FROM
            store
        WHERE
            1 > 2
        );

-----------------------------------------------------------------
/* 6. Retrieve last 3 records from STORE table. */
--Ans:
WITH store_with_rownum AS (
    SELECT
        st.*,
        ROWNUM AS row_number
    FROM
        store st
), max_rownum AS (
    SELECT
        MAX(swr.row_number) AS max_row_num
    FROM
        store_with_rownum swr
)
SELECT
    swr.store_id,
    swr.store_name,
    swr.product,
    swr.quantity,
    swr.cost
FROM
    store_with_rownum swr,
    max_rownum mr
WHERE
    swr.row_number >= (mr.max_row_num - 2);
	
----------------------------------------------------------------
/* 7. Retrieve top 3 records from STORE table. */
--Ans:
WITH store_with_rownum AS (
    SELECT
        st.*,
        ROWNUM AS row_number
    FROM
        store st
)
SELECT
    swr.store_id,
    swr.store_name,
    swr.product,
    swr.quantity,
    swr.cost
FROM
    store_with_rownum swr
WHERE
    swr.row_number <= 3;
	
---------------------------------------------------------------
/* 8. Retrieve top two stores with maximum sale. */
--Ans:
WITH total_sale_store_wise AS (
    SELECT
        st.store_id,
        st.store_name,
        SUM(st.quantity * st.cost) AS total_sale
    FROM
        store st
    GROUP BY
        st.store_id,
        st.store_name
), sale_wise_rank AS (
    SELECT
        tssw.*,
        DENSE_RANK() OVER(
            ORDER BY
                tssw.total_sale DESC
        ) AS rank
    FROM
        total_sale_store_wise tssw
)
SELECT
    swr.*
FROM
    sale_wise_rank swr
WHERE
   swr.rank <= 2;
   
---------------------------------------------------------------------------------------
/* 9. Find stores whose sales are better than the average sales across all stores.  */
--Ans:
WITH total_sale_store_wise AS (
    SELECT
        st.store_id,
        st.store_name,
        SUM(st.quantity * st.cost) AS total_sale
    FROM
        store st
    GROUP BY
        st.store_id,
        st.store_name
), average_sale_across_all_stores AS (
    SELECT
        AVG(tssw.total_sale) AS average
    FROM
        total_sale_store_wise tssw
)
SELECT
    tssw.*
FROM
    total_sale_store_wise tssw,
    average_sale_across_all_stores asaas
WHERE
    tssw.total_sale > asaas.average;
    
---------------------------------------------------------------------------------
/* 10. Find product-wise and store-wise rank of sales. */
--Ans:
WITH total_sale_store_wise AS (
    SELECT
        st.*,
        ( st.quantity * st.cost ) AS product_wise_sale,
        SUM(st.quantity * st.cost) OVER(
            PARTITION BY st.store_id, st.store_name
        ) AS total_sale
    FROM
        store st
)
SELECT
    tssw.*,
    DENSE_RANK() OVER(
        ORDER BY
            tssw.product_wise_sale DESC
    ) AS product_wise_rank_of_sale,
    DENSE_RANK() OVER(
        ORDER BY
            tssw.total_sale DESC
    ) AS store_wise_rank_of_sale
FROM
    total_sale_store_wise tssw;