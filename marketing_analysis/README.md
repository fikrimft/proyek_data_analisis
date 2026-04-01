# **Project Summary: Bank Marketing Campaign Analysis**
dataset source : https://archive.ics.uci.edu/dataset/222/bank+marketing

## **1. Objektif Proyek**
		Menganalisis efektivitas kampanye pemasaran telepon bank untuk mengidentifikasi perilaku nasabah, pola musiman, dan faktor-faktor kunci yang mendorong konversi nasabah dalam berlangganan deposito berjangka.
		
## **2. Wawasan Utama (Key Insights)**
		* **Dominasi Saluran Komunikasi (Conversion Rate):**
			Penggunaan telepon seluler (cellular) merupakan metode yang paling dominan digunakan dalam kampanye, mencakup **64,77%** dari total kontak. Sementara itu, penggunaan telepon kabel (telephone) hanya berkontribusi sebesar **6,43%.**
			
		* **Efektivitas Kampanye Ulang (Succession Rate):**
			Nasabah yang memiliki riwayat keberhasilan di kampanye sebelumnya memiliki tingkat konversi "Yes" yang signifikan secara proporsional. Namun, sebagian besar data masih berada pada kategori "unknown", di mana tingkat penolakan ("No") mencapai **84,10%.**
			
		* **Titik Jenuh Komunikasi (Contact Frequency):**
			Terdapat penurunan tajam dalam frekuensi kontak setelah percobaan pertama.
			Upaya kontak pertama mencakup **39,86%** dari aktivitas, namun angka ini terus merosot hingga di bawah **1%** setelah kontak ke-9.
			Hal ini mengindikasikan adanya batas efisiensi dalam menghubungi nasabah secara berulang.
			
		* **Pola Musiman (Seasonality Analysis):**
			Aktivitas kampanye mencapai puncaknya secara drastis pada bulan **Mei**, dengan kontribusi sebesar **30,45%** dari total tahunan.
			Sebaliknya, bulan-bulan seperti Maret **(1,06%)** dan Desember **(0,47%)** menunjukkan aktivitas yang sangat rendah.
			
## **3. Rekomendasi Bisnis**
		* **Optimalisasi Saluran Seluler:**
			Mengingat tingginya penggunaan cellular, bank harus memprioritaskan pengembangan naskah penawaran (scripts) yang dioptimalkan untuk percakapan seluler guna meningkatkan kualitas interaksi.
			
		* **Strategi Retensi Nasabah:**
			Fokuskan sumber daya pada nasabah yang terdaftar sebagai "success" di kampanye sebelumnya (poutcome), karena mereka memiliki kecenderungan lebih tinggi untuk berlangganan kembali.
			
		* **Batas Maksimal Kontak:**
			Tetapkan kebijakan frekuensi kontak maksimal. Berdasarkan data, efektivitas menurun drastis setelah kontak ke-3 atau ke-4.
			Tim pemasaran sebaiknya dialihkan untuk mencari prospek baru daripada menghubungi nasabah yang sama lebih dari 4 kali.
			
		* **Pemerataan Beban Kampanye:**
			Lakukan evaluasi terhadap lonjakan aktivitas di bulan Mei.
			Jika lonjakan tersebut tidak dibarengi dengan peningkatan tingkat konversi yang setara,
			disarankan untuk meratakan distribusi kampanye ke bulan-bulan dengan aktivitas rendah (seperti Maret atau September) guna menjaga konsistensi beban kerja tim dan perhatian nasabah.