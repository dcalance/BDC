INSERT INTO pc_uri(Cod, Model, Viteza, Ram, Hd, Pret)
SELECT Cod+30 as Cod, Model+100 as Model, Viteza, Ram*2 as Ram, Hd*2 as Hd, Pret/1.5 as Pret
FROM laptop_uri