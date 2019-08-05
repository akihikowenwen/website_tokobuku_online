-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 05 Agu 2019 pada 06.39
-- Versi Server: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `books_store_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pesanan`
--

CREATE TABLE IF NOT EXISTS `detail_pesanan` (
`id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `pesanan_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id`, `produk_id`, `qty`, `pesanan_id`) VALUES
(7, 2, 40, 32),
(8, 2, 20, 33),
(9, 2, 20, 34),
(10, 3, 20, 35),
(11, 2, 34, 36),
(12, 6, 20, 36),
(13, 3, 20, 36),
(14, 2, 40, 37),
(15, 8, 20, 37),
(16, 3, 20, 37),
(17, 2, 1, 38),
(18, 3, 1, 38),
(19, 6, 1, 38),
(20, 2, 3, 39);

-- --------------------------------------------------------

--
-- Struktur dari tabel `info_pembayaran`
--

CREATE TABLE IF NOT EXISTS `info_pembayaran` (
`id` int(11) NOT NULL,
  `info` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_produk`
--

CREATE TABLE IF NOT EXISTS `kategori_produk` (
`id` int(3) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori_produk`
--

INSERT INTO `kategori_produk` (`id`, `nama`, `deskripsi`) VALUES
(6, 'Beverages', ''),
(7, 'Steak', ''),
(8, 'Drinks', ''),
(9, 'buah', 'sadas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontak`
--

CREATE TABLE IF NOT EXISTS `kontak` (
`id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subjek` varchar(200) NOT NULL,
  `pesan` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kontak`
--

INSERT INTO `kontak` (`id`, `nama`, `email`, `subjek`, `pesan`) VALUES
(11, '', 'mshodiqul@gmail.com', '', ''),
(12, '', 'mshodiqul@gmail.com', '', ''),
(13, '', 'mshodiqul@gmail.com', '', ''),
(14, '', 'mshodiqul@gmail.com', '', ''),
(15, '', 'meryayu@gmail.com', '', ''),
(16, '', 'aku@gmail.com', '', ''),
(17, '', 'aku@gmail.com', '', ''),
(18, '', 'aku@gmail.com', '', ''),
(19, '', 'aku@gmail.com', '', ''),
(20, '', 'aku@gmail.com', '', ''),
(21, '', 'aku@gmail.com', '', ''),
(22, '', 'aku@gmail.com', '', ''),
(23, '', 'admin@gmail.com', '', ''),
(24, '', 'hh@gmail.com', '', ''),
(25, '', 'wiwin@gmail.com', '', ''),
(26, '', 'adit@gmail.com', '', ''),
(27, '', 'wiwi@gmail.com', '', ''),
(28, '', 'admin@gmail.com', '', ''),
(29, '', 'putri@gmail.com', '', ''),
(30, '', 'putri@gmail.com', '', ''),
(31, '', 'putri@gmail.com', '', ''),
(32, '', 'putri@gmail.com', '', ''),
(34, '', 'putri@gmail.com', '', ''),
(35, '', 'arul@gmail.com', '', ''),
(36, '', 'arul@gmail.com', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kota`
--

CREATE TABLE IF NOT EXISTS `kota` (
`id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kota`
--

INSERT INTO `kota` (`id`, `nama`, `ongkir`) VALUES
(2, 'Semarang', 40000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE IF NOT EXISTS `laporan` (
`id_pengeluaran` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `Tanggal_pengeluaran` date NOT NULL,
  `harga` varchar(10) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `laporan`
--

INSERT INTO `laporan` (`id_pengeluaran`, `nama_barang`, `Tanggal_pengeluaran`, `harga`, `jumlah`, `total`) VALUES
(39, 'knnn', '2017-12-01', '555555', 4, 500000),
(40, 'bberas', '2017-12-15', '50000', 4, 50000),
(41, 'padi', '2017-12-02', '20', 3, 60),
(42, 'gas', '2017-12-04', '25000', 5, 125000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE IF NOT EXISTS `pembayaran` (
`id` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `status` enum('pending','verified','','') NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `id_pesanan`, `id_user`, `file`, `total`, `status`, `keterangan`, `created_at`) VALUES
(3, 17, 4, '49eb6a44db57cba8d66b3404fa9f0ad45.jpg', 200000, 'verified', 'Contoh Pembayaran', '0000-00-00 00:00:00'),
(4, 17, 4, '49eb6a44db57cba8d66b3404fa9f0ad46.jpg', 200000, 'verified', 'Pembayaran Ke Dua', '2016-09-30 15:58:35'),
(5, 17, 4, '49eb6a44db57cba8d66b3404fa9f0ad46.jpg', 107500, 'verified', 'Terakhir', '2016-09-30 16:10:33'),
(6, 18, 4, '49eb6a44db57cba8d66b3404fa9f0ad46.jpg', 300000, 'verified', 'Bukti Pembayaran', '2016-09-30 16:16:32'),
(7, 18, 4, '49eb6a44db57cba8d66b3404fa9f0ad44.jpg', 40000, 'verified', 'Pembayaran Terakhir', '2016-09-30 16:24:01'),
(8, 19, 4, '49eb6a44db57cba8d66b3404fa9f0ad4buttons.png', 520000, 'verified', 'Bukti Pembayaran', '2016-09-30 16:34:54'),
(9, 25, 6, '49eb6a44db57cba8d66b3404fa9f0ad4urmain.exe', 740000, 'verified', 'ngaceng', '2017-12-04 09:14:10'),
(10, 27, 14, '49eb6a44db57cba8d66b3404fa9f0ad4gambar4.jpg', 192620, 'verified', 'buku', '2019-08-03 23:02:18'),
(11, 39, 17, '49eb6a44db57cba8d66b3404fa9f0ad4gambar4.jpg', 54000, 'verified', 'wr', '2019-08-05 01:34:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE IF NOT EXISTS `penerbit` (
`id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`id`, `nama`) VALUES
(1, 'elex komputindo'),
(3, 'Gramedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penulis`
--

CREATE TABLE IF NOT EXISTS `penulis` (
`id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penulis`
--

INSERT INTO `penulis` (`id`, `nama`) VALUES
(1, 'ahmad rizal'),
(3, 'guruh a');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE IF NOT EXISTS `pesanan` (
`id` int(5) NOT NULL,
  `tanggal_pesan` datetime NOT NULL,
  `tanggal_digunakan` datetime NOT NULL,
  `user_id` int(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `kota` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `read` enum('0','1') NOT NULL,
  `status` enum('lunas','belum lunas','','') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `tanggal_pesan`, `tanggal_digunakan`, `user_id`, `nama`, `alamat`, `kota`, `ongkir`, `telephone`, `read`, `status`) VALUES
(17, '2016-09-30 08:27:51', '2016-10-04 07:00:00', 4, 'Shodiqul Muzaki', 'karangasem', 'Semarang', 40000, '087717495260', '1', 'lunas'),
(18, '2016-09-30 11:15:02', '2016-10-05 08:02:00', 4, 'Shodiqul Muzaki', 'karangasem', 'Semarang', 40000, '087717495260', '1', 'lunas'),
(19, '2016-09-30 11:34:22', '2016-10-07 07:00:00', 4, 'Shodiqul Muzaki', 'karangasem', 'Semarang', 40000, '087717495260', '1', 'lunas'),
(20, '2016-10-03 04:53:05', '2016-10-11 09:00:00', 5, 'Mery Ayu Nurita', 'Semarang aja', 'Semarang', 40000, '089688899260', '1', 'belum lunas'),
(23, '2017-12-04 03:09:46', '2017-12-12 00:00:00', 6, 'aku', 'jember', 'Semarang', 40000, '12345678', '1', 'belum lunas'),
(24, '2017-12-04 03:10:15', '2017-12-21 18:00:00', 6, 'aku', 'jember', 'Semarang', 40000, '12345678', '1', 'belum lunas'),
(25, '2017-12-04 03:13:18', '2017-12-21 00:00:00', 6, 'aku', 'jember', 'Semarang', 40000, '12345678', '1', 'lunas'),
(26, '2019-07-21 06:48:49', '2019-07-30 00:00:00', 12, 'wiwin', 'bekasi', 'Semarang', 40000, '08977aa', '1', 'belum lunas'),
(32, '2019-08-04 06:44:35', '2019-08-04 00:00:00', 14, 'putri', 'semarang', 'Semarang', 40000, '0899', '1', 'belum lunas'),
(33, '2019-08-04 06:49:06', '0000-00-00 00:00:00', 14, 'putri', 'semarang', 'Semarang', 40000, '0899', '0', 'belum lunas'),
(34, '2019-08-04 06:50:53', '2019-08-04 00:00:00', 14, 'putri', 'semarang', 'Semarang', 40000, '0899', '0', 'belum lunas'),
(35, '2019-08-04 06:54:03', '2019-08-04 00:00:00', 14, 'putri', 'semarang', 'Semarang', 40000, '0899', '1', 'belum lunas'),
(36, '2019-08-04 07:40:43', '2019-08-04 00:00:00', 14, 'putri', 'semarang', 'Semarang', 40000, '0899', '0', 'belum lunas'),
(37, '2019-08-04 08:00:42', '2019-08-04 00:00:00', 14, 'putri', 'semarang', 'Semarang', 40000, '0899', '0', 'belum lunas'),
(38, '2019-08-04 08:07:28', '2019-09-01 00:00:00', 14, 'putri', 'semarang', 'Semarang', 40000, '0899', '0', 'belum lunas'),
(39, '2019-08-05 00:00:00', '0000-00-00 00:00:00', 17, 'arul', 'wates', 'Semarang', 40000, '0897878', '1', 'lunas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
`id` int(4) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(200) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `kategori_produk_id` int(11) NOT NULL,
  `penerbit_id` int(11) NOT NULL,
  `penulis_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `deskripsi`, `gambar`, `jumlah`, `harga`, `kategori_produk_id`, `penerbit_id`, `penulis_id`) VALUES
(2, 'Teh Botol Sosro', 'minuman sehat menyegarkan', '49eb6a44db57cba8d66b3404fa9f0ad4gambar3.jpg', 10, '4000', 8, 1, 3),
(3, 'Fruit Salad Spesial', 'Fruid salad spesial ', '49eb6a44db57cba8d66b3404fa9f0ad4gambar2.jpg', 0, '7500', 6, 1, 3),
(6, 'da', 'af', '49eb6a44db57cba8d66b3404fa9f0ad4gambar3.jpg', 0, '234221', 7, 1, 3),
(7, 'dfs', 'sf', '49eb6a44db57cba8d66b3404fa9f0ad4Main-Banner2.jpg', 0, '231', 9, 3, 3),
(8, 'aku', 'ws', '49eb6a44db57cba8d66b3404fa9f0ad4gambar5.jpg', 0, '1', 6, 3, 3),
(9, 'roti', 'buku', '49eb6a44db57cba8d66b3404fa9f0ad4gambar4.jpg', 0, '30000', 6, 3, 3),
(10, 'buu a', 'a', '49eb6a44db57cba8d66b3404fa9f0ad4gambar4.jpg', 5, '4000', 6, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(75) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` enum('user','admin') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `telephone`, `alamat`, `password`, `status`) VALUES
(1, 'adm', 'admin@gmail.com', '08985432330', 'Semarang Ajah', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 'Jokowi', 'joko@gmail.com', '08985432330', 'jakarta 1', '7d00ff54a263fe80825b9297804a982c', 'user'),
(3, 'Putri Delvia', 'putri@gmail.com', '08985432330', 'semarang selatan', '82682943a05de360abb183236c632bd6', 'user'),
(4, 'Shodiqul Muzaki', 'mshodiqul@gmail.com', '087717495260', 'karangasem', 'a63ae42a413740542ce47bb20a124438', 'user'),
(5, 'Mery Ayu Nurita', 'meryayu@gmail.com', '089688899260', 'Semarang aja', 'a63ae42a413740542ce47bb20a124438', 'user'),
(6, 'aku', 'aku@gmail.com', '12345678', 'jember', '89ccfac87d8d06db06bf3211cb2d69ed', 'user'),
(7, 'yugi', 'jun@gmail.com', '868968608', 'jkjgkjn', '053be7b63330b25d02e3e8161bedea49', 'user'),
(8, 'ahuj', 'ah@gmail.com', '868', 'jugo', 'e17098bbcf632e2a1384d0812979587f', 'user'),
(9, 'user', 'user@gmail.com', '99878', 'hjsdjsd', 'b5b73fae0d87d8b4e2573105f8fbe7bc', 'user'),
(10, 'wiwin', 'wiwin@gmail.com', '9879', 'hkl', '79184e2a48c0249556006353a0c65f55', 'user'),
(11, 'adit', 'adit@gmail.com', '9869', 'khsdjka', '357344787fa3d91429f000604af9667f', 'user'),
(12, 'wiwin', 'wiwi@gmail.com', '08977aa', 'bekasi', '9be95ca0921a739fd37db6f39a0cdea5', 'user'),
(13, 'putri', 'admin@gmail.com', '089', 'semarang', '4093fed663717c843bea100d17fb67c8', 'user'),
(14, 'putri', 'putri@gmail.com', '0899', 'semarang', '4093fed663717c843bea100d17fb67c8', 'user'),
(15, 'df', 'putri@gmail.com', 'sdf', 'dfs', '4093fed663717c843bea100d17fb67c8', 'user'),
(16, 'df', 'df@gmail.com', '0898', 'semarang', '50f2194377ef22be5018b6ee76898d4d', 'user'),
(17, 'arul', 'arul@gmail.com', '0897878', 'wates', 'be3025c4341e340ee641e89779ca2649', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
 ADD PRIMARY KEY (`id`,`produk_id`,`pesanan_id`), ADD KEY `pesanan_id` (`pesanan_id`), ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `info_pembayaran`
--
ALTER TABLE `info_pembayaran`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_produk`
--
ALTER TABLE `kategori_produk`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kontak`
--
ALTER TABLE `kontak`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
 ADD PRIMARY KEY (`id_pengeluaran`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penulis`
--
ALTER TABLE `penulis`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
 ADD PRIMARY KEY (`id`,`user_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
 ADD PRIMARY KEY (`id`,`kategori_produk_id`), ADD KEY `kategori_produk_id` (`kategori_produk_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `info_pembayaran`
--
ALTER TABLE `info_pembayaran`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kategori_produk`
--
ALTER TABLE `kategori_produk`
MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `kontak`
--
ALTER TABLE `kontak`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
MODIFY `id_pengeluaran` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `penerbit`
--
ALTER TABLE `penerbit`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `penulis`
--
ALTER TABLE `penulis`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
ADD CONSTRAINT `detail_pesanan_ibfk_2` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `detail_pesanan_ibfk_3` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_produk_id`) REFERENCES `kategori_produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
