--1
SELECT Hd
FROM pc_uri
GROUP BY Hd
HAVING COUNT(*) > 1

--2
SELECT t1.Model, t2.Model, t1.Viteza, t1.Ram
FROM pc_uri as t1, pc_uri as t2
WHERE t1.Model > t2.Model AND t1.Ram = t2.Ram AND t1.Viteza = t2.Viteza

--3
SELECT Producator, produse.Model, Pret
FROM laptop_uri, produse
WHERE produse.Model = laptop_uri.Model AND Viteza < (SELECT MIN(Viteza) FROM pc_uri)

--4
SELECT Producator, pc_uri.Model, Pret
FROM pc_uri, produse
WHERE pc_uri.Model = produse.Model AND pc_uri.Pret = 
(SELECT MAX(Pret) FROM (SELECT Pret FROM pc_uri UNION SELECT Pret FROM laptop_uri) a)
UNION
SELECT Producator, laptop_uri.Model, Pret
FROM laptop_uri, produse
WHERE laptop_uri.Model = produse.Model AND laptop_uri.Pret = 
(SELECT MAX(Pret) FROM (SELECT Pret FROM pc_uri UNION SELECT Pret FROM laptop_uri) a)

--5
SELECT Producator, AVG(Ecran) as Mediu
FROM produse, laptop_uri
WHERE produse.Model = laptop_uri.Model
GROUP BY Producator

--6
SELECT Producator, COUNT(Tip)
FROM produse
WHERE Tip='PC'
GROUP BY Producator
HAVING COUNT(*) > 2 

--7
SELECT Producator, MAX(Pret)
FROM produse, pc_uri
WHERE produse.Model = pc_uri.Model
GROUP BY Producator

--8
SELECT Viteza, AVG(Pret)
FROM pc_uri
WHERE Viteza > 600
GROUP BY Viteza

--9
SELECT Producator
FROM produse, laptop_uri
WHERE produse.Model = laptop_uri.Model AND Viteza >= 750
UNION
SELECT Producator
FROM produse, pc_uri
WHERE produse.Model = pc_uri.Model AND Viteza >= 750

--10
SELECT SUM(Pret)
FROM imprimante
WHERE Pret=(SELECT MIN(Pret) FROM imprimante)

--11
with t1 as(SELECT Model, Pret
FROM pc_uri
WHERE Pret=(SELECT MAX(Pret) FROM pc_uri)
UNION
SELECT Model, Pret
FROM laptop_uri
WHERE Pret=(SELECT MAX(Pret) FROM laptop_uri)
UNION
SELECT Model, Pret
FROM imprimante
WHERE Pret=(SELECT MAX(Pret) FROM imprimante))

SELECT model, Pret
FROM t1
WHERE Pret = (SELECT MAX(Pret) FROM t1)

--12
SELECT Producator
FROM produse, pc_uri
WHERE produse.Model = pc_uri.Model AND Ram = (SELECT MIN(Ram) FROM pc_uri)
INTERSECT
SELECT Producator
FROM produse, imprimante
WHERE produse.Model = imprimante.Model

--13
SELECT AVG(Pret_med_comun) as Pret_med_comun
FROM 
(SELECT AVG(Pret) as Pret_med_comun 
FROM laptop_uri, produse
WHERE laptop_uri.Model = produse.Model AND Producator = 'A'
UNION 
SELECT AVG(Pret) as Pret_med_comun 
FROM pc_uri, produse
WHERE pc_uri.Model = produse.Model AND Producator = 'A') t1

--14
SELECT DISTINCT produse.Producator, Pret_med_prod
FROM
(SELECT Producator, AVG(Pret) as Pret_med_prod
FROM produse, pc_uri
WHERE produse.Model = pc_uri.Model
GROUP BY Producator) as t1, produse
WHERE t1.Producator = produse.Producator AND produse.Tip = 'imprimante'
