## Simulació d'examen
Preguntes tipus test
1. Quina ordre de terminal executa `biblioteca.sql` dins la base de dades existent `biblioteca`?
   - A) `mariadb -u alumne -p biblioteca > biblioteca.sql`
   - B) `mariadb -u alumne -p biblioteca < biblioteca.sql`
   - C) `mariadb-dump -u alumne -p biblioteca < biblioteca.sql`
   - D) `mariadb -u alumne -p --export biblioteca biblioteca.sql`
2. Quines tasques són adequades en la gestió d'scripts i còpies SQL?
   - A) Provar la restauració del backup en una base de dades de proves.
   - B) Revisar el contingut i l'esquema abans de restaurar-lo.
   - C) Guardar els scripts DDL en un repositori versionat.
   - D) Restringir els permisos d'accés als fitxers de backup.
3. Quines afirmacions sobre `CREATE VIEW` són correctes?
   - A) Permet definir una vista basada en una consulta.
   - B) La vista és un objecte definit amb DDL.
   - C) La vista pot simplificar l'accés a dades relacionades.
   - D) Una vista duplica necessàriament totes les files físicament i elimina les taules originals.
4. Quines afirmacions sobre el motor `InnoDB` són correctes?
   - A) Desactiva permanentment totes les restriccions `CHECK` de qualsevol versió de MariaDB.
   - B) Impossibilita definir `PRIMARY KEY` en una taula.
   - C) És adequat per a esquemes que requereixen transaccions.
   - D) Admet claus foranes.
5. Quina definició de columna és adequada per guardar un preu monetari exacte amb dos decimals?
   - A) `preu FLOAT(10,2) NOT NULL`
   - B) `preu INT(10,2) NOT NULL DEFAULT CURRENT_TIMESTAMP`
   - C) `preu VARCHAR(10) NOT NULL`
   - D) `preu DECIMAL(10,2) NOT NULL`
6. Quines opcions descriuen correctament la importació des de terminal?
   - A) Es pot executar `SOURCE /ruta/esquema.sql;` dins del client MariaDB.
   - B) Cal que la connexió disposi dels permisos necessaris per executar les ordres.
   - C) La importació s'ha de fer sempre amb `mariadb-dump` i l'operador `>` perquè el client MariaDB no llegeix fitxers.
   - D) `mariadb -u usuari -p biblioteca < esquema.sql` executa l'SQL del fitxer.
7. Sobre els índexs, quines afirmacions són correctes?
   - A) Consumeixen espai i poden penalitzar operacions d'escriptura.
   - B) Sempre redueixen el temps de qualsevol consulta, encara que no s'utilitzin.
   - C) Substitueixen completament les claus foranes i validen relacions entre taules.
   - D) Poden accelerar consultes filtrades per columnes indexades.
8. Sobre `NULL` en MariaDB, quines afirmacions són correctes?
   - A) És equivalent a zero en qualsevol operació aritmètica i en qualsevol comparació.
   - B) És exactament el mateix que la cadena buida.
   - C) Expressa absència de valor.
   - D) Una columna declarada `NOT NULL` no admet `NULL`.
9. Sobre una columna `email VARCHAR(200) NOT NULL UNIQUE`, quines afirmacions són correctes?
   - A) Emmagatzema text de longitud variable.
   - B) No admet `NULL`.
   - C) No admet correus duplicats segons la col·lació.
   - D) Valida automàticament que tots els valors tinguin una arrova i un domini realment existent.
10. Quines restriccions es poden definir a MariaDB amb SQL DDL?
   - A) `CHECK`
   - B) `PRIMARY KEY`
   - C) `FOREIGN KEY`
   - D) `UNIQUE`
11. Quina ordre genera un backup SQL de la base `biblioteca` sense modificar-la?
   - A) `mariadb -u alumne -p -e "DROP DATABASE biblioteca" > copia.sql`
   - B) `mariadb-dump -u alumne -p biblioteca < copia.sql`
   - C) `mariadb-dump -u alumne -p biblioteca > copia.sql`
   - D) `mariadb -u alumne -p biblioteca > copia.sql`
