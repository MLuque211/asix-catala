## 26. Del disseny lògic al disseny físic

#### 1. Nivells de disseny
El disseny d'una base de dades s'acostuma a separar en tres nivells:

1. **Disseny conceptual**: Descriu el món real amb entitats, atributs i interrelacions mitjançant el model Entitat-Relació (E/R).
2. **Disseny lògic**: Transforma el model conceptual en relacions o taules, camps, claus primàries i claus foranes de manera independent del SGBD.
3. **Disseny físic**: Concreta la implementació del model lògic en un SGBD determinat definint tipus de dades, índexs, motor d'emmagatzematge, codificació, restriccions, noms d'objectes i opcions d'emmagatzematge.

> **Principi de coherència:** El disseny físic no ha de modificar arbitràriament el significat del model lògic; ha de preservar les entitats, les claus i les regles de negoci ja identificades.

#### 2. Objectes habituals d'un SGBD relacional
En la fase d'implementació física es treballen principalment els següents objectes:

| Objecte | Funció |
| :---: | :--- |
| **Base de dades o esquema** | Contenidor lògic d'objectes relacionats. |
| **Taula** | Emmagatzema les files o tuples d'una relació. |
| **Columna** | Implementa un atribut amb un tipus de dada i possibles restriccions. |
| **Clau primària (PK)** | Identifica de manera única cada fila. |
| **Clau alternativa** | Restricció d'unicitat que també podria identificar una fila, però no és la PK. |
| **Clau forana (FK)** | Enllaça files de dues taules i aplica integritat referencial. |
| **Índex** | Accelera certes cerques a canvi de cost addicional en escriptura i espai. |
| **Vista** | Consulta emmagatzemada que presenta una visió lògica de les dades. |
| **Diccionari de dades** | Conjunt de metadades sobre els objectes, les estructures i les restriccions. |

#### 3. Exemple de pas de model lògic a implementació física
Partint de l'esquema relacional `DEPARTAMENT(codi_departament, nom)` i `EMPLEAT(codi_empleat, nom, cognoms, email, sou, codi_departament)`, es prenen les decisions físiques corresponents (identificadors autogenerats, textos amb longitud acotada, `DECIMAL` per a imports monetaris evitant `FLOAT`, unicitat i integritat referencial):

```sql
CREATE DATABASE empresa
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE empresa;

CREATE TABLE departament (
  codi_departament INT UNSIGNED AUTO_INCREMENT,
  nom VARCHAR(80) NOT NULL,
  CONSTRAINT pk_departament PRIMARY KEY (codi_departament),
  CONSTRAINT uq_departament_nom UNIQUE (nom)
) ENGINE=InnoDB;

CREATE TABLE empleat (
  codi_empleat INT UNSIGNED AUTO_INCREMENT,
  nom VARCHAR(60) NOT NULL,
  cognoms VARCHAR(120) NOT NULL,
  email VARCHAR(254) NOT NULL,
  sou DECIMAL(10,2) NOT NULL,
  codi_departament INT UNSIGNED NOT NULL,
  CONSTRAINT pk_empleat PRIMARY KEY (codi_empleat),
  CONSTRAINT uq_empleat_email UNIQUE (email),
  CONSTRAINT ck_empleat_sou CHECK (sou >= 0),
  CONSTRAINT fk_empleat_departament
    FOREIGN KEY (codi_departament)
    REFERENCES departament (codi_departament)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;
```


## 27. Llenguatge de definició de dades (DDL)

#### 1. Concepte i instruccions DDL
El **DDL (*Data Definition Language*)** és el conjunt d'instruccions SQL que permet crear, modificar i eliminar l'estructura dels objectes d'una base de dades, sense manipular directament el contingut de les dades.

| Instrucció | Finalitat |
| :---: | :--- |
| `CREATE` | Crea objectes: bases de dades, taules, índexs, vistes, dominis o usuaris. |
| `ALTER` | Modifica l'estructura d'un objecte existent. |
| `DROP` | Elimina un objecte i, potencialment, les dades associades. |
| `TRUNCATE` | Buida totes les files d'una taula conservant-ne l'estructura. |
| `RENAME` | Canvia el nom d'un objecte segons la sintaxi del SGBD. |

