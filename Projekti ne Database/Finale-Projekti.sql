create database Projekti;
use Projekti;

create table Pacienti (
pID integer,
Emri varchar(30),
Mbiemri varchar(30),
Emri_Prindit varchar(30),
Gjinia char(1),
CHECK (Gjinia IN ('M', 'F','O')),
Data_Lindjes date,
TelMobil varchar(15),
TelFix varchar(15),
Email varchar(30),
Grupi_Gjakut char(3),
CHECK (Grupi_Gjakut IN ('A+', 'A-','B+','B-','0-','0+','AB+','AB-')),
Alergjite text,
primary key(pID)
);

create table AdresaPacienti(
pID integer,
Rruga text,
Qyteti text,
Shteti text,
KodiPostal integer,
primary key(pID),
foreign key(pID) references pacienti(pID)
);

create table Doktori (
dID integer,
Emri varchar(30),
Mbiemri varchar(30),
Titulli Varchar(30),
Reparti text,
TelMob varchar(15),
TelFix varchar(15),
Email varchar(50),
primary key(dID)
);
create table AdresaDoktori(
dID integer,
Rruga text,
Qyteti text,
Shteti text,
KodiPostal integer,
primary key(dID),
foreign key(dID) references doktori(dID)
);

create table Terminet (
tID integer,
pID integer NOT NULL,
Data_ date,
Koha_ time,
dID integer,
primary key(tID),
foreign key(pID) references Pacienti(pID),
foreign key(dID) references Doktori(dID)
);
 
create table Vizita (
tID integer not null,
pID integer,
dID integer,
Terapia text,
Diagnoza text,
Data_ date,
Koha_ time,
primary key(pID,Data_,Koha_),
foreign key(pID) references Pacienti(pID) ON DELETE CASCADE,
foreign key(dID) references doktori(dID),
FOREIGN KEY (tID) REFERENCES Terminet(tID)
);

create table Fatura(
fID integer,
pID integer,
Cmimi real,
TVSH decimal(3,2),
Totali real,
Data_Fatures date,
primary key(fID),
foreign key(pID) references Pacienti(pID) ON DELETE CASCADE,
foreign key(fID) references vizita(tID)
);
create table Pagesa (
PagesaID integer,
LLoji_Pageses varchar(4),
CHECK (Lloji_Pageses IN ('Bank','Cash')),
Emri_Bankes text,
Data_Pageses date,
fID integer,
primary key(PagesaID),
foreign key(fID) references Fatura(fID)
);

create table Grada (
Titulli varchar(30),
Paga real,
Primary key(titulli)
);

create table Pervoja_Vjecare(
titulli varchar(30),
vitet integer,
primary key(titulli),
foreign key(titulli) references Grada(Titulli)
);

create table Hospitalizimi(
pID integer,
Data_Pranimit date,
Data_Leshimit date,
Primary key(pID),
Foreign key(pID) references Pacienti(pID) ON DELETE CASCADE
);


create table Infermieri(
infID integer,
Emri varchar(30),
Mbiemri varchar(30),
Gjinia char(1),
Check (Gjinia IN("M","F")),
Primary key(infID)
);

create table Dhomat(
Dhoma integer,
pID integer,
Inf1ID integer,
Inf2ID integer,
Primary key(Dhoma),
Foreign key(pId) references Hospitalizimi(pID) ON DELETE CASCADE,
Foreign key(inf1ID) references Infermieri(infID),
Foreign key(inf2ID) references Infermieri(infID)
);



