--Crearea tabelei functii_proiect
CREATE TABLE functii_proiect
(id_functie NUMBER(3) PRIMARY KEY,
denumire_functie VARCHAR2(20));

--Crearea tabelei departamente_proiect
CREATE TABLE departamente_proiect
(id_departament NUMBER(3) PRIMARY KEY,
denumire_departament VARCHAR2(20));

--Crearea tabelei p_angajati
CREATE TABLE p_angajati
(id_angajat NUMBER(3) PRIMARY KEY,
nume VARCHAR2(20) NOT NULL,
prenume VARCHAR2(25) NOT NULL,
sex VARCHAR2(1) CHECK (sex IN ('F','M')),
email VARCHAR2(20),
salariul NUMBER(7,2) NOT NULL,
id_functie NUMBER(3),
id_departament NUMBER(3));

--Adaugarea cheilor externe in tabela p_angajati
ALTER TABLE p_angajati 
ADD FOREIGN KEY(id_functie) REFERENCES functii_proiect(id_functie);
ALTER TABLE p_angajati
ADD FOREIGN KEY (id_departament) REFERENCES departamente_proiect(id_departament);

--Modificarea capacitatii salariului de la 7 cifre la 6 in tabela p_angajati
ALTER TABLE p_angajati
MODIFY salariul NUMBER(6,2);

--Adaugarea coloanei data_nastere in tabela p_angajati
ALTER TABLE p_angajati
ADD (data_nastere DATE);

--Crearea tabelei clase
CREATE TABLE clase
(id_clasa NUMBER(3) CONSTRAINT PKey_clase PRIMARY KEY,
denumire_clasa VARCHAR2(4) NOT NULL,
id_angajat NUMBER(3));

ALTER TABLE clase
ADD FOREIGN KEY (id_angajat) REFERENCES p_angajati(id_angajat);

--Crearea tabelei elevi
CREATE TABLE elevi 
(id_elev NUMBER(3) PRIMARY KEY,
nume VARCHAR2(20) NOT NULL,
prenume VARCHAR2(25) NOT NULL,
sex VARCHAR2(1) CHECK (sex IN ('F','M')),
data_nastere DATE,
id_clasa NUMBER(3),
telefon VARCHAR2(10),
FOREIGN KEY(id_clasa) REFERENCES clase(id_clasa));

--Stergerea coloanei 'telefon'
ALTER TABLE elevi
DROP COLUMN telefon;

--Crearea tabelei discipline
CREATE TABLE discipline
(id_disciplina VARCHAR2(2) PRIMARY KEY,
denumire_disciplina VARCHAR2(20));

--Crearea tabelei reusita_elev
CREATE TABLE reusita_elev
(id_elev NUMBER(3),
id_disciplina VARCHAR2(2),
id_angajat NUMBER(3),
tip_evaluare VARCHAR2(20),
nota NUMBER(4,2),
data_evaluare DATE,
PRIMARY KEY (id_elev, id_disciplina, id_angajat, tip_evaluare));

--Adaugarea cheilor primare in tabela reusita elev
ALTER TABLE reusita_elev 
ADD FOREIGN KEY(id_elev) REFERENCES elevi(id_elev);
ALTER TABLE reusita_elev 
ADD FOREIGN KEY(id_disciplina) REFERENCES discipline(id_disciplina);
ALTER TABLE reusita_elev 
ADD FOREIGN KEY(id_angajat) REFERENCES p_angajati(id_angajat);

--Redenumirea tabelei p_angajati in angajati_proiect
RENAME p_angajati TO angajati_proiect;

