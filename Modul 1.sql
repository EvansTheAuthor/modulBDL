create table Mahasiswa (
NIM varchar(11) primary key,
Nama varchar(100) not null,
TanggalLahir date,
JenisKelamin char(1) check (JenisKelamin IN ('L', 'P'))
);

insert into Mahasiswa (NIM, Nama, TanggalLahir, JenisKelamin)
values
('09010623101', 'Eka Sanjaya', '2000-05-15', 'L'),
('09010623102', 'Dwi Puspita', '1999-08-21', 'P'),
('09010623103', 'Tri Sasongko', '1999-09-23', 'L'),
('09010623104', 'Catur Ayu', '1999-10-08', 'P');

create table MatKul(
kodeMK varchar(10) primary key,
namaMK varchar(100) not null,
SKS int not null
);

create table Nilai(
NIM varchar(11),
kodeMK varchar(10),
Nilai char(2),
primary key(NIM, kodeMK),
foreign key(NIM) references Mahasiswa(NIM)
on delete cascade
on update cascade,
foreign key(kodeMK) references MatKul(kodeMK)
on delete cascade
on update cascade
);

INSERT INTO Matkul (KodeMK, NamaMK, SKS)
VALUES
('MK001', 'Basis Data', 3),
('MK002', 'Basis Data Lanjut', 3),
('MK003', 'Pengantar Studi Hadis', 3),
('MK004', 'Manajemen Organisasi', 3);

insert into Nilai(NIM, kodeMK, Nilai)
values
('09010623101', 'MK001', 'A'),
('09010623102', 'MK001', 'B'),
('09010623103', 'MK001', 'C'),
('09010623104', 'MK001', 'A'),
('09010623101', 'MK002', 'B'),
('09010623102', 'MK002', 'B'),
('09010623103', 'MK002', 'C'),
('09010623104', 'MK002', 'C'),
('09010623101', 'MK003', 'A'),
('09010623102', 'MK003', 'A'),
('09010623103', 'MK003', 'B'),
('09010623104', 'MK003', 'B');

delete from Mahasiswa where NIM = '09010623101';
DELETE FROM MatKul WHERE KodeMK = 'MK001';
UPDATE MatKul SET KodeMK = 'MKSI102' WHERE KodeMK = 'MK003';

select* from Mahasiswa;
select* from MatKul;
select* from Nilai;

alter table Mahasiswa add alamat varchar;

update mahasiswa
set alamat='Tidak Diketahui'
where alamat is null;

alter table Mahasiswa
alter column alamat set not null;

alter table nilai
add column nama varchar(100);

update nilai
set nama = (select nama from mahasiswa where mahasiswa.nim=nilai.nim);