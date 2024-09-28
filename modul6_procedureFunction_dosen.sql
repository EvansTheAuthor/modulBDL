---
--- bikin tabel matkul
---

CREATE TABLE "public"."mata_kuliah" (
"kode_mata_kuliah" char(8) COLLATE "pg_catalog"."default" NOT NULL,
"nama_mata_kuliah" varchar(100) COLLATE "pg_catalog"."default",
"sks" int2,
"semester" int2,
"kodejenis" varchar(6) COLLATE "pg_catalog"."default",
CONSTRAINT "mata_kuliah_pkey" PRIMARY KEY ("kode_mata_kuliah")
)
;

---
--- bikin tabel dosen
---

CREATE TABLE "public"."dosen" (
"nomor_induk_dosen" char(18) COLLATE "pg_catalog"."default" NOT NULL,
"nama_dosen" varchar(50) COLLATE "pg_catalog"."default",
"tempat_lahir" varchar(50) COLLATE "pg_catalog"."default",
"tanggal_lahir" date,
"jenis_kelamin" char(1) COLLATE "pg_catalog"."default",
"alamat" varchar(100) COLLATE "pg_catalog"."default",
"kota" varchar(50) COLLATE "pg_catalog"."default",
"email" varchar(100) COLLATE "pg_catalog"."default",
CONSTRAINT "dosen_pkey" PRIMARY KEY ("nomor_induk_dosen")
)
;

---
--- bikin tabel prodi
---

CREATE TABLE "public"."program_studi" (
"kode_prodi" varchar(4) COLLATE "pg_catalog"."default" NOT NULL,
"nama_prodi" varchar(100) COLLATE "pg_catalog"."default",
"jenjang" char(2) COLLATE "pg_catalog"."default",
"nama_kaprodi" varchar(100) COLLATE "pg_catalog"."default",
CONSTRAINT "program_studi_pkey" PRIMARY KEY ("kode_prodi")
)
;

---
--- bikin tabel mengajar
---

CREATE TABLE "public"."mengajar" (
"periode" char(5) COLLATE "pg_catalog"."default" NOT NULL,

"nomor_induk_dosen" varchar(18) COLLATE "pg_catalog"."default" NOT NULL,
"kode_mata_kuliah" char(8) COLLATE "pg_catalog"."default" NOT NULL,
"kode_prodi" varchar(4) COLLATE "pg_catalog"."default" NOT NULL,
"keterangan" varchar(255) COLLATE "pg_catalog"."default",
CONSTRAINT "mengajar_pkey" PRIMARY KEY ("periode", "nomor_induk_dosen",
"kode_prodi", "kode_mata_kuliah"),
CONSTRAINT "mengajar_kode_mata_kuliah_fkey" FOREIGN KEY ("kode_mata_kuliah")
REFERENCES "public"."mata_kuliah" ("kode_mata_kuliah") ON DELETE CASCADE ON
UPDATE CASCADE,
CONSTRAINT "mengajar_kode_prodi_fkey" FOREIGN KEY ("kode_prodi") REFERENCES
"public"."program_studi" ("kode_prodi") ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT "mengajar_nomor_induk_dosen_fkey" FOREIGN KEY ("nomor_induk_dosen")
REFERENCES "public"."dosen" ("nomor_induk_dosen") ON DELETE CASCADE ON UPDATE
CASCADE
)
;

---
--- masukin data matkul
---

INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('A0013004', 'Bahasa Indonesia/TPKI', 3, 1,
'MPK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('A0013008', 'ISD/IBD/IAD', 2, 1, 'MPK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('A0013009', 'Pancasila dan Kewarganegaraan', 2,
1, 'MPK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('A0013010', 'Pengantar Studi Islam', 3, 1,
'MPK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('A0013011', 'Studi Hadits', 2, 2, 'MPK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('A0013012', 'Studi al-Quran', 2, 2, 'KD');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613013', 'Algoritma dan Pemrograman', 3, 1,
'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613014', 'Manajemen dan Organisasi', 3, 1,
'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613015', 'Pengantar Teknologi Informasi', 2,
1, 'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613016', 'Statistika', 3, 2, 'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613017', 'Pengantar Basis Data', 3, 2,
'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613018', 'Konsep Sistem Informasi', 3, 2,
'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613019', 'Teknik Pemrograman', 3, 2, 'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613020', 'Praktikum Teknik Pemrograman', 1,
2, 'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613021', 'Pemrograman Berorientasi Objek
(PBO)', 3, 3, 'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613022', 'Praktikum PBO', 1, 3, 'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613023', 'Pemrograman Web', 4, 4, 'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613024', 'Sistem Operasi', 3, 3, 'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613025', 'Manajemen Sains / RO', 3, 3,
'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613026', 'Technopreneurship', 3, 8, 'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613027', 'Testing & Implementasi Sistem', 3,
7, 'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613028', 'Sistem Cerdas', 3, 6, 'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613029', 'Pemodelan dan Simulasi', 3, 5,
'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613030', 'Kalkulus dan Aljabar Linier', 3, 2,
'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('BH613031', 'Sistem Informasi Akuntansi', 3, 5,
'MKK');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613032', 'Rekayasa Perangkat Lunak', 3, 3,
'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613033', 'Rekayasa Kebutuhan Perangkat
Lunak', 3, 7, 'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613034', 'Interaksi Manusia dan Komputer', 3,
4, 'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613035', 'Jaringan dan Keamanan Komputer', 4,
4, 'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613036', 'Praktikum Jaringan', 2, 4, 'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613037', 'Sistem Informasi Manajemen', 3, 3,
'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613038',
'Analisa dan Perancangan Sistem Informasi', 3, 5, 'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613039',
'Analisa dan Perancangan berorientasi objek', 3, 7, 'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613040', 'E`Business', 3, 7, 'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613041', 'Pengembangan Sistem Informasi', 3,
5, 'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613042', 'Manajemen Hubungan Pelanggan', 3,
5, 'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613043', 'Enterprise Architect', 3, 5,
'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613044', 'Perencanaan Sumberdaya Perusahaan',
3, 7, 'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613045', 'Manajemen Proyek Sistem Informasi',
3, 5, 'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613046',
'Manajemen Administrasi Basis Data', 3, 4, 'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613047', 'Desain Basis Data', 3, 3, 'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613048', 'Praktikum Basis Data', 1, 3,
'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613049', 'Perencanaan Strategis SI', 3, 7,
'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613050', 'Infrastruktur TI', 3, 7, 'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613051', 'Manajemen Proses Bisnis', 3, 4,
'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613052', 'Manajemen Investasi', 3, 6, 'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613053', 'Bisnis Cerdas', 3, 6, 'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('CH613054', 'Proteksi Aset Informasi', 3, 6,
'MKB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('DH613055', 'Etika Profesi', 2, 6, 'MPB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('DH613056', 'Komunikasi Interpersonal', 2, 6,
'MPB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('EH613057', 'Kuliah Kerja Nyata', 2, NULL,
'MBB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('EH613058', 'Metodologi Penelitian', 2, 6,
'MBB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('EH613059', 'Tugas Akhir / Skripsi', 6, NULL,
'MBB');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('FH613060', 'Tata Kelola IT', 3, NULL, 'MKKA');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('FH613061', 'Audit IT', 3, NULL, 'MKKA');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('FH613062', 'Manajemen Resiko', 3, NULL,
'MKKA');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('FH613063', 'Sistem Informasi Geografis', 3,
NULL, 'MKKA');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('FH613064', 'Mobile Technology', 3, NULL,
'MKKA');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('FH613065', 'Pengembangan Aplikasi Berbasis
Web', 3, NULL, 'MKKA');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('FH613066', 'Kecerdasan Buatan', 3, NULL,
'MKKA');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('FH613067', 'Sistem Temu Kembali Informasi', 3,
NULL, 'MKKA');
INSERT INTO "mata_kuliah" ("kode_mata_kuliah", "nama_mata_kuliah", "sks",
"semester", "kodejenis") VALUES ('FH613068', 'Data Mining', 3, NULL, 'MKKA');

---
--- masukin data dosen
---

INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('198701272014031002', 'Abu Hurairah', 'Bojonegoro', '1987-01-27', 'L',
'Jambean 11', 'Bojonegoro', 'Abu_Hurairah@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('197411262000031001', 'Ustman', 'Gresik', '1974-11-26', 'L', 'Menganti 112',
'Gresik', 'Ustman@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('198011082014031002', 'Umar', 'Gresik', '1980-01-10', 'L', 'Driyorejo 5',
'Gresik', 'Umar@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('DLJ02', 'Ikrimah', 'Jember', '1979-01-01', 'L', 'Tanggul 1', 'Jember',
'Ikrimah@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('198403232014031002', 'Ibrahim', 'Kediri', '1984-03-23', 'L', 'Pare Pait 556',
'Kediri', 'Ibrahim@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('197906092014031002', 'Abu Bakar', 'Lamongan', '1979-06-09', 'L',
'Deket Banget 12', 'Lamongan', 'Abu_Bakar@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('198808302014031001', 'Talhah', 'Malang', '1988-08-08', 'L', 'Lawang 35',
'Malang', 'Talhah@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('198403072014031001', 'Qassim', 'Malang', '1984-03-03', 'L', 'Singosari 77',
'Malang', 'Qassim@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('198808132014031001', 'Zubair', 'Pasuruan', '1991-02-02', 'L', 'Pandaan 23',
'Pasuruan', 'Zubair@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('197110262014031003', 'Tsabit', 'Probolinggo', '1971-11-02', 'L', 'Nguling 12',
'Probolinggo', 'Tsabit@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('DLJ04', 'Salman', 'Probolinggo', '1980-01-01', 'L', 'Tiris 34', 'Probolinggo',
'Salman@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('DLJ03', 'Zainab', 'Sidoarjo', '1979-01-01', 'P', 'Waru 1', 'Sidoarjo',
'Zainab@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('198207212014032001', 'Ali Rahmat', 'Surabaya', '1982-07-21', 'L', 'Gunung Anyar 6',
'Surabaya', 'Ali@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('197909272014032001', 'Hafsah', 'Sidoarjo', '1979-09-27', 'P', 'Krian 2',
'Sidoarjo', 'Hafsah@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('198205012014032001', 'Fatimah', 'Sidoarjo', '1982-05-01', 'P', 'Taman 3',
'Sidoarjo', 'Fatimah@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('198702082014032003', 'Ummu Kultsum', 'Surabaya', '1990-01-01', 'P', 'Rungkut 5',
'Surabaya', 'Ummu_Kultsum@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('199011022014032004', 'Ruqayyah', 'Surabaya', '1990-11-02', 'P', 'Wonocolo 7',
'Surabaya', 'Ruqayyah@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('199001202014031003', 'Ammar', 'Surabaya', '1990-01-20', 'L', 'Wonokromo 8',
'Surabaya', 'Ammar@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('197911132014031001', 'Migdad', 'Surabaya', '1979-11-13', 'L', 'Perak 9',
'Surabaya', 'Migdad@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('197008282014031003', 'Zaid', 'Surabaya', '1970-08-28', 'L', 'Bratang 3',
'Surabaya', 'Zaid@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('197901292014031002', 'Ibnu Abbas', 'Tuban', '1979-01-29', 'L', 'Senori 6',
'Tuban', 'Ibnu_Abbas@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES ('DLJ01',
'Ubaidah', 'Jombang', '1979-02-21', 'L', 'Mojoagung 5', 'Jombang',
'Ubaidah@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('198110142014031002', 'Ussamah', 'Jombang', '1981-10-14', 'L', 'Gudo 111',
'Jombang', 'Ussamah@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('197905182014031001', 'Abdurahman', 'Lamongan', '1979-05-18', 'L', 'Jauh Banget 1',
'Lamongan', 'Abdurahman@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('197607032008011014', 'Bilal', 'Mojokerto', '1976-07-03', 'L', 'Brangkal 89',
'Mojokerto', 'Bilal@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('198604272014031004', 'Abdullah', 'Mojokerto', '1986-04-27', 'L', 'Sooko 90',
'Mojokerto', 'Abdullah@uinsby.ac.id');
INSERT INTO "dosen" ("nomor_induk_dosen", "nama_dosen", "tempat_lahir",
"tanggal_lahir", "jenis_kelamin", "alamat", "kota", "email") VALUES
('197902242014032003', 'Khadijah', 'Mojokerto', '2014-09-09', 'P', 'Mojosari 91',
'Mojokerto', 'Khadijah@uinsby.ac.id');

---
--- masukin data prodi
---

INSERT INTO "program_studi" ("kode_prodi", "nama_prodi", "jenjang",
"nama_kaprodi") VALUES ('SINF', 'Sistem Informasi', 'S1', 'Ilham');

---
--- masukin data mengajar
---

INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20141', '197411262000031001', 'A0013010',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20141', '197901292014031002', 'BH613014',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20141', '197902242014032003', 'A0013009',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20141', '197905182014031001', 'BH613015',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20141', '197911132014031001', 'BH613013',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20141', '198205012014032001', 'A0013004',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20141', '198207212014032001', 'A0013004',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20141', '198403072014031001', 'BH613015',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20141', '198604272014031004', 'A0013008',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20141', '198702082014032003', 'A0013008',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20141', '199001202014031003', 'A0013009',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20142', '197607032008011014', 'BH613018',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20142', '197905182014031001', 'BH613017',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20142', '197906092014031002', 'BH613017',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20142', '197909272014032001', 'BH613019',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20142', '197911132014031001', 'BH613016',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20142', '197911132014031001', 'BH613018',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20142', '198207212014032001', 'BH613016',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20142', '198403072014031001', 'BH613030',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20142', '198604272014031004', 'A0013012',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20142', '199001202014031003', 'BH613020',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20142', '199011022014032004', 'BH613030',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20142', 'DLJ01', 'A0013011', 'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '197607032008011014', 'CH613037',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '197901292014031002', 'BH613014',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '197905182014031001', 'CH613048',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '197906092014031002', 'BH613015',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '197909272014032001', 'A0013009',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '198011082014031002', 'DH613056',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '198110142014031002', 'BH613013',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '198207212014032001', 'A0013004',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '198403232014031002', 'CH613032',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '198604272014031004', 'A0013008',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '198701272014031002', 'BH613024',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '198702082014032003', 'BH613022',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '198808302014031001', 'CH613047',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '198808302014031001', 'CH613048',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '199001202014031003', 'BH613025',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '197607032008011014', 'EH613058',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '197901292014031002', 'CH613051',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '197905182014031001', 'BH613017',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '197906092014031002', 'CH613046',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '197909272014032001', 'CH613034',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '197911132014031001', 'BH613019',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '197911132014031001', 'BH613020',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '198011082014031002', 'DH613055',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '198110142014031002', 'BH613018',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '198207212014032001', 'BH613018',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '198207212014032001', 'BH613030',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '198403072014031001', 'CH613035',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '198604272014031004', 'A0013011',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '198702082014032003', 'CH613038',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '198808132014031001', 'BH613016',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '198808302014031001', 'CH613035',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '198808302014031001', 'CH613046',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '199001202014031003', 'BH613019',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '197008282014031003', 'A0013010',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '197008282014031003', 'A0013012',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20141', '197110262014031003', 'BH613013',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20142', '197110262014031003', 'BH613019',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20151', '197110262014031003', 'BH613021',
'SINF', NULL);
INSERT INTO "mengajar" ("periode", "nomor_induk_dosen", "kode_mata_kuliah",
"kode_prodi", "keterangan") VALUES ('20152', '197110262014031003', 'BH613023',
'SINF', NULL);

---
--- menampilkan isi tabel
---

select* from mengajar;
select* from dosen;
select* from mata_kuliah;
select* from program_studi;

---
--- update data dosen
---

update dosen
set nomor_induk_dosen=trim(nomor_induk_dosen);