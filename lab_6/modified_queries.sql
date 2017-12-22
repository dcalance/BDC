--1
SELECT Model, Viteza, Hd
FROM pc_laptop.pc_uri
WHERE Pret < 500

--2
SELECT Producator
FROM Stoc.produse
WHERE Tip='Imprimante'

--3
SELECT Model, Ram, Ecran
FROM pc_laptop.laptop_uri
WHERE Pret > 1000

--4
SELECT *
FROM imprimante.imprimante
WHERE Color='da'