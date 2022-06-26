-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jun 2022 pada 22.19
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_app`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sayuran', '1', '2022-06-11 11:18:24', '2022-06-11 11:18:24'),
(14, 'Bakso', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Nasi', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id` int(11) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga` int(10) NOT NULL,
  `qty` int(2) NOT NULL,
  `total` int(10) NOT NULL,
  `gambar` text NOT NULL,
  `expired` int(10) NOT NULL,
  `id_pelanggan` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_pemesanan`
--

CREATE TABLE `log_pemesanan` (
  `id` int(11) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga` int(10) NOT NULL,
  `qty` int(2) NOT NULL,
  `total` int(10) NOT NULL,
  `kd_pemesanan` varchar(11) NOT NULL,
  `id_pelanggan` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `log_pemesanan`
--

INSERT INTO `log_pemesanan` (`id`, `nama_produk`, `harga`, `qty`, `total`, `kd_pemesanan`, `id_pelanggan`, `created_at`, `updated_at`) VALUES
(18, 'Nasi Goreng', 30000, 3, 90000, '27', 6, '2022-06-18 08:04:40', '2022-06-18 08:04:40'),
(19, 'Nasi Goreng', 30000, 1, 30000, '28', 6, '2022-06-18 11:52:17', '2022-06-18 11:52:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2022-06-10-143029', 'App\\Database\\Migrations\\Admin', 'default', 'App', 1654873677, 1),
(2, '2022-06-10-143112', 'App\\Database\\Migrations\\Pelanggan', 'default', 'App', 1654874077, 2),
(3, '2022-06-10-143134', 'App\\Database\\Migrations\\Pemesanan', 'default', 'App', 1654874077, 2),
(4, '2022-06-10-143206', 'App\\Database\\Migrations\\LogPemesanan', 'default', 'App', 1654874136, 3),
(5, '2022-06-10-143224', 'App\\Database\\Migrations\\Keranjang', 'default', 'App', 1654874196, 4),
(6, '2022-06-10-143232', 'App\\Database\\Migrations\\Produk', 'default', 'App', 1654874197, 4),
(7, '2022-06-10-143259', 'App\\Database\\Migrations\\Kategori', 'default', 'App', 1654874197, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_tlp` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama`, `no_tlp`, `email`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Muhammad Anjar', '081294176339', 'anjarfals07@gmail.com', '$2y$10$Yf1iuy/G5gNOPzG21.iKZ.QTDJqotK4tvymg38auaSU1btOCi4ski', '1', '2022-06-13 11:19:02', '2022-06-13 11:19:02'),
(6, 'test', '81294176231', 'test@gmail.com', '$2y$10$fIleOCv5NMMVeTWjH0F9VO4FvTFPG3SNkUeuUK.AGSV.1hoR8t2NW', '1', '2022-06-13 14:35:59', '2022-06-14 00:00:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `kd_pemesanan` int(11) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `total_bayar` int(10) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `id_pelanggan` int(11) UNSIGNED NOT NULL,
  `status_pemesanan` enum('0','1','2','3','4') NOT NULL,
  `alamat_kirim` text NOT NULL,
  `noteCancel` text NOT NULL,
  `note` text NOT NULL,
  `payment` varchar(20) NOT NULL,
  `ongkir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`kd_pemesanan`, `tgl_pesan`, `total_bayar`, `latitude`, `longitude`, `id_pelanggan`, `status_pemesanan`, `alamat_kirim`, `noteCancel`, `note`, `payment`, `ongkir`) VALUES
(27, '2022-06-18 08:00:00', 94500, -6.2414679628798195, 106.81371487677097, 6, '4', '9c, Melawai, Kecamatan Kebayoran Baru, Daerah Khusus Ibukota Jakarta, Indonesia', '', 'test', 'Cash', 4500),
(28, '2022-06-18 11:00:00', 31500, -6.227041359095551, 106.83481112122536, 6, '0', 'Alamat kirim belum dipilih', '', '', 'Cash', 1500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga` int(10) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` text NOT NULL,
  `status` enum('0','1') NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama_produk`, `harga`, `deskripsi`, `gambar`, `status`, `kategori`, `created_at`, `updated_at`) VALUES
(1, 'Nasi Goreng', 30000, 'Nasi Goreng yang kaya vitamin A, B, C, D, E, F, G\r\nTersedia Semua Menu nasi goreng...\r\nhahahhha\r\n ', 'user.png', '0', 'Nasi', '2022-06-11 21:42:22', '2022-06-11 21:42:22'),
(2, 'Notebook', 12000000, 'hjhk', '1654984250_d30c8192993cfdb865ae.png', '1', 'Nasi uduk juminten', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keranjang_id_pelanggan_foreign` (`id_pelanggan`);

--
-- Indeks untuk tabel `log_pemesanan`
--
ALTER TABLE `log_pemesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_pemesanan_id_pelanggan_foreign` (`id_pelanggan`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`kd_pemesanan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `log_pemesanan`
--
ALTER TABLE `log_pemesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `kd_pemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_id_pelanggan_foreign` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id`);

--
-- Ketidakleluasaan untuk tabel `log_pemesanan`
--
ALTER TABLE `log_pemesanan`
  ADD CONSTRAINT `log_pemesanan_id_pelanggan_foreign` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id`);

--
-- Ketidakleluasaan untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_id_pelanggan_foreign` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
