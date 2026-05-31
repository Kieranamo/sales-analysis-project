SELECT
    p.Product_Name,
    ROUND(AVG(DATEDIFF(w.claim_date, s.sale_date)), 2) average_days_sale_claim
FROM warranty w
JOIN sales s ON s.sale_id = w.sale_id
JOIN products p ON s.product_id = p.Product_ID
WHERE w.claim_date >= s.sale_date
GROUP BY 
	p.Product_Name
ORDER BY 
	p.Product_Name ASC;