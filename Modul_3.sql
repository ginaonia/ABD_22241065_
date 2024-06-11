-- NAMA	: GINA SONIA
-- NIM	: 22241065
-- MODUL3
-- menggunakan database
use UNDIKMA_Mart;
-- ORDER BY
-- Mengambil kolom nama produk dan qty dari penjualan urutkan berdasarkan qyt
SELECT nama_produk, qty FROM tr_penjualan_dqlab
order by qty;
-- Mengambil kolom nama produk dan qty dari penjualan urutkan berdasarkan qyt dan nama produk
SELECT nama_produk, qty FROM tr_penjualan_dqlab
order by qty, nama_produk;

-- Latihan Mandiri 1
SELECT * FROM tr_penjualan_dqlab ORDER BY qty, tgl_transaksi;
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan;
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat;

-- Mengambil kolom nama produk dan qty dari penjualan urutkan berdasarkan qyt dari besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan_dqlab
order by qty DESC, nama_produk DESC;

-- Latihan Mandiri 2
SELECT * FROM tr_penjualan_dqlab ORDER BY tgl_transaksi DESC, qty DESC;
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan DESC;
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat DESC;

-- mengambil nama produk, qty, harga, dan total bayar urutkan berdasarkan total bayar besar ke kecil
SELECT nama_produk, qty, harga, qty*harga AS total_bayar FROM tr_penjualan_dqlab ORDER BY qty*harga DESC;

-- Latihan Mandiri 3
SELECT nama_produk, qty, harga,
diskon_persen, (diskon_persen/100)*harga AS diskon,
qty*(harga-(diskon_persen/100)*harga) AS total_bayar
FROM tr_penjualan_dqlab
ORDER BY total_bayar DESC, diskon DESC;

-- Latihan Mandiri 4
SELECT * FROM tr_penjualan_dqlab WHERE diskon_persen > 0 ORDER BY harga DESC;
SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab WHERE harga >= 100000 ORDER BY harga DESC;
SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab WHERE harga >= 100000 OR 
nama_produk like't%' ORDER BY diskon_persen DESC;

-- FUNGSI AGREGASI
-- Hitung total qty dari tabel penjualan
SELECT sum(qty) FROM tr_penjualan_dqlab;

-- Hitung seluruh row dari tabel penjualan
SELECT count(*) FROM tr_penjualan_dqlab;

-- Menghitung jumlah qty dan jumlah row dari tabel penjualan
SELECT sum(qty) as Total_Qty, count(*) as total_row FROM tr_penjualan_dqlab;

-- Hitung rata-rata, nilai maksimum dan nilai minimum dari qty tabel penjualan
SELECT avg(qty), max(qty), min(qty) FROM tr_penjualan_dqlab;

-- Hitung jumlah nama unik dari nama produk dari tabel penjualan
SELECT count(distinct nama_produk) FROM tr_penjualan_dqlab;

-- Menampilkan seluruh row dan jumlah unik dari nama produk di tabel penjualan
SELECT count(*), count(distinct nama_produk) FROM tr_penjualan_dqlab;
-- SELECT count(*), count(distinct nama_produk), nama_produk FROM tr_penjualan_dqlab;

-- GROUP BY
-- Kelompokkan nilai dari nama prodk dari tabel penjualan
SELECT nama_produk FROM tr_penjualan_dqlab GROUP BY nama_produk;

-- Kelompokkan nilai dari nama produk dan qty di tabel penjualan
SELECT nama_produk, qty FROM tr_penjualan_dqlab GROUP BY nama_produk, qty;

-- GROUP BY + FUNGSI AGREGASI
-- Ambil jumlah qty dari hasil pengelompokan nama produk di tabel penjualan
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk;
-- Ambil jumlah qty dari hasil pengelompokan nama produk di tabel penjualan urutkan besar ke kecil
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk ORDER BY sum(qty);

-- HAVING
-- Mengambil jumlah qty > 2 dari hasil pengelompokan nama produk
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk
 HAVING sum(qty) > 2;
 -- Mengambil jumlah qty > 2 dari hasil pengelompokan nama produk
SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk
 HAVING sum(qty) > 2 ORDER BY sum(qty) DESC;
 
-- LATIHAN MANDIRI5
 SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk HAVING sum(qty) > 4;
 SELECT nama_produk, sum(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk HAVING sum(qty) = 9;
 SELECT nama_produk, sum(qty*(harga-(diskon_persen/100)*harga)) AS total_bayar
 FROM tr_penjualan_dqlab GROUP BY nama_produk ORDER BY total_bayar DESC;
 