INSERT INTO Pacienti(pid,Emri,Mbiemri,Emri_Prindit,Gjinia,Data_Lindjes,TelMobil,TelFix,Email,Grupi_Gjakut,Alergjite)
VALUES 
(1,'Altin','Musliu','Arian','M','2000-11-01','049100062','038100062','altinmusliu321@hotmail.com','B+','Gluten'),
(2,'Adonis','Xhemajli','Ali','M','2001-03-18','045100080','028100082','adonisxhemajli321@hotmail.com','0-','Jo'),
(3,'Agon','Bojaj','Rodrigo','M','2001-01-01','049100063','028500220','agonbojaj321@hotmail.com','0+','Polen'),
(4,'Albina','Ahmeti','Ismet','F','2001-12-14','049100500','038100500','Albinaahmeti321@hotmail.com','B+','Jo'),
(5,'Anik','Hasani','Ilir','M','2005-04-07','049120240','028120240','Anikhasani321@hotmail.com','0-','Jo'),
(6,'Arilind','Bytyqi','Pllumi','M','2000-11-10','044100800','039100800','Arlindbytyqi321@hotmail.com ','AB+','Polen'),
(7,'Bleron','Sadriu','Ahmet','M','1994-04-16','049100050','038100050','Bleronsadriu321@hotmail.com','A+','Jo'),
(8,'Blerand','Hyseni','Adrian','M','1988-02-29','049105800','290105800','Blerandhyseni@hotmail.com','B-','Qumesht'),
(9,'Dardane','Makolli','Bedri','F','1981-10-31','045150250','038150250','Dardanemakolli321@hotmail.com','0+','Jo'),
(10,'Enis','Sylejmani','Hajdin','M','2018-06-24','044165330','038165330','Enissylejmanii321@hotmail.com','A-','Aspirin'),
(11,'Fatmire','Manaj','Rexhep','F','1989-02-15','049190290','290190290','Fatmiremanaj321@hotmail.com','B+','Polen'),
(12,'Kroni','Susuri','Artan','M','2012-12-12','045185400','390185400','Kronisusuri321@hotmail.com','AB-','Jo'),
(13,'Learta','Haliti','Ylli','F','2000-08-05','049100001','390100001','Leartahaliti321@hotmail.com','A-','trimetoprin Bactrim'),
(14,'Loni','Kastrati','Enis','M','2004-03-01','044108107','039108107','Lonikastrati321@hotmail.com','0+','Aspirin'),
(15,'Mali','Mustafa','Muhamet','M','2008-02-29','044101101','028101101','Malimustafa321@hotmail.com','0-','Jo'),
(16,'Njomza','Bekteshi','Agim','F','1999-07-13','044170180','038170180','Njomzabekteshi321@hotmail.com','A-','Veze'),
(17,'Orik','Ajeti','Kadri','M','2013-12-11','049111222','038111222','Orikajeti321@hotmail.com','AB-','Jo'),
(18,'Puhiza','Gashi','Mehdi','F','2020-04-04','049123789','290123789','Puhizagashi321@hotmail.com','A+','Qumesht'),
(19,'Rilind','Krasniqi','Shpend','M','2003-05-12','044155133','028155133','Rilindkrasniqi321@hotmail.com','AB+','Jo'),
(20,'Sara','Hoti','Altin','F','2012-01-01','049100900','038100900','Sarahoti321@hotmail.com','0-','Jo'),
(21,'Tea','Begu','Uran','F','2008-02-17','045100400','390100400','Teabegu321@hotmail.com','B+','Ushqim deti'),
(22,'Urim','Peja','Egzon','M','2001-01-24','045183184','390183184','Urimpeja321@hotmail.com','B-','Polen'),
(23,'Valdete','Sadiku','Driton','F','1994-12-15','045199991','038199991','Valdetesadiku321@hotmail.com','AB+','Jo'),
(24,'Yll','Limani','Betim','M','2009-10-10','044184184','029184184','Ylllimani321@hotmail.com','0-','Gluten'),
(25,'Zahir','Gashi','Ejup','M','1979-06-30','044190190','028190190','Zahirgashi321@hotmail.com','A+','Jo');


INSERT INTO AdresaPacienti(pID,Rruga,Qyteti,Shteti,KodiPostal)
VALUES
(1,'Eliot Engel','Prishtine','Kosove','10000'),
(2,'Shaban Menxhiqi','Vushtrri','Kosove','42000'),
(3,'Skenderbeu','Vushtrri','Kosove','42000'),
(4,'Rruga Jashari','Lipjan','Kosove','14000'),
(5,'Gjergj Kastrioti','Gjakove','Kosove','50000'),
(6,'Adem Jashari','Istog','Kosove','31000'),
(7,'Wesley Clark','Prishtine','Kosove','10000'),
(8,'Hillary Clinton','Kacanik','Kosove','71000'),
(9,'Adem Demaci','Prishtine','Kosove','10000'),
(10,'Martiret e lirise','Prishtine','Kosove','10000'),
(11,'Agim Ramadani','Ferizaj','Kosove','70000'),
(12,'Egnatia','Decan','Kosove','51000'),
(13,'George Bush','Skenderaj','Kosove','41000'),
(14,'Ali Kelmendi','Vushtrri','Kosove','42000'),
(15,'Shaban Polluzha','Skenderaj','Kosove','41000'),
(16,'Azem e Shote Galica','Vushtrri','Kosove','42000'),
(17,'Flaka e Janarit','Ferizaj','Kosove','70000'),
(18,'Kadri Zeka','Gjakove','Kosove','50000'),
(19,'28 Nentori','Prishtine','Kosove','10000'),
(20,'Dita e Flamurit','Mitrovice','Kosove','40000'),
(21,'Isa Boletini','Mitrovice','Kosove','40000'),
(22,'Mihal Grameno','Prishtine','Kosove','10000'),
(23,'Iliria','Gjilan','Kosove','60000'),
(24,'Pavarsia','Prizren','Kosove','20000'),
(25,'17 Shkurti','Gjilan','Kosove','60000');