--Introducerea valorilor in tabela functii_proiect
INSERT INTO functii_proiect (id_functie, denumire_functie) VALUES (10,'Director');
INSERT INTO functii_proiect (id_functie, denumire_functie) VALUES (11,'Director adjunct');
INSERT INTO functii_proiect (id_functie, denumire_functie) VALUES (12,'Secretar?');
INSERT INTO functii_proiect (id_functie, denumire_functie) VALUES (21,'Contabil');
INSERT INTO functii_proiect (id_functie, denumire_functie) VALUES (31,'�nv???tor');
INSERT INTO functii_proiect (id_functie, denumire_functie) VALUES (41,'Doctor');
INSERT INTO functii_proiect (id_functie, denumire_functie) VALUES (42,'Psiholog');
INSERT INTO functii_proiect (id_functie, denumire_functie) VALUES (51,'Bibliotecar?');
INSERT INTO functii_proiect (id_functie, denumire_functie) VALUES (52,'Menajer?');
INSERT INTO functii_proiect (id_functie, denumire_functie) VALUES (53,'Paznic');

--Schimbarea denumirii functiilor unde sunt intalnite diacritice
UPDATE functii_proiect
SET denumire_functie = 'Secretara'
WHERE id_functie=12;

UPDATE functii_proiect
SET denumire_functie = 'Invatator'
WHERE id_functie=31;

UPDATE functii_proiect
SET denumire_functie = 'Bibliotecara'
WHERE id_functie=51;

UPDATE functii_proiect
SET denumire_functie = 'Menajera'
WHERE id_functie=52;

--Introducerea valorilor in tabela departamente_proiect
INSERT INTO departamente_proiect (id_departament, denumire_departament) VALUES (10,'Administratie');
INSERT INTO departamente_proiect (id_departament, denumire_departament) VALUES (20,'Finante');
INSERT INTO departamente_proiect (id_departament, denumire_departament) VALUES (30,'Didactic');
INSERT INTO departamente_proiect (id_departament, denumire_departament) VALUES (40,'Sanatate');
INSERT INTO departamente_proiect (id_departament, denumire_departament) VALUES (50,'Servicii');

--Introducerea valorilor in tabela angajati_proiect
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (01,'Radu','Nicolaescu','M','rnicolaescu@prim.ro',9000,10,10,'26-AUG-1965');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (02,'Mihaela','Andronic','F','mandronic@prim.ro',8000,11,10,'14-MAR-1972');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (03,'Alina','Dumitrescu','F','adumitrescu@prim.ro',6000,12,10,'3-JUN-1973');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (04,'Mihai','Stefan','M','mstefan@prim.ro',5500,21,20,'9-AUG-1975');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (05,'Oana','Roman','F','oroman@prim.ro',5000,21,20,'18-DEC-1970');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (06,'Maria','Dolgan','F','mdolgan@prim.ro',8000,31,30,'1-JAN-1984');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (07,'Felicia','Stoian','F','fstoian@prim.ro',8000,31,30,'7-SEP-1981');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (08,'Sonia','Radu','F','sradu@prim.ro',8000,31,30,'27-FEB-1978');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (09,'Patricia','Frosin','F','pfrosin@prim.ro',8000,31,30,'5-JUL-1974');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (10,'Olivia','Enache','F','oenaceh@prim.ro',8000,31,30,'16-NOV-1984');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (11,'Manuela','Lazar','F','mlazar@prim.ro',8000,31,30,'21-OCT-1981');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (12,'Ina','Luca','F','iluca@prim.ro',8000,31,30,'12-DEC-1979');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (13,'Laura','Albescu','F','lalbsescu@prim.ro',8000,31,30,'11-APR-1974');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (14,'Mara','Lungu','F','mlungu@prim.ro',8000,31,30,'4-MAY-1980');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (15,'Maia','Dalca','F','mdalca@prim.ro',8000,31,30,'19-JUL-1977');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (16,'Janina','Alexandrescu','F','jalexa@prim.ro',8000,31,30,'15-JAN-1979');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (17,'Gabriel','Petran','M','gpetran@prim.ro',8000,31,30,'13-NOV-1980');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (18,'Miruna','Ionescu','F','mionescu@prim.ro',6000,41,40,'10-APR-1972');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (19,'Bogdan','Olarescu','M','bolareascu@prim.ro',5000,42,40,'20-SEP-1979');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (20,'Gabriela','Tacu','F','gtacu@prim.ro',4000,51,50,'29-DEC-1968');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (21,'Cosmina','Paun','F','cpaun@prim.ro',3000,52,50,'14-MAY-1988');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (22,'Ramona','Bobu','F','rbobu@prim.ro',3000,52,50,'3-FEB-1986');
INSERT INTO angajati_proiect (id_angajat,prenume, nume, sex, email, salariul, id_functie, id_departament, data_nastere)
VALUES (23,'Sergiu','Dochia','M','sdochia@prim.ro',4000,53,50,'29-DEC-1986');

