CREATE TABLE kendaraan (
    id_kendaraan             VARCHAR(6 BYTE) NOT NULL,
    jenis_kendaraan          VARCHAR(20 BYTE) NOT NULL,
    merek                    VARCHAR(20 BYTE) NOT NULL,
    plat_nomor               VARCHAR(10 BYTE) NOT NULL,
    pelanggan_id_pelanggan   VARCHAR(6 BYTE) NOT NULL
);

ALTER TABLE kendaraan ADD CONSTRAINT kendaraan_pk PRIMARY KEY ( id_kendaraan );

CREATE TABLE montir (
    id_montir     VARCHAR(6 BYTE) NOT NULL,
    nama_montir   VARCHAR(50 BYTE) NOT NULL,
    email         VARCHAR(50 BYTE) NOT NULL,
    no_telp       VARCHAR(16 BYTE) NOT NULL
);

ALTER TABLE montir ADD CONSTRAINT montir_pk PRIMARY KEY ( id_montir );

CREATE TABLE pelanggan (
    id_pelanggan     VARCHAR(6 BYTE) NOT NULL,
    nama_pelanggan   VARCHAR(50 BYTE) NOT NULL,
    email            VARCHAR(50 BYTE) NOT NULL,
    no_telp          VARCHAR(16 BYTE) NOT NULL,
    alamat           VARCHAR(100 BYTE) NOT NULL
);

ALTER TABLE pelanggan ADD CONSTRAINT pelanggan_pk PRIMARY KEY ( id_pelanggan );

CREATE TABLE service (
    id_servis                VARCHAR(6 BYTE) NOT NULL,
    tgl_servis               DATE NOT NULL,
    jenis_servis             VARCHAR(20 BYTE) NOT NULL,
    durasi                   VARCHAR(20 BYTE) NOT NULL,
    kendaraan_id_kendaraan   VARCHAR(6 BYTE) NOT NULL,
    montir_id_montir         VARCHAR(6 BYTE) NOT NULL
);

ALTER TABLE service ADD CONSTRAINT service_pk PRIMARY KEY ( id_servis );

CREATE TABLE transaksi (
    id_transaksi        VARCHAR(6 BYTE) NOT NULL,
    tgl_transaksi       DATE NOT NULL,
    total_harga         DECIMAL NOT NULL,
    metode_pembayaran   VARCHAR(20 BYTE) NOT NULL,
    service_id_servis   VARCHAR(6 BYTE) NOT NULL
);

CREATE UNIQUE INDEX transaksi__idx ON
    transaksi (
        service_id_servis
    ASC );

ALTER TABLE transaksi ADD CONSTRAINT transaksi_pk PRIMARY KEY ( id_transaksi );

ALTER TABLE kendaraan
    ADD CONSTRAINT kendaraan_pelanggan_fk FOREIGN KEY ( pelanggan_id_pelanggan )
        REFERENCES pelanggan ( id_pelanggan );

ALTER TABLE service
    ADD CONSTRAINT service_kendaraan_fk FOREIGN KEY ( kendaraan_id_kendaraan )
        REFERENCES kendaraan ( id_kendaraan );

ALTER TABLE service
    ADD CONSTRAINT service_montir_fk FOREIGN KEY ( montir_id_montir )
        REFERENCES montir ( id_montir );

ALTER TABLE transaksi
    ADD CONSTRAINT transaksi_service_fk FOREIGN KEY ( service_id_servis )
        REFERENCES service ( id_servis );