INSERT INTO grada(titulli,paga)
values
('Dr.Cons.',2000),
('Dr.Asoc.',1500),
('Dr.Spec.',1300);



INSERT INTO Doktori(dId,Emri,Mbiemri,Titulli,Reparti,TelMob,TelFix,Email)
VALUES
(1,'Adri','Asllani','Dr.Asoc.','Radiologji','049200056','038200056','Adriasallani321@hotmail.com'),
(2,'Arlind','Mehmeti','Dr.Spec.','Ortopedi','045200482','038200482','Arlindmehmeti@hotmail.com'),
(3,'Agim','Xhafa','Dr.Cons.','Pediatri','044201401','03820140	1','Agimxhafa@hotmail.com'),
(4,'Albion','Ademi','Dr.Spec.','Psikiatri','049200808','038200808','Albionademi@hotmail.com'),
(5,'Alma','Latifi','Dr.Cons.','Pediatri','049200001','038200001','Almalatifi@hotmail.com'),
(6,'Drilona','Hasanaj','Dr.Spec.','Ortopedi','044220440','038220440','Drilonahasanaj@hotmail.com'),
(7,'Luan','Mehmeti','Dr.Asoc.','Pediatri','045250500','038250500','Luanmehmeti@hotmail.com'),
(8,'Mentor','Haziri','Dr.Spec.','Psikiatri','049230230','038230230','Mentorhaziri@hotmail.com'),
(9,'Natyre','Mulaku','Dr.Asoc.','Pediatri','044270280','038270280','Natyremulaku@hotmail.com'),
(10,'Orhan','Sylejmani','Dr.Cons.','Radiologji','044210220','038210220','Orhansylejmani@hotmail.com'),
(11,'Petrit','Luta','Dr.Asoc.','Radiologji','044291291','038291291','Petritluta@hotmail.com'),
(12,'Qerim','Kabashi','Dr.Cons.','Ortopedi','045200200','038200200','Qerimkabashi@hotmail.com');

INSERT INTO AdresaDoktori(dID,Rruga,Qyteti,Shteti,KodiPostal)
values
(1,'Rruga B','Prishtine','Kosove','10000'),
(2,'Ali Ibushi','Gjilan','Kosove','60000'),
(3,'BekimAdemi','Prishtine','Kosove','10000'),
(4,'Al Bytyqi','Vushtrri','Kosove','42000'),
(5,'Jeton Terstena','Prishtine','Kosove','10000'),
(6,'Shqipe Jashari','Ferizaj','Kosove','70000'),
(7,'Hyvzi Sylejmani','Prishtine','Kosove','10000'),
(8,'Justiniani III','Prishtine','Kosove','10000'),
(9,'Rruga Fan Noli','Ferizaj','Kosove','70000'),
(10,'Rruga Janna','Ferizaj','Kosove','70000'),
(11,'Vellezerit Frasheri','Gjilan','Kosove','60000'),
(12,'28 Nentori','Prishtine','Kosove','10000');


INSERT INTO terminet(tID,pId,Data_,Koha_,dID)
VALUES
(1,4,'2020-01-24','17:35:36',1),
(2,2,'2020-01-28','10:10:54',12),
(3,6,'2020-02-14','14:24:30',4),
(4,5,'2002-02-20','14:26:58',10),
(5,1,'2020-03-06','14:26:58',5),
(6,3,'2020-03-18','08:27:34',8),
(7,7,'2020-04-17','12:10:01',11),
(8,13,'2020-04-20','10:00:00',6),
(9,9,'2020-05-14','12:10:01',2),
(10,11,'2020-05-14','19:37:42',9),
(11,8,'2020-06-01','09:46:46',10),
(12,12,'2020-06-15','09:09:14',7),
(13,10,'2020-07-13','11:15:00',2),
(14,14,'2020-07-28','13:42:25',4),
(15,17,'2020-08-10','11:15:00',9),
(16,15,'2020-08-17','15:30:20',6),
(17,21,'2020-08-20','16:49:20',7),
(18,19,'2020-09-01','10:54:21',3),
(19,22,'2020-10-05','10:05:00',12),
(20,16,'2020-10-08','13:19:40',5),
(21,24,'2020-11-13','15:30:20',3),
(22,20,'2020-12-01','19:35:42',8),
(23,23,'2020-12-04','08:26:35',1),
(24,25,'2020-12-09','19:35:42',9),
(25,18,'2020-12-17','16:03:16',11);
select * from fatura;

