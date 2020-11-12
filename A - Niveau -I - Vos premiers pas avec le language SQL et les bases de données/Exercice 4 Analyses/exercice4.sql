1. La base est vierge. Réalisez l'insertion d'un jeu de données dans les différentes

INSERT INTO typeanalyse (refTypeAnalyse, designation, prixTypeAnalyse)
 VALUES
 (25,'farine',12.5),
 (38,'sucre',15.7),
 (60,'lait',4); 

tables. Les données seront définies par vous-même à votre convenance.
2. Augmentez de 10% tous les prix des analyses.

UPDATE typeanalyse
SET prixTypeAnalyse =prixTypeAnalyse * 1.1

3. Il a été défini un prix plancher de 80 DHs pour toutes les analyses. Mettez à jour la
table ANALYSE.

UPDATE typeanalyse
SET prixTypeAnalyse =80

4. Aujourd'hui, toutes les analyses en cours ont été réalisées. Mettez à jour la base

UPDATE realiser
SET dateRealisation ='2020-10-09'

5. Le client dont le code est "c1" vient de fournir son numéro de téléphone
(0611111111). Mettre à jour la table correspondante.

UPDATE client
SET tel ='06 25 56 89 66' WHERE codeClient=002

6. Suite à un bug informatique, des entrées ont été saisies le 01 février 2007 au lieu du
1er février 2006. Mettez à jour la base.

UPDATE realiser
SET dateRealisation ='2020-10-09' WHERE  dateRealisation ='2020-10-05'

7. Afin de préparer la nouvelle campagne, de nouvelles analyses ont été définies.
Ces nouvelles analyses sont disponibles dans une table ANALYSECOLYSTEROL
dont la structure (champs, types de donnée) est identique à TYPEANALYSE. Mettez
à jour la table TYPEANALYSE à partir de la table ANALYSECOLYSTEROL

CREATE TABLE `ANALYSECOLYSTEROL` (
	`refTypeAnalyse` INT(8) NOT NULL AUTO_INCREMENT,
	`designation` VARCHAR(50) NULL DEFAULT NULL,
	`prixTypeAnalyse` FLOAT NULL DEFAULT NULL,
	PRIMARY KEY (`refTypeAnalyse`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=66
;
INSERT INTO typeanalyse
    SELECT  refTypeAnalyse,designation,prixTypeAnalyse
    FROM ANALYSECOLYSTEROL ; 