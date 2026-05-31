SELECT
	t.Country,
	t.City,
    COUNT(*) total_orders,
	SUM(s.quantity) total_quantity,
	SUM(p.price*s.quantity) total_revenue,
    ROUND(SUM(p.price * s.quantity) / NULLIF(SUM(s.quantity), 0), 2) avg_unit_price
FROM sales s
JOIN stores t ON s.store_id = t.Store_ID
JOIN products p ON p.Product_ID = s.product_id
GROUP BY 
	t.Country,
    t.City
ORDER BY 
	t.Country,
    t.City