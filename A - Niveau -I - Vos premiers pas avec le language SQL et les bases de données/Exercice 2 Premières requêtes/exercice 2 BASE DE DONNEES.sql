exercice 2 BASE DE DONNEES
QUESTION 1
----------
SELECT * FROM villes_france_free 
ORDER BY ville_population_2012 DESC
LIMIT 10

QUESTION 2
----------
SELECT * FROM villes_france_free 
ORDER BY ville_surface ASC
LIMIT 50

QUESTION 3
----------
METHODE 1
SELECT departement_nom FROM departement WHERE departement_code REGEXP '97'
METHODE 2
SELECT * FROM `departement` WHERE `departement_code` LIKE '97%'

QUESTION 4
----------
                METHODE 1
SELECT ville_nom,departement_nom FROM villes_france_free INNER JOIN departement ON villes_france_free.ville_departement=departement.departement_code
ORDER BY ville_population_2012 DESC
LIMIT 10 
                METHODE 2
 SELECT ville_nom,departement_nom, ville_population_2012, departement_code
FROM villes_france_free, departement 
WHERE ville_departement = departement_code
ORDER BY ville_population_2012 DESC LIMIT 10
                METHODE 3
 SELECT * 
FROM `villes_france_free` 
LEFT JOIN departement ON departement_code = ville_departement
ORDER BY `ville_population_2012` DESC 
LIMIT 10               

QUESTION 5
----------
SELECT departement_nom, ville_departement, COUNT(*) AS nbr_items 
FROM `villes_france_free` 
LEFT JOIN departement ON departement_code = ville_departement
GROUP BY ville_departement
ORDER BY `nbr_items` DESC



QUESTION 6
----------
SELECT departement_nom, ville_departement, SUM(`ville_surface`) AS dpt_surface 
FROM `villes_france_free` 
LEFT JOIN departement ON departement_code = ville_departement
GROUP BY ville_departement  
ORDER BY dpt_surface  DESC
LIMIT 10





QUESTION 7
----------
METHODE 1
            SELECT COUNT(*) FROM villes_france_free WHERE ville_nom REGEXP 'Saint'
METHODE 2
SELECT COUNT(*) 
FROM `villes_france_free` 
WHERE `ville_nom` LIKE 'saint%'            

QUESTION 8
----------
SELECT ville_nom, COUNT(*) AS nbt_item 
FROM `villes_france_free` 
GROUP BY `ville_nom` 
ORDER BY nbt_item DESC

QUESTION 9
----------
SELECT * 
FROM `villes_france_free` 
WHERE `ville_surface` > (SELECT AVG(`ville_surface`) FROM `villes_france_free`)

QUESTION 10
-----------
METHODE 1
SELECT departement_nom, SUM(ville_population_2012) AS sommep_population_2012 
FROM villes_france_free
INNER JOIN  departement
GROUP BY departement_code HAVING sommep_population_2012  > 2000000

methode 2 marine
SELECT ville_departement, SUM(ville_population_2012) AS population_2012
FROM villes_france_free 
GROUP BY ville_departement
HAVING population_2012 > 2000000 /having au lieu de where  car condition de selectionner ceux inferrieur à 2 millions/
ORDER BY population_2012 DESC

METHODE 3 
SELECT ville_departement, SUM(`ville_population_2012`) AS population_2012
FROM `villes_france_free` 
GROUP BY `ville_departement`
HAVING population_2012 > 2000000

