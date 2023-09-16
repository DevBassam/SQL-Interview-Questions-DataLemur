-- Multiply WITH '1.0' to avoid integer division
SELECT ROUND(SUM(item_count * order_occurrences) * 1.0 / SUM(order_occurrences), 1) AS mean
FROM items_per_order;