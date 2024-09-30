-- ----------------------------
-- Table structure for pembelian_barang
-- ----------------------------
DROP TABLE IF EXISTS "public"."pembelian_barang";
CREATE TABLE "public"."pembelian_barang" (
"id_pembelian" int8 NOT NULL,
"id_barang" char(5) COLLATE "pg_catalog"."default",
"tanggal_pembelian" date,
"harga_per_item" float8,
"jumlah_pembelian" int8,
"harga_pembelian" float8
)
;
-- ----------------------------
-- Table structure for penjualan_barang
-- ----------------------------
DROP TABLE IF EXISTS "public"."penjualan_barang";
CREATE TABLE "public"."penjualan_barang" (
"id_penjualan" int8 NOT NULL,
"id_barang" char(5) COLLATE "pg_catalog"."default",
"tanggal_penjualan" date,
"harga_per_item" float8,
"jumlah_penjualan" int8,
"harga_penjualan" float8
)
;
-- ----------------------------
-- Table structure for stock_barang
-- ----------------------------
DROP TABLE IF EXISTS "public"."stock_barang";
CREATE TABLE "public"."stock_barang" (
"id_barang" char(5) COLLATE "pg_catalog"."default"
NOT NULL,"nama_barang" varchar(50)
COLLATE "pg_catalog"."default", "harga_barang" float4,
"stock_barang" int4)
;
-- ----------------------------
-- Primary Key structure for table pembelian_barang
-- ----------------------------
ALTER TABLE "public"."pembelian_barang"
ADD CONSTRAINT "pembelian_barang_pkey"
PRIMARY KEY ("id_pembelian");
-- Primary Key structure for table penjualan_barang
-- ----------------------------
ALTER TABLE "public"."penjualan_barang"
ADD CONSTRAINT "penjualan_barang_pkey"
PRIMARY KEY ("id_penjualan");
-- ----------------------------
-- Primary Key structure for table stock_barang
-- ----------------------------
ALTER TABLE "public"."stock_barang"
ADD CONSTRAINT "stock_barang_pkey"
PRIMARY KEY ("id_barang");
-- ----------------------------
-- Foreign Keys structure for table pembelian_barang
-- ----------------------------
ALTER TABLE "public"."pembelian_barang"
ADD CONSTRAINT "penjualan_barang_copy1_id_barang_fkey"
FOREIGN KEY ("id_barang")
REFERENCES "public"."stock_barang" ("id_barang")
ON DELETE CASCADE
ON UPDATE CASCADE;
-- ----------------------------
-- Foreign Keys structure for table penjualan_barang
-- ----------------------------
ALTER TABLE "public"."penjualan_barang"
ADD CONSTRAINT "idx_fx"
FOREIGN KEY ("id_barang")
REFERENCES "public"."stock_barang" ("id_barang")
ON DELETE CASCADE
ON UPDATE CASCADE;
-- ----------------------------
-- memasukkan isi tabel stock_barang
-- ----------------------------
INSERT INTO "stock_barang" ("id_barang", "nama_barang", "harga_barang",
"stock_barang") VALUES ('T0001', 'TOPI BASEBALL GENERIK', '50000', 100);
INSERT INTO "stock_barang" ("id_barang", "nama_barang", "harga_barang",
"stock_barang") VALUES ('T0002', 'TOPI RIMBA EAGER SIZE L', '150000', 100);
INSERT INTO "stock_barang" ("id_barang", "nama_barang", "harga_barang",
"stock_barang") VALUES ('T0003', 'TOPI OSIS SMP', '15000', 100);
INSERT INTO "stock_barang" ("id_barang", "nama_barang", "harga_barang",
"stock_barang") VALUES ('T0004', 'TOPI OSIS SMA', '20000', 100);
INSERT INTO "stock_barang" ("id_barang", "nama_barang", "harga_barang",
"stock_barang") VALUES ('T0006', 'TOPI TENTARA KADET SIZE M', '100000', 100);
INSERT INTO "stock_barang" ("id_barang", "nama_barang", "harga_barang",
"stock_barang") VALUES ('T0005', 'TOPI PRAMUKA', '20000', 100);
-- ----------------------------
-- menampilkan seluruh isi tabel stock_barang
-- diurutkan lewat ID Numbernya
-- ----------------------------
SELECT * FROM stock_barang ORDER BY id_barang;
-- ----------------------------
-- membuat trigger di tabel pembelian_barang
-- ----------------------------
CREATE OR REPLACE FUNCTION
"public"."tambahi_stock_barang_karena_belanja"()
RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
UPDATE stock_barang SET stock_barang
= stock_barang + new.jumlah_pembelian
	where id_barang = new.id_barang;
RETURN NEW;
END;
	$BODY$
	LANGUAGE plpgsql VOLATILE
	COST 100

CREATE TRIGGER "restock"
AFTER INSERT ON "public"."pembelian_barang"
FOR EACH ROW
EXECUTE PROCEDURE
"public"."tambahi_stock_barang_karena_belanja"();
-- ----------------------------
-- uji coba skenario 1
-- ----------------------------
INSERT INTO "public"."pembelian_barang"
("id_pembelian", "id_barang", "tanggal_pembelian",
"harga_per_item", "jumlah_pembelian", "harga_pembelian")
VALUES
(1, 'T0001', '2023-10-01', '35000', 50, '1750000');

