CREATE TABLE etudiant (
id int(10) NOT NULL AUTO_INCREMENT,
nom varchar(50),
prenom varchar(50),
age int(3),
statut varchar(30),
credit int(5),
codePermanent varchar(30),
dateDeNaissance Date,
PRIMARY KEY (id)
);

CREATE TABLE telephone(
id int(10) NOT NULL AUTO_INCREMENT,
idDetudiant int(10) NOT NULL, 
indicatif varchar(10),
numero varchar(15),
principal bool,
cellulaire bool,
FOREIGN KEY (idDetudiant) REFERENCES etudiant (id),
PRIMARY KEY (id)
);

CREATE TABLE adresse(
id int(10) NOT NULL AUTO_INCREMENT,
idDetudiant int(10) NOT NULL,
numero varchar(10),
rue varchar(60),
ville varchar(20),
codePostal varchar(10),
province varchar(20),
pays varchar(20),
principale bool,
supprime bool,
FOREIGN KEY (idDetudiant) REFERENCES etudiant (id),
PRIMARY KEY (id)
);

INSERT INTO etudiant ( nom, prenom, age, statut, credit, codePermanent, dateDeNaissance) VALUES 
('Luke', 'Lucky', 85, 'Partiel', 3, 'LUCL2504584', '1937-05-06'), 
('Allen', 'Woody', 86, 'Plan', 21, 'WOOA8545788', '1933-07-08'),
('Mouse', 'Mickey', 22, 'Plan', 30, 'MICM7878802', '1990-11-08'),
('Duck', 'Donald', 28, 'Partiel', 2, 'DOND4512458','1990-11-09'),
('Tarrantino', 'Quentin', 58, 'Partiel', 18, 'Qeut2054854', '1965-05-06'),
('Morisson', 'Jim', 37, 'Plein', 3, 'JIM7878545', '1949-01-01'),
('John', 'Elton', 33, 'Partiel', 33, 'ELTJ2004584', '1970-12-15'),
('Star', 'Ringo', 47, 'Plein', 54, 'RINS8545662', '1932-07-22'),
('Lennon', 'John', 62, 'Partiel', 9, 'JOHL7802027', '1982-11-08'),
('Trump', 'Donald', 100, 'Plein', 0, 'DONT0254875', '1950-02-09'),
('Van Halen', 'Eddy', 65, 'Partiel', 21, 'EDYV3652698', '1965-05-06');

INSERT INTO telephone ( idDetudiant, indicatif, numero, principal, cellulaire) VALUES
(1, '518', '663-2545', TRUE, FALSE),
(1, '418', '663-2545', FALSE, TRUE),
(2, '514', '452-2125', TRUE, FALSE),
(3, '514', '452-5555', FALSE, TRUE),
(4, '418', '785-2251', TRUE, FALSE),
(5, '819', '452-0215', TRUE, FALSE),
(6, '819', '784-5252', TRUE, TRUE),
(6, '514', '456-2125', FALSE, FALSE),
(6, '418', '456-2125', FALSE, FALSE),
(7, '418', '555-2360', TRUE, TRUE),
(8, '514', '875-5850', TRUE, FALSE),
(9, '819', '458-0258', TRUE, TRUE),
(10, '819', '785-5541', TRUE, TRUE),
(11, '514', '774-5582', TRUE, FALSE),
(12, '514', '302-5520', TRUE, TRUE);

INSERT INTO adresse(idDetudiant,numero,rue,ville,codePostal,province,pays,principale,supprime) VALUES
(1, '1234', 'rue du Zoo', 'Quebec', 'G3C 4R5', 'Qucbec', 'Canada', TRUE, FALSE ),
(1, '1034', 'Blouvard Laurier', 'Quebec', 'G5G 4R5', 'Qucbec', 'Canada', FALSE, FALSE ),
(2, '1024', 'Avenue Diamond', 'Quebec', 'G5R 3C5', 'Qucbec', 'Canada', TRUE, FALSE ),
(3, '554', 'rue du Yanik', 'Quebec', 'G1C 2B3', 'Qucbec', 'Canada', TRUE, FALSE ),
(4, '1234', 'rue du Daiko', 'Quebec', 'G5G 3R5', 'Qucbec', 'Canada', TRUE, FALSE ),
(5, '1033', 'Boulevard Pascal', 'Montreal', 'G4H 4C6', 'Qucbec','Canada', TRUE, FALSE ),
(6, '3234', 'rue des Emoraudes', 'Quebec', 'G3H 6R5', 'Qucbec', 'Canada', TRUE, FALSE ),
(6, '134', 'rue Royal', 'Quebec', 'G3C 4R5', 'Qucbec', 'Canada', FALSE, FALSE ),
(7, '568', 'Boulevard Hochelaga ', 'Quebec', 'G3W 5R5', 'Qucbec', 'Canada', TRUE, FALSE ),
(8, '879', 'Avenue Lebourneuf ', 'Quebec', 'G8D 1R5', 'Qucbec', 'Canada', TRUE, FALSE ),
(8, '333', 'Avenue Pix-xii ', 'Quebec', 'G1W 3C4', 'Qucbec', 'Canada', FALSE, FALSE ),
(9, '9865', 'Boulevard Henri-Bourassa ', 'Montreal', 'G3R 1G3', 'Quebec', 'Canada', TRUE, FALSE) ,
(10, '1024', 'Chemin Ste-Foy ', 'Quebec', 'G8l 4R5', 'Qucbec', 'Canada', TRUE, FALSE ),
(11, '1506', 'Chemin Sain-Louis ', 'Quebec', 'G2T 1S5', 'Qucbec', 'Canada', TRUE, FALSE ),
(12, '879', 'Boulevard du Versant nord', 'Quebec', 'G3S 4G5', 'Qucbec', 'Canada', TRUE, FALSE );