> **Atenció:** Les instruccions DDL poden tenir efectes irreversibles (especialment `DROP DATABASE`, `DROP TABLE` i certs `ALTER TABLE`). Abans d'executar-les, cal revisar l'entorn, les dependències i disposar de còpies de seguretat.

#### 2. Subllenguatges SQL: DDL, DML, DCL i TCL

| Família | Objectiu | Exemples |
| :---: | :--- | :--- |
| **DDL** | Defineix estructures de la base de dades. | `CREATE TABLE`, `ALTER TABLE`, `DROP INDEX` |
| **DML** | Insereix, modifica, consulta o esborra dades. | `INSERT`, `UPDATE`, `DELETE`, `SELECT` |
| **DCL** | Gestiona permisos i control d'accés. | `GRANT`, `REVOKE` |
| **TCL** | Controla transaccions. | `START TRANSACTION`, `COMMIT`, `ROLLBACK`, `SAVEPOINT` |


## 28. Convencions de disseny físic

#### 1. Convencions de nomenclatura
Aplicar una convenció estable redueix errors i facilita el manteniment de l'esquema:

- Escriure identificadors en **minúscules i `snake_case`** (`codi_client`, `data_alta`).
- Anomenar les taules en **singular** (`client`, `comanda`, `producte`).
- Utilitzar prefixos coherents per a les restriccions i índexs:
  - `pk_` per a claus primàries.
  - `fk_` per a claus foranes.
  - `uq_` per a restriccions d'unicitat.
  - `ck_` per a restriccions `CHECK`.
  - `ix_` per a índexs.
- Evitar paraules reservades, abreviatures ambigües i noms genèrics (`camp1`, `taula_nova`).
- Mantenir el mateix nom i domini entre una PK i les FK que la referencien sempre que sigui possible.

#### 2. Joc de caràcters i col·lació
- **Joc de caràcters (`CHARACTER SET`)**: Determina com es codifica el text. Per conservar accents, caràcters especials i diversos alfabets s'estableix habitualment `utf8mb4`.
- **Col·lació (`COLLATE`)**: Defineix les regles de comparació i ordenació de cadenes segons l'idioma i les polítiques requerides (p. ex., `utf8mb4_unicode_ci`).

```sql
CREATE DATABASE biblioteca
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
```

> **Nota de coherència:** La codificació ha de coincidir entre la base de dades, les connexions de l'aplicació, els fitxers d'importació i l'eina gràfica.

#### 3. Motor d'emmagatzematge
En MariaDB/MySQL, el motor d'emmagatzematge determina les funcionalitats disponibles. Per a bases de dades relacionals que requereixen integritat referencial (claus foranes) i transaccions, s'utilitza habitualment **`InnoDB`**.

```sql
CREATE TABLE prova (
  id INT UNSIGNED AUTO_INCREMENT,
  descripcio VARCHAR(100) NOT NULL,
  CONSTRAINT pk_prova PRIMARY KEY (id)
) ENGINE=InnoDB;
```


## 29. Tipus de dades i dominis

#### 1. Principi general
El tipus de dada ha de reflectir el domini real de l'atribut, ja que condiciona la validació, l'espai ocupat, les operacions disponibles, les comparacions i el rendiment d'índexs i consultes. No s'ha d'utilitzar `VARCHAR` de manera indiscriminada per a dates, imports o valors booleans.

#### 2. Cadenes de caràcters

| Tipus | Ús habitual | Observacions |
| :---: | :--- | :--- |
| `CHAR(n)` | Codis de longitud fixa (ISO país, codi postal fix, estats de 2 lletres). | Pot completar amb espais segons el SGBD. |
| `VARCHAR(n)` | Noms, correus, adreces, títols i textos curts. | Tipus textual més habitual per a longitud variable. |
| `TEXT` | Observacions o descripcions llargues. | Cal valorar-ne l'impacte en índexs i rendiment. |
| `BLOB` | Dades binàries grans. | Sovint és preferible desar fitxers fora de la BD i guardar-ne la ruta. |

#### 3. Nombres enters i decimals

