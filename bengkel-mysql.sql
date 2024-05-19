CREATE TABLE `transaksi`(
    `id_transaksi` VARCHAR(6) NOT NULL,
    `tgl_transaksi` DATE NOT NULL,
    `total_harga` DECIMAL(8, 2) NOT NULL,
    `metode_pembayaran` VARCHAR(20) NOT NULL,
    `service_id_servis` VARCHAR(6) NOT NULL
);
CREATE TABLE `montir`(
    `id_montir` VARCHAR(6) NOT NULL,
    `nama_montir` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `no_telp` VARCHAR(16) NOT NULL
);
CREATE TABLE `service`(
    `id_servis` VARCHAR(6) NOT NULL,
    `tgl_servis` DATE NOT NULL,
    `jenis_servis` VARCHAR(20) NOT NULL,
    `durasi` VARCHAR(20) NOT NULL,
    `kendaraan_id_kendaraan` VARCHAR(6) NOT NULL,
    `montir_id_montir` VARCHAR(6) NOT NULL
);
CREATE TABLE `kendaraan`(
    `id_kendaraan` VARCHAR(6) NOT NULL,
    `jenis_kendaraan` VARCHAR(20) NOT NULL,
    `merek` VARCHAR(20) NOT NULL,
    `plat_nomor` VARCHAR(10) NOT NULL,
    `pelanggan_id_pelanggan` VARCHAR(6) NOT NULL
);
CREATE TABLE `pelanggan`(
    `id_pelanggan` VARCHAR(6) NOT NULL,
    `nama_pelanggan` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `no_telp` VARCHAR(16) NOT NULL,
    `alamat` VARCHAR(100) NOT NULL
);
ALTER TABLE
    `service` ADD CONSTRAINT `service_id_servis_foreign` FOREIGN KEY(`id_servis`) REFERENCES `transaksi`(`id_transaksi`);
ALTER TABLE
    `kendaraan` ADD CONSTRAINT `kendaraan_id_kendaraan_foreign` FOREIGN KEY(`id_kendaraan`) REFERENCES `service`(`kendaraan_id_kendaraan`);
ALTER TABLE
    `pelanggan` ADD CONSTRAINT `pelanggan_id_pelanggan_foreign` FOREIGN KEY(`id_pelanggan`) REFERENCES `kendaraan`(`pelanggan_id_pelanggan`);
ALTER TABLE
    `service` ADD CONSTRAINT `service_montir_id_montir_foreign` FOREIGN KEY(`montir_id_montir`) REFERENCES `montir`(`id_montir`);