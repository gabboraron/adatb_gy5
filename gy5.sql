SELECT * FROM dolgozo ORDER BY oazon  DESC, dnev DESC;

SELECT * FROM dolgozo d1 JOIN dolgozo d2 ON d1.fonoke = d2.dkod;

SELECT * FROM fiz_kategoria f, dolgozo d WHERE d.fizetes BETWEEN f.also AND f.felso;

/* Mekkora a maximális fizetés a dolgozók között? */
SELECT MAX(fizetes) FROM dolgozo;

/* Mennyi a dolgozók összfizetése? */
SELECT SUM(fizetes) FROM dolgozo;

/* Mennyi a 20-as osztályon az átlagfizetés? */
SELECT oazon, MAX(fizetes) FROM dolgozo GROUP BY oazon;

/* Hány olyan dolgozó van, akinek a fizetése > 2000? */
SELECT oazon, MAX(fizetes) FROM dolgozo GROUP BY oazon HAVING MIN(fizetes) > 1000;

/* akinek foglalkozasa CLRK azokból csoportott képezve max fizetes */
SELECT oazon, MAX(fizetes) FROM dolgozo WHERE foglalkozas = 'CLERK' GROUP BY oazon HAVING MIN(fizetes) > 1000;

/* az oazon és a foglalkozas alapjûán mosom egybe a csoportokat */
SELECT oazon, foglalkozas, max(fizetes), count(*) 
    FROM dolgozo GROUP BY oazon, foglalkozas
    /* ha kettõnél nagyobb fõs csoportok érdekelnek: */
    HAVING COUNT (*) >= 2
    /* rendezzem elõbb oazon majd foglaklkozás szerint */
    ORDER BY oazon, foglalkozas
    ;
    
/* Mennyi a 20-as osztályon az átlagfizetés? */    
SELECT oazon, AVG(fizetes) FROM dolgozo
    WHERE oazon = 20
    GROUP BY oazon
    /*HAVING oazon = 20*/;
    
/* Adjuk meg, hogy hány különbözõ foglalkozás fordul elõ a dolgozók között. */ 
count (*), count (foglalkozas), count(distinct foglalkozas) FROM dolgozo;


/* Hány olyan dolgozó van, akinek a fizetése > 2000? */
SELECT count (*) from dolgozo where fizetes > 2000;

/* Adjuk meg osztályonként a telephelyet és az átlagfizetést (oazon, telephely, atl_fiz). */
SELECT oazon, telephely, AVG(fizetes) FROM dolgozo NATURAL JOIN osztaly GROUP BY oazon, telephely;


/* **** */
/* Adjuk meg, hogy az egyes osztályokon hány ember dolgozik. */
SELECT count(*) FROM dolgozo GROUP BY oazon;

/* Adjuk meg azokra az osztályokra az átlagfizetést, ahol ez nagyobb mint 2000. */
SELECT AVG(fizetes) FROM dolgozo GROUP BY oazon HAVING AVG(fizetes) > 2000;

/* Adjuk meg az átlagfizetést azokon az osztályokon, ahol legalább 4-en dolgoznak (oazon, avg_fiz) */
SELECT oazon, AVG(fizetes) FROM dolgozo GROUP BY oazon HAVING COUNT(*) >= 4;

/* Adjuk meg az átlagfizetést és telephelyet azokon az osztályokon, ahol legalább 4-en dolgoznak. */ 
SELECT AVG(fizetes), telephely FROM dolgozo NATURAL JOIN osztaly GROUP BY telephely  HAVING COUNT(*) >= 4;

/* Adjuk meg azon osztályok nevét és telephelyét, ahol az átlagfizetés nagyobb mint 2000. (onev, telephely) */
SELECT oazon, telephely FROM dolgozo NATURAL JOIN osztaly GROUP BY oazon, telephely HAVING AVG(fizetes)>2000;

/* Adjuk meg hogy az egyes fõnököknek hány beosztottja van */
SELECT fonoke, COUNT(*) FROM dolgozo GROUP BY fonoke;

/* Adjuk meg hogy fõnökökre lebontva az alkalmazottak maximális fizetését, azokra a fõnökökre akiknek pontosan 2db 2000-nél többet keresõ beosztottja van */ 
SELECT D2.dnev, COUNT(*) FROM dolgozo d1 JOIN dolgozo d2 ON d1.fonoke = d2.dkod 
    Where d1.fizetes > 2000 
    Group BY d2.dnev 
    HAving COUNT(*) = 2 
    ORDER BY d2.dnev;

SELECT *  FROM dolgozo;