SELECT * FROM pembelian_barang ORDER BY id_pembelian;
SELECT * FROM stock_barang ORDER BY id_barang;

-- ----------------------------
-- uji coba skenario 2
-- ----------------------------
INSERT INTO "public"."pembelian_barang"
("id_pembelian", "id_barang", "tanggal_pembelian",
"harga_per_item", "jumlah_pembelian", "harga_pembelian")
VALUES
(2, 'T0002', '2023-10-01', '100000', 50, '5000000');

SELECT * FROM pembelian_barang ORDER BY id_pembelian;
SELECT * FROM stock_barang ORDER BY id_barang;
-- ----------------------------
-- membuat trigger lagi di tabel pembelian_barang
-- ----------------------------
CREATE OR REPLACE FUNCTION
"public"."update_stock_barang_karena_update_pembelian"()
RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
if old.jumlah_pembelian > new.jumlah_pembelian then
UPDATE stock_barang SET stock_barang
= stock_barang -
(old.jumlah_pembelian - new.jumlah_pembelian)
where id_barang = new.id_barang;
elsif old.jumlah_pembelian < new.jumlah_pembelian then
UPDATE stock_barang SET stock_barang
= stock_barang +
(new.jumlah_pembelian - old.jumlah_pembelian)
where id_barang = new.id_barang;
end if;
RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100

CREATE TRIGGER "kurangi_stock_karena_pembelian"
BEFORE UPDATE ON "public"."pembelian_barang"
FOR EACH ROW
EXECUTE PROCEDURE
"public"."update_stock_barang_karena_update_pembelian"();
-- ----------------------------
-- uji coba skenario 3.1 (update data karena pembelian)
-- ----------------------------
UPDATE "public"."pembelian_barang"
SET "jumlah_pembelian" = 20, "harga_pembelian"
= '2000000' WHERE "id_pembelian" = 2

SELECT * FROM pembelian_barang ORDER BY id_pembelian;
SELECT * FROM stock_barang ORDER BY id_barang;
-- ----------------------------
-- membuat trigger kurangi_stock
-- ----------------------------
CREATE OR REPLACE FUNCTION
"public"."kurangi_stock_barang_karena_penjualan"()
RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
UPDATE stock_barang SET stock_barang
= stock_barang - new.jumlah_penjualan
where id_barang = new.id_barang;
RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100

CREATE TRIGGER "kurangi_stock_barang"
AFTER INSERT ON "public"."penjualan_barang"
FOR EACH ROW
EXECUTE PROCEDURE
"public"."kurangi_stock_barang_karena_penjualan"();
-- ----------------------------
-- uji coba skenario 3.2 (hapus data karena penjualan)
-- ----------------------------
INSERT INTO "public"."penjualan_barang"
("id_penjualan", "id_barang", "tanggal_penjualan",
"harga_per_item", "jumlah_penjualan", "harga_penjualan")
VALUES
(1, 'T0001', '2023-10-01', '50000', 10, '500000');

SELECT * FROM penjualan_barang ORDER BY id_penjualan;
SELECT * FROM stock_barang ORDER BY id_barang;

INSERT INTO "public"."penjualan_barang"
("id_penjualan", "id_barang", "tanggal_penjualan",
"harga_per_item", "jumlah_penjualan", "harga_penjualan")
VALUES
(2, 'T0002', '2023-10-01', '150000', 2, '300000');

SELECT * FROM penjualan_barang ORDER BY id_penjualan;
SELECT * FROM stock_barang ORDER BY id_barang;
-- ----------------------------
-- membuat trigger kurangi_stock
-- ----------------------------
CREATE OR REPLACE FUNCTION
"public"."update_stock_barang_karena_update_penjualan"()
RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
if old.jumlah_penjualan > new.jumlah_penjualan then
UPDATE stock_barang SET stock_barang = stock_barang
+ (old.jumlah_penjualan - new.jumlah_penjualan)
where id_barang = new.id_barang;
elsif old.jumlah_penjualan < new.jumlah_penjualan then
UPDATE stock_barang SET stock_barang
= stock_barang -
(new.jumlah_penjualan - old.jumlah_penjualan)
where id_barang = new.id_barang;
end if;
RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100

CREATE TRIGGER "update_stock_karena_penjualan"
BEFORE UPDATE ON "public"."penjualan_barang"
FOR EACH ROW
EXECUTE PROCEDURE
"public"."update_stock_barang_karena_update_penjualan"();

-- ----------------------------
-- uji coba skenario 3.3 (update data karena update penjualan)
-- ----------------------------
UPDATE "public"."penjualan_barang"
SET "jumlah_penjualan" = 1,
"harga_penjualan" = '150000'
WHERE "id_penjualan" = 2

SELECT * FROM penjualan_barang ORDER BY id_penjualan;
SELECT * FROM stock_barang ORDER BY id_barang;