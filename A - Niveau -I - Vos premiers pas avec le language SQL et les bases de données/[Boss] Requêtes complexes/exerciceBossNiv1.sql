1) Obtenir l’utilisateur ayant le prénom "Muriel" et le mot de passe (en clair) "test11", sachant que
l’encodage du mot de passe est effectué avec l’algorithme Sha1.

SELECT *
FROM `client`
WHERE `prenom` = "Muriel" 
AND `password` = SHA1( "test11")

2) Obtenir la liste de tous les produits qui sont présent sur plusieurs commandes.

SELECT nom,COUNT(*) AS nbr_items
FROM `commande_ligne`
GROUP BY `nom`
HAVING  COUNT(*) > 1
ORDER BY nbr_items DESC



3) Obtenir la liste de tous les produits qui sont présent sur plusieurs commandes et
 y ajouter une colonne qui liste les identifiants des commandes associées.

SELECT nom,COUNT(*) AS nbr_items,group_concat(commande_id)
FROM `commande_ligne`
GROUP BY `nom`
HAVING  COUNT(*) > 1





4) Enregistrer le prix total à l’intérieur de chaque ligne des commandes, en fonction du prix unitaire
et de la quantité

UPDATE  commande_ligne  
SET prix_total = prix_unitaire * quantite

5) Obtenir le montant total pour chaque commande et y voir facilement la date associée à cette
commande ainsi que le prénom et nom du client associé

SELECT SUM(prix_total) AS montant_total,client.nom,client.prenom,commande.date_achat FROM commande_ligne,commande,client
 WHERE commande_ligne.id=client.id AND commande_ligne.id=commande.id
GROUP BY commande_id

6) (Attention - question difficile) Enregistrer le montant total de chaque commande dans le champ
intitulé “cache_prix_total”

UPDATE commande A
INNER JOIN (
	SELECT commande_ligne.commande_id, ROUND(SUM(commande_ligne.prix_total), 2) AS sumPrix
	FROM commande_ligne
	GROUP BY commande_ligne.commande_id
) B
ON A.id = B.commande_id
SET A.cache_prix_total = B.sumPrix
WHERE A.id = B.commande_id

7) Obtenir le montant global de toutes les commandes, pour chaque mois

SELECT commande.date_achat, MONTH(commande.date_achat) as mois,round(sum(commande.cache_prix_total),2) AS MT_PAR_MOIS
	FROM commande
	GROUP BY mois

8) Obtenir la liste des 10 clients qui ont effectué le plus grand montant de commandes, et obtenir ce
montant total pour chaque client.

SELECT client.nom, commande.cache_prix_total AS mt_par_mois  
FROM commande,client
WHERE commande.id=client.id
ORDER BY  mt_par_mois DESC
LIMIT 10


9) Obtenir le montant total des commandes pour chaque date

SELECT date_achat,
 sum(cache_prix_total) AS mt_par_date 
FROM commande
GROUP BY date_achat

10) Ajouter une colonne intitulée “category” à la table contenant les commandes. Cette colonne
contiendra une valeur numérique

ALTER table commande
ADD category int(10)


11) Enregistrer la valeur de la catégorie, en suivant les règles suivantes :
“1” pour les commandes de moins de 200€
“2” pour les commandes entre 200€ et 500€
“3” pour les commandes entre 500€ et 1.000€
“4” pour les commandes supérieures à 1.000€


UPDATE commande
SET category =case
  when  cache_prix_total<200 then 1
  when  cache_prix_total BETWEEN 200 and 500  then 2
  when cache_prix_total BETWEEN 500 and 1000   then 3
  when  cache_prix_total>1000  then 4
end

12) Créer une table intitulée “commande_category” qui contiendra le descriptif de ces catégories

CREATE TABLE `commande_category` (
	`cache_prix_total` FLOAT NOT NULL DEFAULT '0',
	`categorie` INT(10) NOT NULL
)
ENGINE=InnoDB
;

13) Insérer les 4 descriptifs de chaque catégorie au sein de la table précédemment créée

INSERT INTO commande_category (ID,DESCRIPTION)
 VALUES
 (1,'pour les commandes de moins de 200€'),
 (2,'pour les commandes entre 200€ et 500€'),
 (3,'pour les commandes 500€ et 1.000€ '),
 (4,'pour les commandes  supérieures à 1.000€ ');


14) Supprimer toutes les commandes (et les lignes des commandes) inférieur au 
1er février 2019. Cela doit être effectué en 2 requêtes maximum



//requête une
DELETE commande_ligne
FROM commande_ligne
INNER JOIN commande ON commande_ligne.commande_id = commande.id
WHERE commande.date_achat < '2019-02-01'

// requêtes deux
DELETE 
FROM commande
WHERE commande.date_achat < '2019-02-01'

