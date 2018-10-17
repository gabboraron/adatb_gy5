SELECT * FROM dolgozo ORDER BY oazon  DESC, dnev DESC;

SELECT * FROM dolgozo d1 JOIN dolgozo d2 ON d1.fonoke = d2.dkod;

SELECT * FROM fiz_kategoria f, dolgozo d WHERE d.fizetes BETWEEN f.also AND f.felso;

/* Mekkora a maxim�lis fizet�s a dolgoz�k k�z�tt? */
SELECT MAX(fizetes) FROM dolgozo;

/* Mennyi a dolgoz�k �sszfizet�se? */
SELECT SUM(fizetes) FROM dolgozo;

/* Mennyi a 20-as oszt�lyon az �tlagfizet�s? */
SELECT oazon, MAX(fizetes) FROM dolgozo GROUP BY oazon;

/* H�ny olyan dolgoz� van, akinek a fizet�se > 2000? */
SELECT oazon, MAX(fizetes) FROM dolgozo GROUP BY oazon HAVING MIN(fizetes) > 1000;

/* akinek foglalkozasa CLRK azokb�l csoportott k�pezve max fizetes */
SELECT oazon, MAX(fizetes) FROM dolgozo WHERE foglalkozas = 'CLERK' GROUP BY oazon HAVING MIN(fizetes) > 1000;

/* az oazon �s a foglalkozas alapj��n mosom egybe a csoportokat */
SELECT oazon, foglalkozas, max(fizetes), count(*) 
    FROM dolgozo GROUP BY oazon, foglalkozas
    /* ha kett�n�l nagyobb f�s csoportok �rdekelnek: */
    HAVING COUNT (*) >= 2
    /* rendezzem el�bb oazon majd foglaklkoz�s szerint */
    ORDER BY oazon, foglalkozas
    ;
    
/* Mennyi a 20-as oszt�lyon az �tlagfizet�s? */    
SELECT oazon, AVG(fizetes) FROM dolgozo
    WHERE oazon = 20
    GROUP BY oazon
    /*HAVING oazon = 20*/;
    
/* Adjuk meg, hogy h�ny k�l�nb�z� foglalkoz�s fordul el� a dolgoz�k k�z�tt. */ 
count (*), count (foglalkozas), count(distinct foglalkozas) FROM dolgozo;


/* H�ny olyan dolgoz� van, akinek a fizet�se > 2000? */
SELECT count (*) from dolgozo where fizetes > 2000;

/* Adjuk meg oszt�lyonk�nt a telephelyet �s az �tlagfizet�st (oazon, telephely, atl_fiz). */
SELECT oazon, telephely, AVG(fizetes) FROM dolgozo NATURAL JOIN osztaly GROUP BY oazon, telephely;


/* **** */
/* Adjuk meg, hogy az egyes oszt�lyokon h�ny ember dolgozik. */
SELECT count(*) FROM dolgozo GROUP BY oazon;

/* Adjuk meg azokra az oszt�lyokra az �tlagfizet�st, ahol ez nagyobb mint 2000. */
SELECT AVG(fizetes) FROM dolgozo GROUP BY oazon HAVING AVG(fizetes) > 2000;

/* Adjuk meg az �tlagfizet�st azokon az oszt�lyokon, ahol legal�bb 4-en dolgoznak (oazon, avg_fiz) */
SELECT oazon, AVG(fizetes) FROM dolgozo GROUP BY oazon HAVING COUNT(*) >= 4;

/* Adjuk meg az �tlagfizet�st �s telephelyet azokon az oszt�lyokon, ahol legal�bb 4-en dolgoznak. */ 
SELECT AVG(fizetes), telephely FROM dolgozo NATURAL JOIN osztaly GROUP BY telephely  HAVING COUNT(*) >= 4;

/* Adjuk meg azon oszt�lyok nev�t �s telephely�t, ahol az �tlagfizet�s nagyobb mint 2000. (onev, telephely) */
SELECT oazon, telephely FROM dolgozo NATURAL JOIN osztaly GROUP BY oazon, telephely HAVING AVG(fizetes)>2000;

/* Adjuk meg hogy az egyes f�n�k�knek h�ny beosztottja van */
SELECT fonoke, COUNT(*) FROM dolgozo GROUP BY fonoke;

/* Adjuk meg hogy f�n�k�kre lebontva az alkalmazottak maxim�lis fizet�s�t, azokra a f�n�k�kre akiknek pontosan 2db 2000-n�l t�bbet keres� beosztottja van */ 
SELECT D2.dnev, COUNT(*) FROM dolgozo d1 JOIN dolgozo d2 ON d1.fonoke = d2.dkod 
    Where d1.fizetes > 2000 
    Group BY d2.dnev 
    HAving COUNT(*) = 2 
    ORDER BY d2.dnev;

SELECT *  FROM dolgozo;






