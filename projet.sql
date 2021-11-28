--SUPPRESSION DES TABLES

DROP TABLE IF EXISTS hebergement CASCADE;
DROP TABLE IF EXISTS saison CASCADE;
DROP TABLE IF EXISTS prestation CASCADE;
DROP TABLE IF EXISTS soins CASCADE;
DROP TABLE IF EXISTS etape CASCADE;
DROP TABLE IF EXISTS cure CASCADE;
DROP TABLE IF EXISTS weekend CASCADE;
DROP TABLE IF EXISTS objectif CASCADE;
DROP TABLE IF EXISTS criteres CASCADE;
DROP TABLE IF EXISTS periode CASCADE;
DROP TABLE IF EXISTS client CASCADE;
DROP TABLE IF EXISTS tarifhebergement CASCADE;
DROP TABLE IF EXISTS tarifprestation CASCADE;
DROP TABLE IF EXISTS contient CASCADE;
DROP TABLE IF EXISTS compose CASCADE;
DROP TABLE IF EXISTS possede CASCADE;
DROP TABLE IF EXISTS reservation CASCADE;

--CREATION DES TABLES

CREATE TABLE hebergement(
	idChambre int PRIMARY KEY,
	situation varchar(50),	
	typeChambre varchar(50)
);

CREATE TABLE saison(
	idSaison varchar(10) PRIMARY KEY,
	annee int,		
	libelleSa varchar(50)
);

CREATE TABLE prestation(
	codePresta varchar(10) PRIMARY KEY,
	nomPresta varchar(50)
);

CREATE TABLE soins(
	codeSoins varchar(10) PRIMARY KEY,		
	libelleSo varchar(50),
	dureeEstimee int,
	effectifMax int
);

CREATE TABLE etape(
	numEtape int PRIMARY KEY,
	description varchar(80),
	dureeEtape int
);