| Tipus | Ús habitual | Observacions |
| :---: | :--- | :--- |
| `TINYINT` | Booleans (`BOOLEAN` n'és un àlies `TINYINT(1)`) o valors molt petits. | Cal documentar el significat de `0` i `1`. |
| `SMALLINT` | Enters de rang reduït (curs acadèmic codificat, percentatge enter). | Admet el modificador `UNSIGNED`. |
| `INT` | Identificadors habituals i comptadors. | Admet `UNSIGNED` per evitar negatius. |
| `BIGINT` | Identificadors o comptadors de gran volum. | Admet `UNSIGNED`. |
| `DECIMAL(p,s)` | Imports monetaris, percentatges exactes i valors comptables. | `p`: dígits totals; `s`: decimals (equivalent a `NUMERIC(p,s)`). |

> **Atenció amb els decimals:** Mai no s'ha d'utilitzar `FLOAT` o `DOUBLE` per emmagatzemar imports monetaris que requereixin precisió exacta, perquè són tipus de coma flotant aproximada.

#### 4. Dates i hores

| Tipus | Exemple d'ús |
| :---: | :--- |
| `DATE` | Data de naixement, data d'alta o data de lliurament. |
| `TIME` | Hora d'inici d'una activitat o durada. |
| `DATETIME` | Data i hora d'una operació sense conversió automàtica de zona horària. |
| `TIMESTAMP` | Marca temporal d'auditoria, creació o modificació (`DEFAULT CURRENT_TIMESTAMP`). |

#### 5. Valors nuls, valors per defecte i tipus especials
- **`NULL` i `DEFAULT`**: `NULL` indica absència de valor i no equival a `0`, cadena buida (`""`), `FALSE` ni cap data especial. No s'ha d'utilitzar `NULL` per ocultar errors de modelatge; si una dada és obligatòria, cal definir `NOT NULL`. L'ús de `DEFAULT` simplifica insercions i garanteix convencions.
- **Tipus que requereixen prudència**:
  - `ENUM`: Pot ser còmode en alguns SGBD, però redueix la portabilitat i dificulta canvis futurs.
  - **Codis aparentment numèrics**: Dades com el DNI, codis postals o telèfons s'han de desar com a text perquè poden incloure lletres, zeros inicials o guions.
  - **Contrasenyes**: Mai no s'han d'emmagatzemar en text pla; s'han de gestionar des de l'aplicació mitjançant funcions de *hash* segures.


## 30. Creació de bases de dades i taules

#### 1. Creació de bases de dades i estructura general de taula
Les clàusules `IF NOT EXISTS` i `IF EXISTS` permeten elaborar scripts repetibles, tot i que no substitueixen la revisió de l'entorn de treball.

```sql
CREATE DATABASE IF NOT EXISTS institut
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE institut;

CREATE TABLE aula (
  codi_aula INT UNSIGNED AUTO_INCREMENT,
  nom VARCHAR(20) NOT NULL,
  capacitat SMALLINT UNSIGNED NOT NULL,
  CONSTRAINT pk_aula PRIMARY KEY (codi_aula),
  CONSTRAINT uq_aula_nom UNIQUE (nom),
  CONSTRAINT ck_aula_capacitat CHECK (capacitat > 0)
) ENGINE=InnoDB;
```

#### 2. Claus primàries, naturals i artificials
- **Clau primària (PK)**: Identifica unívocament cada fila, no admet `NULL` ni duplicats, pot ser simple o composta i genera habitualment un índex.
- **Clau natural**: Existeix al món real (p. ex., un NIF).
- **Clau artificial o subrogada**: La genera el sistema (p. ex., `INT UNSIGNED AUTO_INCREMENT`). Simplifica relacions i evita que canvis en dades de negoci afectin les FK, però cal mantenir una restricció `UNIQUE` sobre l'identificador natural rellevant.

```sql
-- Exemple de clau artificial + clau natural amb UNIQUE
CREATE TABLE client (
  codi_client INT UNSIGNED AUTO_INCREMENT,
  nif CHAR(9) NOT NULL,
  nom VARCHAR(100) NOT NULL,
  CONSTRAINT pk_client PRIMARY KEY (codi_client),
  CONSTRAINT uq_client_nif UNIQUE (nif)
) ENGINE=InnoDB;

-- Exemple de clau primària composta
CREATE TABLE matricula (
  codi_alumne INT UNSIGNED NOT NULL,
  codi_modul INT UNSIGNED NOT NULL,
  curs_academic CHAR(9) NOT NULL,
  CONSTRAINT pk_matricula PRIMARY KEY (codi_alumne, codi_modul, curs_academic)
) ENGINE=InnoDB;
```

#### 3. Claus foranes i polítiques referencials
Per ser compatibles, la clau forana i la clau referenciada han de tenir dominis compatibles (mateix tipus base, mida raonable i signe coherent).

| Cas d'ús | Política habitual | Motiu |
| :---: | :---: | :--- |
| **Client i comandes** | `ON DELETE RESTRICT` | Evita esborrar clients amb historial de comandes. |
| **Comanda i línies de comanda** | `ON DELETE CASCADE` | Les línies no tenen sentit sense la comanda pare. |
| **Empleat i responsable opcional** | `ON DELETE SET NULL` | Conserva l'empleat sense responsable assignat. |
| **Codi intern immutable** | `ON UPDATE RESTRICT` | Normalment no s'actualitzen claus artificials. |

```sql
CREATE TABLE comanda (
  codi_comanda INT UNSIGNED AUTO_INCREMENT,
  data_comanda DATE NOT NULL,
  codi_client INT UNSIGNED NOT NULL,
  CONSTRAINT pk_comanda PRIMARY KEY (codi_comanda),
  CONSTRAINT fk_comanda_client
    FOREIGN KEY (codi_client)
    REFERENCES client (codi_client)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;
```

#### 4. Restriccions de domini
Asseguren que les dades compleixen regles bàsiques mitjançant `NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`, `PRIMARY KEY` i `FOREIGN KEY`.

```sql
CREATE TABLE producte (
  codi_producte INT UNSIGNED AUTO_INCREMENT,
  nom VARCHAR(120) NOT NULL,
  preu DECIMAL(10,2) NOT NULL,
  estoc INT UNSIGNED NOT NULL DEFAULT 0,
  estat VARCHAR(20) NOT NULL DEFAULT 'actiu',
  CONSTRAINT pk_producte PRIMARY KEY (codi_producte),
  CONSTRAINT ck_producte_preu CHECK (preu >= 0),
  CONSTRAINT ck_producte_estat CHECK (estat IN ('actiu', 'descatalogat'))
) ENGINE=InnoDB;
```


## 31. Modificació d'estructures amb ALTER TABLE

#### 1. Operacions habituals
La sintaxi concreta pot variar lleugerament entre SGBD; en MariaDB/MySQL s'utilitzen habitualment les clàusules següents:

```sql
-- Afegir una columna
ALTER TABLE producte
  ADD COLUMN descripcio TEXT NULL;

-- Modificar tipus o restriccions d'una columna
ALTER TABLE producte
  MODIFY COLUMN nom VARCHAR(160) NOT NULL;

-- Afegir i eliminar restriccions d'unicitat
ALTER TABLE producte
  ADD CONSTRAINT uq_producte_nom UNIQUE (nom);

ALTER TABLE producte
  DROP INDEX uq_producte_nom;

-- Eliminar una clau forana pel seu nom
ALTER TABLE comanda
  DROP FOREIGN KEY fk_comanda_client;
```

#### 2. Planificació abans de modificar estructures
Abans d'executar un `ALTER TABLE` en producció cal verificar:

1. Si existeixen dades prèvies que incompleixin la nova regla.
2. Si altres taules, vistes, procediments o aplicacions depenen de la columna afectada.
3. Si l'operació pot provocar bloquejos a la taula.
4. Si es disposa d'un pla de reversió o d'una còpia de seguretat actualitzada.
5. Si el canvi queda reflectit al diccionari de dades.


## 32. Índexs, vistes i metadades

#### 1. Índexs i rendiment
Un **índex** és una estructura auxiliar que accelera l'accés a les files segons els valors d'una o més columnes. Són especialment útils per a PK, FK, restriccions `UNIQUE` i columnes freqüents en clàusules `WHERE`, `JOIN`, `ORDER BY` i `GROUP BY`.

> **Compromís de rendiment:** Els índexs ocupen espai en disc, exigeixen manteniment intern i alenteixen les operacions d'escriptura (`INSERT`, `UPDATE`, `DELETE`). Cal crear-los únicament quan es justifiquin amb les consultes reals de l'aplicació.

```sql
CREATE INDEX ix_comanda_data
  ON comanda (data_comanda);

CREATE INDEX ix_empleat_departament_nom
  ON empleat (codi_departament, cognoms, nom);
```

#### 2. Vistes
Una **vista** és una consulta guardada que es presenta com si fos una taula virtual. Permet simplificar consultes complexes, limitar columnes visibles i oferir una capa d'abstracció.

```sql
CREATE VIEW vw_empleats_departament AS
SELECT
  e.codi_empleat,
  e.nom,
  e.cognoms,
  e.email,
  d.nom AS departament
FROM empleat e
JOIN departament d
  ON d.codi_departament = e.codi_departament;
```

> **Nota de seguretat:** Una vista no substitueix una política completa de seguretat; els permisos reals s'han de configurar mitjançant rols i privilegis del SGBD.

#### 3. Diccionari de dades i consulta de metadades
El **diccionari de dades** documenta de manera estructurada les metadades de l'esquema: significat de cada taula i columna, tipus i domini, nul·labilitat, claus, valors per defecte, relacions i regles de negoci no implementables amb restriccions simples.

| Columna (`producte`) | Tipus | Admet NULL | Clau/Índex | Valor per defecte | Descripció i regles |
| :---: | :---: | :---: | :---: | :---: | :--- |
| `codi_producte` | `INT UNSIGNED` | No | **PK** | Auto | Identificador intern únic del producte. |
| `nom` | `VARCHAR(120)` | No | **UQ** | - | Nom comercial; no es pot repetir. |
| `preu` | `DECIMAL(10,2)` | No | - | - | Import de venda en euros (`>= 0`). |
| `estoc` | `INT UNSIGNED` | No | - | `0` | Unitats disponibles; no pot ser negatiu. |
| `estat` | `VARCHAR(20)` | No | - | `'actiu'` | Només s'admet `'actiu'` o `'descatalogat'`. |

En MariaDB/MySQL, el catàleg **`information_schema`** permet consultar programàticament aquestes metadades:

```sql
-- Consultar taules d'un esquema
SELECT table_name, table_type, engine
FROM information_schema.tables
WHERE table_schema = 'institut'
ORDER BY table_name;

-- Consultar columnes d'una taula
SELECT column_name, column_type, is_nullable, column_default, column_key, extra
FROM information_schema.columns
WHERE table_schema = 'institut'
  AND table_name = 'matricula'
ORDER BY ordinal_position;

-- Consultar restriccions de clau forana
SELECT constraint_name, table_name, column_name, referenced_table_name, referenced_column_name
FROM information_schema.key_column_usage
WHERE table_schema = 'institut'
  AND referenced_table_name IS NOT NULL
ORDER BY table_name, ordinal_position;
```


## 33. Treball amb eines gràfiques i verificació

#### 1. Principi de doble competència
Cal dominar tant la creació d'objectes mitjançant **eines gràfiques** (útils per explorar i visualitzar l'esquema) com mitjançant **scripts SQL** (imprescindibles per automatitzar, versionar en Git, revisar i desplegar de manera reproduïble).