12. En una restauració d'un fitxer SQL amb redirecció `<`, quines afirmacions són correctes?
   - A) L'operació crea automàticament qualsevol BD inexistent encara que el fitxer no contingui `CREATE DATABASE`.
   - B) El caràcter `<` envia el resultat de la consulta cap al fitxer com a backup.
   - C) L'usuari necessita permisos per executar les instruccions del fitxer.
   - D) El client llegeix ordres SQL del fitxer indicat.
13. Per emprar `ON DELETE SET NULL`, quines condicions o efectes són correctes?
   - A) Quan s'esborra el pare, la FK de les filles afectades passa a `NULL`.
   - B) El motor sempre elimina també la fila filla per mantenir la integritat referencial.
   - C) La columna de la FK ha d'admetre `NULL`.
   - D) La columna FK ha de ser obligatòriament una clau primària `NOT NULL`.
14. Quines ordres o fragments tenen sentit en un entorn MariaDB per revisar l'estructura?
   - A) `SELECT table_name FROM information_schema.tables WHERE table_schema = 'biblioteca';`
   - B) `SHOW CREATE TABLE llibre;`
   - C) `SHOW TABLES;`
   - D) `DESCRIBE soci;`
15. Quines accions són bones pràctiques abans d'executar un `ALTER TABLE` important?
   - A) Disposar d'una còpia de seguretat o d'un pla de reversió.
   - B) Desactivar definitivament la comprovació de claus foranes a tota la instància.
   - C) Comprovar si les dades existents compleixen la nova restricció.
   - D) Eliminar totes les claus primàries abans de modificar qualsevol columna.
16. Quines afirmacions són certes sobre una clau primària composta?
   - A) Cada columna de la clau composta ha de ser individualment única.
   - B) Només es pot declarar en taules que no tinguin claus foranes.
   - C) La unicitat s'aplica a la combinació completa de columnes.
   - D) Pot definir-se amb `PRIMARY KEY (isbn, id_autor)`.
17. Sobre `information_schema`, quines afirmacions són correctes?
   - A) Permet identificar taules d'un esquema.
   - B) És el nom obligatori de la base de dades on s'han de guardar les dades de negoci de qualsevol aplicació.
   - C) Conté informació de metadades.
   - D) Permet consultar columnes i restriccions.
18. Quines declaracions defineixen regles de domini vàlides?
   - A) `CHECK (preu >= 0)`
   - B) `estat VARCHAR(20) NOT NULL DEFAULT 'actiu'`
   - C) `CHECK preu IS ALWAYS > 0 OR NULLS FORBIDDEN`
   - D) `DEFAULT NOT NULL CHECK (estat) IS 'actiu'`
19. Quines afirmacions sobre `DROP TABLE` són correctes?
   - A) Cal revisar dependències i disposar de còpies abans d'emprar-lo.
   - B) Elimina la taula.
   - C) És idèntic a `DELETE FROM taula` perquè conserva totes les restriccions i índexs de la taula original.
   - D) Pot eliminar-ne també les dades.
20. Quina instrucció elimina una clau forana anomenada `fk_comanda_client` de `comanda`?
   - A) `DELETE FOREIGN KEY fk_comanda_client FROM comanda WHERE id > 0;`
   - B) `DROP CONSTRAINT fk_comanda_client FROM comanda;`
   - C) `ALTER TABLE comanda DROP FOREIGN KEY fk_comanda_client;`
   - D) `ALTER TABLE comanda DROP PRIMARY KEY fk_comanda_client;`
21. Quines afirmacions sobre les claus primàries són correctes?
   - A) Cada taula ha de declarar sempre dues claus primàries independents per poder utilitzar `InnoDB`.
   - B) Poden incloure més d'una columna.
   - C) Identifiquen de manera única una fila.
   - D) No admeten `NULL`.