CREATE TABLE cure(
	idCure varchar(10) PRIMARY KEY,
	nomCure varchar(50),
	description varchar(250),
	codePresta varchar(10),
	FOREIGN KEY (codePresta) REFERENCES prestation(codePresta) 
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE weekend(
	idWE varchar(10) PRIMARY KEY,
	nomWE varchar(50),
	codePresta varchar(10),
	FOREIGN KEY (codePresta) REFERENCES prestation(codePresta) 
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE objectif (
	idObj varchar(10) PRIMARY KEY,
	libelleO varchar(50)
);

CREATE TABLE criteres(
	idCri varchar(10) PRIMARY KEY,
	libelle varchar(50),
	idCure varchar(10),
	FOREIGN KEY (idCure) REFERENCES cure(idCure) 
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE periode(
	idPeriode varchar(10) PRIMARY KEY,
	debut date NOT NULL,
	fin date NOT NULL,
	idSaison varchar(10),
	FOREIGN KEY (idSaison) REFERENCES saison(idSaison) 
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE client(
	idCli varchar(20) PRIMARY KEY,		
	motdepasse varchar(8),
	numtel varchar(10)
);

CREATE TABLE tarifHebergement(
	idSaison varchar(10),
	idChambre int,
	tarifH int NOT NULL,
	PRIMARY KEY(idSaison,idChambre),
	FOREIGN KEY (idSaison) REFERENCES saison(idSaison) 
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idChambre) REFERENCES hebergement(idChambre) 
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tarifPrestation(
	idSaison varchar(10),
	codePresta varchar(10),
	tarifP int NOT NULL,
	PRIMARY KEY(idSaison, codePresta),
	FOREIGN KEY(idSaison) REFERENCES saison(idSaison) 
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(codePresta) REFERENCES prestation(codePresta) 
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE contient(
	codePresta varchar(10),
	codeSoins varchar(10),
	quantite int,
	PRIMARY KEY(codePresta, codeSoins),
	FOREIGN KEY(codePresta) REFERENCES prestation(codePresta) 
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(codeSoins) REFERENCES soins(codeSoins) 
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE compose(
	codeSoins varchar(10),
	numEtape int,
	PRIMARY KEY(codeSoins, numEtape),
	FOREIGN KEY(codeSoins) REFERENCES soins(codeSoins) 
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(numEtape) REFERENCES etape(numEtape) 
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE possede(
	idCure varchar(10),
	idObj varchar(10),
	PRIMARY KEY(idCure, idObj),
	FOREIGN KEY(idCure) REFERENCES cure(idCure) 
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(idObj) REFERENCES objectif(idObj) 
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE reservation(
	idcli varchar(20),
	idchambre int,
	arrivee date,
	depart date,
	PRIMARY KEY(idcli, idchambre),
	FOREIGN KEY(idcli) REFERENCES client(idcli)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(idchambre) REFERENCES hebergement(idchambre)
	ON DELETE CASCADE ON UPDATE CASCADE
);

--INSERTION DES VALEURS DANS LES TABLES


--table hebergement

INSERT INTO hebergement VALUES (1, 'Mer', 'standard double');
INSERT INTO hebergement VALUES (2, 'Rue', 'confort simple');
INSERT INTO hebergement VALUES (3, 'Jardin', 'standard simple');
INSERT INTO hebergement VALUES (4, 'Jardin', 'standard double');
INSERT INTO hebergement VALUES (5, 'Mer', 'confort double');
INSERT INTO hebergement VALUES (6, 'Mer', 'suite');
INSERT INTO hebergement VALUES (7, 'Jardin', 'suite');
INSERT INTO hebergement VALUES (8, 'Rue', 'standard double');
INSERT INTO hebergement VALUES (9, 'Rue', 'standard simple');
INSERT INTO hebergement VALUES (10, 'Mer', 'standard simple');

--table saison

INSERT INTO saison VALUES ('HIV08', 2008, 'Saison hivernal 2008');
INSERT INTO saison VALUES ('BAS08', 2008, 'Basse saison 2008');
INSERT INTO saison VALUES ('MOY08', 2008, 'Moyenne saison 2008');
INSERT INTO saison VALUES ('HAU08', 2008, 'Haute saison 2008');
INSERT INTO saison VALUES ('HIV09', 2009, 'Hivernal 2009');
INSERT INTO saison VALUES ('BAS09', 2009, 'Basse saison 2009');
INSERT INTO saison VALUES ('MOY09', 2009, 'Moyenne saison 2009');
INSERT INTO saison VALUES ('HAU09', 2009, 'Haute saison 2009');

--table prestation

INSERT INTO prestation VALUES ('BE42', 'Bien-etre');
INSERT INTO prestation VALUES ('REF101', 'Remise en forme');
INSERT INTO prestation VALUES ('SA51', 'Sante');
INSERT INTO prestation VALUES ('AM55', 'Amincissement');
INSERT INTO prestation VALUES ('PN98', 'Postnatal');
INSERT INTO prestation VALUES ('AA54', 'Anti-age');
INSERT INTO prestation VALUES ('SDD12', 'Sante du dos');
INSERT INTO prestation VALUES ('SDJ10', 'Sante des jambes');
INSERT INTO prestation VALUES ('DE65', 'Detente');
INSERT INTO prestation VALUES ('BF201', 'Beaute-Fraicheur');

--table soins

INSERT INTO soins VALUES ('EVA83', 'Enveloppement d algues', 240, 12);
INSERT INTO soins VALUES ('MT01', 'Massage tonique', 60, NULL);
INSERT INTO soins VALUES ('MP45', 'Massage des pieds', 20, 3);
INSERT INTO soins VALUES ('AQB86', 'Aquabike', 55, 30);
INSERT INTO soins VALUES ('TDC88', 'Tapis de course', 30, 6);
INSERT INTO soins VALUES ('VEL89', 'Velo', 30, 6);
INSERT INTO soins VALUES ('SA44', 'Sauna', 45, 24);
INSERT INTO soins VALUES ('GO96', 'Gommage', 10, NULL);
INSERT INTO soins VALUES ('MSB22', 'Massage special bebe', 25, NULL);
INSERT INTO soins VALUES ('MAM54', 'Massage avec musique relaxante', 60, 7);
INSERT INTO soins VALUES ('MAN32', 'Massage normaux', 60, 7);
INSERT INTO soins VALUES ('MAR12', 'Massage relaxants', 60, 7);
INSERT INTO soins VALUES ('DAA02', 'Douche a affusion', 15, 1);
INSERT INTO soins VALUES ('BBA04', 'Bains bouillonnants algues', 25, 3);
INSERT INTO soins VALUES ('SHV05', 'Soin hydratant du visage', 10, 10);
INSERT INTO soins VALUES ('DSM06', 'Douche sous-marines', 15, 1);
INSERT INTO soins VALUES ('BH98', 'Bain hydromassants', 25, 1);
INSERT INTO soins VALUES ('MA99', 'Manucure', 30, 15);
INSERT INTO soins VALUES ('SP16', 'Soin des pieds', 30, 7);

--table contient

INSERT INTO contient VALUES ('BE42', 'MAN32', 3);
INSERT INTO contient VALUES ('BE42', 'MAR12', 3);
INSERT INTO contient VALUES ('BE42', 'DAA02', 3);
INSERT INTO contient VALUES ('BE42', 'BBA04', 3);
INSERT INTO contient VALUES ('BE42', 'SHV05', 1);
INSERT INTO contient VALUES ('BE42', 'EVA83', 3);
INSERT INTO contient VALUES ('BE42', 'DSM06', 3);
INSERT INTO contient VALUES ('BE42', 'BH98', 3);
INSERT INTO contient VALUES ('BE42', 'MA99', 1);
INSERT INTO contient VALUES ('BE42', 'SP16', 1);
INSERT INTO contient VALUES ('REF101', 'TDC88', 7);
INSERT INTO contient VALUES ('REF101', 'VEL89', 7);
INSERT INTO contient VALUES ('REF101', 'AQB86', 7);
INSERT INTO contient VALUES ('REF101', 'MAN32', 7);
INSERT INTO contient VALUES ('REF101', 'MT01', 3);
INSERT INTO contient VALUES ('SA51', 'MAM54', 3);
INSERT INTO contient VALUES ('SA51', 'MAR12', 3);
INSERT INTO contient VALUES ('SA51', 'DAA02', 4);
INSERT INTO contient VALUES ('SA51', 'BBA04', 2);
INSERT INTO contient VALUES ('SA51', 'SHV05', 5);
INSERT INTO contient VALUES ('AM55', 'VEL89', 7);
INSERT INTO contient VALUES ('AM55', 'MT01', 3);
INSERT INTO contient VALUES ('AM55', 'MAM54', 7);
INSERT INTO contient VALUES ('AM55', 'BH98', 4);
INSERT INTO contient VALUES ('AM55', 'SA44', 2);
INSERT INTO contient VALUES ('PN98', 'EVA83', 3);
INSERT INTO contient VALUES ('PN98', 'MP45', 3);
INSERT INTO contient VALUES ('PN98', 'AQB86', 3);
INSERT INTO contient VALUES ('PN98', 'GO96', 5);
INSERT INTO contient VALUES ('PN98', 'MSB22', 3);
INSERT INTO contient VALUES ('PN98', 'MAM54', 3);
INSERT INTO contient VALUES ('PN98', 'MAR12', 3);
INSERT INTO contient VALUES ('PN98', 'SHV05', 3);
INSERT INTO contient VALUES ('PN98', 'MA99', 1);
INSERT INTO contient VALUES ('AA54', 'EVA83', 7);
INSERT INTO contient VALUES ('AA54', 'GO96', 5);
INSERT INTO contient VALUES ('AA54', 'MAM54', 3);
INSERT INTO contient VALUES ('AA54', 'MAR12', 3);
INSERT INTO contient VALUES ('AA54', 'SHV05', 3);
INSERT INTO contient VALUES ('AA54', 'DAA02', 2);
INSERT INTO contient VALUES ('SDD12', 'MT01', 3);
INSERT INTO contient VALUES ('SDD12', 'MAN32', 3);
INSERT INTO contient VALUES ('SDD12', 'MAR12', 3);
INSERT INTO contient VALUES ('SDD12', 'DAA02', 2);
INSERT INTO contient VALUES ('SDD12', 'DSM06', 4);
INSERT INTO contient VALUES ('SDJ10', 'MT01', 3);
INSERT INTO contient VALUES ('SDJ10', 'MAN32', 3);
INSERT INTO contient VALUES ('SDJ10', 'DAA02', 2);
INSERT INTO contient VALUES ('SDJ10', 'DSM06', 4);
INSERT INTO contient VALUES ('SDJ10', 'MP45', 7);
INSERT INTO contient VALUES ('SDJ10', 'SP16', 7);
INSERT INTO contient VALUES ('DE65', 'EVA83', 3);
INSERT INTO contient VALUES ('DE65', 'MAR12', 3);
INSERT INTO contient VALUES ('DE65', 'DAA02', 3);
INSERT INTO contient VALUES ('DE65', 'BBA04', 3);
INSERT INTO contient VALUES ('DE65', 'SHV05', 1);
INSERT INTO contient VALUES ('DE65', 'DSM06', 3);
INSERT INTO contient VALUES ('DE65', 'BH98', 3);
INSERT INTO contient VALUES ('BF201', 'EVA83', 3);
INSERT INTO contient VALUES ('BF201', 'DAA02', 3);
INSERT INTO contient VALUES ('BF201', 'BBA04', 3);
INSERT INTO contient VALUES ('BF201', 'SHV05', 1);
INSERT INTO contient VALUES ('BF201', 'DSM06', 3);
INSERT INTO contient VALUES ('BF201', 'BH98', 3);
INSERT INTO contient VALUES ('BF201', 'MA99', 1);

--table etape

INSERT INTO etape VALUES (10, 'Douche froide haute pression', 10);
INSERT INTO etape VALUES (11, 'Douche chaude haute pression', 10);
INSERT INTO etape VALUES (12, 'Masque a la boue', 15);
INSERT INTO etape VALUES (13, 'Sterilisation des mains', 5);
INSERT INTO etape VALUES (14, 'Application d huiles', 25);
INSERT INTO etape VALUES (15, 'Application de cremes hydratantes', 20);

--table compose

INSERT INTO compose VALUES ('MT01', 14);
INSERT INTO compose VALUES ('MP45', 14);
INSERT INTO compose VALUES ('MP45', 15);
INSERT INTO compose VALUES ('GO96', 15);
INSERT INTO compose VALUES ('GO96', 12);
INSERT INTO compose VALUES ('MSB22', 13);
INSERT INTO compose VALUES ('MAM54', 14);

--table cure

INSERT INTO cure VALUES ('BE1', 'Bien-etre', 'Cette cure bien-etre rassemble les essentiels
de la thalassotherapie pour retrouver les sources de l energie vitale et evacuer les tensions', 'BE42');
INSERT INTO cure VALUES ('REF1', 'Remise en forme', 'Une cure de remise en forme en 
thalasso vous plongera dans un univers de bien etre absolu. Entouré de pros, vous 
(re-)apprendrez a aimer le sport et l exercice physique entre deux pauses cocooning', 'REF101');
INSERT INTO cure VALUES ('S1', 'Santé', 'Cette cure sante vous permettra de soigner et de soulager
vos problemes de sante a l aide d eau minerale provenant d une source naturelle', 'SA51');
INSERT INTO cure VALUES ('A1', 'Amincissement', 'Drainer, destocker, sculpter, raffermir… 
Voila ce que les protocoles thalasso de cette cure amincissement assurent. Soins nouvelle generation, 
relation emotionnelle a la nourriture, sport dans ses grandes largeurs', 'AM55');
INSERT INTO cure VALUES ('PN1', 'Postnatale', 'La cure postnatale pour jeune maman apporte les
benefices d une cure de remise en forme et de bien etre pour lutter contre le baby blues de la jeune mere', 'PN98');
INSERT INTO cure VALUES ('AA1', 'Anti-age', 'La cure Anti-age, grace a un coaching individuel en synergie
avec les protocoles de soins et des produits haute technologie, stimule la reparation des tissus, 
permet de corriger et prevenir les signes du vieillissement sur le visage et le corps', 'AA54');
INSERT INTO cure VALUES ('SDD1', 'Sante du dos', 'Cette cure sante du dos propose massages et jets 
decontractants, applications de boues antalgiques et seances coachees de posturologie, avec un 
accompagnement personnalise pour le renforcement musculaire et le soulagement des tensions du dos', 'SDD12');
INSERT INTO cure VALUES ('SDJ1', 'Sante des jambes', 'Cette cure sante des jambes propose un programme
complet de soins drainants et stimulants qui permettent d ameliorer la dynamique circulatoire des 
jambes et eviter la sensation de lourdeur dans les jambes en fin de journee', 'SDJ10');

--table weekend

INSERT INTO weekend VALUES ('D1', 'Detente', 'DE65');
INSERT INTO weekend VALUES ('BF1', 'Beaute-fraicheur', 'BF201');

--table critere

INSERT INTO criteres VALUES ('AM551', 'tour de taille', 'A1');
INSERT INTO criteres VALUES ('AM552', 'tour de hanche', 'A1');
INSERT INTO criteres VALUES ('AM553', 'tour de cuisse', 'A1');
INSERT INTO criteres VALUES ('AM554', 'tour de poinget', 'A1');
INSERT INTO criteres VALUES ('AM555', 'taille', 'A1');
INSERT INTO criteres VALUES ('AM556', 'poids', 'A1');

--table objectif

INSERT INTO objectif VALUES ('PP', 'perte de poids'); 
INSERT INTO objectif VALUES ('DE', 'detente');
INSERT INTO objectif VALUES ('RA', 'raffermissement');
INSERT INTO objectif VALUES ('REE', 'reeducation');
INSERT INTO objectif VALUES ('CI', 'cicatrisation');

--table periode

INSERT INTO periode VALUES ('A0801','2008-01-15','2008-02-04','HIV08');
INSERT INTO periode VALUES ('A0802','2008-02-05','2008-03-25','BAS08');
INSERT INTO periode VALUES ('A0810','2008-10-08','2008-12-02','BAS08');
INSERT INTO periode VALUES ('A0803','2008-03-26','2008-07-08','MOY08');
INSERT INTO periode VALUES ('A0809','2008-09-24','2008-10-07','MOY08');
INSERT INTO periode VALUES ('A0807','2008-07-09','2008-09-23','HAU08');
INSERT INTO periode VALUES ('A0901','2009-01-03','2009-02-20','HIV09');
INSERT INTO periode VALUES ('A0902','2009-02-21','2009-04-25','BAS09');
INSERT INTO periode VALUES ('A0910','2009-10-19','2009-12-04','BAS09');
INSERT INTO periode VALUES ('A0904','2009-04-26','2009-07-12','MOY09');
INSERT INTO periode VALUES ('A0909','2009-09-30','2009-10-18','MOY09');
INSERT INTO periode VALUES ('A0907','2009-07-13','2009-09-29','HAU09');

--table tarifhebergement

INSERT INTO tarifhebergement VALUES ('HIV08', 1, 150);
INSERT INTO tarifhebergement VALUES ('HIV08', 10, 200);
INSERT INTO tarifhebergement VALUES ('BAS08', 6, 425);
INSERT INTO tarifhebergement VALUES ('BAS08', 5, 220);
INSERT INTO tarifhebergement VALUES ('MOY08', 3, 230);
INSERT INTO tarifhebergement VALUES ('MOY08', 4, 180);
INSERT INTO tarifhebergement VALUES ('HAU08', 2, 250);
INSERT INTO tarifhebergement VALUES ('HAU08', 9, 230);
INSERT INTO tarifhebergement VALUES ('HIV09', 9, 200);
INSERT INTO tarifhebergement VALUES ('HIV09', 2, 215);
INSERT INTO tarifhebergement VALUES ('BAS09', 4, 175);
INSERT INTO tarifhebergement VALUES ('BAS09', 3, 220);
INSERT INTO tarifhebergement VALUES ('MOY09', 5, 240);
INSERT INTO tarifhebergement VALUES ('MOY09', 6, 485);
INSERT INTO tarifhebergement VALUES ('HAU09', 10, 290);
INSERT INTO tarifhebergement VALUES ('HAU09', 1, 245);

--table tarifprestation

INSERT INTO tarifprestation VALUES ('HIV08', 'BE42', 440);
INSERT INTO tarifprestation VALUES ('HIV08', 'REF101', 395);
INSERT INTO tarifprestation VALUES ('BAS08', 'SA51', 480);
INSERT INTO tarifprestation VALUES ('BAS08', 'AM55', 500);
INSERT INTO tarifprestation VALUES ('MOY08', 'PN98', 410);
INSERT INTO tarifprestation VALUES ('MOY09', 'AA54', 430);
INSERT INTO tarifprestation VALUES ('HAU09', 'SDD12', 470);
INSERT INTO tarifprestation VALUES ('HAU09', 'SDJ10', 530);
INSERT INTO tarifprestation VALUES ('BAS09', 'DE65', 200);
INSERT INTO tarifprestation VALUES ('HAU09', 'BF201', 215);

--table possede

INSERT INTO possede VALUES ('A1', 'PP');
INSERT INTO possede VALUES ('REF1', 'PP');
INSERT INTO possede VALUES ('BE1', 'DE');
INSERT INTO possede VALUES ('S1', 'DE');
INSERT INTO possede VALUES ('PN1', 'DE');
INSERT INTO possede VALUES ('SDD1', 'DE');
INSERT INTO possede VALUES ('SDJ1', 'DE');
INSERT INTO possede VALUES ('AA1', 'DE');
INSERT INTO possede VALUES ('REF1', 'RA');
INSERT INTO possede VALUES ('A1', 'RA');
INSERT INTO possede VALUES ('SDD1', 'RA');
INSERT INTO possede VALUES ('SDJ1', 'RA');
INSERT INTO possede VALUES ('SDD1', 'REE');
INSERT INTO possede VALUES ('SDJ1', 'REE');
INSERT INTO possede VALUES ('PN1', 'REE');
INSERT INTO possede VALUES ('S1', 'CI');
