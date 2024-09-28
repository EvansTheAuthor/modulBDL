---- 
---- nomor 1
----
select semester, sum (sks) as sks_per_semester
from mata_kuliah group by semester order by semester;

select* from mata_kuliah ;
select* from mengajar;
select* from dosen;

----
--- nomor 4
----
select sks, count (nama_mata_kuliah) as jumlah_matkul
from mata_kuliah group by sks having (sks)>2;

----
---- nomor 2
----
select kode_mata_kuliah,nama_mata_kuliah,sks
from public.mata_kuliah
order by kode_mata_kuliah;

----
---- nomor 5
----
select nomor_induk_dosen, count (kode_mata_kuliah) as
jumlah_matkul_diajar from mengajar
group by nomor_induk_dosen
having count (nomor_induk_dosen)>3;

----
---- nomor 6
----
select jenis_kelamin, count (nama_dosen) as jumlah_dosen
from dosen group by jenis_kelamin;

----
---- nomor 3
----
select semester,sum (sks) as jumlah_sks
from mata_kuliah group by semester
order by semester;