22. Quines comprovacions inclouries en un pla de proves de DDL?
   - A) Intentar duplicar una clau primària.
   - B) Considerar validat l'esquema només perquè l'ordre `CREATE TABLE` ha acabat sense errors.
   - C) Intentar inserir una referència forana inexistent.
   - D) Comprovar que un `CHECK` rebutja valors invàlids.
23. Quins elements formen part d'un bon pla de proves de l'esquema de biblioteca?
   - A) Casos de clau duplicada.
   - B) Casos d'esborrat de pares amb fills.
   - C) Casos d'inserció vàlida.
   - D) Comprovació de les metadades de l'esquema.
24. Quines afirmacions sobre `TRUNCATE TABLE` són correctes?
   - A) Conserva l'estructura de la taula.
   - B) Es considera una operació DDL en MariaDB.
   - C) Elimina únicament les files que compleixen una condició `WHERE` definida després de `TRUNCATE`.
   - D) Buida el contingut de la taula.
25. Sobre `VARCHAR(50)` i `CHAR(2)`, quines afirmacions són correctes?
   - A) `VARCHAR(50)` obliga sempre a guardar exactament cinquanta caràcters.
   - B) `VARCHAR(50)` serveix per a cadenes de longitud variable.
   - C) `CHAR(2)` és un tipus enter de dos bytes que no admet lletres.
   - D) `CHAR(2)` és apropiat per a codis de longitud fixa de dos caràcters.
26. Quines afirmacions sobre l'script de biblioteca són correctes?
   - A) `llibre.isbn` identifica cada llibre.
   - B) `exemplar.codi_barres` pot repetir-se lliurement perquè la taula no imposa cap unicitat.
   - C) `llibre_autor` utilitza la combinació d'ISBN i autor com a clau.
   - D) `soci.email` està declarat únic.
27. Quina instrucció crea una base de dades MariaDB anomenada `biblioteca`?
   - A) `CREATE DATABASE biblioteca;`
   - B) `MAKE DATABASE biblioteca;`
   - C) `NEW DATABASE biblioteca;`
   - D) `CREATE TABLE biblioteca DATABASE;`
28. Quines declaracions de clau forana són correctes a MariaDB?
   - A) `FOREIGN KEY (id_soci) REFERENCES soci(id_soci)`
   - B) `FOREIGN KEY id_soci REFERENCES soci WITH AUTOINCREMENT`
   - C) `FOREIGN KEY (isbn) REFERENCES llibre(isbn) ON DELETE RESTRICT`
   - D) `REFERENCES soci(id_soci) FROM prestec WITHOUT CONSTRAINT CHECK DELETE RESTRICT`
29. Quines ordres creen índexs MariaDB?
   - A) `ALTER INDEX ix_comanda_data ADD TO comanda(data_comanda);`
   - B) `CREATE UNIQUE COLUMN ix_empleat_nom FROM empleat(cognoms, nom) WITHOUT TABLE;`
   - C) `CREATE INDEX ix_empleat_nom ON empleat(cognoms, nom);`
   - D) `CREATE INDEX ix_comanda_data ON comanda(data_comanda);`
30. Quines ordres canvien l'estructura de la taula `producte`?
   - A) `ALTER TABLE producte ADD COLUMN descripcio TEXT NULL;`
   - B) `ALTER TABLE producte MODIFY COLUMN nom VARCHAR(160) NOT NULL;`
   - C) `SELECT nom FROM producte ORDER BY nom;` i desa el resultat com a nova columna.
   - D) `UPDATE producte SET nom = 'nou';`
31. Sobre `CREATE DATABASE IF NOT EXISTS institut`, quines afirmacions són correctes?
   - A) Crea l'esquema si encara no existeix.
   - B) Elimina les taules preexistents per regenerar-les automàticament.
   - C) Evita l'error habitual d'existència quan l'esquema ja hi és.
   - D) Selecciona obligatòriament `institut` per a totes les connexions futures.
