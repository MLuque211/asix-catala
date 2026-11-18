# Assignatura: Gestió de base de dades
S'enfoca en el disseny, implementació, gestió i explotació dels sistemes de dades per emmagatzemar la informació de manera estructurada, segura i eficient. Aquesta representació ha de ser correcta, eficient i útil per a diferents usuaris.
## 1. Dades, informació i representació

Concepte de dada i informació: Una dada és una representació d'un fet, concepte o instrucció d'una manera formalitzada, apta per ser comunicada, interpretada o processada per fons humanes o automàtiques.

1. **Dada vs. Informació**: Les dades per separat no volen dir res; és una representació informàtica. La informació s'obté quan les dades es processen, s'organitzen o s'interpreten en un context determinat.
2. Per dissenyar bé una base de dades cal separar tres nivells de pensament:
    1. **Món real**: És la part de la realitat que es vol informatitzar o modelar.
    2. **Món conceptual**: És el disseny del que es vol representar de la realitat.
    3. **Món de les representacions**: És la formalització de les idees en un model de dades.
3. **Fases del disseny d'una Base de Dades**
    1. **Disseny Conceptual**: Què ens interessa del món real (entitats, relacions, atributs i restriccions).
    2. **Disseny Lògic**: Com ho representem en un model de dades determinat (taules, columnes i claus).
    3. **Disseny Físic**: Com ho guardem als medis d'emmagatzematge (índex, particions, fitxers, etc.).

## 2. Elements bàsics d'una base de dades
Una **entitat** és qualsevol objecte o concepte del món real (tant tangible com intangible) sobre el qual es vol emmagatzemar informació.
- **Entitat tipus**: Classe general d'elements.
- **Entitat instància**: Element concret d'aquesta classe.

Una **relació** és una connexió o associació existent entre dues o més entitats. Com més relacions s'identifiquen i defineixen, més identificable i precís és el model.

Un **atribut** és una propietat o característica que descriu una entitat o una relació.

Una **Clau**: Atribut o conjunt d'atributs que permete identificar de manera única una instància (La clau primària no pot admetre cap valor NULL).

Un **valor** és un contingut concret que pren un atribut per a una instància específica d'una entitat.
- **Tipus de dada**: Conjunt general de valors amb operacions possibles (ex: string, integer, date, decimal).
- **Domini**: Conjunt de valors vàlids per a un atribut.

Un **valor NULL** indica l'absència de valor, diferenciant entre un zero, una cadena buida i un espai en blanc.

_Exemple_
| Atribut | Tipus | Domini | Admet NULL? | Descripció / Funció |
| :---: | :---: | :---: | :---: | :---: |
| DNI | String | Tots els DNI possibles | No | Identificador únic (Clau Primària) |
| Nom | String | Entre 1 i 100 caràcters | No | Nom de l'usuari/persona |
| Data Naixement | Date | Data realista | No | Data de naixement vàlida |
| Nota | Decimal | Valors de 0 a 10 | Sí | Qualificació acadèmica |
| Telèfon | String | Format telefònic admès | Sí | Número de contacte |

## 3. Representació tabular

La representació més habitual en el model relacional és la **taula** (taula, fila, columna, cel·la). Una de menys habitual és el **CSV** (fitxers de valors separats en comes). Una taula es pot organitzar:
- **Seqüencial**: Els registres es desen un darrera l'altre. És simple i útil per processaments complets, però lenta per buscar un registre concret si no hi ha cap estructura auxiliar.
- **Directa**: Permet accedir a una posició concreta sense recórrer tot el fitxer. Pot utilitzar càlculs d’adreça o hashing.
- **Indexada**: És una estructura auxiliar que ajuda a localitzar registres segons una clau.

Els **sistemes lògics d'emmagatzematge** són maneres d'organitzar les dades perquè les operacions siguin possibles i eficients. Tenim:
- **Fitxer pla**: Guarda informació text en format simple, sense cap estructura relacional.
- **Piles i cues**: Estructures de dades per a processament d'accés primer/últim (LIFO / FIFO).
- **Hashing**: Calcula la posició física exacta d'emmagatzematge a partir d'un número o clau única, permetent accés directe.

