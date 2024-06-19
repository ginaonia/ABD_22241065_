-- NAMA: GINA SONIA
-- NIM	: 22241065
-- Tugas Baru

use UNDIKMA_Mart;
-- case1
-- mencari list nama customer dari database, berupa nama customer nya serta alamat nya
SELECT nama_pelanggan, alamat FROM ms_pelanggan_dqlab;

-- case2
-- melihat nama produk dan harga dari setiap produk
SELECT nama_produk, harga FROM ms_produk_dqlab;

-- case3
--  munculkan semua data dari ms produk dengan Flashdisk DQLab 32 GB dengan harga diatas dari 15000
SELECT * FROM ms_produk_dqlab WHERE nama_produk = 'Flashdisk DQLab 32 GB' AND harga > 15000;

-- case4 
-- melihat dari database yang ada terdapat 3 produk dengan profit tertinggi yaitu : Flashdisk DQLab 84 GB, Tas Travel Organizer DigiSkills.id, Gantungan Kunci DQLab. 
-- Munculkanlah semua data mengenai ketiga produk tersebut dari database produk
SELECT *
FROM ms_produk_dqlab
WHERE nama_produk 
IN ('Flashdisk DQLab 84 GB', 'Tas Travel Organizer DigiSkills.id', 'Gantungan Kunci DQLab');
-- case5
--  melihat semua list produk yang memiliki harga dibawah 50000, munculkan lah semua produk yang berada dibawah harga 50000
SELECT * FROM ms_produk_dqlab 
WHERE harga <=50000 ORDER BY harga DESC;

-- case6
-- Munculkanlah kode pelanggan, nama produk, kuantitynya, harga dan total harga dari semua produk yang pernah ditransaksikan, namun output yang diminta adalah total harga minimal 200.000 dan diurutkan berdasarkan dengan total harganya.
SELECT kode_pelanggan, nama_produk, qty,  (qty * harga) AS total_harga 
FROM tr_penjualan_dqlab
WHERE (qty * harga) >= 200000 ORDER BY total_harga DESC; 

-- case7
-- Munculkanlah kode_pelanggan, dan jumlah quantity produk yang dibeli, dan jumlah harganya, lalu coba cari sisa dari kuantity tersebut jika dibagi dengan 3 karena pihak marketing ingin melakukan plotting 1 marketing 1 pelanggan dengan 3 quantity maksimum, sehingga bisa termonitor sisa quantity produk yang tidak adan termonitor dari semua produk sebagai kolom sisa_quantity sebagai bahan Analisa lanjutan.
SELECT kode_pelanggan, 
SUM(qty) AS total_qty, 
SUM(qty * harga) AS total_harga, 
SUM(qty) % 3 AS sisa_qty
FROM tr_penjualan_dqlab
GROUP BY kode_pelanggan;

-- case8
-- Munculkanlah kode transaksi, tanggal transaksi, nomor urut, dan kode produk yang digabung dengan nama produk dengan kuantity sama dengan 5 dari database yang ada
SELECT kode_transaksi, tgl_transaksi, no_urut, kode_produk,nama_produk,
CONCAT(kode_produk, ' - ', nama_produk) AS kode_produk_namaproduk
FROM tr_penjualan_dqlab
WHERE qty = 5;

-- case9
-- memunculkan nama pelanggan tanpa gelar dengan kode pelanggan  dqlabcust01
SELECT nama_pelanggan,
TRIM(REPLACE(nama_pelanggan, ', S.H', '')) AS nama_tanpa_gelar, 
SUBSTRING_INDEX(nama_pelanggan, ' ', 1) AS nama_panggilan
FROM ms_pelanggan_dqlab
WHERE kode_pelanggan = 'dqlabcust01';
    
-- case10
-- Munculkan lah nama pelanggan, dan initial pelanggan dengan initial pelanggan ialah dimulai dari huruf kedua dan yang diambil adalah 3 huruf pertama dari huruf kedua
SELECT nama_pelanggan, 
SUBSTR(nama_pelanggan, 2, 3) AS initial
FROM ms_pelanggan_dqlab;

-- case11
-- Munculkan lah nama pelanggan, dan initial pelanggan dengan initial pelanggan ialah dimulai dari huruf kedua dan yang diambil adalah 3 huruf pertama dari huruf kedua, lalu munculkanlah Panjang kata dari nama pelanggan tersebut
SELECT nama_pelanggan, 
SUBSTR(nama_pelanggan, 2, 3) AS initial,
LENGTH(nama_pelanggan) AS total_char
FROM ms_pelanggan_dqlab;

-- case12
-- Munculkan lah nama pelanggan, dan initial pelanggan dengan initial pelanggan ialah dimulai dari huruf kedua dan yang diambil adalah 3 huruf pertama dari huruf kedua, lalu munculkanlah Panjang kata dari nama pelanggan tersebut, lalu ubahlah ‘Pelanggan Non Member’ menjadi ‘Not member’
SELECT nama_pelanggan, 
SUBSTR(nama_pelanggan, 2, 3) AS initial,
LENGTH(nama_pelanggan) AS total_char, CASE 
WHEN nama_pelanggan = 'Pelanggan Non Member' THEN 'Not member' 
ELSE nama_pelanggan
END AS new_revisi_pelanggan
FROM ms_pelanggan_dqlab;

