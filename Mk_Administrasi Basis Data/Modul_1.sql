-- Nama: Gina Sonia
-- Nim: 22241065
-- Modul_1

-- Menggunakan database undikma_mart
use UNDIKMA_Mart;
-- Mengambil data nama_produk dari tabel ms_produk_dqlab
SELECT nama_produk FROM ms_produk_dqlab;
-- Mengambil Lebih dari satu kolom
SELECT nama_produk, harga FROM ms_produk_dqlab;
-- Mengambil seluruh kolom tabel
SELECT * FROM ms_produk_dqlab;


-- LATIHAN 
-- 1. Mengambil kolom kode_produk, nama_produk, dari tabel ms_produk
SELECT kode_produk, nama_produk FROM ms_produk_dqlab;

-- 2. Mengambil seluruh Kolom  dari tabel tr_penjualan
SELECT * FROM tr_penjualan_dqlab;

-- ALIAS & FREFIX
-- Contoh prefix
SELECT ms_produk_dqlab.nama_produk FROM ms_produk_dqlab;
-- contoh ALIAS dalam kolom
SELECT nama_produk as np FROM ms_produk_dqlab;
SELECT nama_produk np FROM ms_produk_dqlab;

-- contoh alias didalam tabel
SELECT nama_produk FROM ms_produk_dqlab as mpl;

-- contoh penggunaan ALIAS di PREFIX
SELECT mpl.nama_produk FROM ms_produk_dqlab as mpl;

-- case_1
SELECT nama_pelanggan, alamat FROM ms_pelanggan_dqlab;
-- case_2
SELECT nama_produk, harga FROM ms_produk_dqlab;

