WITH cte AS (
	SELECT 
		CONCAT(YEAR(s.sale_date), ' Q', QUARTER(s.sale_date)) sales_quarter,
        p.Product_Name, 
        p.Price,
        SUM(s.quantity) total_quantity
	FROM products p
		JOIN sales s ON p.Product_ID = s.product_id
GROUP BY
	CONCAT(YEAR(s.sale_date), ' Q', QUARTER(s.sale_date)),
    p.Product_ID,
    P.Product_Name,
    p.Price)

SELECT 
	sales_quarter,
	Product_Name,
    Price, total_quantity,
    price*total_quantity AS total_revenue
FROM cte
ORDER BY 
	sales_quarter, 
	Product_Name ASC;