32. Quines afirmacions sobre `AUTO_INCREMENT` són correctes?
   - A) Assigna sempre el mateix identificador quan dues insercions tenen les mateixes dades de negoci.
   - B) Pot generar identificadors numèrics automàticament.
   - C) És habitual combinar-lo amb una clau primària.
   - D) No garanteix una numeració consecutiva sense buits.
33. Quins efectes té `ON DELETE CASCADE` en una relació pare-filla vàlida?
   - A) Bloqueja qualsevol esborrat del pare encara que no existeixin files filles.
   - B) És útil quan les files filles no tenen sentit sense el pare.
   - C) Esborrar el pare pot esborrar les files filles relacionades.
   - D) Conserva sempre totes les files filles i substitueix la FK per zero.
34. Què pot passar amb `ON DELETE RESTRICT` a `exemplar.isbn` respecte de `llibre.isbn`?
   - A) Permet esborrar un llibre sense exemplars si no hi ha altres restriccions.
   - B) Impedeix esborrar un llibre referenciat per exemplars.
   - C) Esborra en cascada tots els exemplars vinculats al llibre.
   - D) Transforma automàticament en `NULL` els ISBN de tots els exemplars afectats.
35. Quines afirmacions sobre `NOT NULL`, `DEFAULT` i `CHECK` són correctes?
   - A) `DEFAULT` defineix un valor predeterminat quan correspon aplicar-lo.
   - B) `DEFAULT` elimina les restriccions de clau forana de la columna perquè el valor per defecte preval sempre.
   - C) `CHECK` pot limitar els valors admesos.
   - D) `NOT NULL` impedeix emmagatzemar `NULL`.
36. Quines sentències consulten informació de l'estructura a MariaDB?
   - A) `DROP TABLE information_schema.columns;` per refrescar les metadades del servidor.
   - B) `DESCRIBE llibre;`
   - C) `SHOW TABLES;`
   - D) `DELETE FROM information_schema.tables;`
37. Quines afirmacions sobre fer un backup lògic MariaDB són correctes?
   - A) `mariadb-dump` pot exportar ordres SQL de l'esquema.
   - B) La redirecció `>` permet escriure la sortida al fitxer.
   - C) El fitxer resultant es pot inspeccionar abans de restaurar-lo.
   - D) `mariadb-dump` importa obligatòriament les dades i esborra la base de dades origen.
38. Quines afirmacions sobre les claus foranes són correctes?
   - A) Ajuden a garantir la integritat referencial.
   - B) Estableixen relacions entre taules.
   - C) Una clau forana sempre crea automàticament una taula nova de relació molts-a-molts.
   - D) Les columnes relacionades han de tenir tipus compatibles.
39. Quines definicions poden formar part d'un `CREATE TABLE` de MariaDB?
   - A) `CONSTRAINT uq_soci_email PRIMARY FOREIGN (email) REFERENCES soci(email)`
   - B) `CONSTRAINT pk_soci UNIQUE NULL (id_soci)`
   - C) `CONSTRAINT pk_soci PRIMARY KEY (id_soci)`
   - D) `CONSTRAINT uq_soci_email UNIQUE (email)`
40. Quines dades són adequades per incloure al diccionari de dades?
   - A) Contrasenyes en text pla de tots els usuaris que fan servir la base de dades.
   - B) Tipus i nul·labilitat de les columnes.
   - C) Claus i restriccions.
   - D) Finalitat de les taules i atributs.
41. Quines afirmacions sobre `CHECK (data_prevista_retorn >= data_prestec)` són correctes?
   - A) És una restricció definida amb DDL.
   - B) Expressa una regla temporal.
   - C) Comprova que l'exemplar no tingui mai més d'un préstec obert sense cap altra restricció.
   - D) Rebutja dates previstes anteriors a la data de préstec en insercions vàlides.
42. Quines afirmacions sobre `USE biblioteca;` són correctes?
   - A) Selecciona la base de dades de treball de la sessió.
   - B) Modifica automàticament la configuració permanent de tots els clients connectats al servidor.
   - C) Pot aparèixer dins d'un script SQL.
   - D) No crea la base de dades si no existeix.
