# **RFM ANALYSIS**

## analisis perilaku customer RFM (Retention, Frequency, Monetary) menggunakan python.

I. INTRO
	1. dataset	: UCI (online Retail Dataset) https://archive.ics.uci.edu/dataset/352/online+retail
	2. tools	: Google Colab (pandas, Numpy, Seaborn)
	
II. FRAMEWORK
	1. menghubungkan dataset langsung dari repo ke colab menggunakan teknik data ingestion.
	2. Mengintegrasikan colab ke Gdrive agar dataset yang telah dianalisa siap untuk dibuat dashboard.
	3. Membarsihkan data, diantaranya : menghapus baris tanpa customerID, mengubah nilai quantity yang negatif menjadi positif, menghapus baris dengan price bernilai negatif, dll.
	4. Menambah kolom baru, diantaranya : status order, year month, nilai amount (antara quantity x price).
	5. Membuat user retention cohort:
		a. Agregat data transaksi ke bentuk summary total transaksi/order setiap pengguna setiap bulan.
		b. Buat kolom sebagai cohort dari pengguna, misal cohort bulan pertama kali bertransaksi.
		c. Hitung jarak bulan antara bulan transaksi dengan bulan pertama kali transaksi dan jumlahkan dengan 1 agar jarak bulan 0 menjadi 1 yang berarti bulan pertama, dst.
		d. Tabel pivot dengan index berupa cohort, kolom berupa jarak bulan, dan nilainya adalah banyaknya pengguna unik (count unique dari ID pengguna).
		e. Hitung banyaknya pengguna di masing-masing cohort (pengguna yang pertama kali transaksi di bulan tersebut) dan bagi semua nilai di tabel pivot tadi dengan nilai tersebut sebagai retention rate.


III. INSIGHT & BUSSINESS RECOMENDATION
1. Wawasan Bisnis (Insights)
	* Analisis ini menggunakan data transaksi ritel online untuk mengelompokkan pelanggan berdasarkan perilaku belanja mereka:
	* Pembersihan Data: Analis telah melakukan pembersihan data yang signifikan, termasuk menangani nilai kosong pada CustomerID, menghapus transaksi tanpa deskripsi, serta mengonversi nilai kuantitas negatif (retur) menjadi nilai absolut untuk perhitungan volume transaksi.
	* Identifikasi Outlier: Sebanyak 32.138 baris outlier telah dihapus dari kolom Amount menggunakan metode Z-score untuk memastikan hasil segmentasi tidak terdistorsi oleh transaksi tunggal yang sangat besar.

Metrik RFM:
	* Recency: Mengukur kapan terakhir kali pelanggan bertransaksi.
	* Frequency: Mengukur seberapa sering pelanggan berbelanja dalam periode tertentu.
	* Monetary: Mengukur total nilai uang yang dihabiskan oleh pelanggan.

2. Rekomendasi Strategis Berdasarkan Segmen
Walaupun label segmen spesifik (seperti 'Champions' atau 'At Risk') biasanya muncul di bagian akhir visualisasi notebook, berikut adalah rekomendasi umum berdasarkan metodologi yang digunakan:

	A.	Segmen Loyalitas Tinggi (High RFM Score)
		Karakteristik: Pelanggan yang baru saja berbelanja, sangat sering, dan dengan nilai transaksi besar.
		Rekomendasi:
		* Berikan program loyalitas eksklusif atau akses awal ke produk baru.
		* Tawarkan program referral untuk menarik pelanggan baru melalui mereka.

	B.	Segmen Pelanggan Potensial (High Recency, Moderate Frequency)
		Karakteristik: Pelanggan baru yang mulai menunjukkan tanda-tanda berbelanja rutin.
		Rekomendasi:

		* Gunakan strategi up-selling atau cross-selling berdasarkan riwayat produk yang mereka beli.
		* Kirimkan survei kepuasan untuk membangun keterikatan emosional sejak dini.

	C.	Segmen "At Risk" (Low Recency, High Frequency/Monetary)
		Karakteristik: Pelanggan yang dulunya sering belanja besar, namun sudah lama tidak kembali.
		Rekomendasi:
		* Luncurkan kampanye win-back dengan diskon khusus atau penawaran "Kami merindukan Anda".
		* Identifikasi apakah ada masalah layanan yang membuat mereka berhenti berbelanja.

	D.	Segmen "Lost" (Low RFM Score)
		Karakteristik: Pelanggan yang jarang berbelanja, nilainya kecil, dan sudah sangat lama tidak bertransaksi.
		Rekomendasi:
		* Gunakan strategi pemasaran berbiaya rendah (seperti email otomatis).
		* Jangan habiskan anggaran pemasaran besar pada segmen ini; fokuskan sumber daya pada segmen yang lebih menguntungkan.

3. Optimasi Operasional
Analisis Geografis: Data menunjukkan transaksi berasal dari berbagai negara (seperti United Kingdom). Disarankan untuk menyesuaikan stok dan kampanye pemasaran berdasarkan preferensi regional yang dominan.
Pemantauan Tren Bulanan: Dengan kolom year_month yang telah dibuat, bisnis harus memantau pertumbuhan bulanan untuk mendeteksi musiman (seasonality) dalam perilaku belanja.