#### 2. Flux de treball segons l'eina

| Eina | Flux de treball recomanat |
| :---: | :--- |
| **phpMyAdmin** | Accedir al servidor $\rightarrow$ crear/seleccionar BD $\rightarrow$ definir taules, columnes, tipus, nul·labilitat i índexs $\rightarrow$ assignar PK i motor `InnoDB` $\rightarrow$ configurar FK a la vista de relacions $\rightarrow$ revisar el SQL generat i exportar l'estructura. |
| **DBeaver / MySQL Workbench** | Connectar al servidor $\rightarrow$ crear esquema i taules des de l'editor visual $\rightarrow$ definir claus, índexs i relacions $\rightarrow$ generar l'script DDL $\rightarrow$ provar-lo en un esquema de proves $\rightarrow$ comparar amb el model lògic i desar en control de versions. |

#### 3. Verificació visual mínima i pla de proves
Després de generar l'esquema cal comprovar visualment que totes les taules, columnes, PK, FK i polítiques `ON DELETE` / `ON UPDATE` coincideixen exactament amb el model lògic i l'script DDL.

Per validar la implementació física cal executar un **pla de proves** que inclogui:

- **Casos vàlids (proves positives)**: Insercions i operacions que el sistema ha d'acceptar.
- **Casos invàlids (proves negatives)**: Intents d'inserció o modificació que vulneren PK, FK, `UNIQUE`, `NOT NULL` o `CHECK` i que el SGBD ha de rebutjar.
- **Polítiques referencials**: Comprovació del comportament de `RESTRICT`, `CASCADE` o `SET NULL` davant esborrats i actualitzacions.
- **Verificació de metadades**: Consulta a `information_schema` per confirmar l'estructura real desplegada.