INSERT INTO Vizita(tid,pId,dId,Terapia,Diagnoza,Data_,Koha_)
VALUES
('1','1','1','Operim','Thyerje te 3 brinjeve','2020-01-31', '08:00:00'),
('2','2','12','Pushim 2 muaj pa aktivitete sportive','Dhimbje ne shpute te kembes','2020-02-04','12:00:00'),
('3','3','4','Antibiotike_Paxil_Lexapro','Stres','2020-02-21','11:30:00'),
('4','4','10','Terapi fizikale','Lendimi I miniskusit','2020-02-27','14:30:00'),
('5','5','5','Limonade','Temperature','2020-03-13',' 15:30:00'),
('6','6','8','Qetesues','Depresion','2020-03-25',' 16:00:00'),
('7','7','11','Vendosja e dores ne gjips 1 muaj','Dore e thyer','2020-04-24','10:00:00'),
('8','8','6','Vendosja e kembes ne gjips 1 muaj Aspirin Maximus','Frakture Femuri','2020-04-27','12:30:00'),
('9','9','2','Terapi fizikale','Lendimi I muskulit Tendinitis','2020-05-21','14:00:00'),
('10','10','9','Infuzion Temperature','lodhje','2020-07-20','12:00:00'),
('11','11','10','Loperamide','Dhimbje ne stomak','2020-06-08','18:30:00'),
('12','12','7','Krem aknesh','Aknet','2020-06-22','08:30:00'),
('13','13','2','Terapi fizikale','Shputa te sheshta','2020-05-21','16:00:00'),
('14','14','4','Rritja e oreve te gjumit','Crregullimi I gjumit','2020-08-04','15:00:00'),
('15','15','9','Qaj frutash','Ftohje','2020-08-17','08:00:00'),
('16','16','6','Fitnes','Deformimi i shtylles kurrizore','2020-08-24','11:30:00'),
('17','17','7','Qaj kamomil','Ftohje','2020-08-27','13:30:00'),
('18','18','3','Acetaminophen','Temperature','2020-09-08','16:30:00'),
('19','19','12','Akull Aspirin Produkte qumeshti','Lendim i kembes','2020-10-12','18:00:00'),
('20','20','5','Injeksion dhe ushqim i lehte','Infektim nga ushqimi','2020-10-15','11:30:00'),
('21','21','3','Dekompozimi ndaj rrezeve te kaltra','Dhimbje koke nga perdorimi I telefonit','2020-11-20','14:30:00'),
('22','22','8','Pimavanserin','Halucinacione','2020-12-07','10:00:00'),
('23','23','1','Vendosja e syzeve','Demtimi I retines','2020-12-11','16:00:00'),
('24','24','9','Vizita ne bjeshke_thithja e ajrit te paster','Sinuset','2020-12-16','17:30:00'),
('25','25','11','','','2020-12-31','13:30:00');


insert into fatura (fID,pID,Cmimi,TVSH,Totali,Data_fatures)
values 
('1','1','500','0.18','590','2020-02-07'),
('2','2','20','0.18','23.6','2020-02-04'),
('3','3','20','0.18','23.6','2020-02-21'),
('4','4','20','0.18','23.6','2020-02-27'),
('5','5','20','0.18','23.6','2020-03-13'),
('6','6','20','0.18','23.6','2020-03-25'),
('7','7','50','0.18','59','2020-04-25'),
('8','8','300','0.18','354','2020-05-01'),
('9','9','20','0.18','23.6','2020-05-21'),
('10','10','25','0.18','29.5','2020-05-21'),
('11','11','20','0.18','23.6','2020-06-08'),
('12','12','20','0.18','23.6','2020-06-22'),
('13','13','20','0.18','23.6','2020-07-20'),
('14','14','20','0.18','23.6','2020-08-04'),
('15','15','20','0.18','23.6','2020-08-17'),
('16','16','20','0.18','23.6','2020-08-24'),
('17','17','20','0.18','23.6','2020-08-27'),
('18','18','20','0.18','23.6','2020-09-08'),
('19','19','20','0.18','23.6','2020-10-12'),
('20','20','50','0.18','59','2020-10-17'),
('21','21','20','0.18','23.6','2020-11-20'),
('22','22','250','0.18','295','2020-12-14'),
('23','23','20','0.18','23.6','2020-12-11'),
('24','24','20','0.18','23.6','2020-12-16'),
('25','25','200','0.18','236','2020-12-28');

