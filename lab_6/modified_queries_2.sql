--1
SELECT Model, Viteza, Hd
FROM pcs
WHERE Pret < 500

--2
SELECT Producator
FROM prod
WHERE Tip='Imprimante'

--3
SELECT Model, Ram, Ecran
FROM laptops
WHERE Pret > 1000

--4
SELECT *
FROM impr
WHERE Color='da'