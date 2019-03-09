/*Membuat Database*/
CREATE DATABASE surat;

USE surat;

/*Membuat Tabel*/
CREATE TABLE warga (
nik VARCHAR (6),
nama VARCHAR(30),
tempat_lahir VARCHAR(30),
tanggal_lahir DATETIME,
alamat TEXT,
kode_pos VARCHAR (5)
);/*Kurang JKel*/

CREATE TABLE data_surat (
id_surat INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nama_surat VARCHAR(30) 
);

CREATE TABLE proses_surat (
nik VARCHAR(6),
id_surat INT, 
tanggal_input DATETIME 
);

CREATE TABLE kode_pos (
id_kode_pos INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
kode_pos VARCHAR(5),
kecamatan VARCHAR(30)
);

/*Menambah Primary Key*/
ALTER TABLE warga ADD PRIMARY KEY (nik);

/*Mengubah tanggal_input menjadi not null*/
ALTER TABLE proses_surat MODIFY tanggal_input DATETIME NOT NULL;

/*Menambah kolom Jkel*/
ALTER TABLE warga ADD jkel VARCHAR(1);

/*Mengisi data*/
INSERT INTO warga VALUES ('123B67','DIMS','Jakarta','2019-03-02','jln.raya 3','17150');
INSERT INTO warga VALUES ('123C47','MNurul','Bekasi','2019-05-02','jln.raya 9','17159'),
('193C47','Devi','Banjarmasin','2019-05-12','jln.raya 9','16159');

INSERT INTO data_surat (nama_surat) VALUES ('Keterangan Domisili');
INSERT INTO data_surat (nama_surat) VALUES ('Keterangan Menikah'),('Surat Pengajuan KJP');

INSERT INTO kode_pos (kode_pos,kecamatan) VALUES ('17150','Tambun Selatan');
INSERT INTO kode_pos (kode_pos,kecamatan) VALUES ('17159','Tambun Utara'),('17152','Tambun Selatan');

INSERT INTO proses_surat VALUES ('123B67','1','2019-03-11');
INSERT INTO proses_surat VALUES ('123C47','2','2019-03-19'),('193C47','3','2019-03-22');

/*Update data*/
UPDATE warga SET tempat_lahir='Bandung' WHERE nik='123B67';

UPDATE warga SET jkel='L' where nik='123B67';

/*Hapus data*/
DELETE FROM kode_pos WHERE id_kode_pos='1';

/*Menampilkan data*/
SELECT * FROM proses_surat WHERE id_surat > '1';

SELECT nik,nama,tanggal_lahir from warga ORDER BY tanggal_lahir DESC;

SELECT a.nik,a.tanggal_input,b.nama FROM proses_surat a,warga b WHERE a.nik=b.nik; 

SELECT a.nama,a.alamat,a.kode_pos, b.kecamatan FROM warga a INNER JOIN kode_pos b ON a.kode_pos=b.kode_pos;

/*Menampilkan semua tabel*/
SHOW TABLES;










