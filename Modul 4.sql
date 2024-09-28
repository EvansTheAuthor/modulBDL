select distinct* from mengajar
left join mata_kuliah on mengajar.kode_mata_kuliah
= mata_kuliah.kode_mata_kuliah
left join dosen on mengajar.nomor_induk_dosen
=dosen.nomor_induk_dosen;

select distinct * from mengajar, mata_kuliah, dosen
where mengajar.kode_mata_kuliah = mata_kuliah.kode_mata_kuliah
and mengajar.nomor_induk_dosen = dosen.nomor_induk_dosen;

select* from dosen
left join mengajar on dosen.nomor_induk_dosen
= mengajar.nomor_induk_dosen left join program_studi
on mengajar.kode_prodi = program_studi.kode_prodi;

select* from dosen
left join mengajar on dosen.nomor_induk_dosen
= mengajar.nomor_induk_dosen
left join program_studi on mengajar.kode_prodi
=program_studi.kode_prodi
where mengajar.periode='20141';

select * from mengajar
right join mata_kuliah
on mengajar.kode_mata_kuliah
= mata_kuliah.kode_mata_kuliah;

select*from mengajar
right join mata_kuliah
on mengajar.kode_mata_kuliah
= mata_kuliah.kode_mata_kuliah
where mata_kuliah.kodejenis = 'MBB';


select distinct mengajar.kode_prodi, mengajar.periode,
mata_kuliah.nama_mata_kuliah,
mata_kuliah.sks, dosen.nama_dosen
from mengajar
full join mata_kuliah on mengajar.kode_mata_kuliah
=mata_kuliah.kode_mata_kuliah
full join dosen on mengajar.nomor_induk_dosen
=dosen.nomor_induk_dosen
where mengajar.kode_prodi = 'SINF';

select distinct mengajar.kode_prodi, mengajar.periode,
mata_kuliah.nama_mata_kuliah,
mata_kuliah.sks, dosen.nama_dosen
from mengajar, mata_kuliah, dosen
where mengajar.kode_mata_kuliah
= mata_kuliah.kode_mata_kuliah
and mengajar.nomor_induk_dosen
= dosen.nomor_induk_dosen;

-- ----------------------------
-- Table structure for toko_sepatu
-- ----------------------------
DROP TABLE IF EXISTS "public"."toko_sepatu";
CREATE TABLE "public"."toko_sepatu" (
  "toko" varchar(3) COLLATE "pg_catalog"."default",
  "sepatu" varchar(50) COLLATE "pg_catalog"."default",
  "harga" float4
)
;

-- ----------------------------
-- Records of toko_sepatu
-- ----------------------------
INSERT INTO "public"."toko_sepatu" VALUES ('ABC', 'Sepatu Ortuseight Hyperblast', 10);
INSERT INTO "public"."toko_sepatu" VALUES ('XYZ', 'Sepatu Ortuseight Hyperblast', 15);
INSERT INTO "public"."toko_sepatu" VALUES ('DEF', 'Sepatu 910 Hiroshi', 15);
INSERT INTO "public"."toko_sepatu" VALUES ('DEF', 'Sepatu Mills Enermax Stream', 25);
INSERT INTO "public"."toko_sepatu" VALUES ('XYZ', 'Sepatu Mills Enermax Stream', 20);

-- ----------------------------
-- Table structure for toko_topi
-- ----------------------------
DROP TABLE IF EXISTS "public"."toko_topi";
CREATE TABLE "public"."toko_topi" (
  "toko" varchar(3) COLLATE "pg_catalog"."default",
  "topi" varchar(50) COLLATE "pg_catalog"."default",
  "harga" float4
)
;

-- ----------------------------
-- Records of toko_topi
-- ----------------------------
INSERT INTO "public"."toko_topi" VALUES ('ABC', 'Topi Rimba Eiger', 6);
INSERT INTO "public"."toko_topi" VALUES ('ABC', 'Topi Commando Eiger', 8);
INSERT INTO "public"."toko_topi" VALUES ('FGH', 'Topi Commando Eiger', 7);
INSERT INTO "public"."toko_topi" VALUES ('WXY', 'Topi Commando Eiger', 7);
INSERT INTO "public"."toko_topi" VALUES ('ABC', 'Topi Sailor Eiger', 7);
INSERT INTO "public"."toko_topi" VALUES ('XYZ', 'Topi Sailor Eiger', 5);

select*from toko_sepatu
full join toko_topi on toko_sepatu.toko = toko_topi.toko;

select distinct * from toko_sepatu cross join toko_topi;