-- case13
-- Munculkan lah nama pelanggan, dan initial pelanggan dengan initial pelanggan 
SELECT nama_pelanggan, 
SUBSTR(nama_pelanggan, 2, 3) AS initial,
LENGTH(nama_pelanggan) AS total_char,CASE 
WHEN nama_pelanggan = 'Pelanggan Non Member' THEN 'Not member' 
ELSE nama_pelanggan
END AS new_revisi_pelanggan,
UPPER(nama_pelanggan) AS UPPER_NAMA_PELANGGAN, 
LOWER(nama_pelanggan) AS lower_nama_pelanggan
FROM ms_pelanggan_dqlab;

-- case14
-- Munculkanlah nama pelanggan dengan total order yang dilakukan beserta jumlah quantity yang dilakukan dan revenue berdasarkan kode pelanggan tersebut
SELECT p.kode_pelanggan,
    COUNT(DISTINCT t.kode_transaksi) AS total_order,
    SUM(t.qty) AS jumlah_kuantitas,
    SUM(t.harga * t.qty) AS revenue
FROM ms_pelanggan_dqlab p
JOIN tr_penjualan_dqlab t 
ON p.kode_pelanggan = t.kode_pelanggan
GROUP BY p.kode_pelanggan, p.nama_pelanggan;
    
    -- case15
    -- Munculkanlah kode pelanggan, total order dari data, sum(qty) dan remark berdasarkan quantity dengan harga dimana jika :
SELECT kode_pelanggan,
COUNT(kode_transaksi) AS total_order,
SUM(qty) AS total_quantity,
SUM(harga * qty) AS revenue,CASE 
WHEN SUM(harga * qty) >= 900000 THEN 'Target Achieved'
WHEN SUM(harga * qty) <= 850000 THEN 'Less performed'
ELSE 'Follow Up'
END AS remark
FROM tr_penjualan_dqlab
GROUP BY kode_pelanggan;

-- case16
-- Munculkanlah kode transaksi, kode pelanggan, kode produk, nama produk, harga, qty dan total lalu urutkan berdasarkan harga dari terbesar ke terkecil
SELECT kode_transaksi,kode_pelanggan,kode_produk,nama_produk,harga,qty,(qty*harga) 
AS total
FROM tr_penjualan_dqlab
ORDER BY harga DESC;

-- case17
-- Munculkanlah data-data 
SELECT nama_produk,no_urut
FROM tr_penjualan_dqlab;

-- case18
-- Munculkanlah data data dengan union
SELECT nama_produk,no_urut
FROM ms_produk_dqlab
UNION
SELECT nama_produk, no_urut
FROM tr_penjualan_dqlab;

-- case19 
-- Munculkanlah kode pelanggan, nama pelanggan, alamat dan nama produk Ketika nama produk 
SELECT p.kode_pelanggan,p.nama_pelanggan,p.alamat,pr.nama_produk
FROM ms_pelanggan_dqlab p
JOIN tr_penjualan_dqlab t
 ON p.kode_pelanggan = t.kode_pelanggan
JOIN ms_produk_dqlab pr ON t.kode_produk = pr.kode_produk
WHERE pr.nama_produk IN ('Kotak Pensil DQLab', 'Flashdisk DQLab 32 GB', 'Sticky Notes DQLab 500 sheets');
    
    -- case20 
    -- Munculkan lah nama produk, tanggal transaksi nya, dan selisih hari dari tanggal tersebut
SELECT nama_produk, tgl_transaksi,
DATEDIFF(NOW(), tgl_transaksi) AS days_aging
FROM tr_penjualan_dqlab;

-- case21 
-- Munculkanlah nama produk, tgl transaksi, month date, year date, selisih hari dari transaksi atas semua produk yanga ada di historical database penjuala 
SELECT nama_produk,tgl_transaksi,
    DAY(tgl_transaksi) AS day_date,
    MONTH(tgl_transaksi) AS month_date,
    YEAR(tgl_transaksi) AS year_date,
    DATEDIFF(CURDATE(), tgl_transaksi) AS selisih_hari
FROM tr_penjualan_dqlab;
    
    -- case22
    SELECT nama_produk,tgl_transaksi,
    DATE_FORMAT(tgl_transaksi, '%M') AS month_date,
    YEAR(tgl_transaksi) AS year_date,
    DAY(tgl_transaksi) AS day_date,
    DATEDIFF(CURDATE(), tgl_transaksi) AS days_aging
FROM tr_penjualan_dqlab;

-- case23
SELECT nama_produk,tgl_transaksi,
    MONTH(tgl_transaksi) AS month_date,
    YEAR(tgl_transaksi) AS year_date,
    DAY(tgl_transaksi) AS day_date,
    PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM CURDATE()), EXTRACT(YEAR_MONTH FROM tgl_transaksi)) AS month_aging,
    DATEDIFF(CURDATE(), tgl_transaksi) AS days_aging
FROM tr_penjualan_dqlab;












  