ALTER TABLE etudiant ADD COLUMN telephone varchar(25);
ALTER TABLE etudiant ADD COLUMN postal varchar(10);

UPDATE etudiant E, telephone T
SET E.telephone = concat(T.indicatif,'-',T.numero)
WHERE T.idDetudiant = E.id AND T.principal=TRUE;

UPDATE etudiant E, adresse A
SET E.postal = A.codePostal
WHERE A.idDetudiant = E.id;

-- **Modification de donnee** -- 

UPDATE telephone SET indicatif='581',numero='999-1234' WHERE id=1 AND principal=TRUE;
UPDATE etudiant SET statut='Partiel' WHERE id=4;
UPDATE telephone SET numero='991-7899' WHERE id=2;
UPDATE adresse SET principale=FALSE WHERE id=10;
	UPDATE adresse SET principale=TRUE WHERE id=11;
UPDATE telephone SET indicatif='418', numero='456-6666' WHERE idDetudiant=5 AND principal=TRUE;
UPDATE telephone SET principal=TRUE WHERE id=1;
	UPDATE telephone SET principal=FALSE WHERE id=2;
UPDATE adresse 
SET numero='1879', rue='Boulevard Hochelaga', ville='Montreal', codePostal='T5F 5G6'
WHERE id=15 AND principale=TRUE;

UPDATE adresse 
SET idDetudiant=9
WHERE idDetudiant=10;
	UPDATE adresse
	SET principale=FALSE
	WHERE id=12;


-- **Suppression de donnee** --

	DELETE FROM telephone WHERE idDetudiant=3;
	DELETE FROM adresse WHERE idDetudiant=3;
DELETE FROM etudiant WHERE id=3;
DELETE FROM telephone WHERE id=9;
UPDATE adresse SET supprime=TRUE WHERE id=10;

-- **Modification de table** --

ALTER TABLE etudiant ADD COLUMN diplomeObtenu varchar(50);
ALTER TABLE etudiant ADD COLUMN anneeDiplomation date;
ALTER TABLE adresse ADD COLUMN compte varchar(30);
ALTER TABLE telephone ADD COLUMN maison bool;

-- **SELECT ion de donnee 1** --

SELECT  etudiant.* 
FROM etudiant 
INNER JOIN telephone 
WHERE etudiant.id=telephone.idDetudiant 
AND telephone.indicatif='514';

SELECT  * FROM etudiant 
INNER JOIN telephone
WHERE etudiant.id=telephone.idDetudiant;

SELECT  distinct nom, prenom, adresse.rue, adresse.numero, adresse.ville 
FROM etudiant 
INNER JOIN adresse 
WHERE etudiant.id=adresse.idDetudiant 
ORDER BY etudiant.prenom;

SELECT  distinct etudiant.id, nom, prenom, codePermanent, adresse.ville 
FROM etudiant
INNER JOIN adresse
WHERE etudiant.id=adresse.idDetudiant 
AND adresse.ville='Quebec'
AND age>=30
AND statut='partiel';

SELECT  numero 
FROM telephone
WHERE indicatif='819' 
AND principal=TRUE;

SELECT  nom, prenom, indicatif, telephone.numero 
FROM etudiant
INNER JOIN telephone
WHERE etudiant.id=telephone.idDetudiant
AND credit>12 
AND telephone.cellulaire=TRUE;

-- **SELECT ion de donner 2 **--

SELECT  distinct nom, prenom, codePermanent 
FROM etudiant
INNER JOIN adresse
WHERE ville='Quebec'
OR ville='Montreal';

SELECT  distinct nom, prenom, codePermanent 
FROM etudiant
INNER JOIN adresse
WHERE NOT pays='Canada';

SELECT  rue, ville
FROM adresse
WHERE codePostal='%R3W';

SELECT  distinct etudiant.*
FROM etudiant
INNER JOIN adresse
WHERE etudiant.id=adresse.idDetudiant;

SELECT  distinct adresse.*, indicatif, telephone.numero
FROM adresse
INNER JOIN telephone
WHERE adresse.idDetudiant=telephone.idDetudiant;

SELECT  nom, prenom, numero, rue, ville 
FROM etudiant
INNER JOIN adresse
WHERE etudiant.id=adresse.idDetudiant;

-- **SELECT ion de donnee 3 **-- 

SELECT  nom, prenom, codePermanent
FROM etudiant
WHERE age>30;

SELECT  nom, prenom, codePermanent, telephone.indicatif, telephone.numero
FROM etudiant
INNER JOIN telephone
WHERE telephone.idDetudiant=etudiant.id 
AND age > 35;

-- **






