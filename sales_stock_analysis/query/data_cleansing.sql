-- Cek apakah ada harga atau stok yang tidak valid (<= 0)
SELECT * FROM products 
WHERE unit_price <= 0 OR units_in_stock < 0;

-- Query untuk standarisasi nama produk dalam laporan
SELECT 
    product_id, 
    INITCAP(TRIM(product_name)) AS clean_product_name,
    unit_price
FROM products;

-- Cek variasi nama negara untuk melihat inkonsistensi
SELECT DISTINCT country FROM customers ORDER BY 1;

SELECT 
    customer_id,
    company_name,
    CASE 
        WHEN country IN ('USA', 'US', 'United States') THEN 'USA'
        WHEN country = 'UK' THEN 'United Kingdom'
        ELSE country 
    END AS standardized_country
FROM customers;

-- Cek anomali umur karyawan (misal: masuk kerja sebelum lahir)
SELECT employee_id, first_name, last_name, birth_date, hire_date
FROM employees
WHERE hire_date <= birth_date;

-- Menghitung usia saat ini secara bersih
SELECT 
    first_name || ' ' || last_name AS full_name,
    EXTRACT(YEAR FROM AGE(birth_date)) AS current_age
FROM employees;

-- Cek duplikasi nama perusahaan pengiriman
SELECT company_name, COUNT(*)
FROM shippers
GROUP BY company_name
HAVING COUNT(*) > 1;

-- Menghitung durasi pengiriman hanya untuk data yang valid
SELECT 
    order_id,
    order_date,
    shipped_date,
    (shipped_date - order_date) AS days_to_ship
FROM orders
WHERE shipped_date IS NOT NULL 
  AND shipped_date >= order_date; -- Menghindari durasi negatif