## 34. Glossari
- **Base de dades:** Conjunt organitzat de dades i objectes relacionats.
- **Catàleg:** Repositori de metadades que descriu els objectes d'un SGBD (p. ex., `information_schema`).
- **Clau alternativa:** Clau candidata no escollida com a clau primària, implementada mitjançant `UNIQUE`.
- **Clau forana (FK):** Columna o conjunt de columnes que referencia una clau d'una altra taula.
- **Clau primària (PK):** Identificador únic i no nul de les files d'una taula.
- **Collation (Col·lació):** Regles de comparació i ordenació de cadenes de text.
- **DDL:** Llenguatge de definició de dades (*Data Definition Language*).
- **Domini:** Conjunt de valors vàlids que pot prendre un atribut.
- **Índex:** Estructura auxiliar que accelera l'accés a files segons determinades columnes.
- **Integritat d'entitat:** Regla que impedeix claus primàries nules o duplicades.
- **Integritat referencial:** Regla que exigeix que una clau forana apunti a una fila existent o sigui nul·la si es permet.
- **Metadada:** Dada que descriu una altra dada o objecte de la base de dades.
- **Motor d'emmagatzematge:** Component del SGBD que gestiona l'emmagatzematge físic i funcionalitats com transaccions o FK (`InnoDB`).
- **Restricció:** Regla que el SGBD comprova automàticament per preservar la validesa de les dades.
- **Script:** Fitxer de text amb instruccions SQL executables.
- **Vista:** Consulta desada que ofereix una representació lògica de les dades.


