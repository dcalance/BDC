--1
SELECT Model, Viteza, Hd
FROM pc_uri
WHERE Pret < 500

--2
SELECT Producator
FROM produse
WHERE Tip='Imprimante'

--3
SELECT Model, Ram, Ecran
FROM laptop_uri
WHERE Pret > 1000

--4
SELECT *
FROM imprimante
WHERE Color='da'

--5
SELECT Model, Viteza, Hd
FROM pc_uri
WHERE Pret < 600 AND (Cd='12x' OR Cd='24x')

--6
SELECT Producator, Viteza, Cod
FROM pc_uri, produse 
WHERE Hd = (SELECT MIN(Hd) FROM pc_uri)
and pc_uri.Model = produse.Model

--7
SELECT produse.Model, Producator
FROM pc_uri, produse 
WHERE Pret > 450
and pc_uri.Model = produse.Model

--8
SELECT Producator
FROM produse
WHERE Tip='Imprimante' or Tip='Laptop_uri'
EXCEPT
SELECT Producator
FROM produse
WHERE Tip='PC'

SELECT p1.Producator FROM
(select distinct producator from produse p1 
where tip = 'Imprimante' or tip = 'Laptop_uri') p1
left join  (select distinct producator from produse where tip = 'PC') p2 on p1.Producator = p2.Producator
where p2.Producator is null

--9
SELECT Producator
FROM produse, pc_uri
WHERE Viteza > 450 AND produse.Model = pc_uri.Model
GROUP BY Producator
EXCEPT
SELECT Producator
FROM produse, pc_uri
WHERE Viteza <= 450 AND produse.Model = pc_uri.Model
GROUP BY Producator

--10
SELECT *
FROM imprimante
WHERE Pret = (SELECT MAX(Pret) FROM imprimante)

--11
SELECT AVG(Viteza) as Average
FROM pc_uri

--12
SELECT AVG(Viteza) as Average
FROM laptop_uri
WHERE Pret > 1000

--13
SELECT AVG(Viteza) as Average
FROM pc_uri, produse
WHERE Producator='A' AND pc_uri.Model = produse.Model;

--14
SELECT produse.Model, Producator
FROM pc_uri, produse
WHERE pc_uri.Model = produse.Model AND
Viteza > (SELECT MAX(Viteza) FROM laptop_uri)

--15
SELECT produse.Model, Producator
FROM pc_uri, produse
WHERE pc_uri.Model = produse.Model AND
Ram > (SELECT AVG(Ram) FROM laptop_uri)

--16
SELECT Model, Pret
FROM laptop_uri
WHERE Pret > (SELECT MIN(Pret)*2 FROM pc_uri)

--17
SELECT Viteza, AVG(Pret) as Pret_mediu
FROM pc_uri
GROUP BY Viteza
