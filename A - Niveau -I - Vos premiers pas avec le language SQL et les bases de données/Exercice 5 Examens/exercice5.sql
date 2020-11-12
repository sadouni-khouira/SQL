Exo 1:
SELECT * FROM stagiaires

Exo 2:
SELECT * FROM examens

Exo 3:
SELECT Tel FROM stagiaires

Exo 4:
SELECT NumE, Date FROM examens

Exo 5:
SELECT nomS FROM stagiaires
ORDER BY nomS DESC

Exo 6:
SELECT * FROM examens
WHERE salle = 'A2' OR salle = 'A3'

Exo 7:
SELECT * FROM examens
WHERE TypeE = 'P'

Exo 8:
SELECT * FROM examens
WHERE TypeE = 'P'
ORDER BY Date

Exo 9:
SELECT * FROM examens
ORDER BY salle ASC, date DESC

Exo 10:
SELECT NumE, Note
FROM passerexamen
WHERE NumS = 'S01'

Exo 11:
SELECT NumE, Note
FROM passerexamen
WHERE NumS = 'S01' AND Note >= 15

Exo 12:
SELECT * 
FROM stagiaires
WHERE nomS LIKE '%e%'

Exo 13:
SELECT prenomS 
FROM stagiaires
WHERE prenomS LIKE '%s

Exo 14:
SELECT prenomS 
FROM stagiaires
WHERE prenomS LIKE '%s' OR prenomS LIKE '%d'

Exo 15:
SELECT nomS, prenomS 
FROM stagiaires
WHERE nomS LIKE '%e' AND prenomS LIKE '%s'

Exo 16:
SELECT nomS 
FROM stagiaires
WHERE SUBSTR(nomS, 2, 1) = 'a'

Exo 17:
SELECT nomS 
FROM stagiaires
WHERE SUBSTR(nomS, 2, 1) != 'a'

Exo 18:
SELECT *
FROM examens
WHERE TypeE = 'P' AND salle LIKE 'A%'

Exo 19:
SELECT salle
FROM examens

Exo 20:
SELECT salle
FROM examens
GROUP BY salle 

Exo 21:
SELECT NumE, MIN(Note), MAX(Note)
FROM passerexamen
GROUP BY NumE

Exo 22:
SELECT MIN(Note), MAX(Note)
FROM passerexamen
WHERE NumE = 'E05'

Exo 23:
SELECT NumE, MAX(Note) - MIN(Note)
FROM passerexamen
GROUP BY NumE

Exo 24:
SELECT COUNT(*)
FROM examens
WHERE TypeE = 'P'

Exo 25:
SELECT MIN(Date)
FROM examens

Exo 26:
SELECT nomS
FROM stagiaires
WHERE nomS LIKE '%r%' OR nomS LIKE '%s%'

Exo 27:
SELECT NumS, MAX(Note)
FROM passerexamen
GROUP BY NumS

Exo 28:
SELECT DATE(`date`), COUNT(*)
FROM examens
GROUP BY DATE(`date`)

Exo 29:
SELECT salle, COUNT(*)
FROM examens
GROUP BY salle

Exo 30:
SELECT salle, COUNT(*)
FROM examens
WHERE salle = 'A1'
GROUP BY salle

Exo 31:
SELECT salle
FROM examens
GROUP BY salle 
HAVING COUNT(*) >= 2

Exo 32:
SELECT salle
FROM examens
GROUP BY salle 
HAVING COUNT(*) = 3

Exo 33:
SELECT COUNT(*)
FROM examens
WHERE salle LIKE 'A%'

Exo 34:
SELECT salle, COUNT(*)
FROM examens
WHERE salle LIKE 'A%'
GROUP BY salle

Exo 35:
SELECT salle
FROM examens
WHERE salle LIKE 'A%'
GROUP BY salle
HAVING COUNT(*) >= 2
