-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Apr 2023 pada 17.39
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_rumah_sakit`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_dokter`
--

CREATE TABLE `tb_dokter` (
  `ID_DOKTER` varchar(255) NOT NULL,
  `ID_PENGGUNA` varchar(255) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `SPESIALIS` varchar(255) NOT NULL,
  `NO_REGRISTASI` int(255) NOT NULL,
  `ALAMAT` varchar(255) NOT NULL,
  `NO_TELP` int(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `JADWAL_KERJA` varchar(255) NOT NULL,
  `TARIF_KONSULTASI` int(255) NOT NULL,
  `RIWAYAT_PENDIDIKAN` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenis_kamar`
--

CREATE TABLE `tb_jenis_kamar` (
  `ID_JENIS_KAMAR` varchar(255) NOT NULL,
  `ID_KAMAR` varchar(255) NOT NULL,
  `NAMA_JENIS_KAMAR` varchar(255) NOT NULL,
  `DESKRIPSI` varchar(255) NOT NULL,
  `FASILITAS` varchar(255) NOT NULL,
  `KAPASITAS` int(255) NOT NULL,
  `TARIF_KAMAR` int(255) NOT NULL,
  `RUANG_ASAL_PASIEN` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenis_perawatan`
--

CREATE TABLE `tb_jenis_perawatan` (
  `ID_JENIS_PERAWATAN` varchar(255) NOT NULL,
  `ID_DOKTER` varchar(255) NOT NULL,
  `ID_TENAGA_KESEHATAN` varchar(255) NOT NULL,
  `NAMA_JENIS` varchar(255) NOT NULL,
  `DESKRIPSI` varchar(255) NOT NULL,
  `STATUS` varchar(255) NOT NULL,
  `HARGA` int(255) NOT NULL,
  `DURASI` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kamar`
--

CREATE TABLE `tb_kamar` (
  `ID_KAMAR` varchar(255) NOT NULL,
  `ID_PEGAWAI` varchar(255) NOT NULL,
  `ID_PASIEN` varchar(255) NOT NULL,
  `ID_TENAGA_KESEHATAN` varchar(255) NOT NULL,
  `NO_KAMAR` int(255) NOT NULL,
  `TIPE_KAMAR` varchar(255) NOT NULL,
  `KAPASITAS` int(255) NOT NULL,
  `FASILITAS` varchar(255) NOT NULL,
  `KONDISI` varchar(255) NOT NULL,
  `TARIF_KAMAR` int(255) NOT NULL,
  `KETERANGAN` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_obat`
--

CREATE TABLE `tb_obat` (
  `ID_OBAT` varchar(255) NOT NULL,
  `ID_TENAGA_KESEHATAN` varchar(255) NOT NULL,
  `NAMA_OBAT` varchar(255) NOT NULL,
  `KATEGORI` varchar(255) NOT NULL,
  `DESKRIPSI` varchar(255) NOT NULL,
  `KETERSEDIAAN` varchar(255) NOT NULL,
  `STOK` int(255) NOT NULL,
  `KADALUARSA` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pasien`
--

CREATE TABLE `tb_pasien` (
  `ID_PASIEN` varchar(255) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `TGL_LAHIR` int(255) NOT NULL,
  `JENIS_KELAMIN` varchar(255) NOT NULL,
  `ALAMAT` varchar(255) NOT NULL,
  `NO_TELP` int(255) NOT NULL,
  `RIWAYAT` varchar(255) NOT NULL,
  `ALERGI` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `ID_PEGAWAI` varchar(255) NOT NULL,
  `ID_PENGGUNA` varchar(255) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `NO_REGISTRASI` int(255) NOT NULL,
  `ALAMAT` varchar(255) NOT NULL,
  `NO_TELP` int(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `JADWAK_KERJA` int(255) NOT NULL,
  `UNIT_KERJA` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `ID_PEMBAYARAN` varchar(255) NOT NULL,
  `ID_PEGAWAI` varchar(255) NOT NULL,
  `ID_PASIEN` varchar(255) NOT NULL,
  `ID_KAMAR` varchar(255) NOT NULL,
  `ID_DOKTER` varchar(255) NOT NULL,
  `ID_PEMERIKSAAN` varchar(255) NOT NULL,
  `ID_JENIS_PERAWATAN` varchar(255) NOT NULL,
  `ID_OBAT` varchar(255) NOT NULL,
  `ID_TENAGA_KESEHATAN` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pemeriksaan_dokter`
--

CREATE TABLE `tb_pemeriksaan_dokter` (
  `ID_PEMERIKSAAN` varchar(255) NOT NULL,
  `ID_DOKTER` varchar(255) NOT NULL,
  `ID_PASIEN` varchar(255) NOT NULL,
  `TGL_PEMERIKSAAN` int(255) NOT NULL,
  `KELUHAN` varchar(255) NOT NULL,
  `DIAGNOSA` varchar(255) NOT NULL,
  `BIAYA` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `ID_PENGGUNA` varchar(255) NOT NULL,
  `NAMA_PENGGUNA` varchar(255) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `HAK_AKSES` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tenaga_kesehatan`
--

CREATE TABLE `tb_tenaga_kesehatan` (
  `ID_TENAGA_KESEHATAN` varchar(255) NOT NULL,
  `ID_PENGGUNA` varchar(255) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `NO_REGRISTASI` varchar(255) NOT NULL,
  `ALAMAT` varchar(255) NOT NULL,
  `NO_TELP` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `JADWAL_KERJA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_dokter`
--
ALTER TABLE `tb_dokter`
  ADD KEY `ID_DOKTER` (`ID_DOKTER`),
  ADD KEY `ID_PENGGUNA` (`ID_PENGGUNA`);

--
-- Indeks untuk tabel `tb_jenis_kamar`
--
ALTER TABLE `tb_jenis_kamar`
  ADD PRIMARY KEY (`ID_JENIS_KAMAR`),
  ADD KEY `ID_KAMAR` (`ID_KAMAR`);

--
-- Indeks untuk tabel `tb_jenis_perawatan`
--
ALTER TABLE `tb_jenis_perawatan`
  ADD PRIMARY KEY (`ID_JENIS_PERAWATAN`),
  ADD KEY `ID_DOKTER` (`ID_DOKTER`),
  ADD KEY `ID_TENAGA_KESEHATAN` (`ID_TENAGA_KESEHATAN`);

--
-- Indeks untuk tabel `tb_kamar`
--
ALTER TABLE `tb_kamar`
  ADD PRIMARY KEY (`ID_KAMAR`),
  ADD KEY `ID_PERAWAT` (`ID_PEGAWAI`),
  ADD KEY `ID_PASIEN` (`ID_PASIEN`),
  ADD KEY `ID_TENAGA_KESEHATAN` (`ID_TENAGA_KESEHATAN`);

--
-- Indeks untuk tabel `tb_obat`
--
ALTER TABLE `tb_obat`
  ADD PRIMARY KEY (`ID_OBAT`),
  ADD KEY `ID_PERAWAT` (`ID_TENAGA_KESEHATAN`);

--
-- Indeks untuk tabel `tb_pasien`
--
ALTER TABLE `tb_pasien`
  ADD PRIMARY KEY (`ID_PASIEN`);

--
-- Indeks untuk tabel `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`ID_PEGAWAI`),
  ADD KEY `ID_PENGGUNA` (`ID_PENGGUNA`);

--
-- Indeks untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`ID_PEMBAYARAN`),
  ADD KEY `ID_PEGAWAI` (`ID_PEGAWAI`),
  ADD KEY `ID_PASIEN` (`ID_PASIEN`),
  ADD KEY `ID_KAMAR` (`ID_KAMAR`),
  ADD KEY `ID_DOKTER` (`ID_DOKTER`),
  ADD KEY `ID_PEMERIKSAAN` (`ID_PEMERIKSAAN`),
  ADD KEY `ID_JENIS_PERAWATAN` (`ID_JENIS_PERAWATAN`),
  ADD KEY `ID_OBAT` (`ID_OBAT`),
  ADD KEY `ID_TENAGA_KESEHATAN` (`ID_TENAGA_KESEHATAN`);

--
-- Indeks untuk tabel `tb_pemeriksaan_dokter`
--
ALTER TABLE `tb_pemeriksaan_dokter`
  ADD PRIMARY KEY (`ID_PEMERIKSAAN`),
  ADD KEY `ID_DOKTER` (`ID_DOKTER`),
  ADD KEY `ID_PASIEN` (`ID_PASIEN`);

--
-- Indeks untuk tabel `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`ID_PENGGUNA`);

--
-- Indeks untuk tabel `tb_tenaga_kesehatan`
--
ALTER TABLE `tb_tenaga_kesehatan`
  ADD PRIMARY KEY (`ID_TENAGA_KESEHATAN`),
  ADD KEY `ID_PENGGUNA` (`ID_PENGGUNA`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_dokter`
--
ALTER TABLE `tb_dokter`
  ADD CONSTRAINT `tb_dokter_ibfk_1` FOREIGN KEY (`ID_PENGGUNA`) REFERENCES `tb_pengguna` (`ID_PENGGUNA`);

--
-- Ketidakleluasaan untuk tabel `tb_jenis_kamar`
--
ALTER TABLE `tb_jenis_kamar`
  ADD CONSTRAINT `tb_jenis_kamar_ibfk_1` FOREIGN KEY (`ID_KAMAR`) REFERENCES `tb_kamar` (`ID_KAMAR`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_jenis_perawatan`
--
ALTER TABLE `tb_jenis_perawatan`
  ADD CONSTRAINT `tb_jenis_perawatan_ibfk_1` FOREIGN KEY (`ID_DOKTER`) REFERENCES `tb_dokter` (`ID_DOKTER`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_jenis_perawatan_ibfk_2` FOREIGN KEY (`ID_TENAGA_KESEHATAN`) REFERENCES `tb_tenaga_kesehatan` (`ID_TENAGA_KESEHATAN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_kamar`
--
ALTER TABLE `tb_kamar`
  ADD CONSTRAINT `tb_kamar_ibfk_1` FOREIGN KEY (`ID_PEGAWAI`) REFERENCES `tb_pegawai` (`ID_PEGAWAI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_kamar_ibfk_2` FOREIGN KEY (`ID_PASIEN`) REFERENCES `tb_pasien` (`ID_PASIEN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_kamar_ibfk_3` FOREIGN KEY (`ID_TENAGA_KESEHATAN`) REFERENCES `tb_tenaga_kesehatan` (`ID_TENAGA_KESEHATAN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_obat`
--
ALTER TABLE `tb_obat`
  ADD CONSTRAINT `tb_obat_ibfk_1` FOREIGN KEY (`ID_TENAGA_KESEHATAN`) REFERENCES `tb_tenaga_kesehatan` (`ID_TENAGA_KESEHATAN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD CONSTRAINT `tb_pegawai_ibfk_1` FOREIGN KEY (`ID_PENGGUNA`) REFERENCES `tb_pengguna` (`ID_PENGGUNA`);

--
-- Ketidakleluasaan untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD CONSTRAINT `tb_pembayaran_ibfk_1` FOREIGN KEY (`ID_PEGAWAI`) REFERENCES `tb_pegawai` (`ID_PEGAWAI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pembayaran_ibfk_2` FOREIGN KEY (`ID_PASIEN`) REFERENCES `tb_pasien` (`ID_PASIEN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pemeriksaan_dokter`
--
ALTER TABLE `tb_pemeriksaan_dokter`
  ADD CONSTRAINT `tb_pemeriksaan_dokter_ibfk_1` FOREIGN KEY (`ID_DOKTER`) REFERENCES `tb_dokter` (`ID_DOKTER`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pemeriksaan_dokter_ibfk_2` FOREIGN KEY (`ID_PASIEN`) REFERENCES `tb_pasien` (`ID_PASIEN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_tenaga_kesehatan`
--
ALTER TABLE `tb_tenaga_kesehatan`
  ADD CONSTRAINT `tb_tenaga_kesehatan_ibfk_1` FOREIGN KEY (`ID_PENGGUNA`) REFERENCES `tb_pengguna` (`ID_PENGGUNA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
