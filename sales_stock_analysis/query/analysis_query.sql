/* A. Metrik Penjualan (Sales Metrics)
	1. Total Pendapatan Kotor (Total Gross Revenue)
	   Metrik ini menghitung total uang yang masuk sebelum dikurangi diskon. */
SELECT 
    ROUND(SUM(unit_price * quantity)::numeric, 2) AS total_gross_revenue
FROM order_details;

/*	2. Tren Penjualan Bulanan (Monthly Sales Trend)
	   Penting untuk melihat apakah bisnis sedang tumbuh atau menurun setiap bulannya.*/
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    ROUND(SUM(unit_price * quantity * (1 - discount))::numeric, 2) AS net_revenue
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY 1
ORDER BY 1;

/*	3. Produk Terlaris (Top Selling Products)
	   Mengetahui produk mana yang menyumbang volume penjualan terbesar.*/
SELECT 
    p.product_name,
    SUM(od.quantity) AS total_sold
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 10;

/* B. Metrik Inventaris (Inventory Metrics)
	1. Nilai Stok saat Ini (Inventory Value)
	   Menghitung berapa banyak aset uang yang "terkunci" di gudang.*/
SELECT 
    SUM(unit_price * units_in_stock) AS total_inventory_value
FROM products;

/*	2. Produk yang Perlu Dipesan Ulang (Reorder Alert)
	   Mengidentifikasi stok yang sudah di bawah level aman agar tidak terjadi kekosongan barang (stockout).*/
SELECT 
    product_name,
    units_in_stock,
    reorder_level
FROM products
WHERE units_in_stock <= reorder_level 
  AND discontinued = 0;

/*	3. Rasio Perputaran Inventaris (Inventory Turnover - Estimasi)
	   Melihat seberapa cepat produk keluar dari gudang (semakin tinggi semakin baik).*/
SELECT 
    p.product_name,
    SUM(od.quantity) AS units_sold,
    p.units_in_stock,
    ROUND((SUM(od.quantity)::numeric / NULLIF(p.units_in_stock, 0)), 2) AS turnover_ratio
FROM products p
JOIN order_details od ON p.product_id = od.product_id
WHERE p.units_in_stock > 0
GROUP BY p.product_id, p.product_name, p.units_in_stock
ORDER BY turnover_ratio DESC;