insert into Pagesa(PagesaID,Lloji_pageses,Emri_Bankes,Data_pageses,fid)
values
('1','Cash',' ','2020-02-07','1'),
('2','Bank','BKT','2020-02-04','2'),
('3','Cash',' ','2020-02-21','3'),
('4','Cash',' ','2020-02-27','4'),
('5','Bank','TEB','2020-03-13','5'),
('6','Bank','Banka Ekonomike','2020-03-25','6'),
('7','Cash',' ','2020-04-25','7'),
('8','Bank','Raiffeisen','2020-05-01','8'),
('9','Bank','NLB','2020-05-21','9'),
('10','Cash',' ','2020-05-21','10'),
('11','Cash',' ','2020-06-08','11'),
('12','Cash',' ','2020-06-22','12'),
('13','Bank','ProCredit','2020-07-20','13'),
('14','Cash',' ','2020-08-04','14'),
('15','Bank','NLB','2020-08-17','15'),
('16','Cash',' ','2020-08-24','16'),
('17','Bank','BKT','2020-08-27','17'),
('18','Bank','TEB','2020-09-08','18'),
('19','Bank','BKT','2020-10-12','19'),
('20','Cash',' ','2020-10-17','20'),
('21','Bank','ProCredit','2020-11-20','21'),
('22','Cash',' ','2020-12-14','22'),
('23','Cash',' ','2020-12-11','23'),
('24','Bank','Banka Ekonomike','2020-12-16','24'),
('25','Cash',' ','2020-12-28','25');


insert into Hospitalizimi(pID,Data_Pranimit,Data_Leshimit)
values
('1','2020-01-31','2020-02-07'),
('7','2020-04-24','2020-04-25'),
('8','2020-04-27','2020-05-01'),
('20','2020-10-15','2020-10-17'),
('22','2020-12-07','2020-12-14'),
('25','2020-12-31','2020-01-03');

insert into Infermieri(infID,Emri,Mbiemri,Gjinia)
values
('1','Alberiana','Tofaj','F'),
('2','Albiona','Vukaj','F'),
('3','Albina','Maloku','F'),
('4','Artin','Sermaxhaj','M'),
('5','Alban','Beqiri','M'),
('6','Ardonis','Vitia','M'),
('7','Altin','Asllani','M'),
('8','Adonis','Ismaili','M'),
('9','Ermira','Hoti','F'),
('10','Erblina','Mustafa','F'),
('11','Erzen','Salihu','M'),
('12','Patriot','Islami','M'),
('13','Orgesa','Dorbelani','F'),
('14','Saimire','Osmani','F'),
('15','Sinan','Basha','M'),
('16','Trim','Sinani','M'),
('17','Uresa','Smajli','F'),
('18','Vanesa','Musliu','F'),
('19','Xhevat','Arifi','M'), 
('20','Zafire','Azemi','F');		

insert into Dhomat(Dhoma,pID,Inf1ID,Inf2ID)
values
('1','1','1','2'),
('2','7','3','4'),
('3','8','5','6'),
('4','20','7','8'),
('5','22','9','10'),
('6','25','11','12');


-- 1. Listoni të gjithë pacientët që janë nga qyteti i Prishtinës.

select Adresapacienti.pID, Pacienti.Emri, Pacienti.Mbiemri,Adresapacienti.Qyteti
from Adresapacienti 
inner join Pacienti on Adresapacienti.pID = Pacienti.pID
where Adresapacienti.Qyteti= 'Prishtine';


--  2. Cilët pacientë (SSN-të dhe emrat e tyre) kanë paguar fatura në vlerë mbi 150 Euro?

select Fatura.pID, Pacienti.Emri, Pacienti.Mbiemri,Fatura.Totali,Pagesa.Data_Pageses
from Fatura
inner join Pacienti on Fatura.pID = Pacienti.pID inner join Pagesa on Fatura.fID = Pagesa.fID
where Fatura.Totali>150;


 -- 3.Paraqitni të gjitha terminet e vizitave që janë caktuar për nesër për radiologji.

