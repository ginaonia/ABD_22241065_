-- NAMA: GINA SONIA
-- NIM	: 22241065
-- UJIAN AKHIR SEMESTER

Use UNDIKMA_Mart;

-- soal 1 limit(Tampilkan 5 produk yang memiliki pendapatan penjualan terbanyak)
SELECT nama_produk, SUM(qty * (harga - (diskon_persen / 100) * harga)) AS revenue
FROM tr_penjualan_dqlab
GROUP BY nama_produk
ORDER BY revenue DESC
LIMIT 5;



-- soal 2 (tampilkan hanya  3 katagori produk, dan total pendapatan(revenue) yang berstatus target achived dengan ketentuan)
-- jika revenue >= 900000 = target achived
-- jika revenue < 900000 = Less Perfomence
-- jika tidak keduanya = follow update
-- pakai case dan join
SELECT p.kategori_produk, SUM(t.qty * (t.harga - t.diskon_persen)) AS revenue,
CASE 
WHEN SUM(t.qty * (t.harga - t.diskon_persen)) >= 900000 THEN 'Target Achieved'
WHEN SUM(t.qty * (t.harga - t.diskon_persen)) < 900000 THEN 'Less Perfomance'
ELSE 'Follow Up'
END AS remark
FROM tr_penjualan_dqlab AS t
JOIN ms_produk_dqlab p ON t.kode_produk = p.kode_produk
GROUP BY p.kategori_produk
HAVING remark = 'Target Achieved'
ORDER BY revenue DESC
LIMIT 3;



-- soal 3 Jika hari ini adalah tanggal 30 Juni 2020, maka berikan informasi 3 nama produk yang paling lama tidak dibeli oleh pelanggan (dalam hari) wajib menggunakan JOIN wajib pake join, fungsi, group by

SELECT mpd.nama_produk, DATEDIFF('2020-06-30', IFNULL(MAX(tp.tgl_transaksi), '2020-06-30')) AS hari_tidak_dibeli
FROM ms_produk_dqlab AS mpd
LEFT JOIN tr_penjualan_dqlab AS tp ON mpd.kode_produk = tp.kode_produk
GROUP BY mpd.nama_produk
ORDER BY hari_tidak_dibeli DESC
LIMIT 3;



