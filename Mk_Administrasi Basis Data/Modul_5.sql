-- NAMA	: GINA SONIA
-- NIM	: 22241065
-- MODUL : 5

use UNDIKMA_Mart;

-- JOIN 
-- Tampilkan nama pelanggan beserta qty belanja
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty 
FROM ms_pelanggan_dqlab AS mp JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan;

-- JOIN TANPA FILTER = CROSS JOIN
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty 
FROM ms_pelanggan_dqlab AS mp JOIN tr_penjualan_dqlab AS tp
ON true;

-- INNER JOIN
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty 
FROM ms_pelanggan_dqlab AS mp INNER JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan;

-- LEFT OUTER JOIN
SELECT tp. kode_pelanggan, mp.nama_pelanggan, tp.qty 
FROM tr_penjualan_dqlab AS tp 
LEFT OUTER JOIN  ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- RIGHT OUTER JOIN
SELECT tp. kode_pelanggan, mp.nama_pelanggan, tp.qty 
FROM tr_penjualan_dqlab AS tp 
RIGHT OUTER JOIN  ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- LEFT OUTER JOIN 3 TABEL
-- Tampilakan nama pelanggan, kategori prodak yang dibeli, nama produk yang dibeli qty belanjanya
SELECT mp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM tr_penjualan_dqlab AS tp 
LEFT OUTER JOIN ms_pelanggan_dqlab AS mp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk;

-- ORDER BY DAN JOIN
-- tampilkan kategori produk, nama produk, dan jumlah qty yang dikelompokkan berdasarkan kataegori dan nam produk
SELECT mp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM tr_penjualan_dqlab AS tp 
LEFT OUTER JOIN ms_pelanggan_dqlab AS mp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk
ORDER BY qty DESC;

-- GROUPING dan FUNGSI AGREGASI BY pada JOIN
-- Tampilkan kategori produk, nama produk, dan jumlah qty yang di kelompokkan berdasarkan kategori  dan nama produk
SELECT mpd.kategori_produk, mpd.nama_produk, sum(tp.qty) AS jumlah_qty_terjual
FROM ms_produk_dqlab AS mpd
LEFT OUTER JOIN tr_penjualan_dqlab AS tp
ON mpd.kode_produk = tp.kode_produk
GROUP BY mpd.kategori_produk, mpd.nama_produk
HAVING sum(tp.qty) IS NULL
ORDER BY sum(tp.qty);

-- LATIHAN MANDIRI
-- Buatlah join untuk ketiga table yang terdapat pada dqlabmartbasic dengan INNER JOIN.
SELECT mp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM tr_penjualan_dqlab AS tp 
INNER JOIN ms_pelanggan_dqlab AS mp
ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN ms_produk_dqlab AS mpd
ON mpd.kode_produk = tp.kode_produk;

-- Buatlah join untuk ketiga table dengan urutan ms_pelanggan, tr_penjualan dan ms_produk yang terdapat pada dqlabmartbasic dengan LEFT JOIN, kemudian filter untuk qty yang tidak bernilai NULL dengan operator IS NOT NULL.
SELECT tp.kode_pelanggan, mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM ms_pelanggan_dqlab AS mp 
LEFT JOIN tr_penjualan_dqlab AS tp 
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT JOIN ms_produk_dqlab AS mpd 
ON tp.kode_produk = mpd.kode_produk
WHERE tp.qty IS NOT NULL;

-- Buatlah join untuk ketiga table dengan urutan ms_pelanggan, tr_penjualan dan ms_produk yang terdapat pada dqlabmartbasic dengan INNER JOIN, kemudian tampilkan grouping untuk kolom kategori produk dan penjumlahan qty.
SELECT mpd.kategori_produk, SUM(tp.qty) AS total_qty
FROM ms_pelanggan_dqlab AS mp
INNER JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN ms_produk_dqlab AS mpd
ON tp.kode_produk = mpd.kode_produk
GROUP BY mpd.kategori_produk
ORDER BY total_qty DESC;

-- Cobalah lakukan JOIN ms_produk dengan table ms_produk juga dengan kolom relationship kode_produk (benar, Anda tidak salah baca) - ini kita lakukan join dengan table sendiri yang memang bisa dilakukan, jangan lupa untuk menggunakan alias.
SELECT mp1.kode_produk AS kode_produk_1, mp1.nama_produk AS nama_produk_1, 
    mp2.kode_produk AS kode_produk_2, mp2.nama_produk AS nama_produk_2, mp1.kategori_produk
FROM ms_produk_dqlab AS mp1
JOIN ms_produk_dqlab AS mp2
ON mp1.kategori_produk = mp2.kategori_produk
AND mp1.kode_produk != mp2.kode_produk;