--Introducerea valorilor in tabela clase
INSERT INTO clase (id_clasa, denumire_clasa, id_angajat) VALUES (00, '00', 06);
INSERT INTO clase (id_clasa, denumire_clasa, id_angajat) VALUES (10, '1-A', 07);
INSERT INTO clase (id_clasa, denumire_clasa, id_angajat) VALUES (11, '1-B', 08);
INSERT INTO clase (id_clasa, denumire_clasa, id_angajat) VALUES (20, '2-A', 09);
INSERT INTO clase (id_clasa, denumire_clasa, id_angajat) VALUES (21, '2-B', 10);
INSERT INTO clase (id_clasa, denumire_clasa, id_angajat) VALUES (30, '3-A', 11);
INSERT INTO clase (id_clasa, denumire_clasa, id_angajat) VALUES (31, '3-B', 12);
INSERT INTO clase (id_clasa, denumire_clasa, id_angajat) VALUES (40, '4-A', 13);
INSERT INTO clase (id_clasa, denumire_clasa, id_angajat) VALUES (41, '4-B', 14);

--Introducerea elevilor
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa) 
VALUES (001,'Iris','Oprea', 'F', '14-DEC-2016',00);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (002,'Roberta','Furtuna', 'F', '24-SEP-2016',00);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (003,'Ioana','ALexandrescu', 'F', '9-SEP-2015',00);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (004,'Luiza','Adam', 'F', '23-DEC-2015',00);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (005,'Eva','Semen', 'F', '11-APR-2016',00);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (006,'Cristi','Stancu', 'M', '19-MAY-2016',00);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (007,'David','Tulbure', 'M', '31-JAN-2015',00);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (008,'Emil','Robu', 'M', '10-OCT-2016',00);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (009,'Vlad','Ion', 'M', '3-NOV-2015',00);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa) 
VALUES (010,'Cristi','Stancu', 'M', '19-MAY-2016',00);

INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa) 
VALUES (101,'Mihai','Andronic', 'M', '13-JUN-2016',10);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (102,'Ana','Livada', 'F', '25-SEP-2016',10);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (103,'Livia','Tudor', 'F', '09-FEB-2016',10);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa) 
VALUES (104,'Ecaterina','Stoica', 'F', '21-SEP-2014',10);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa) 
VALUES (105,'Mirela','Dascalu', 'F', '19-JUN-2014',10);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (106,'Bogdan','Ardei', 'M', '5-DEC-2014',10);

INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (111,'Stefan','Florescu', 'M', '14-AUG-2014',11);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (112,'Luiza','Proca', 'F', '24-MAY-2014',11);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (113,'Geanina','Smeureanu', 'F', '8-NOV-2014',11);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (114,'Victoria','Vadim', 'F', '12-JUL-2014',11);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (115,'Denis','Slav', 'M', '19-APR-2014',11);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (116,'Arina','Gene', 'F', '28-MAR-2014',11);

INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (201,'Valentina','Teodorescu', 'F', '28-MAR-2013',20);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (202,'Ion','Mihai', 'M', '17-JAN-2013',20);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (203,'Raluca','Dumitrache', 'F', '10-JUL-2013',20);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (204,'Valeria','Stoica', 'F', '15-APR-2013',20);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (205,'Tiberiu','Mocanu', 'M', '23-JUL-2013',20);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (206,'Petru','Ioveanu', 'M', '05-MAY-2013',20);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (207,'Liviu','Mircea', 'M', '30-AUG-2013',20);

INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (211,'Ionel','Gobor', 'M', '14-OCT-2013',21);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (212,'Marius','Oprea', 'M', '6-FEB-2013',21);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (213,'Ovidiu','Dunas', 'M', '12-SEP-2013',21);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (214,'Sebastian','Petram', 'M', '28-JUL-2013',21);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (215,'Vasilica','Vasile', 'F', '21-NOV-2013',21);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (216,'Sanda','Adam', 'F', '19-OCT-2013',21);

INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (301,'Tudor','Vladimirescu', 'M', '14-OCT-2012',30);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (302,'Ala','Lupei', 'F', '2-FEB-2012',30);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (303,'Violeta','Scrisu', 'F', '02-DEC-2012',30);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (304,'Pavel','Bartos', 'M', '23-JUL-2012',30);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (305,'Diana','Muntea', 'F', '27-NOV-2012',30);

INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (311,'Iulian','Faurar', 'M', '5-APR-2012',31);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (312,'Corina','Stoian', 'F', '12-NOV-2012',31);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (313,'Ela','Faurar', 'F', '5-APR-2012',31);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (314,'Luminita','Constantinescu', 'F', '13-JUL-2012',31);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (315,'Lorand','Balan', 'M', '16-JAN-2012',31);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (316,'Nelu','Dalca', 'M', '1-JAN-2012',31);

INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (401,'Ileana','Ungur', 'F', '21-SEP-2011',40);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (402,'Jeni','Popescu', 'F', '26-JAN-2011',40);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (403,'Tudor','Andronic', 'M', '14-JAN-2011',40);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (404,'Robert','Ungur', 'M', '14-JAN-2011',40);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (405,'Hortensia','Grosu', 'F', '5-APR-2010',40);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (406,'Gabi','Cosmescu', 'M', '19-MAY-2011',40);

INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (411,'Horia','Brenciu', 'M', '9-SEP-2010',41);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (412,'Iacob','Matache', 'M', '22-APR-2010',41); 
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (413,'Nicoleta','Matei', 'F', '12-FEB-2011',41);
INSERT INTO elevi (id_elev, prenume, nume, sex, data_nastere, id_clasa)
VALUES (414,'Lidia','Fortuna', 'F', '16-NOV-2011',41);

--Introducerea valorilor in tabela discipline
INSERT INTO discipline (id_disciplina, denumire_disciplina)
VALUES ('1', 'Limba Romana');
INSERT INTO discipline (id_disciplina, denumire_disciplina)
VALUES ('2', 'Matematica');
INSERT INTO discipline (id_disciplina, denumire_disciplina)
VALUES ('3', 'Istoria');
INSERT INTO discipline (id_disciplina, denumire_disciplina)
VALUES ('4', 'Stiinte');
INSERT INTO discipline (id_disciplina, denumire_disciplina)
VALUES ('5', 'Geografie');
INSERT INTO discipline (id_disciplina, denumire_disciplina)
VALUES ('6', 'Arta');
INSERT INTO discipline (id_disciplina, denumire_disciplina)
VALUES ('7', 'Muzica');
INSERT INTO discipline (id_disciplina, denumire_disciplina)
VALUES ('8', 'Religie');
INSERT INTO discipline (id_disciplina, denumire_disciplina)
VALUES ('9', 'Educatia Civica');
INSERT INTO discipline (id_disciplina, denumire_disciplina)
VALUES ('10', 'Educatia Fizica');
INSERT INTO discipline (id_disciplina, denumire_disciplina)
VALUES ('11', 'Informatica');
INSERT INTO discipline (id_disciplina, denumire_disciplina)
VALUES ('12', 'Limba Engleza');
INSERT INTO discipline (id_disciplina, denumire_disciplina)
VALUES ('13', 'Limba Franceza');