43. Quines afirmacions sobre el joc `utf8mb4` i la col·lació són correctes?
   - A) La col·lació determina regles de comparació i ordenació.
   - B) `utf8mb4` determina una codificació de text.
   - C) Es poden establir en crear una base de dades.
   - D) La col·lació és una instrucció de backup que exporta automàticament totes les taules en UTF-8.
44. Quines restriccions impedeixen valors duplicats en la columna o combinació de columnes afectada?
   - A) `CHECK (preu >= 0)` valida valors però també deduplica automàticament.
   - B) `PRIMARY KEY`
   - C) `UNIQUE`
   - D) `DEFAULT`
45. Sobre la regla del préstec obert a l'exemple de biblioteca, quines afirmacions són correctes?
   - A) Una columna generada pot retornar l'identificador de l'exemplar si és obert.
   - B) Una restricció `UNIQUE` sobre el valor generat pot impedir dos préstecs oberts.
   - C) Un préstec obert té `data_retorn_real IS NULL`.
   - D) L'única solució possible és eliminar la clau forana de préstec i permetre ISBN inexistents.
46. Quines poden ser instruccions DDL vàlides de MariaDB?
   - A) `DROP TABLE IF EXISTS prova;`
   - B) `ALTER TABLE prova ADD COLUMN nom VARCHAR(40);`
   - C) `CREATE TABLE prova (id INT PRIMARY KEY);`
   - D) `CREATE INDEX ix_prova_nom ON prova(nom);`
47. Quines afirmacions sobre `DECIMAL(10,2)` són correctes?
   - A) És un tipus aproximat de coma flotant que perd precisió intencionadament en els cèntims.
   - B) Disposa de deu dígits de precisió total.
   - C) És adequat per guardar imports monetaris exactes.
   - D) Reserva dos dígits per a la part decimal.
48. En el model de biblioteca, quines afirmacions són correctes?
   - A) Cada autor ha de tenir exactament un únic llibre per definició.
   - B) `exemplar.isbn` referencia el llibre al qual pertany.
   - C) `llibre_autor` resol la relació molts-a-molts.
   - D) `prestec` és la taula que emmagatzema obligatòriament els noms dels autors.
49. Quines afirmacions són correctes sobre `ON UPDATE CASCADE`?
   - A) Modifica automàticament totes les columnes de totes les taules, independentment de les relacions.
   - B) Forma part de la definició de la restricció referencial.
   - C) Pot propagar un canvi de clau referenciada a la taula filla.
   - D) S'aplica a una relació amb clau forana.
50. Quines instruccions corresponen a DDL?
   - A) `SELECT * FROM llibre WHERE isbn IS NULL ORDER BY titol;`
   - B) `DROP TABLE IF EXISTS prova;`
   - C) `ALTER TABLE llibre ADD COLUMN idioma CHAR(2);`
   - D) `INSERT INTO llibre (isbn) VALUES ('x');`

<details>
<summary><b>Veure respostes</b></summary>

1. B
2. A, B, C, D
3. A, B, C
4. C, D
5. D
6. A, B, D
7. A, D
8. C, D
9. A, B, C
10. A, B, C, D
11. C
12. C, D
13. A, C
14. A, B, C, D
15. A, C
16. C, D
17. A, C, D
18. A, B
19. A, B, D
20. C
21. B, C, D
22. A, C, D
23. A, B, C, D
24. A, B, D
25. B, D
26. A, C, D
27. A
28. A, C
29. C, D
30. A, B
31. A, C
32. B, C, D
33. B, C
34. A, B
35. A, C, D
36. B, C
37. A, B, C
38. A, B, D
39. C, D
40. B, C, D
41. A, B, D
42. A, C, D
43. A, B, C
44. B, C
45. A, B, C
46. A, B, C, D
47. B, C, D
48. B, C
49. B, C, D
50. B, C

</details>