# **Northwind Sales & Inventory Analysis Report**
data source : https://github.com/pthom/northwind_psql.git

## **1. Executive Summary
Analisis ini bertujuan untuk mengevaluasi performa penjualan dan efisiensi manajemen inventaris pada database Northwind.
Berdasarkan data yang diolah menggunakan PostgreSQL, bisnis mencatatkan total pendapatan kotor sebesar $1,354,458.59 dengan tren pertumbuhan yang signifikan pada periode akhir 1997 hingga awal 1998.
Namun, terdapat tantangan pada manajemen stok di mana beberapa produk memiliki rasio perputaran yang terlalu tinggi sementara stok menipis.

## **2. Key Metrics Analysis
**A. Sales Performance**
* **Total Revenue:** 
Pendapatan kotor mencapai **$1.35M.**

* **Top Products:** 
Produk kategori keju dan makanan penutup mendominasi pasar,
dengan **Camembert Pierrot** (1,577 unit) dan **Raclette Courdavault** (1,496 unit) sebagai kontributor volume terbesar.

* **Monthly Trend:** 
Terjadi lonjakan pendapatan yang konsisten mulai dari pertengahan 1997.
Puncaknya terlihat pada awal 1998 dengan net revenue bulanan yang stabil di angka tinggi.

**B. Inventory Health
* **Inventory Value:** 
Total nilai aset yang tersimpan di gudang saat ini adalah sebesar **$73,953.35.**

* **Turnover Ratio:** 
Produk seperti **Sir Rodney's Scones** memiliki rasio perputaran sangat ekstrem (**338.67**).
Ini menunjukkan permintaan yang sangat tinggi namun jumlah stok di tangan sangat rendah.

* **Stock Alerts:** 
Terdapat beberapa produk kritis yang stoknya sudah di bawah reorder level,
bahkan ada yang mencapai stok **0** seperti **Gorgonzola Telino.**

## **3. Business Insights**
| **Kategori**         | **Temuan Utama**                                                                                                                                                                                                                 |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **High Demand Risk** | Produk terlaris seperti Gnocchi di nonna Alice dan Sir Rodney's Scones memiliki stok yang sangat tipis. Rasio turnover yang tinggi (>100) menunjukkan risiko kehilangan potensi penjualan (lost sales) karena kekosongan barang. |
| **Revenue Driver**   | Sebagian besar pendapatan didorong oleh produk kategori Dairy Products dan Confections.                                                                                                                                          |
| **Operational Gap**  | Laporan Reorder Alert menunjukkan banyak produk memiliki units_in_stock yang jauh di bawah reorder_level, menandakan adanya keterlambatan dalam proses pengadaan (procurement).                                                  |

## **4. Recommendations**
+ **Manajemen Stok (Inventory Optimization)**
	* **Segera Lakukan Restock:** 
		Prioritaskan pengadaan untuk produk dengan stok 0 (Contoh: Gorgonzola Telino) dan produk dengan turnover di atas 50 guna menghindari stockout.
	  
	* **Evaluasi Reorder Level:**
		Untuk produk seperti Sir Rodney's Scones, naikkan ambang batas reorder level karena tingkat penjualannya jauh lebih cepat daripada kecepatan pengisian stok saat ini.
		
+ **Strategi Penjualan (Sales Strategy)**
	* **Bundling Strategy:**
		Pasangkan produk dengan turnover tinggi (cepat laku) dengan produk yang memiliki turnover rendah namun margin keuntungan tinggi untuk menyeimbangkan arus kas.
		
	* **Loyalty Program:**
		Mengingat tren penjualan yang meningkat, gunakan data ini untuk memberikan promo kepada pelanggan yang melakukan pembelian pada periode puncak agar retensi meningkat.
		
+ **Efisiensi Operasional**
	* **Supplier Review:**
		Periksa kinerja supplier untuk produk-produk di daftar Reorder Alert. Jika stok sering kosong, pertimbangkan untuk mencari supplier alternatif atau menegosiasikan lead time yang lebih cepat.
		
## **Tools Used**
* **Database:** PostgreSQL (Northwind Database)
* **Analysis:** SQL Query (Agregasi, Joins, CTEs)
* **Documentation:** Markdown, Excel(Charts)