Un **índex** és una estructura de dades auxiliar que permet trobar registres de manera molt més directa i eficient. Està format per les dades de la clau i un apuntador (adreça física o lògica). Hi ha dos tipus:
- **Índex dens**: Té una entrada a líndex per cada registre del fitxer.
- **Índex no dens**: Té una entrada a l'índex només per a alguns registres o blocs de dades, reduint la mida de l'índex.

Un **apuntador** connecta registres relacionats o permeten navegar entre blocs de memòria directament.
```
Exemple de Ticketmaster/FC Barcelona

- Dada: 48123456K, 80'50.
- Informació: El soci 48123456K ha comprat una entrada de 85'50€.
- Món Real (disseny conceptual): Un aficionat emetent una compra per a un partit.
- Món Conceptual (disseny lògic): TAULA Usuaris, TAULA Entrades.
- Món de les representacions (disseny físic): Emmagatzematge en discos SSD d'AWS optimitzat amb índexs.

- Entitat tipus: Usuari, Entrada.
- Entitat instància: L'usuari concret "Isaac Garcia".
- Relació: "Un Usuari COMPRA una Entrada".
- Atribut: Email, Preu_Entrada.
- Clau Primària: ID_Usuari (USR-001) (mai admet NULL).
- Valor: 85.50.
- Tipus de Dada: Decimal, String, Date.
- Domini: Preus vàlids de 10.00 a 1000.00€.
- Valor NULL: El camp Telèfon que el soci no ha volgut omplir al formulari  . 

- Seqüencial: Guardar les compres d'entrades una darrere l'altra al disc dur segons l'ordre d'arribada.
- Directa: Anar directament al sector de disc on està el registre calculant la seva posició de memòria.
- Indexada: Consultar una llista auxiliar ordenada per trobar un registre a l'instant.

- Fitxer pla (taula): Un fitxer socis descarregat per obrir les dades a Excel.
- Cua (FIFO): La cua virtual on el primer usuari que entra a la web és el primer a comprar l'entrada.
- Pila (LIFO): El botó de "Desfer" (Undo) de l'administrador que cancel·la l'últim canvi realitzat.
- Hashing: El càlcul immediat en O(1) per validar el codi QR de l'entrada al torn d'accés del Camp Nou.

- Apuntador: Sector 402, Bloc 12 (Adreça física de memòria on està tota la informació del soci).
- Índex dens: Un índex amb els 5 milions de correus dels socis ordenats, on cada email té el seu apuntador.
- Índex no dens (Dispers): Un índex que apunta només al primer soci de cada bloc de 1.000 registres per estalviar espai en memòria.
```
Veure [Exercici 1: Elecció del sistema d'emmagatzematge](../exercicis/ex1-sistema-emmagatzematge.md)

## 4. De fitxers tradicionals a base de dades
Els fitxers són útils en entorns senzills, però quan el volum de dades creix i cal compartir la informació entre diferents usuaris o aplicacions, apareixen problemes d'eficiència, seguretat i manteniment.

| Problema | Amb fitxers | Amb base de dades |
| :---: | :---: | :---: |
| **Redundància** | Cada aplicació pot tenir la seva pròpia còpia de les dades. | Les dades es centralitzen o es controlen de manera unificada. |
| **Inconsistència** | Dues còpies de la mateixa dada poden tenir valors diferents. | El SGBD ajuda a mantenir la coherència de la informació. |
| **Aïllament** | Les dades queden disperses en fitxers diferents i desconnectats. | Les relacions permeten consultar dades interconnectades. |
| **Consultes noves** | Cal programar-les de zero o manipular fitxers manualment. | Es poden realitzar consultes àgils amb **SQL** o eines del SGBD. |
| **Integritat** | La lògica de control depèn exclusivament de cada programa. | La pròpia BD la pot controlar mitjançant restriccions (*constraints*). |
| **Concurrència** | Dos usuaris o processos podent trepitjar-se els canvis. | El SGBD gestiona l'accés simultani amb bloquejos i transaccions. |
| **Seguretat** | Permisos limitats a nivell de fitxer o d'aplicació. | Control d'accés granular per usuari, rol, taula, vista o operació. |

Per entendre un entorn de dades complet, cal diferenciar entre la informació emmagatzemada i el conjunt global que la fa funcionar:
- **Base de dades**: Conjunt estructurat de dades interrelacionades que representa una part del món real i que pot ser utilitzat de manera compartida per diferents usuaris o aplicacions.
- **Sistema de bases de dades**: Conjunt integrat per la **base de dades**, el **SGBD** (Sistema Gestor de Bases de Dades), els **usuaris**, les **aplicacions**, el **maquinari**, els **procediments** i les **normes d’ús**.

No tots els escenaris requereixen la complexitat d'un SGBD. Un **fitxer tradicional** pot ser la millor opció quan es compleixen aquestes condicions:

    1. El **volum de dades** és molt petit.
    2. No existeixen **relacions** entre les dades.
    3. Només hi escriu una **única aplicació**.
    4. No es requereixen **consultes complexes**.
    5. Es tracta de **fitxers de configuració** o registres d'activitat (*logs*) simples.

Veure [Exercici 2: Detecció de redundàncies](../exercicis/ex2-deteccio-redundancia.md)


## 5. Sistemes gestors de bases de dades

#### 1. Què és un SGBD?

Un **Sistema Gestor de Bases de Dades (SGBD)** és un programari especialitzat que permet definir, crear, consultar, modificar, protegir, administrar i recuperar bases de dades. Actua com a intermediari entre les aplicacions o usuaris i les dades físiques emmagatzemades.

#### 2. Utilitat d’un SGBD

Un SGBD aporta un conjunt de funcionalitats essencials per a la gestió de dades:
- **Definició d’estructures de dades** i **diccionari de dades**.
- Execució de **consultes no predefinides**.
- **Independència física i lògica** respecte a les aplicacions.
- **Control de redundància** i **integritat de les dades**.
- Gestió de **transaccions** i **concurrència**.
- **Seguretat, permisos, còpies de seguretat** i **recuperació**.
- **Eines d’administració i monitoratge**.

#### 3. Objectius i funcionalitats principals
- Consultes no predefinides: Permet realitzar consultes noves mitjançant llenguatges com **SQL** sense haver de reprogramar l'aplicació per a cada necessitat.
- Independència física: L'estructura d'emmagatzematge físic (índexs, particions) pot canviar sense que això afecti o obligui a modificar el codi de les aplicacions.
- Independència lògica: Permet realitzar canvis en l'esquema lògic (com afegir noves columnes) sense alterar el funcionament de les aplicacions que no utilitzen aquests camps.
- Control de redundància: Dissenyat per evitar duplicitats innecessàries. Si existeixen rèpliques intencionades, el SGBD s'encarrega de mantenir la seva coherència.
- Integritat: Garanteix que les dades emmagatzemades siguin vàlides, correctes i coherents mitjançant diferents tipus de restriccions (*constraints*).

| Tipus de restricció | Què controla | Exemple |
| :---: | :---: | :---: |
| **Domini** | Valors admesos per a un atribut. | La nota ha d’estar entre 0 i 10. |
| **Clau primària** | Identificació única d'una instància. | No pot haver-hi dos alumnes amb el mateix `id_alumne`. |
| **Clau forana** | Manteniment de les relacions vàlides. | Una matrícula ha de referenciar un alumne existent. |
| **No nul (NOT NULL)** | Obligatorietat de presència de valor. | El nom de l’alumne no pot ser `NULL`. |
| **Únic (UNIQUE)** | No repetició d’un valor concret. | El correu electrònic no es pot repetir en la taula. |

- Transaccions: Un conjunt d’operacions que s'han d’executar de manera completa o no executar-se en absolut (*tot o res*).
- Concurrència: Mecanisme que gestiona l'accés simultani de diversos usuaris o processos al mateix temps sobre les mateixes dades, evitant interferències o incoherències.
- Seguretat: Sistema de protecció que inclou autenticació, autorització, assignació de rols, privilegis, vistes, auditoria i xifratge.

#### 4. Propietats ACID
Les transaccions d'un SGBD s'avaluen i descriuen mitjançant les **propietats ACID**:

| Propietat | Significat |
| :---: | :---: |
| **Atomicitat** | La transacció s'executa sencera o no es fa gens (*tot o res*). |
| **Consistència** | La base de dades passa d’un estat vàlid a un altre estat vàlid respectant totes les regles. |
| **Aïllament** | Les transaccions concurrents no s’interfereixen entre si de manera incorrecta. |
| **Durabilitat** | Un cop confirmada la transacció, les dades persisteixen de forma permanent. |

#### 5. Llenguatges de bases de dades

| Categoria | Nom complet | Funció | Exemples DDL/DML/DCL |
| :---: | :---: | :---: | :---: |
| **DDL** | *Data Definition Language* | Definir i crear estructures de la BD. | `CREATE TABLE`, `ALTER TABLE`, `DROP` |
| **DML** | *Data Manipulation Language* | Inserir, modificar o esborrar dades. | `INSERT`, `UPDATE`, `DELETE` |
| **DQL** | *Data Query Language* | Consultar i recuperar dades (part del DML). | `SELECT` |
| **DCL** | *Data Control Language* | Administrar privilegis i permisos. | `GRANT`, `REVOKE` |
| **TCL** | *Transaction Control Language* | Controlar el flux de les transaccions. | `COMMIT`, `ROLLBACK`, `SAVEPOINT` |

#### 6. Usuaris d’un SGBD

| Tipus d’usuari | Descripció | Exemple |
| :---: | :---: | :---: |
| **Usuari final o extern** | Accedeix a la BD indirectament mitjançant una aplicació. | Client d’un caixer automàtic. |
| **Usuari sofisticat** | Fa consultes directes mitjançant eines pròpies del SGBD. | Analista de dades escrivint SQL. |
| **Programador d’aplicacions** | Desenvolupa programes que interactuen amb la BD. | Desenvolupador d’una aplicació web. |
| **DBA** | Administra la BD, permisos, rendiment, còpies i seguretat. | Administrador de bases de dades. |

#### 7. Funcions del DBA
El **DBA** (*Database Administrator*) és el responsable de:
- Crear i mantenir els esquemes de la BD.
- Definir usuaris, rols i gestió de permisos.
- Planificar les **còpies de seguretat** i la **recuperació** davant d'incidències.
- Controlar el rendiment, l'optimització i l'espai en disc (índexs i estructures físiques).
- Vetllar per la integritat, seguretat i documentació del sistema.

## 6. Components funcionals d’un SGBD
Un SGBD es pot entendre com un conjunt de mòduls integrats que cooperen per gestionar les dades de manera eficient, segura i transparent per a l'usuari.

#### 1. El **processador de consultes**
Interpreta les instruccions enviades per l'usuari o les aplicacions i les transforma en operacions que el sistema pot executar a nivell físic.

| Component | Funció principal |
| :---: | :---: |
| **Intèrpret DDL** | Interpreta les instruccions de definició d'estructura (`CREATE`, `ALTER`, `DROP`) i actualitza el diccionari de dades. |
| **Compilador DML** | Tradueix les consultes i operacions de manipulació de dades (`SELECT`, `INSERT`, etc.) a plans d’execució. |
| **Optimitzador** | Analitza i tria l'estratègia més eficient (menys cost de temps i recursos) per executar una consulta. |
| **Motor d’execució** | Executa les instruccions segons el pla d'execució generat per l'optimitzador. |

#### 2. El **gestor d’emmagatzematge**
Connecta el nivell lògic (esquemes, taules) amb el nivell físic (fitxers, discos).

| Component | Funció principal |
| :---: | :---: |
| **Gestor d’arxius** | Administra l'espai físic en disc i l'organització de les estructures de fitxers. |
| **Gestor de memòria intermèdia (*Buffer Manager*)** | Decideix quines pàgines de dades es mantenen a la RAM per reduir els accessos lents a disc. |
| **Gestor de transaccions** | Assegura les propietats ACID, mantenint l'atomicitat, l'aïllament i la recuperabilitat. |
| **Gestor d’autoritzacions i integritat** | Comprova els permisos dels usuaris i valida que es compleixin les restriccions d'integritat. |

#### 3. Estructures físiques habituals
Per dur a terme la seva funció, el SGBD utilitza diferents estructures de fitxers a nivell d'emmagatzematge:
- **Arxius de dades**: Fitxers que contenen els registres i informació pròpiament dita.
- **Índexs**: Estructures auxiliars que acceleren l'accés i cerca per determinats camps.
- **Logs o diaris de transaccions**: Fitxers de registre d'activitat que permeten recuperar la BD davant d'errors o caigudes.
- **Diccionari de dades**: Emmagatzema les metadades de tot el sistema.

#### 4. El **diccionari de dades**
És el repositori centralitzat que conté les **metadades** (dades sobre les dades) que descriuen l’estructura i l’organització global de la base de dades. El diccionari conté informació sobre:
- **Estructures**: Taules, columnes, vistes i tipus de dades.
- **Regles i restriccions**: Claus primàries, claus foranes i restriccions d'integritat.
- **Accés i seguretat**: Usuaris, rols, privilegis i permisos.
- **Optimització**: Índexs i estadístiques d’ús del sistema.
- **Lògica programable**: Procediments emmagatzemats, funcions i *triggers*.

Veure [Exercici 3: consultar el diccionari de dades amb SQLite](../exercicis/ex3-consultar.md)


## 7. Arquitectura ANSI/X3/SPARC: nivells d’abstracció
L’**arquitectura ANSI/X3/SPARC** estableix un model de referència que separa la visió d’una base de dades en **tres nivells d'abstracció independents**, permetent aïllar la percepció de l'usuari de l'emmagatzematge físic real.

#### 1. Nivells de l'arquitectura

| Nivell | Descripció | Responsabilitat / Contingut |
| :---: | :---: | :---: |
| **Nivell extern** | Visió particular o parcial de les dades per a cada usuari o aplicació (*Vistes*). | Defineix interfícies personalitzades i restringeix l'accés a dades no rellevants o confidencials. |
| **Nivell conceptual** | Estructura lògica global de tota la base de dades (*Esquema conceptual*). | Representa totes les entitats, atributs, relacions, domini de dades i restriccions d'integritat. |
| **Nivell intern** | Descripció de l'emmagatzematge físic de les dades (*Esquema físic*). | Detalla l'organització en disc, estructures de fitxers, pàgines de memòria, índexs, particions i camins d'accés. |

#### 2. Avantatge principal
El principal propòsit d'aquesta arquitectura de tres nivells és assolir la **independència de dades**:

1. **Independència física**: Permet realitzar canvis en l'estructura d'emmagatzematge físic (com afegir índexs o canviar de disc) sense haver de modificar l'esquema conceptual ni les aplicacions.
2. **Independència lògica**: Permet modificar l'esquema conceptual (com afegir un nou camp) sense afectar les vistes externes o aplicacions que no fan servir aquesta informació.
3. **Seguretat i adaptabilitat**: Permet oferir diferents vistes adaptades a cada perfil d'usuari, millorant la privacitat i el manteniment global de la BD.

Exemple d'aplicació dels 3 nivells de l'arquitectura ANSI/X3/SPARC
- Nivell Extern (Vistes usuaris):
    - Vista Professor: Només veu 'Nom Alumne', 'Assignatura' i 'Nota final'.
    - Vista Secretaris: Veu 'Nom Alumne', 'DNI', 'Dades Bancàries' i 'Estat de la Matrícula'.
- Nivell Conceptual (Esquema Lògic Global):
    - Taula ALUMNE (id_alumne, dni, nom, email, compte_bancari)
    - Taula MATRICULA (id_matricula, id_alumne, id_assignatura, nota)
    - Restricció: Nota entre 0 i 10. ID_Alumne és la Clau Primària.
- Nivell Intern (Esquema Físic):
    - Emmagatzematge en blocs de pàgina de 8 KB en un sistema de fitxers InnoDB.
    - Índex B-Tree creat sobre la columna 'DNI' per accelerar les cerques.

## 8. Models de bases de dades

#### 1. Què és un model de dades?
Un **model de dades** és un conjunt d’eines conceptuals que permet descriure dades, les seves relacions, les seves restriccions i les operacions que s'hi poden aplicar. Un model de dades defineix principalment:
    - **Estructures**: La forma com s'organitzen les dades (taules, arbres, documents, grafs, objectes).
    - **Restriccions**: Regles per mantenir la coherència (claus, dominis, integritat referencial).
    - **Operacions**: Mecanismes per consultar, inserir, modificar i esborrar informació.

#### 2. Classificació per nivell d’abstracció

| Tipus de model | Ús principal | Exemples |
| :---: | :---: | :---: |
| **Conceptual** | Anàlisi del problema i de la realitat a alt nivell. | Model Entitat-Relació (E/R), UML de classes. |
| **Lògic** | Representació estructurada implementable en un SGBD. | Model Relacional, Documental, Graf, Xarxa. |
| **Físic** | Estructures internes d’emmagatzematge de baix nivell. | Arbres B+, Hash, organització per pàgines i índexs. |

#### 3. Principals models de dades
1. Model jeràrquic: Organitza les dades en una estructura d'**arbre invertit**.
    - **Característiques**: Un node arrel; cada node fill té un **únic pare** (relacions 1:N strictes).
    - **Avantatges/Inconvenients**: Accés molt ràpid si la consulta segueix la jerarquia, però poc flexible si no és el cas.
    - **Exemples d'ús actuals**: Sistemes de fitxers, LDAP / Active Directory, DNS, documents XML.
2. Model en xarxa: Evolució del model jeràrquic que permet que un registre fill tingui **més d’un pare** (graf de registres amb apuntadors). És més flexible, però presenta una elevada complexitat d'administració.
3. Model relacional: Representa la informació mitjançant **taules**. És el model predominant en la majoria de sistemes d'informació empresarials.
    - **Estructura**: Les dades es guarden en taules, on les files són **tuples** (registres) i les columnes són **atributs**.
    - **Relacions**: Es representen enllaçant taules mitjançant **claus foranes** (*foreign keys*).
    - **Llenguatge**: S'utilitza **SQL** (*Structured Query Language*).
4. Model relacional amb objectes i orientat a objectes
    - **Relacional amb objectes**: Amplia el model relacional tradicional amb tipus de dades complexos, estructures riques i funcions associades segons el SGBD.
    - **Orientat a objectes**: Representa les dades com a objectes del món real amb atributs i mètodes associats.
    - **Conceptes clau**: Classe, objecte, atribut, mètode, encapsulació, herència i polimorfisme.
5. Bases de dades XML i documentals (NoSQL): Emmagatzemen informació en **documents estructurats o semiestructurats** (JSON, XML).
    - **Ús principal**: Quan les dades no tenen una estructura fixa/rígida o cal intercanviar dades fàcilment entre sistemes web/APIs.
6. Bases de dades de graf (NoSQL): Representen la informació com un conjunt de **nodes** (entitats) i **arestes** (relacions).
    - **Ús principal**: Ideal quan les relacions i els camins de connexió són tan o més importants que les pròpies dades (ex: xarxes socials, sistemes de recomanació, xarxes de transport).

#### 4. Comparativa de models

| Model | Estructura | Punt fort | Limitació |
| :---: | :---: | :---: | :---: |
| **Jeràrquic** | Arbre (pare-fill). | Gran rendiment en accessos jeràrquics directes. | Poca flexibilitat per consultes no previstes. |
| **Xarxa** | Graf de registres amb apuntadors. | Més flexible que el model jeràrquic. | Complexitat desenvolupament i manteniment elevada. |
| **Relacional** | Taules (files i columnes). | Simplicitat lògica, SQL estàndard, alta integritat. | `JOIN`s costosos en grans volums de dades. |
| **Relacional amb objectes** | Taules amb tipus complexos. | Combina la potència de SQL amb dades riques. | Més complex de dissenyar que el relacional pur. |
| **Documental (JSON/XML)** | Documents semiestructurats. | Gran flexibilitat d’esquema i escalabilitat. | Integritat referencial menys directa o automàtica. |
| **Graf** | Nodes i arestes. | Optimitza la cerca de relacions complexes i camins. | Menys eficient per a dades tabulars o simples. |

Veure [Exercici 4. Triar el model adequat](../exercicis/ex4-model-adequat.md)


## 9. Bases de dades segons la ubicació de la informació

#### 1. Centralitzades
Una **base de dades centralitzada** guarda totes les dades en un únic sistema o ubicació principal.
    - **Avantatges**: Administració més simple, control centralitzat unificat i menys problemes de coherència entre còpies.
    - **Inconvenients**: Punt únic de fallada (*Single Point of Failure*) si no hi ha alta disponibilitat, possible coll d'ampolla i major latència per a usuaris distants.

#### 2. Client-servidor
En l’**arquitectura client-servidor**, les aplicacions clientes (escriptori, web, APIs, eines d'administració) fan peticions i el servidor central de BD s'encarrega de processar-les i retornar els resultats.

#### 3. Distribuïdes
Una **base de dades distribuïda** té les dades repartides en diversos nodes connectats per xarxa, però ofereix una visió unificada i coordinada del conjunt a l'usuari.
1. Sistemes homogenis: Tots els nodes utilitzen el **mateix SGBD** o tecnologies compatibles.
    - **Avantatge**: Molt més fàcil de coordinar, gestionar consultes i mantenir transaccions.
2. Sistemes heterogenis: Els nodes utilitzen **SGBD diferents** (ex: MySQL en un node i PostgreSQL o Oracle en un altre).
    - **Avantatge**: Més flexibilitat i permet aprofitar sistemes existents.
    - **Inconvenient**: Gran complexitat d’integració, conversió de formats i administració.

#### 4. Duplicació i fragmentació
- **Replicació (Duplicació)**: Guardar còpies exactes de les mateixes dades en més d’un node.
- **Fragmentació**: Dividir una taula o conjunt de dades en fragments per ubicar-los en nodes diferents:
    - **Fragmentació horitzontal**: Divideix per **files** (tuples).
    - **Fragmentació vertical**: Divideix per **columnes** (atributs).
    - **Fragmentació mixta**: Combina la fragmentació horitzontal i la vertical.

| Estratègia | Avantatge | Risc |
| :---: | :---: | :---: |
| **Replicació completa** | Alta disponibilitat i consultes locals molt ràpides. | Actualitzacions i escriptures molt més costoses. |
| **Divisió sense rèplica** | Estalvia espai i simplifica les actualitzacions. | Si cau un node, es perden temporalment aquestes dades. |
| **Node principal amb rèpliques parcials** | Equilibri entre control central i proximitat als usuaris. | Dependència parcial del node principal. |
| **Rèpliques en nodes seleccionats** | Bona disponibilitat sense duplicar-ho tot a tot arreu. | Disseny i manteniment de la coherència més complexos. |

#### 5. Transparències en bases de dades distribuïdes
La **transparència** permet que la complexitat de la distribució sigui invisible per a l'usuari o programador:
    - **Transparència d’ubicació**: L’usuari no necessita saber en quin node físic es troben les dades.
    - **Transparència de replicació**: L’usuari no necessita saber quantes còpies d'una dada existeixen.
    - **Transparència de fragmentació**: L’usuari consulta com si la taula fos completa, encara que internament estigui dividida.
    - **Transparència de fallades**: El sistema continua funcionant automàticament encara que un node falli.

#### 6. Avantatges i inconvenients de les BD distribuïdes

| Avantatges | Inconvenients |
| :---: | :---: |
| Apropen les dades físicament als usuaris locals. | Disseny i arquitectura molt més complexos. |
| Milloren la disponibilitat si hi ha rèpliques. | Mantenir la coherència de les dades és difícil. |
| Permeten autonomia local a cada seu o node. | Costos elevats de xarxa, infraestructura i comunicació. |
| Reparteixen la càrrega de treball (escalabilitat). | Gestió de la seguretat i recuperació més complexa. |

Veure [Exercici 5. Disseny distribuït](../exercicis/ex5-disseny-distribuit.md)


## 10. Classificació dels SGBD
Els SGBD es poden classificar des de diferents punts de vista segons el criteri utilitzat (model de dades, arquitectura, tipus de càrrega de treball o desplegament).

#### 1. Segons el model de dades

| Tipus | Característica | Exemples habituals |
| :---: | :---: | :---: |
| **Relacional** | Estructura en taules, claus i ús de SQL. | MariaDB, MySQL, PostgreSQL, Oracle, SQL Server, SQLite. |
| **Objecte-relacional** | Model relacional ampliat amb tipus avançats i extensions. | PostgreSQL, Oracle Database. |
| **Documental** | Emmagatzematge en documents semiestructurats (JSON, BSON, XML). | MongoDB, CouchDB, bases XML natives. |
| **Clau-valor** | Accés extremadament ràpid mitjançant un identificador únic. | Redis, Riak. |
| **Columna ampla** | Dades distribuïdes en famílies de columnes per a grans volums. | Cassandra, HBase. |
| **Graf** | Informació estructurada en nodes, arestes i propietats. | Neo4j, JanusGraph. |

#### 2. Segons la ubicació i arquitectura

| Tipus | Descripció |
| :---: | :---: |
| **Monousuari** | Dissenyat per a ser utilitzat per un sol usuari o aplicació local. |
| **Client-servidor** | Un servidor centralitza la BD i atén les peticions de múltiples clients. |
| **Distribuït** | Les dades estan repartides en diferents nodes coordinats per xarxa. |
| **Encastat (*Embedded*)** | El SGBD s'integra directament dins del propi codi/executable de l'aplicació. |
| **Al núvol (*Cloud*)** | Infraestructura gestionada al núvol, sovint ofert com a servei (SaaS/PaaS). |

#### 3. Segons la càrrega de treball (OLTP vs. OLAP)
    - **OLTP (*Online Transaction Processing*)**: Sistemes orientats a operacions diàries, ràpides i freqüents (compres, matrícules, reserves, bancs).
    - **OLAP (*Online Analytical Processing*)**: Sistemes orientats a l'anàlisi massiva de dades, informes executius i presa de decisions (*Business Intelligence*).

| Criteri | OLTP | OLAP |
| :---: | :---: | :---: |
| **Objectiu principal** | Operacions transaccionals diàries. | Anàlisi de dades i presa de decisions. |
| **Tipus de consultes** | Curtes, molt freqüents i d'accés directe. | Complexes, agregades (`SUM`, `AVG`) i de llarga durada. |
| **Nivell de dades** | Dades actuals, en temps real i detallades. | Dades històriques, consolidades i resumides. |
| **Exemple** | Venda d’una entrada de concert. | Informe de vendes trimestral o comparativa anual. |

#### 4. Segons el desplegament

| Tipus | Descripció |
| :---: | :---: |
| **Local** | Instal·lat directament en un ordinador o servidor propi d'escriptori. |
| **Servidor corporatiu** | On-premise, en el centre de dades (*Data Center*) intern d’una organització. |
| **Servei gestionat (*DBaaS*)** | El proveïdor (AWS, GCP, Azure) s’encarrega del manteniment, còpies i escalabilitat. |
| **Híbrid** | Combina servidors locals amb infraestructures de bases de dades al núvol. |

Veure [Exercici 6. Classificar SGBD](../exercicis/ex6-classificar-sgbd.md)

## 11. Avaluació final
Veure [Exercici 7. Avaluació final](../exercicis/ex7-avaluacio-final.md)

## 12. Glossari
- **Atribut:** Propietat d’una entitat.
- **Base de dades:** Conjunt estructurat de dades interrelacionades.
- **Camp:** Implementació d’un atribut en un fitxer o taula.
- **Clau forana:** Camp o conjunt de camps que referencia una clau primària d’una altra taula.
- **Clau primària:** Clau triada per identificar de manera única cada registre.
- **Concurrència:** Accés simultani de diversos usuaris o processos a les dades.
- **Dada:** Representació informàtica d’una informació.
- **DBA:** Administrador de bases de dades.
- **Diccionari de dades:** Repositori de metadades de la base de dades.
- **Domini:** Conjunt de valors vàlids per a un atribut.
- **Entitat:** Objecte o concepte del món real que es vol representar.
- **Fitxer pla:** Fitxer amb dades sense estructura relacional complexa.
- **Índex:** Estructura auxiliar per accelerar cerques.
- **Integritat:** Propietat que indica que les dades són coherents i vàlides.
- **Metadada**: Dada que descriu una altra dada.
- **Model de dades:** Conjunt d’eines per descriure estructures, restriccions i operacions sobre dades.
- **Registre:** Conjunt de camps que representa una instància.
- **SGBD:** Sistema gestor de bases de dades.
- **Transacció:** Conjunt d’operacions que s’executen com una unitat.
- **Vista:** Representació externa o subconjunt lògic de dades per a un usuari o aplicació.

## 13. Resum final
1. Les dades són representacions informàtiques de la informació.
2. Una base de dades modela una part del món real.
3. Cal distingir món real, món conceptual i món de les representacions.
4. Les entitats tenen atributs, i els atributs prenen valors dins d’un domini.
5. Les claus permeten identificar registres i establir relacions.
6. Els fitxers són útils, però tenen limitacions quan hi ha moltes dades, usuaris i relacions.
7. Un SGBD aporta consultes, integritat, seguretat, concurrència, transaccions i recuperació.
8. El diccionari de dades guarda metadades.
9. L’arquitectura ANSI/X3/SPARC separa nivell extern, conceptual i intern.
10. Els models principals són jeràrquic, xarxa, relacional, objecte-relacional, documental i graf.
11. Les bases de dades poden ser centralitzades, client-servidor o distribuïdes.
12. Classificar un SGBD exigeix indicar el criteri: model, arquitectura, desplegament, càrrega de treball o
ús.