## 35. Resum final de la unitat
1. El disseny físic concreta el model lògic en un SGBD específic sense alterar-ne el significat ni les regles de negoci.
2. Seleccionar tipus de dades precisos (`DECIMAL` per a moneda, `DATE`/`DATETIME` per a temps, `VARCHAR`/`CHAR` segons longitud) optimitza la validació, l'espai i el rendiment.
3. Les convencions de nomenclatura (`snake_case`, singular per a taules i prefixos `pk_`, `fk_`, `uq_`, `ck_`, `ix_`) faciliten el manteniment de l'esquema.
4. La integritat de les dades es garanteix mitjançant claus primàries, alternatives, foranes, restriccions de domini (`NOT NULL`, `CHECK`, `DEFAULT`) i polítiques referencials (`RESTRICT`, `CASCADE`, `SET NULL`).
5. Els índexs acceleren les cerques freqüents, però penalitzen les operacions d'escriptura i ocupen espai, per la qual cosa s'han de crear amb criteri.
6. Les modificacions estructurals amb `ALTER TABLE` requereixen planificació prèvia, anàlisi d'impacte i còpies de seguretat.
7. El domini tant de scripts DDL versionables com d'eines gràfiques, juntament amb un pla de proves positiu i negatiu i un diccionari de dades complet, assegura una implementació professional.


Aquí teniu una [simulació d'examen](../exercicis/ex016-simulació-examen.md). 