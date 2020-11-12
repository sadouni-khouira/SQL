QUESTION 1
----------
Afficher la liste des étudiants triés par ordre croissant de date de naissance.
SELECT * FROM etudiant 
ORDER BY date_naissance DESC

QUESTION 2
----------
Afficher tous les étudiants inscrits à M1 et tous les étudiants inscrits à M2.
SELECT * FROM etudiant WHERE niveau='M1' OR niveau='M2'

QUESTION 3
----------
Afficher les matricules des étudiants qui ont passé l'examen du cours 002.
SELECT etudiant.matricule FROM etudiant,examen,cours WHERE etudiant.matricule=examen.matricule AND examen.code=cours.code AND cours.code=002

QUESTION 4
----------
 Afficher les matricules de tous les étudiants qui ont passé l'examen du cours 001 et
de tous les étudiants qui ont passé l'examen du cours 002.
SELECT * FROM etudiant,examen,cours WHERE etudiant.matricule=examen.matricule AND examen.code=cours.code AND (cours.code=001 OR cours.code=002)

QUESTION 5
-----------
Afficher le matricule, code, note /20 et note /40 de tous les examens classés par
ordre croissant de matricule et de code
SELECT *, note*2 FROM examen 
ORDER BY matricule ,code DESC

QUESTION 6
----------
Trouver la moyenne de notes de cours 002.
SELECT AVG(note) AS moyenne  FROM examen WHERE CODE=002
QUESTION 7
----------
 Compter les examens passés par un étudiant (exemple avec matricule 'e001')

SELECT COUNT(*) AS Nombre_eétudiant FROM examen WHERE matricule='e001'

QUESTION 8
----------
Compter le nombre d'étudiants qui ont passé l'examen du cours 002.
SELECT COUNT(*) AS Nombre_eétudiant FROM examen WHERE CODE=002
QUESTION 9
----------
Calculer la moyenne des notes d'un étudiant (exemple avec matricule 'e001').

SELECT AVG(note) AS moyenne_étudiant  FROM examen WHERE matricule='e001'

QUESTION 10
----------
Compter les examens passés par chaque étudiant.

SELECT matricule, COUNT(code) AS Nombre_éxamen
FROM examen 
GROUP BY matricule

QUESTION 11
----------
Calculer la moyenne des notes pour chaque étudiant.

SELECT etudiant.matricule,nom,AVG(note) AS moyenne  FROM examen,etudiant,cours WHERE examen.code=cours.code AND examen.matricule=etudiant.matricule 
GROUP BY etudiant.matricule

QUESTION 12
-----------

.Même question, mais afficher seulement les étudiants (et leurs moyennes) dont la
moyenne est >= 15
SELECT AVG(note)  FROM examen GROUP BY examen.matricule having AVG(note)>=15

QUESTION 13
-----------
Trouver la moyenne de notes de chaque cours.
SELECT AVG(note)  FROM examen GROUP BY examen.code 
