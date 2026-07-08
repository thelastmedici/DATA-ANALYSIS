SELECT product_line, warehouse, to_char(date, 'FMMonth') AS month,
       SUM(total) - SUM(payment_fee) AS net_revenue
FROM sales
-- GROUP BY month, warehouse
WHERE client_type = 'Wholesale'
    GROUP BY product_line, warehouse, to_char(date, 'FMMonth'), extract(month FROM date)
ORDER BY   product_line, extract(month FROM  date), net_revenue desc;