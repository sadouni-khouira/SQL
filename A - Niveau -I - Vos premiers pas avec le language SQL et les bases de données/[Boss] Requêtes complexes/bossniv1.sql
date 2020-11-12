Exo 1:
SELECT *
FROM `client`
WHERE prenom = "Muriel"
AND `password` = SHA1("test11")

Exo 2:
SELECT nom, COUNT(*) AS nbr_items 
FROM `commande_ligne` 
GROUP BY nom HAVING nbr_items > 1
ORDER BY nbr_items DESC

Exo 3:
SELECT nom, COUNT(*) AS nbr_items, GROUP_CONCAT(commande_id) 
FROM `commande_ligne` 
GROUP BY nom HAVING nbr_items > 1

Exo 4:
UPDATE commande_ligne
SET prix_total = prix_unitaire * quantite

Exo 5:
SELECT `client`.nom, `client`.prenom, DATE_FORMAT(commande.date_achat,"%d %M %Y") AS `date`, ROUND(SUM(commande_ligne.prix_total), 2) AS prix_commande
FROM commande
INNER JOIN commande_ligne
ON commande.id = commande_ligne.commande_id
INNER JOIN `client`
ON commande.client_id = `client`.id
GROUP BY commande.id

Exo 6:
UPDATE commande A
INNER JOIN (
	SELECT commande_ligne.commande_id, ROUND(SUM(commande_ligne.prix_total), 2) AS sumPrix
	FROM commande_ligne
	GROUP BY commande_ligne.commande_id
) B
ON A.id = B.commande_id
SET A.cache_prix_total = B.sumPrix
WHERE A.id = B.commande_id

Exo 7:
SELECT MONTH(commande.date_achat) AS month_achat, ROUND(SUM(commande.cache_prix_total)) AS total_mois
FROM commande
GROUP BY month_achat

Exo 8:
SELECT `client`.nom, ROUND(SUM(commande_ligne.prix_total), 2) AS prix_commande
FROM commande
INNER JOIN commande_ligne
ON commande.id = commande_ligne.commande_id
INNER JOIN `client`
ON commande.client_id = `client`.id
GROUP BY `client`.id
ORDER BY prix_commande DESC
LIMIT 10

Exo 9:
SELECT commande.date_achat, ROUND(SUM(commande.cache_prix_total)) AS total
FROM commande
GROUP BY commande.date_achat

Exo 10:
ALTER TABLE commande
ADD category INT

Exo 11:
UPDATE commande
SET category = CASE 
WHEN cache_prix_total <= 200 THEN 1
WHEN cache_prix_total > 200 AND cache_prix_total <= 500 THEN 2
WHEN cache_prix_total > 500 AND cache_prix_total <= 1000 THEN 3
ELSE 4
END

Exo 12:
CREATE TABLE formation.commande_category (
	id INT (1),
	description VARCHAR (40)
)

Exo 13:
INSERT INTO commande_category (id, description)
VALUES 
(1, "pour les commandes de moins de 200€"),
(2, "pour les commandes entre 200€ et 500€"),
(3, "pour les commandes entre 500€ et 1.000€"),
(4, "pour les commandes supérieures à 1.000€")

Exo 14:
// Partie commande_ligne
DELETE commande_ligne
FROM commande_ligne
INNER JOIN commande ON commande_ligne.commande_id = commande.id
WHERE commande.date_achat < '2019-02-01'

// Partie commande
DELETE 
FROM commande
WHERE commande.date_achat < '2019-02-01'
