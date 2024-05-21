-- Nama : Gina Sonia
-- Nim : 22241065
-- MOdul : 2

-- Menggunakan Database
use UNDIKMA_Mart;
-- NILAI LITERAL ANGKA
SELECT 77;
SELECT 77 as angka;

-- Menampilkan beberapa nilai literal dengan tipe data berbeda 
SELECT 77 as angka,
true as nilai_logika,
'UNDIKMA' as teks;

-- Null
SELECT NULL as kosong;

-- OPERASI MATEMATIKA
-- KALKULASI EKSPRESI MATEMATIKA
SELECT 5%2 as Sisa_bagi,
5/2 as Hasil_bagi_1,
5 DIV 2 as HAsil_bagi_2;

-- Latihan Mandiri 1
SELECT 4*2 as Hasil_kali,
(4*8)%7 as Sisa_bagi,
(4*8)MOD 7 Sisa_bagi_2; 

-- Menampilkan total belanja
SELECT qty*harga AS Total_belanja FROM tr_penjualan_dqlab; 

--  Operator perbandinagan
-- Melakukan operator perbandingan 
SELECT 5=5, 5<>5, 5<>4, 5!=4, 5>4;


-- Latihan Mandiri 2
SELECT 1=1, 1>1, 5>=5, 5.2=5.20000, NULL= 1, NULL=NULL;

-- FUNGSI
SELECT pow (3,2),
round (3.14), round(3.54),
round(3.155,1), round(3.155,2),
floor(4.28), floor(4.78),
ceiling(4.39), ceiling(4.5);

SELECT  now(), year(now()),
datediff(now(), '2002-07-04'), day('2002-07-04');

-- Latihan Mandiri 3
SELECT datediff('2022-07-23', NOW()),
year ('2022-07-23'),
month ('2022-07-23'),
day ('2022-07-23'),
year (NOW());
 
 -- Berapa selisih transaksi dengan hari ini didalam tr_penjualan_dqlab
 SELECT datediff(now(), tgl_transaksi) FROM tr_penjualan_dqlab;
 
 -- filtering with where
 SELECT nama_produk,qty FROM tr_penjualan_dqlab where qty > 3;

