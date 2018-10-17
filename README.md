# GY5

# GY5

Aktuális feladat: 
http://vopraai.web.elte.hu/tananyag/adatb1819/5.ora/feladat.txt

Ingyenes tesztszerver:
https://www.db4free.net/index.php?language=hu


> Emlékeztetőül: 

````SQL
SELECT * FROM dolgozo ORDER BY oazon  DESC, dnev DESC;

SELECT * FROM dolgozo d1 JOIN dolgozo d2 ON d1.fonoke = d2.dkod;

SELECT * FROM fiz_kategoria f, dolgozo d WHERE d.fizetes BETWEEN f.also AND f.felso;
````

- Mekkora a maximális fizetés a dolgozók között?
````SQL
SELECT MAX(fizetes) FROM dolgozo;
````

- Mennyi a dolgozók összfizetése?
````SQL
SELECT SUM(fizetes) FROM dolgozo;
````

-  Mennyi a 20-as osztályon az átlagfizetés?
````SQL
SELECT oazon, AVG(fizetes) FROM dolgozo
    WHERE oazon = 20
    GROUP BY oazon
    /*HAVING oazon = 20*/;
````
-   Adjuk meg, hogy hány különböző foglalkozás fordul elő a dolgozók között.
````SQL
count (*), count (foglalkozas), count(distinct foglalkozas) FROM dolgozo;
````

-    Hány olyan dolgozó van, akinek a fizetése > 2000? 
````SQL
SELECT count (*) from dolgozo where fizetes > 2000;
````

-     Adjuk meg osztályonként a telephelyet és az átlagfizetést (oazon, telephely, atl_fiz).
````SQL
SELECT oazon, telephely, AVG(fizetes) FROM dolgozo NATURAL JOIN osztaly GROUP BY oazon, telephely;
````


-  Adjuk meg, hogy az egyes osztályokon hány ember dolgozik.
````SQL
SELECT count(*) FROM dolgozo GROUP BY oazon;
````
-  Adjuk meg azokra az osztályokra az átlagfizetést, ahol ez nagyobb mint 2000.
````SQL
SELECT AVG(fizetes) FROM dolgozo GROUP BY oazon HAVING AVG(fizetes) > 2000;
````

-  Adjuk meg az átlagfizetést azokon az osztályokon, ahol legalább 4-en dolgoznak (oazon, avg_fiz) 
````SQL
SELECT oazon, AVG(fizetes) FROM dolgozo GROUP BY oazon HAVING COUNT(*) >= 4;
````

-  Adjuk meg az átlagfizetést és telephelyet azokon az osztályokon, ahol legalább 4-en dolgoznak.
````SQL
SELECT AVG(fizetes), telephely FROM dolgozo NATURAL JOIN osztaly GROUP BY telephely  HAVING COUNT(*) >= 4;
````

-  Adjuk meg azon osztályok nevét és telephelyét, ahol az átlagfizetés nagyobb mint 2000. (onev, telephely)
````SQL
SELECT oazon, telephely FROM dolgozo NATURAL JOIN osztaly GROUP BY oazon, telephely HAVING AVG(fizetes)>2000;
````

-  Adjuk meg hogy az egyes főnököknek hány beosztottja van
````SQL
SELECT fonoke, COUNT(*) FROM dolgozo GROUP BY fonoke;
````
-  Adjuk meg hogy főnökökre lebontva az alkalmazottak maximális fizetését, azokra a főnökökre akiknek pontosan 2db 2000-nél többet kereső beosztottja van 
````SQL
SELECT D2.dnev, COUNT(*) FROM dolgozo d1 JOIN dolgozo d2 ON d1.fonoke = d2.dkod 
    Where d1.fizetes > 2000 
    Group BY d2.dnev 
    HAving COUNT(*) = 2 
    ORDER BY d2.dnev;
````
