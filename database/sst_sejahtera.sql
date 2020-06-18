-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jun 2020 pada 17.34
-- Versi server: 10.1.32-MariaDB
-- Versi PHP: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sst_sejahtera`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `no` int(11) NOT NULL,
  `id` varchar(50) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `merk` varchar(255) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `satuan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`no`, `id`, `nama_barang`, `merk`, `jenis`, `stok`, `satuan`) VALUES
(1, 'BS001', 'Beras', 'Mikky', 'Super', 9, 'kg'),
(0, 'MK001', 'Minyak Kelapa', 'Fitri', 'Curah', 5, 'liter');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `no` int(11) NOT NULL,
  `id` varchar(50) NOT NULL,
  `tanggal_keluar` datetime NOT NULL,
  `id_pegawai` varchar(50) NOT NULL,
  `id_barang` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_jual` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang_keluar`
--

INSERT INTO `barang_keluar` (`no`, `id`, `tanggal_keluar`, `id_pegawai`, `id_barang`, `jumlah`, `harga_jual`) VALUES
(1, '001BK', '2020-06-18 11:00:00', 'PGW01', 'BS001', 1, '14000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `no` int(11) NOT NULL,
  `id` varchar(50) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `id_supplier` varchar(50) NOT NULL,
  `id_barang` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_beli` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang_masuk`
--

INSERT INTO `barang_masuk` (`no`, `id`, `tanggal_masuk`, `id_supplier`, `id_barang`, `jumlah`, `harga_beli`) VALUES
(1, '001BM', '2020-06-17', 'SPL02', 'BS001', 30, '11500');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_captcha`
--

CREATE TABLE `cms_captcha` (
  `captcha_id` bigint(13) NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `cms_captcha`
--

INSERT INTO `cms_captcha` (`captcha_id`, `captcha_time`, `ip_address`, `word`) VALUES
(3298, 1592493496, '::1', '653655'),
(3297, 1592493382, '::1', '179362'),
(3295, 1592492263, '::1', '936456'),
(3296, 1592492275, '::1', '252816');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_log`
--

CREATE TABLE `cms_log` (
  `id_log` int(30) NOT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `mac_address` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `kegiatan` text,
  `user` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `cms_log`
--

INSERT INTO `cms_log` (`id_log`, `ip`, `mac_address`, `time`, `kegiatan`, `user`) VALUES
(1, '::1', '', '2019-01-30 20:39:29', 'Login  by Jihan Ali Ahmad', 'superadmin'),
(2, '::1', '', '2019-11-05 17:45:51', 'Login  by Jihan Ali Ahmad', 'superadmin'),
(3, '::1', '', '2019-11-05 17:47:27', 'Menambah Purchasing Invoice dengan data sbb:<br />\r\n                    <ul><li><b>no_pi</b> dengan value <b>001/kalingga/11/2019</b></li><li><b>id_buyer</b> dengan value <b>1</b></li><li><b>tgl</b> dengan value <b>2019-11-05</b></li><li><b>tgl_pengiriman</b> dengan value <b>2020-02-01</b></li><li><b>fsc_cert</b> dengan value <b>34124</b></li><li><b>fsc_lisence</b> dengan value <b>524554</b></li><li><b>buyer_po_nr</b> dengan value <b>778</b></li><li><b>pembayaran</b> dengan value <b>2</b></li><li><b>id</b> dengan value <b>1</b></li></ul>', 'superadmin'),
(4, '::1', '', '2020-03-10 17:15:13', 'Login  by Jihan Ali Ahmad', 'superadmin'),
(5, '::1', '', '2020-03-12 09:55:56', 'Menambah menu dengan data sbb:<br />\r\n                    <ul><li><b>nama</b> dengan value <b>Instansi</b></li><li><b>deskripsi</b> dengan value <b>-</b></li><li><b>alias</b> dengan value <b>instansi</b></li><li><b>allowed_level</b> dengan value <b>1,2</b></li><li><b>url</b> dengan value <b>master/instansi</b></li><li><b>aktif</b> dengan value <b>1</b></li><li><b>urutan</b> dengan value <b>1</b></li><li><b>grup</b> dengan value <b>2</b></li></ul>', 'superadmin'),
(6, '::1', '', '2020-03-12 13:25:13', 'Login  by Jihan Ali Ahmad', 'superadmin'),
(7, '::1', '', '2020-03-12 13:39:55', 'Mengubah data instansi sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>1</b></li><li><b>nama</b> dengan value <b>1</b></li><li><b>alamat</b> dengan value <b>kosong</b></li><li><b>kode</b> dengan value <b>kosong</b></li><li><b>provinsi</b> dengan value <b>kosong</b></li><li><b>email</b> dengan value <b>kosong</b></li><li><b>website</b> dengan value <b>kosong</b></li><li><b>telepon</b> dengan value <b>kosong</b></li><li><b>kementerian</b> dengan value <b>kosong</b></li><li><b>tahun_ajaran</b> dengan value <b>kosong</b></li><li><b>nama_fakultas</b> dengan value <b>kosong</b></li><li><b>nama_dekan</b> dengan value <b>kosong</b></li><li><b>alamat_fakultas</b> dengan value <b>kosong</b></li><li><b>telepon_fakultas</b> dengan value <b>kosong</b></li><li><b>nama_jurusan</b> dengan value <b>kosong</b></li><li><b>nama_kajur</b> dengan value <b>kosong</b></li><li><b>nama_kalab</b> dengan value <b>kosong</b></li><li><b>telepon_jurusan</b> dengan value <b>kosong</b></li><li><b>alamat_jurusan</b> dengan value <b>kosong</b></li><li><b>deskripsi_jurusan</b> dengan value <b>kosong</b></li><li><b>peta_jurusan</b> dengan value <b>kosong</b></li><li><b>zona_waktu</b> dengan value <b>kosong</b></li></ul>', 'superadmin'),
(8, '::1', '', '2020-03-12 13:40:20', 'Mengubah data instansi sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>1</b></li><li><b>nama</b> dengan value <b>Universitas Negeri Semarang</b></li><li><b>alamat</b> dengan value <b>kosong</b></li><li><b>kode</b> dengan value <b>kosong</b></li><li><b>provinsi</b> dengan value <b>kosong</b></li><li><b>email</b> dengan value <b>kosong</b></li><li><b>website</b> dengan value <b>kosong</b></li><li><b>logo</b> dengan value <b>files/2020/03/ebcff3bcfaf285d80bf3e5144993191d.png</b></li><li><b>telepon</b> dengan value <b>kosong</b></li><li><b>kementerian</b> dengan value <b>kosong</b></li><li><b>tahun_ajaran</b> dengan value <b>kosong</b></li><li><b>nama_fakultas</b> dengan value <b>kosong</b></li><li><b>nama_dekan</b> dengan value <b>kosong</b></li><li><b>alamat_fakultas</b> dengan value <b>kosong</b></li><li><b>telepon_fakultas</b> dengan value <b>kosong</b></li><li><b>nama_jurusan</b> dengan value <b>kosong</b></li><li><b>nama_kajur</b> dengan value <b>kosong</b></li><li><b>nama_kalab</b> dengan value <b>kosong</b></li><li><b>telepon_jurusan</b> dengan value <b>kosong</b></li><li><b>alamat_jurusan</b> dengan value <b>kosong</b></li><li><b>deskripsi_jurusan</b> dengan value <b>kosong</b></li><li><b>zona_waktu</b> dengan value <b>kosong</b></li></ul>', 'superadmin'),
(9, '::1', '', '2020-03-12 13:40:52', 'Mengubah data instansi sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>1</b></li><li><b>nama</b> dengan value <b>Universitas Negeri Semarang</b></li><li><b>alamat</b> dengan value <b>Kampus Sekaran, Gunungpati, Semarang</b></li><li><b>kode</b> dengan value <b>kosong</b></li><li><b>provinsi</b> dengan value <b>kosong</b></li><li><b>email</b> dengan value <b>kosong</b></li><li><b>website</b> dengan value <b>kosong</b></li><li><b>telepon</b> dengan value <b>kosong</b></li><li><b>kementerian</b> dengan value <b>kosong</b></li><li><b>tahun_ajaran</b> dengan value <b>kosong</b></li><li><b>nama_fakultas</b> dengan value <b>kosong</b></li><li><b>nama_dekan</b> dengan value <b>kosong</b></li><li><b>alamat_fakultas</b> dengan value <b>kosong</b></li><li><b>telepon_fakultas</b> dengan value <b>kosong</b></li><li><b>nama_jurusan</b> dengan value <b>kosong</b></li><li><b>nama_kajur</b> dengan value <b>kosong</b></li><li><b>nama_kalab</b> dengan value <b>kosong</b></li><li><b>telepon_jurusan</b> dengan value <b>kosong</b></li><li><b>alamat_jurusan</b> dengan value <b>kosong</b></li><li><b>deskripsi_jurusan</b> dengan value <b>kosong</b></li><li><b>peta_jurusan</b> dengan value <b>kosong</b></li><li><b>zona_waktu</b> dengan value <b>kosong</b></li></ul>', 'superadmin'),
(10, '::1', '', '2020-05-08 07:34:20', 'Login  by Jihan Ali Ahmad', 'superadmin'),
(11, '::1', '', '2020-05-08 07:47:34', 'Menambah Master nama_alat dengan data sbb:<br />\r\n                    <ul><li><b>kode</b> dengan value <b>MK01</b></li><li><b>nama_alat</b> dengan value <b>Mikroskop</b></li><li><b>keterangan</b> dengan value <b>-</b></li></ul>', 'superadmin'),
(12, '::1', '', '2020-05-08 07:47:56', 'Mengedit Master nama_alat dengan data sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>1</b></li><li><b>kode</b> dengan value <b>MK01</b></li><li><b>nama_alat</b> dengan value <b>Mikroskop</b></li><li><b>keterangan</b> dengan value <b>lihat</b></li></ul>', 'superadmin'),
(13, '::1', '', '2020-05-08 09:37:33', 'Login  by Kholiq', 'kholiq'),
(14, '::1', '', '2020-05-08 09:39:40', 'Menambah Master nama_alat dengan data sbb:<br />\r\n                    <ul><li><b>kode</b> dengan value <b>MK02</b></li><li><b>nama_alat</b> dengan value <b>Mikroskop Besar</b></li><li><b>keterangan</b> dengan value <b>Mikroskop Besar</b></li></ul>', 'kholiq'),
(15, '::1', '', '2020-05-13 13:29:29', 'Login  by Kholiq', 'kholiq'),
(16, '::1', '', '2020-05-13 18:29:08', 'Login  by Kholiq', 'kholiq'),
(17, '::1', '', '2020-05-14 07:36:22', 'Login  by Kholiq', 'kholiq'),
(18, '::1', '', '2020-05-14 16:22:42', 'Login  by Kholiq', 'kholiq'),
(19, '::1', '', '2020-05-14 19:35:25', 'Login  by Kholiq', 'kholiq'),
(20, '::1', '', '2020-05-21 22:35:24', 'Login  by Kholiq', 'kholiq'),
(21, '::1', '', '2020-05-22 07:59:55', 'Logout SIONLAB by ', 'Tamu'),
(22, '::1', '', '2020-05-22 08:03:50', 'Login  by Kholiq', 'kholiq'),
(23, '::1', '', '2020-05-27 21:29:42', 'Login  by Kholiq', 'kholiq'),
(24, '::1', '', '2020-05-28 06:14:31', 'Logout SIONLAB by ', 'Tamu'),
(25, '::1', '', '2020-05-28 06:14:44', 'Login  by Kholiq', 'kholiq'),
(26, '::1', '', '2020-05-28 06:19:12', 'Mengedit Master nama_alat dengan data sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>2</b></li><li><b>kode</b> dengan value <b>MK02</b></li><li><b>nama_alat</b> dengan value <b>Mikroskop 2</b></li><li><b>keterangan</b> dengan value <b>Mikroskop Besar</b></li></ul>', 'kholiq'),
(27, '::1', '', '2020-05-28 11:52:51', 'Logout SIONLAB by ', 'Tamu'),
(28, '::1', '', '2020-05-28 11:53:04', 'Login  by Kholiq', 'kholiq'),
(29, '::1', '', '2020-05-28 14:36:39', 'Logout SIONLAB by ', 'Tamu'),
(30, '::1', '', '2020-05-28 14:36:52', 'Login  by Kholiq', 'kholiq'),
(31, '::1', '', '2020-05-28 19:50:12', 'Login  by Kholiq', 'kholiq'),
(32, '::1', '', '2020-05-29 08:33:59', 'Logout SIONLAB by ', 'Tamu'),
(33, '::1', '', '2020-05-29 08:34:13', 'Login  by Kholiq', 'kholiq'),
(34, '::1', '', '2020-05-29 08:41:12', 'Mengedit menu dengan data sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>131</b></li><li><b>nama</b> dengan value <b>Kategori Alat dan Bahan</b></li><li><b>deskripsi</b> dengan value <b>-</b></li><li><b>allowed_level</b> dengan value <b>1,2</b></li><li><b>url</b> dengan value <b>master/kategori_alat_dan_bahan</b></li><li><b>aktif</b> dengan value <b>1</b></li><li><b>urutan</b> dengan value <b>4</b></li><li><b>grup</b> dengan value <b>2</b></li></ul>', 'kholiq'),
(35, '::1', '', '2020-05-29 12:26:29', 'Login  by Kholiq', 'kholiq'),
(36, '::1', '', '2020-06-01 12:33:06', 'Login  by Kholiq', 'kholiq'),
(37, '::1', '', '2020-06-01 14:31:32', 'Menambah Master satuan dengan data sbb:<br />\r\n                    <ul><li><b>nama_satuan</b> dengan value <b>pipet</b></li><li><b>keterangan</b> dengan value <b>kaca</b></li></ul>', 'kholiq'),
(38, '::1', '', '2020-06-03 10:01:58', 'Login  by Kholiq', 'kholiq'),
(39, '::1', '', '2020-06-03 10:18:10', 'Logout SIONLAB by Kholiq', 'kholiq'),
(40, '::1', '', '2020-06-03 10:20:31', 'Login  by Kholiq', 'kholiq'),
(41, '::1', '', '2020-06-03 11:59:06', 'Mengedit menu dengan data sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>138</b></li><li><b>nama</b> dengan value <b>Pengajuan Alat</b></li><li><b>deskripsi</b> dengan value <b>-</b></li><li><b>allowed_level</b> dengan value <b>1,2</b></li><li><b>url</b> dengan value <b>pengajuan/pengajuan_alat</b></li><li><b>aktif</b> dengan value <b>1</b></li><li><b>urutan</b> dengan value <b>10</b></li><li><b>grup</b> dengan value <b>4</b></li></ul>', 'kholiq'),
(42, '::1', '', '2020-06-03 13:51:50', 'Menambah Master satuan dengan data sbb:<br />\r\n                    <ul><li><b>nama_satuan</b> dengan value <b>Router</b></li><li><b>keterangan</b> dengan value <b>Teknologi</b></li></ul>', 'kholiq'),
(43, '::1', '', '2020-06-03 13:52:21', 'Mengedit Master satuan dengan data sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>2</b></li><li><b>nama_satuan</b> dengan value <b>Buku</b></li><li><b>keterangan</b> dengan value <b>Panduan praktikum basis data</b></li></ul>', 'kholiq'),
(44, '::1', '', '2020-06-03 14:01:31', 'Logout SIONLAB by Kholiq', 'kholiq'),
(45, '::1', '', '2020-06-03 14:01:43', 'Login  by Kholiq', 'kholiq'),
(46, '::1', '', '2020-06-03 15:08:24', 'Logout SIONLAB by Kholiq', 'kholiq'),
(47, '::1', '', '2020-06-03 15:08:35', 'Login  by Kholiq', 'kholiq'),
(48, '::1', '', '2020-06-04 11:37:41', 'Login  by Kholiq', 'kholiq'),
(49, '::1', '', '2020-06-04 11:51:04', 'Menambah Master satuan dengan data sbb:<br />\r\n                    <ul><li><b>nama_satuan</b> dengan value <b>Buku</b></li><li><b>keterangan</b> dengan value <b>Panduan sistem operasi</b></li></ul>', 'kholiq'),
(50, '::1', '', '2020-06-04 11:51:19', 'Mengedit Master satuan dengan data sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>5</b></li><li><b>nama_satuan</b> dengan value <b>Buku</b></li><li><b>keterangan</b> dengan value <b>sistem operasi</b></li></ul>', 'kholiq'),
(51, '::1', '', '2020-06-04 12:24:05', 'Menambah Master nama_alat dengan data sbb:<br />\r\n                    <ul><li><b>kode</b> dengan value <b>kosong</b></li><li><b>nama_alat</b> dengan value <b>pipet kaca</b></li><li><b>keterangan</b> dengan value <b>-</b></li></ul>', 'kholiq'),
(52, '::1', '', '2020-06-04 12:24:19', 'Mengedit Master nama_alat dengan data sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>3</b></li><li><b>kode</b> dengan value <b>MK04</b></li><li><b>nama_alat</b> dengan value <b>pipet kaca</b></li><li><b>keterangan</b> dengan value <b>-</b></li></ul>', 'kholiq'),
(53, '::1', '', '2020-06-04 12:24:26', 'Mengedit Master nama_alat dengan data sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>3</b></li><li><b>kode</b> dengan value <b>MK03</b></li><li><b>nama_alat</b> dengan value <b>pipet kaca</b></li><li><b>keterangan</b> dengan value <b>-</b></li></ul>', 'kholiq'),
(54, '::1', '', '2020-06-04 12:39:48', 'Menambah pengajuan alat dengan data sbb:<br />\r\n                    <ul><li><b>nama_alat</b> dengan value <b>Pipet</b></li><li><b>jenis</b> dengan value <b>solid</b></li><li><b>keterangan</b> dengan value <b>-</b></li></ul>', 'kholiq'),
(55, '::1', '', '2020-06-04 12:40:04', 'Mengedit pengajuan alat dengan data sbb:<br />\r\n                    <ul><li><b>nama_alat</b> dengan value <b>Pipet</b></li><li><b>jenis</b> dengan value <b>solid</b></li><li><b>keterangan</b> dengan value <b>dibutuhkan segera</b></li></ul>', 'kholiq'),
(56, '::1', '', '2020-06-04 12:40:32', 'Mengedit pengajuan alat dengan data sbb:<br />\r\n                    <ul><li><b>nama_alat</b> dengan value <b>Pipet</b></li><li><b>jenis</b> dengan value <b>solid</b></li><li><b>keterangan</b> dengan value <b>dibutuhkan segera</b></li></ul>', 'kholiq'),
(57, '::1', '', '2020-06-04 12:41:36', 'Mengedit pengajuan alat dengan data sbb:<br />\r\n                    <ul><li><b>nama_alat</b> dengan value <b>Pipet</b></li><li><b>jenis</b> dengan value <b>solid</b></li><li><b>keterangan</b> dengan value <b>dibutuhkan segera</b></li></ul>', 'kholiq'),
(58, '::1', '', '2020-06-04 12:49:49', 'Mengedit pengajuan alat dengan data sbb:<br />\r\n                    <ul><li><b>nama_alat</b> dengan value <b>Pipet</b></li><li><b>jenis</b> dengan value <b>solid</b></li><li><b>keterangan</b> dengan value <b>dibutuhkan segera</b></li></ul>', 'kholiq'),
(59, '::1', '', '2020-06-04 12:50:52', 'Mengedit pengajuan alat dengan data sbb:<br />\r\n                    <ul><li><b>nama_alat</b> dengan value <b>Router</b></li><li><b>jenis</b> dengan value <b>solid</b></li><li><b>keterangan</b> dengan value <b>dibutuhkan segera</b></li></ul>', 'kholiq'),
(60, '::1', '', '2020-06-04 12:56:49', 'Mengedit pengajuan alat dengan data sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>1</b></li><li><b>nama_alat</b> dengan value <b>Router</b></li><li><b>jenis</b> dengan value <b>solid</b></li><li><b>keterangan</b> dengan value <b>dibutuhkan segera</b></li></ul>', 'kholiq'),
(61, '::1', '', '2020-06-04 19:21:34', 'Logout SIONLAB by ', 'Tamu'),
(62, '::1', '', '2020-06-04 19:21:45', 'Login  by Kholiq', 'kholiq'),
(63, '::1', '', '2020-06-04 19:22:16', 'Mengedit master kategori alat dengan data sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>1</b></li><li><b>nama_alat</b> dengan value <b>Mikroskop</b></li><li><b>kategori</b> dengan value <b>Penunjang Praktikum</b></li><li><b>keterangan</b> dengan value <b>Terbatas</b></li></ul>', 'kholiq'),
(64, '::1', '', '2020-06-04 19:24:18', 'Menambah master kategori alat dengan data sbb:<br />\r\n                    <ul><li><b>nama_alat</b> dengan value <b>Pipet</b></li><li><b>kategori</b> dengan value <b>Penunjang Praktikum</b></li><li><b>keterangan</b> dengan value <b>-</b></li></ul>', 'kholiq'),
(65, '::1', '', '2020-06-04 19:47:22', 'Menambah master kategori bahan dengan data sbb:<br />\r\n                    <ul><li><b>kategori</b> dengan value <b>Liquid</b></li><li><b>keterangan</b> dengan value <b>-</b></li></ul>', 'kholiq'),
(66, '::1', '', '2020-06-04 20:01:52', 'Mengedit master kategori alat dengan data sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>1</b></li><li><b>kategori</b> dengan value <b>liquid</b></li><li><b>keterangan</b> dengan value <b>-</b></li></ul>', 'kholiq'),
(67, '::1', '', '2020-06-04 20:06:02', 'Mengedit master kategori alat dengan data sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>1</b></li><li><b>kategori</b> dengan value <b>Liquid</b></li><li><b>keterangan</b> dengan value <b>-</b></li></ul>', 'kholiq'),
(68, '::1', '', '2020-06-04 20:06:31', 'Mengedit master kategori alat dengan data sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>1</b></li><li><b>kategori</b> dengan value <b>Liquid</b></li><li><b>keterangan</b> dengan value <b>-</b></li></ul>', 'kholiq'),
(69, '::1', '', '2020-06-04 20:07:19', 'Menambah master kategori bahan dengan data sbb:<br />\r\n                    <ul><li><b>kategori</b> dengan value <b>Liquid</b></li><li><b>keterangan</b> dengan value <b>Berbahaya</b></li></ul>', 'kholiq'),
(70, '::1', '', '2020-06-04 23:29:02', 'Logout SIONLAB by ', 'Tamu'),
(71, '::1', '', '2020-06-05 00:49:51', 'Login  by Kholiq', 'kholiq'),
(72, '::1', '', '2020-06-05 14:09:59', 'Login  by Kholiq', 'kholiq'),
(73, '::1', '', '2020-06-05 14:12:03', 'Logout SIONLAB by Kholiq', 'kholiq'),
(74, '::1', '', '2020-06-05 14:12:25', 'Login  by Tiffany', 'tiffany'),
(75, '::1', '', '2020-06-05 14:14:19', 'Mengubah user dengan data sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>14</b></li><li><b>nama</b> dengan value <b>Tiffany</b></li><li><b>username</b> dengan value <b>tiffany</b></li><li><b>password</b> dengan value <b>*FCC67C9225D63398152A826201B41AA6CF02555C</b></li><li><b>gambar</b> dengan value <b>files/2020/06/2da277a466b12a2f364607b733f225b9.jpg</b></li><li><b>no_hp</b> dengan value <b>kosong</b></li><li><b>alamat</b> dengan value <b>kosong</b></li></ul>', 'tiffany'),
(76, '::1', '', '2020-06-05 14:14:23', 'Logout SIONLAB by Tiffany', 'tiffany'),
(77, '::1', '', '2020-06-05 14:14:33', 'Login  by Tiffany', 'tiffany'),
(78, '::1', '', '2020-06-05 14:20:44', 'Menambah pengajuan alat dengan data sbb:<br />\r\n                    <ul><li><b>nama_alat</b> dengan value <b>Pipet Kaca</b></li><li><b>jenis</b> dengan value <b>solid</b></li><li><b>keterangan</b> dengan value <b>-</b></li></ul>', 'tiffany'),
(79, '::1', '', '2020-06-05 14:30:59', 'Mengedit master kategori alat dengan data sbb:<br />\r\n                    <ul><li><b>id</b> dengan value <b>2</b></li><li><b>kategori</b> dengan value <b>Liquid</b></li><li><b>keterangan</b> dengan value <b>Berbahaya</b></li></ul>', 'tiffany'),
(80, '::1', '', '2020-06-06 12:41:00', 'Login  by Tiffany', 'tiffany'),
(81, '::1', '', '2020-06-06 12:49:39', 'Menambah pengajuan bahan dengan data sbb:<br />\r\n                    <ul><li><b>kode</b> dengan value <b>B001</b></li><li><b>nama_bahan</b> dengan value <b>Merkuri</b></li><li><b>jenis</b> dengan value <b>Liquid</b></li><li><b>keterangan</b> dengan value <b>Dibutuhkan segera</b></li></ul>', 'tiffany'),
(82, '::1', '', '2020-06-07 21:42:08', 'Login  by Tiffany', 'tiffany'),
(83, '::1', '', '2020-06-10 12:52:14', 'Login  by Tiffany', 'tiffany'),
(84, '::1', '', '2020-06-17 13:52:45', 'Login  by Tiffany', 'tiffany'),
(85, '::1', '', '2020-06-18 08:46:53', 'Logout SILANDIK by ', 'Tamu'),
(86, '::1', '', '2020-06-18 08:48:35', 'Login  by Tiffany', 'tiffany'),
(87, '::1', '', '2020-06-18 11:34:37', 'Menambah data supplier dengan data sbb:<br />\r\n                    <ul><li><b>no</b> dengan value <b>kosong</b></li><li><b>id_supplier</b> dengan value <b>SPL02</b></li><li><b>nama</b> dengan value <b>Lala Nirmala</b></li><li><b>nomor_telepon</b> dengan value <b>083476484644</b></li><li><b>alamat</b> dengan value <b>JL. Makmur, Genteng, Banyuwangi</b></li></ul>', 'tiffany'),
(88, '::1', '', '2020-06-18 14:04:55', 'Logout SILANDIK by ', 'Tamu'),
(89, '::1', '', '2020-06-18 14:05:11', 'Login  by Tiffany', 'tiffany'),
(90, '::1', '', '2020-06-18 15:59:14', 'Logout SST SEJAHTERA by Tiffany', 'tiffany'),
(91, '::1', '', '2020-06-18 16:08:08', 'Login  by Tiffany', 'tiffany'),
(92, '::1', '', '2020-06-18 16:10:41', 'Logout SST SEJAHTERA by Tiffany', 'tiffany'),
(93, '::1', '', '2020-06-18 16:12:16', 'Login  by Tiffany', 'tiffany'),
(94, '::1', '', '2020-06-18 17:50:21', 'Menambah data supplier dengan data sbb:<br />\r\n                    <ul><li><b>no</b> dengan value <b>kosong</b></li><li><b>id_supplier</b> dengan value <b>SPL03</b></li><li><b>nama</b> dengan value <b>Callista Atha</b></li><li><b>nomor_telepon</b> dengan value <b>087890678567</b></li><li><b>alamat</b> dengan value <b>Jakarta</b></li></ul>', 'tiffany'),
(95, '::1', '', '2020-06-18 18:06:12', 'Menambah master satuan dengan data sbb:<br />\r\n                    <ul><li><b>no</b> dengan value <b>kosong</b></li><li><b>id_barang</b> dengan value <b>MK001</b></li><li><b>nama_barang</b> dengan value <b>Minyak Kelapa</b></li><li><b>merk</b> dengan value <b>Fitri</b></li><li><b>jenis</b> dengan value <b>Curah</b></li><li><b>stok</b> dengan value <b>7</b></li><li><b>satuan</b> dengan value <b>kg</b></li></ul>', 'tiffany'),
(96, '::1', '', '2020-06-18 18:27:32', 'Mengedit master satuan dengan data sbb:<br />\r\n                    <ul><li><b>no</b> dengan value <b>0</b></li><li><b>id</b> dengan value <b>MK001</b></li><li><b>nama_barang</b> dengan value <b>Minyak Kelapa</b></li><li><b>merk</b> dengan value <b>Fitri</b></li><li><b>jenis</b> dengan value <b>Curah</b></li><li><b>stok</b> dengan value <b>8</b></li><li><b>satuan</b> dengan value <b>kg</b></li></ul>', 'tiffany'),
(97, '::1', '', '2020-06-18 18:29:42', 'Menambah master satuan dengan data sbb:<br />\r\n                    <ul><li><b>no</b> dengan value <b>kosong</b></li><li><b>id</b> dengan value <b>MK001</b></li><li><b>nama_barang</b> dengan value <b>Minyak Kelapa</b></li><li><b>merk</b> dengan value <b>Fitri</b></li><li><b>jenis</b> dengan value <b>Curah</b></li><li><b>stok</b> dengan value <b>5</b></li><li><b>satuan</b> dengan value <b>liter</b></li></ul>', 'tiffany'),
(98, '::1', '', '2020-06-18 18:46:37', 'Menambah data supplier dengan data sbb:<br />\r\n                    <ul><li><b>no</b> dengan value <b>kosong</b></li><li><b>id</b> dengan value <b>SPL04</b></li><li><b>nama_supplier</b> dengan value <b>Joko Purnawan</b></li><li><b>nomor_telepon</b> dengan value <b>0876-9867-9098</b></li><li><b>alamat</b> dengan value <b>Tegal</b></li></ul>', 'tiffany'),
(99, '::1', '', '2020-06-18 18:47:06', 'Mengedit data supplier dengan data sbb:<br />\r\n                    <ul><li><b>no</b> dengan value <b>3</b></li><li><b>id</b> dengan value <b>SPL03</b></li><li><b>nama_supplier</b> dengan value <b>Callista Atha</b></li><li><b>nomor_telepon</b> dengan value <b>0878-9067-8567</b></li><li><b>alamat</b> dengan value <b>Jakarta</b></li></ul>', 'tiffany'),
(100, '::1', '', '2020-06-18 20:02:37', 'Mengedit data barang masuk dengan data sbb:<br />\r\n                    <ul><li><b>no</b> dengan value <b>1</b></li><li><b>id</b> dengan value <b>001BM</b></li><li><b>tanggal_masuk</b> dengan value <b>2020-06-17</b></li><li><b>id_supplier</b> dengan value <b>SPL02</b></li><li><b>id_barang</b> dengan value <b>BS001</b></li><li><b>jumlah</b> dengan value <b>30</b></li><li><b>harga_beli</b> dengan value <b>11500</b></li></ul>', 'tiffany'),
(101, '::1', '', '2020-06-18 21:57:40', 'Logout SST SEJAHTERA by ', 'Tamu'),
(102, '::1', '', '2020-06-18 21:57:54', 'Login  by Tiffany', 'tiffany'),
(103, '::1', '', '2020-06-18 22:16:18', 'Logout SST SEJAHTERA by Tiffany', 'tiffany'),
(104, '::1', '', '2020-06-18 22:18:15', 'Login  by Tiffany', 'tiffany');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_menu`
--

CREATE TABLE `cms_menu` (
  `id` int(11) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `allowed_level` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `aktif` int(1) NOT NULL DEFAULT '1',
  `urutan` int(11) NOT NULL,
  `grup` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `cms_menu`
--

INSERT INTO `cms_menu` (`id`, `alias`, `nama`, `deskripsi`, `allowed_level`, `url`, `aktif`, `urutan`, `grup`) VALUES
(89, 'reset_pass', 'Reset Password User', 'Reset Password User', '+1+', 'apl/reset', 1, 1, 3),
(35, 'semua', 'semua', 'untuk login semua', '+1+2+3+4+5+6+8+7+', 'cms/login/admin_page', 1, 1, 3),
(88, 'crud_user', 'Tambah,edit,delete user', 'tambah_edit_delete', '+1+2+3+4+', 'apl/crud', 1, 1, 3),
(104, 'status_pak', 'Home', 'Status Pengajuan PAK', '+1+2+3+4+5+6+', 'pak/dashboard/status_pak', 1, 1, 101),
(132, 'data_barang', 'Data Barang', '-', '+1+2+', 'master_data/data_barang', 1, 2, 1),
(141, 'data_supplier', 'Data Supplier', '', '+1+2+3', 'master_data/data_supplier', 1, 3, 1),
(142, 'request_barang', 'Request Barang', '', '+1+2+3', 'transaksi/request_barang', 1, 4, 2),
(145, 'data_user', 'Data User', '', '+1+2+3+', 'manajemen_user/data_user', 1, 7, 4),
(144, 'barang_keluar', 'Barang Keluar', '', '+1+2+3', 'transaksi/barang_keluar', 1, 6, 2),
(143, 'barang_masuk', 'Barang Masuk', '', '+1+2+3', 'transaksi/barang_masuk', 1, 5, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_menu_grup`
--

CREATE TABLE `cms_menu_grup` (
  `id_grup_menu` int(11) NOT NULL,
  `nama_grup` varchar(255) DEFAULT NULL,
  `icon` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `cms_menu_grup`
--

INSERT INTO `cms_menu_grup` (`id_grup_menu`, `nama_grup`, `icon`) VALUES
(3, 'Hidden Menu', NULL),
(1, 'Master Data', 'fa fa-fw fa-book'),
(4, 'Manajemen User', 'fa fa-fw fa-archive'),
(101, 'Dashboard', 'fa fa-dashboard'),
(2, 'Transaksi', 'fa fa-fw fa-level-up');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_online`
--

CREATE TABLE `cms_online` (
  `user_id` int(5) NOT NULL,
  `last_activity` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `cms_online`
--

INSERT INTO `cms_online` (`user_id`, `last_activity`) VALUES
(2, ''),
(3, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_user`
--

CREATE TABLE `cms_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `level` int(10) DEFAULT NULL,
  `bagian` int(11) DEFAULT '1',
  `no_hp` varchar(100) DEFAULT NULL,
  `alamat` text,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `cms_user`
--

INSERT INTO `cms_user` (`id`, `nama`, `gambar`, `username`, `password`, `level`, `bagian`, `no_hp`, `alamat`, `last_login`) VALUES
(9, 'Admin Supplier', 'files/2016/10/5d1a93bc69ca0cbc6777f940955285ba.png', 'admin', '*E3CCE608FE4C2B066CB6AE607CB6A53C309EC0E6', 3, 1, '0291-595628', 'Jl. Citrosoma RT. 17/06', '2017-03-02 14:28:19'),
(13, 'coba', 'files/2017/04/f6b70ba5e4de413f8832472bef538c0d.JPG', 'coba', '*FD64E348EC9DCCE6525B358693A9CFDC733F5184', 3, 1, 'qq', 'qq', '2017-04-25 09:27:29'),
(14, 'Tiffany', 'files/2020/06/2da277a466b12a2f364607b733f225b9.jpg', 'tiffany', '*FCC67C9225D63398152A826201B41AA6CF02555C', 1, 1, '', '', '2020-06-18 22:18:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_level`
--

CREATE TABLE `master_level` (
  `id` int(11) NOT NULL,
  `level` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `master_level`
--

INSERT INTO `master_level` (`id`, `level`) VALUES
(1, 'Admin'),
(2, 'Pegawai'),
(3, 'Gudang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_user`
--

CREATE TABLE `master_user` (
  `id` int(11) NOT NULL,
  `nip` varchar(100) NOT NULL,
  `level` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `master_user`
--

INSERT INTO `master_user` (`id`, `nip`, `level`) VALUES
(2, 'jihan', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `no` int(11) NOT NULL,
  `id` varchar(50) NOT NULL,
  `nama_pegawai` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `nomor_telpon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`no`, `id`, `nama_pegawai`, `jabatan`, `alamat`, `nomor_telpon`) VALUES
(1, 'PGW01', 'Tiffany Ovilia', 'kasir', 'Banyuwangi', '08993536797'),
(2, 'PGW02', 'Fikry Muhanna', 'Gudang', 'Banyumas', '08993536798'),
(3, 'PGW03', 'Chyntia Eka', 'Admin', 'Brebes', '08993536799');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telepon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `request_barang`
--

CREATE TABLE `request_barang` (
  `no` int(11) NOT NULL,
  `id` varchar(50) NOT NULL,
  `tanggal_request` date NOT NULL,
  `id_barang` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `no` int(11) NOT NULL,
  `id` varchar(50) NOT NULL,
  `nama_supplier` varchar(255) NOT NULL,
  `nomor_telepon` varchar(20) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`no`, `id`, `nama_supplier`, `nomor_telepon`, `alamat`) VALUES
(2, 'SPL02', 'Lala Nirmala', '083476484644', 'JL. Makmur, Genteng, Banyuwangi'),
(3, 'SPL03', 'Callista Atha', '0878-9067-8567', 'Jakarta'),
(4, 'SPL04', 'Joko Purnawan', '0876-9867-9098', 'Tegal');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `no` int(11) NOT NULL,
  `id` varchar(50) NOT NULL,
  `level` int(1) NOT NULL,
  `id_pegawai` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`no`, `id`, `level`, `id_pegawai`, `nama`, `email`) VALUES
(1, 'tiffany', 1, 'PGW01', 'Tiffany Ovilia', 'tiffanyovilia@students.unnes.ac.id');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no` (`no`);

--
-- Indeks untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indeks untuk tabel `cms_captcha`
--
ALTER TABLE `cms_captcha`
  ADD PRIMARY KEY (`captcha_id`) USING BTREE,
  ADD KEY `word` (`word`) USING BTREE;

--
-- Indeks untuk tabel `cms_log`
--
ALTER TABLE `cms_log`
  ADD PRIMARY KEY (`id_log`) USING BTREE;

--
-- Indeks untuk tabel `cms_menu`
--
ALTER TABLE `cms_menu`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `cms_menu_grup`
--
ALTER TABLE `cms_menu_grup`
  ADD PRIMARY KEY (`id_grup_menu`) USING BTREE;

--
-- Indeks untuk tabel `cms_online`
--
ALTER TABLE `cms_online`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- Indeks untuk tabel `cms_user`
--
ALTER TABLE `cms_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `master_level`
--
ALTER TABLE `master_level`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `master_user`
--
ALTER TABLE `master_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no` (`no`),
  ADD UNIQUE KEY `nama_pegawai` (`nama_pegawai`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `request_barang`
--
ALTER TABLE `request_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor` (`no`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no` (`no`),
  ADD UNIQUE KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_pegawai_2` (`id_pegawai`),
  ADD KEY `nama` (`nama`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cms_captcha`
--
ALTER TABLE `cms_captcha`
  MODIFY `captcha_id` bigint(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3299;

--
-- AUTO_INCREMENT untuk tabel `cms_log`
--
ALTER TABLE `cms_log`
  MODIFY `id_log` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT untuk tabel `cms_menu`
--
ALTER TABLE `cms_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT untuk tabel `cms_menu_grup`
--
ALTER TABLE `cms_menu_grup`
  MODIFY `id_grup_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT untuk tabel `cms_user`
--
ALTER TABLE `cms_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `master_level`
--
ALTER TABLE `master_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `master_user`
--
ALTER TABLE `master_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `barang_keluar_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `barang_keluar_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`);

--
-- Ketidakleluasaan untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `barang_masuk_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`nama`) REFERENCES `pegawai` (`nama_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