-- Introducerea valorilor in tabela reusita_elev
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (101, '1',07, 'evaluare', 8.5, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (101, '2',07, 'evaluare', 9, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (101, '6',07, 'evaluare',9.6, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (101, '9',07, 'evaluare', 7.1, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (101, '10',17, 'evaluare', 10, '10-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (102, '1',07, 'evaluare', 9, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (102, '2',07, 'evaluare', 9, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (102, '6',07, 'evaluare',9.6, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (102, '9',07, 'evaluare', 7.1, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (102, '10',17, 'evaluare', 10, '10-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (103, '1',07, 'evaluare', 9.2, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (103, '2',07, 'evaluare', 8.45, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (103, '6',07, 'evaluare',10, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (103, '9',07, 'evaluare', 9, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (103, '10',17, 'evaluare', 9, '10-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (104, '1',07, 'evaluare', 10, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (104, '2',07, 'evaluare',10, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (104, '6',07, 'evaluare',10, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (104, '9',07, 'evaluare', 10, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (104, '10',17, 'evaluare', 10, '10-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (105, '1',07, 'evaluare', 9, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (105, '2',07, 'evaluare', 6, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (105, '6',07, 'evaluare',8, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (105, '9',07, 'evaluare', 7, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (105, '10',17, 'evaluare', 8, '10-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (106, '1',07, 'evaluare', 8.45, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (106, '2',07, 'evaluare', 9.68, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (106, '6',07, 'evaluare',8.52, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (106, '9',07, 'evaluare', 9.36, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (106, '10',17, 'evaluare', 8, '10-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (111, '1',08, 'evaluare', 9.7, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (111, '2',08, 'evaluare', 10, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (111, '6',08, 'evaluare',9.46, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (111, '9',08, 'evaluare', 9.32, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (111, '10',17, 'evaluare', 10, '10-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (112, '1',08, 'evaluare', 8.55, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (112, '2',08, 'evaluare', 9.30, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (112, '6',08, 'evaluare',8.90, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (112, '9',08, 'evaluare', 6.2, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (112, '10',17, 'evaluare', 9, '10-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (113, '1',08, 'evaluare', 7.5, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (113, '2',08, 'evaluare', 7, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (113, '6',08, 'evaluare',9, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (113, '9',08, 'evaluare', 8, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (113, '10',17, 'evaluare', 9, '10-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (114, '1',08, 'evaluare', 6.3, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (114, '2',08, 'evaluare', 7, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (114, '6',08, 'evaluare',6, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (114, '9',08, 'evaluare', 10, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (114, '10',17, 'evaluare', 7, '10-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (115, '1',08, 'evaluare', 10, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (115, '2',08, 'evaluare', 9, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (115, '6',08, 'evaluare',10, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (115, '9',08, 'evaluare', 10, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (115, '10',17, 'evaluare', 10, '10-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (116, '1',08, 'evaluare', 6.3, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (116, '2',08, 'evaluare', 5, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (116, '6',08, 'evaluare',7, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (116, '9',08, 'evaluare', 6, '10-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (116, '10',17, 'evaluare', 10, '10-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (201, '1',09, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (201, '2',09, 'evaluare', 5, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (201, '3',09, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (201, '4',09, 'evaluare', 8, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (201, '6',09, 'evaluare',10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (201, '9',09, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (201, '10',17, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (201, '13',15, 'evaluare', 9, '9-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (202, '1',09, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (202, '2',09, 'evaluare', 8, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (202, '3',09, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (202, '4',09, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (202, '6',09, 'evaluare',9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (202, '9',09, 'evaluare', 8, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (202, '10',17, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (202, '13',15, 'evaluare', 10, '9-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (203, '1',09, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (203, '2',09, 'evaluare', 8, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (203, '3',09, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (203, '4',09, 'evaluare', 8, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (203, '6',09, 'evaluare',10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (203, '9',09, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (203, '10',17, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (203, '13',15, 'evaluare', 9, '9-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (204, '1',09, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (204, '2',09, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (204, '3',09, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (204, '4',09, 'evaluare', 8, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (204, '6',09, 'evaluare',10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (204, '9',09, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (204, '10',17, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (204, '13',15, 'evaluare', 10, '9-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (205, '1',09, 'evaluare', 8, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (205, '2',09, 'evaluare', 7, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (205, '3',09, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (205, '4',09, 'evaluare', 8, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (205, '6',09, 'evaluare',9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (205, '9',09, 'evaluare', 8, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (205, '10',17, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (205, '13',15, 'evaluare', 9, '9-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (206, '1',09, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (206, '2',09, 'evaluare', 7, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (206, '3',09, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (206, '4',09, 'evaluare', 4, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (206, '6',09, 'evaluare',7, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (206, '9',09, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (206, '10',17, 'evaluare', 6, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (206, '13',15, 'evaluare', 9, '9-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (211, '1',10, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (211, '2',10, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (211, '3',10, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (211, '4',10, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (211, '6',10, 'evaluare',10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (211, '9',10, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (211, '10',17, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (211, '13',16, 'evaluare', 10, '9-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (212, '1',10, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (212, '2',10, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (212, '3',10, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (212, '4',10, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (212, '6',10, 'evaluare',10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (212, '9',10, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (212, '10',17, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (212, '13',16, 'evaluare', 9, '9-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (213, '1',10, 'evaluare', 7, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (213, '2',10, 'evaluare', 8, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (213, '3',10, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (213, '4',10, 'evaluare', 7, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (213, '6',10, 'evaluare',10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (213, '9',10, 'evaluare', 7, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (213, '10',17, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (213, '13',16, 'evaluare', 6, '9-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (214, '1',10, 'evaluare', 6, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (214, '2',10, 'evaluare', 4, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (214, '3',10, 'evaluare', 5, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (214, '4',10, 'evaluare', 5, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (214, '6',10, 'evaluare',5, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (214, '9',10, 'evaluare', 7, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (214, '10',17, 'evaluare', 5, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (214, '13',16, 'evaluare', 4, '9-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (215, '1',10, 'evaluare', 4, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (215, '2',10, 'evaluare', 4, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (215, '3',10, 'evaluare', 3, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (215, '4',10, 'evaluare', 2, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (215, '6',10, 'evaluare',5, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (215, '9',10, 'evaluare', 3, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (215, '10',17, 'evaluare', 2, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (215, '13',16, 'evaluare', 4, '9-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (216, '1',10, 'evaluare', 7, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (216, '2',10, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (216, '3',10, 'evaluare', 10, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (216, '4',10, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (216, '6',10, 'evaluare',9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (216, '9',10, 'evaluare', 9, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (216, '10',17, 'evaluare', 8, '9-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (216, '13',16, 'evaluare', 9, '9-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (301, '1',11, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (301, '2',11, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (301, '3',11, 'evaluare', 7, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (301, '4',11, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (301, '5',11, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (301, '6',11, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (301, '9',11, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (301, '10',17, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (301, '13',15, 'evaluare', 9, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (302, '1',11, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (302, '2',11, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (302, '3',11, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (302, '4',11, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (302, '5',11, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (302, '6',11, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (302, '9',11, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (302, '10',17, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (302, '13',15, 'evaluare', 8, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (303, '1',11, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (303, '2',11, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (303, '3',11, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (303, '4',11, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (303, '5',11, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (303, '6',11, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (303, '9',11, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (303, '10',17, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (303, '13',15, 'evaluare', 10, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (305, '1',11, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (305, '2',11, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (305, '3',11, 'evaluare', 7, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (305, '4',11, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (305, '5',11, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (305, '6',11, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (305, '9',11, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (305, '10',17, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (305, '13',15, 'evaluare', 9, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (311, '1',12, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (311, '2',12, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (311, '3',12, 'evaluare', 7, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (311, '4',12, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (311, '5',12, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (311, '6',12, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (311, '9',12, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (311, '10',17, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (311, '13',16, 'evaluare', 9, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (312, '1',12, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (312, '2',12, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (312, '3',12, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (312, '4',12, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (312, '5',12, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (312, '6',12, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (312, '9',12, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (312, '10',17, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (312, '13',16, 'evaluare', 9, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (313, '1',12, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (313, '2',12, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (313, '3',12, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (313, '4',12, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (313, '5',12, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (313, '6',12, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (313, '9',12, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (313, '10',17, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (313, '13',16, 'evaluare', 9, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (314, '1',12, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (314, '2',12, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (314, '3',12, 'evaluare', 7, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (314, '4',12, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (314, '5',12, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (314, '6',12, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (314, '9',12, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (314, '10',17, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (314, '13',16, 'evaluare', 9, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (315, '1',12, 'evaluare', 4, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (315, '2',12, 'evaluare', 5, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (315, '3',12, 'evaluare', 4, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (315, '4',12, 'evaluare', 3, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (315, '5',12, 'evaluare', 5, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (315, '6',12, 'evaluare', 6, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (315, '9',12, 'evaluare', 5, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (315, '10',17, 'evaluare', 5, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (315, '13',16, 'evaluare', 4, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (316, '1',12, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (316, '2',12, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (316, '3',12, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (316, '4',12, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (316, '5',12, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (316, '6',12, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (316, '9',12, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (316, '10',17, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (316, '13',16, 'evaluare', 10, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (401, '1',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (401, '2',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (401, '3',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (401, '4',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (401, '5',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (401, '6',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (401, '7',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (401, '8',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (401, '9',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (401, '10',17, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (401, '12',15, 'evaluare', 10, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (402, '1',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (402, '2',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (402, '3',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (402, '4',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (402, '5',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (402, '6',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (402, '7',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (402, '8',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (402, '9',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (402, '10',17, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (402, '12',15, 'evaluare', 10, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (403, '1',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (403, '2',13, 'evaluare', 7, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (403, '3',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (403, '4',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (403, '5',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (403, '6',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (403, '7',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (403, '8',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (403, '9',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (403, '10',17, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (403, '12',15, 'evaluare', 10, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (405, '1',13, 'evaluare', 7, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (405, '2',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (405, '3',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (405, '4',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (405, '5',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (405, '6',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (405, '7',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (405, '8',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (405, '9',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (405, '10',17, 'evaluare', 7, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (405, '12',15, 'evaluare', 10, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (406, '1',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (406, '2',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (406, '3',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (406, '4',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (406, '5',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (406, '6',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (406, '7',13, 'evaluare', 7, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (406, '8',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (406, '9',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (406, '10',17, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (406, '12',15, 'evaluare', 10, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (411, '1',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (411, '2',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (411, '3',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (411, '4',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (411, '5',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (411, '6',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (411, '7',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (411, '8',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (411, '9',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (411, '10',17, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (411, '13',16, 'evaluare', 9, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (412, '1',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (412, '2',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (412, '3',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (412, '4',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (412, '5',13, 'evaluare', 7, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (412, '6',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (412, '7',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (412, '8',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (412, '9',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (412, '10',17, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (412, '13',16, 'evaluare', 9, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (413, '1',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (413, '2',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (413, '3',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (413, '4',13, 'evaluare', 7, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (413, '5',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (413, '6',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (413, '7',13, 'evaluare', 10, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (413, '8',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (413, '9',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (413, '10',17, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (413, '13',16, 'evaluare', 9, '8-DEC-2021');

INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (414, '1',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (414, '2',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (414, '3',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (414, '4',13, 'evaluare', 7, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (414, '5',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (414, '6',13, 'evaluare', 8, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (414, '7',13, 'evaluare', 7, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (414, '8',13, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (414, '9',13, 'evaluare', 6, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (414, '10',17, 'evaluare', 9, '8-DEC-2021');
INSERT INTO reusita_elev (id_elev, id_disciplina, id_angajat, tip_evaluare, nota, data_evaluare)
VALUES (414, '13',16, 'evaluare', 8, '8-DEC-2021');

--Marirea salariului cu 10% a salariatului cu cel mai mic salariu 
UPDATE angajati_proiect
SET salariul=salariul+(salariul * 0.1)
WHERE id_angajat IN (
SELECT id_angajat
FROM angajati_proiect
WHERE salariul=(SELECT MIN(salariul) FROM angajati_proiect)
GROUP BY id_angajat);

--Stergere disciplina cu id-ul 11
DELETE FROM discipline
WHERE id_disciplina=11;

--Afisarea listei cu invatatorii care au clase
SELECT a.nume, a.prenume , c.denumire_clasa
FROM angajati_proiect a, clase c
WHERE a.id_angajat=c.id_angajat;