select Terminet.tID,Terminet.Data_,Terminet.Koha_,Terminet.dID,Doktori.Reparti
from Terminet
inner join Doktori on Terminet.dID = Doktori.dID 
where Doktori.Reparti = 'Radiologji' and Terminet.Data_ = DATE(NOW() + INTERVAL 1 DAY);

-- 4. Listoni ID-të e doktorëve të cilët dje kanë pasur dy ose më shumë vizita ndërsa sot nuk kanë pasur asnjë vizitë.


select Doktori.dID, COUNT(Vizita.dID)
From Doktori
inner join Vizita on Doktori.dID = Vizita.dID
Where Date(Vizita.data_) = DATE(NOW() - INTERVAL 1 DAY) and NOT EXISTS (SELECT  *
									From Vizita
							                 	inner join Doktori on Vizita.dID = Doktori.dID
									WHERE Date(Vizita.data_) = DATE(NOW())
                  )

GROUP BY Doktori.dID
HAVING COUNT(Vizita.dID) > 1
ORDER BY Doktori.dID, COUNT(Vizita.dID);

 -- 5. Listoni top 5 doktorët me numër maksimal të vizitave në 3 muajt e fundit. 
 -- Lista të paraqes të dhënat e doktorit duke përfshirë edhe emrin e repartit ku punon dhe numrin e vizitave që ka realizuar.

Select Doktori.dID,Doktori.Emri,Doktori.Mbiemri,Doktori.Reparti, COUNT(Vizita.dID) max_Vizita
From Doktori
Join Vizita on Doktori.dID = Vizita.dID
where Date(Vizita.data_) between DATE(NOW() - INTERVAL 3 MONTH) and DATE(NOW())	
GROUP BY Doktori.dID
HAVING max_Vizita
ORDER BY  max_Vizita DESC
limit 5;

-- 6. Për secilin repart paraqitni (në një listë të vetme):
-- 6.1. numrin e doktorëve që punojnë në atë repart,
-- 6.2. pagën mesatare,
-- 6.3. numrin e vizitave të realizuara në këtë vit
-- 6.4. shumën e faturuar (vlerën pa TVSH dhe me TVSH) nga vizitat e realizuara në këtë vit
-- 6.5. shumën e pagesave të realizuara në këtë vit

Select  Doktori.Reparti, COUNT( distinct doktori.did) Nr_doktorëve ,avg(grada.paga) Pagesa, COUNT(Vizita.dID) Nr_Vizitave,sum(fatura.cmimi) Shuma_cmimit , sum(fatura.totali) Shuma_totali, count(pagesa.pagesaId) Numri_pagesave
From Doktori
inner JOIN grada on  Doktori.Titulli = grada.Titulli Join Vizita on Doktori.dID = Vizita.dID join fatura on vizita.tID = fatura.fID join pagesa on fatura.fid= pagesa.PagesaID
WHERE Date(Vizita.data_)>='2020-01-01'
GROUP BY Doktori.Reparti;

-- pacinetet meshkuj 

create view PacientetMeshkuj as
select pid, Emri, mbiemri
from Pacienti
where pacienti.gjinia = 'M';

-- emrat e doktorave 

create view EmratEDoktoreve as
select did, Emri, Mbiemri
from Doktori
order by emri;


-- koha e termint duhet te jete para 20:00

delimiter  //
create trigger ShikoKohenTerminit before
insert on terminet
for each row
begin
IF new.termine.koha>'20%' then
signal sqlstate '45000'
set message_text="Koha e terminit duhet te jete para 20:00";
end if;
end;//
delimiter ;

-- kur dikush diagnoztifikohet me Covid-19

delimiter //
create trigger Covid19 after
insert on vizita
for each row
begin
IF new.vizitat.giagnoza='covid-19' then
signal sqlstate '45000'
set message_text='Ky pacient duhet karantinuar';
END IF;
end;//
delimiter ;

-- call ListoPacientet()

delimiter //
create procedure ListoPacientet()
begin
select*from pacienti;
end//
delimiter //

-- call NdryshoPacientin(1,'Altin','Musliu')

delimiter //
create procedure NdryshoPacientin(pid integer, Emri varchar(30), Mbiemri varchar(30))
begin
update pacienti
set Emri=x_emri,
Mbiemri=x_mbiemri
where pid=x_id;
end;//
delimiter //


-- funksioni per totalin 

delimiter $$
create function Totali(Cmimi integer, TVSH decimal)
returns real
deterministic
begin
  return Cmimi+Cmimi*TVSH;
end $$
delimiter $$

