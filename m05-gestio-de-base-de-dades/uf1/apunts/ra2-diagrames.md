
## 14. Del problema real al disseny de la base de dades
El **model Entitat-Relació (E/R)** és conceptual i serveix per entendre i comunicar la realitat que es vol informatitzar. El **model relacional** és lògic i concreta aquesta realitat en taules, claus i restriccions. Per fer un bon disseny, mai s'ha de començar dibuixant taules directament sense haver analitzat i entès prèviament els requeriments del sistema.

#### 1. Exemple inicial: servei de préstec d’una biblioteca
Una biblioteca d’institut necessita registrar llibres, exemplars físics, autors, alumnes i préstecs. L'anàlisi dels requeriments expressats pels usuaris permet identificar les primeres regles de negoci:
    - Un **llibre** pot tenir diversos **autors**.
    - D’un mateix **llibre** hi pot haver diversos **exemplars** físics.
    - Un **alumne** pot tenir diversos **préstecs** al llarg del curs.
    - Cada **préstec** correspon a un sol **exemplar** i a un sol **alumne**.
    - Un **exemplar** no pot tenir dos préstecs actius simultanis.
    - La **data de retorn** ha de ser posterior o igual a la **data de préstec**.

#### 2. Fases del disseny d'una base de dades

| Fase | Preguntes principals | Producte o resultat |
| :---: | :---: | :---: |
| **Anàlisi de requeriments** | Quina informació es necessita? Qui la fa servir? Quines regles existeixen? | Llista de requisits, entrevistes, casos d’ús i exemples. |
| **Disseny conceptual** | Quines entitats, atributs i interrelacions hi ha al món real? | Diagrama Entitat-Relació (E/R). |
| **Disseny lògic** | Com es transformen les entitats i relacions en taules, claus i restriccions? | Esquema relacional normalitzat (Model Relacional). |
| **Disseny físic** | Quins tipus de dades, índexs, particions i opcions del SGBD s’utilitzaran? | Script DDL (SQL) i documentació d'emmagatzematge físic. |

#### 3. Com llegir i analitzar un requeriment
El text dels requeriments proporciona pistes fonamentals, però cal analitzar el context de cada paraula per determinar la seva funció dins del model:

| Element del text | Possibilitat de modelatge | Exemple |
| :---: | :---: | :---: |
| **Substantiu identificable** | **Entitat** (objecte o concepte principal). | Alumne, Llibre, Exemplar. |
| **Característica o qualitat** | **Atribut** (propietat que descriu una entitat). | Títol, DataNaixement, ISBN. |
| **Verb o associació** | **Interrelació** (connexió entre entitats). | Un alumne *realitza* un préstec. |
| **Quantitat, condició o norma** | **Cardinalitat, restricció o regla de negoci**. | No més de 3 préstecs actius per alumne. |

Una mateixa paraula pot tenir papers diferents segons el context. Per exemple, un *préstec* pot ser una **interrelació** entre `ALUMNE` i `EXEMPLAR`, però si té atributs propis rellevants (*DataPrestec*, *DataPrevistaRetorn*, *Estat*, sancions...), habitualment es tractarà com una **entitat associativa**.

Veure [Exercici 8. Extreure informació d'un enunciat](../exercicis/ex8-extreure-informacio.md)


## 15. Model entitat-relació: elements fonamentals

#### 1. Entitats
Una **entitat** és qualsevol objecte, concepte, esdeveniment o element distingible del món real sobre el qual interessa emmagatzemar informació. Poden ser físiques (*ALUMNE*, *LLIBRE*, *VEHICLE*) o abstractes (*ASSEGURANÇA*, *RESERVA*, *FACTURA*).
    - **Entitat tipus**: Classe o conjunt general d’entitats que comparteixen atributs i característiques. En els diagrames es representa en singular i majúscules (`ALUMNE`).
    - **Entitat instància**: Element o objecte concret que pertany a una entitat tipus (p. ex., l'alumna concreta "Laia").

> **Bones pràctiques de nomenclatura:**
> - Escriure sempre el nom en **singular** (`ALUMNE`, no *ALUMNES*).
> - Utilitzar noms **significatius i estables**, evitant termes genèrics com *DADES* o *INFORMACIO*.
> - No confondre una entitat amb una acció (utilitzar un nom de fet registrable com `MATRICULA`, no el verb *MATRICULAR*).

#### 2. Atributs
Un **atribut** és una propietat o característica que descriu una entitat o una interrelació.

| Atribut | Significat | Observació |
| :---: | :---: | :---: |
| **id_alumne** | Identificador intern únic. | Sol ser la Clau Primària (PK). |
| **nom** | Nom de la persona. | Normalment obligatori (*NOT NULL*). |
| **cognom1, cognom2** | Cognoms de l'alumne. | El segon cognom pot ser opcional. |
| **data_naixement** | Data de naixement. | Permet calcular l’edat (dada derivada). |
| **email** | Correu electrònic. | Pot requerir restricció d'unicitat (*UNIQUE*). |
| **telefon** | Telèfon de contacte. | Pot ser opcional o multivaluat segons requeriments. |

#### 3. Domini, tipus de dada i valor nul
    - **Tipus de dada**: Classificació tècnica dels valors i operacions possibles (enter, decimal, text, data, booleà, etc.).
    - **Domini**: Conjunt de valors vàlids i amb significat propi que pot prendre un atribut (un subconjunt del tipus de dada).
    - **Valor nul (NULL)**: Indica l'absència de valor (desconegut, no aplicable, pendent o no proporcionat).

| Atribut | Tipus orientatiu | Domini | Admet NULL? |
| :---: | :---: | :---: | :---: |
| **nota_final** | Decimal | Valors de 0 a 10. | **Sí** (mentre no s’hagi avaluat). |
| **estat** | Text curt / Enum | `pendent`, `actiu`, `tancat`, `anullat`. | **No**. |
| **data_retorn** | Data | Data posterior o igual a `data_prestec`. | **Sí** (si el préstec continua obert). |
| **email** | Text | Format de correu electrònic vàlid. | Segons requeriments de negoci. |

> **Atenció amb el valor NULL:** `NULL` no és el mateix que zero (`0`), una cadena de text buida (`""`) ni una data per defecte. En SQL **no es compara mai amb l'operador `=`**, sinó mitjançant les instruccions `IS NULL` o `IS NOT NULL`.

#### 4. Tipus d’atributs

| Tipus | Descripció | Exemple |
| :---: | :---: | :---: |
| **Simple** | Atribut atòmic que no s’ha de dividir per al tractament previst. | Nom. |
| **Compost** | Es pot dividir en subcomponents amb significat propi. | Adreça → Via, número, codi postal, municipi. |
| **Monovaluat** | Té com a màxim un únic valor per a cada instància. | DNI, ISBN. |
| **Multivaluat** | Pot tenir diversos valors simultanis per a una mateixa instància. | Telèfons d’una persona. |
| **Derivat** | El seu valor es calcula dinàmicament a partir d’altres dades. | Edat (calculada a partir de `data_naixement`). |
| **Identificador** | Atribut que participa o forma part d'una clau. | `id_alumne`, `ISBN`. |

> **Nota de disseny relacional:** En el model relacional, tots els camps han de contenir valors atòmics. Un atribut multivaluat com *Telèfons* mai s'ha de guardar com una llista de valors separats per comes en una sola cel·la; s'ha de convertir en una taula relacionada.

#### 5. Claus
- **Clau candidata**: Conjunt mínim d’un o més atributs capaç d’identificar de manera única cada instància d’una entitat o tupla.
- **Clau primària (PK - *Primary Key*)**: Clau candidata seleccionada com a identificador principal de l'entitat. **Mai no pot contenir valors NULL**.
- **Clau alternativa**: Qualsevol clau candidata que no ha estat escollida com a clau primària.
- **Clau composta**: Clau d'identificació formada per la unió de dos o més atributs.

Veure [Exercici 9. Analitzar atributs](../exercicis/ex9-analitzar-atributs.md)


## 16. Interrelacions i cardinalitats

#### 1. Interrelacions
Una **interrelació** és una associació amb significat entre dues o més entitats. S'anomenen habitualment amb un verb o expressió verbal (*ALUMNE realitza MATRICULA*, *PROFESSOR imparteix CURS*). Una interrelació pot tenir **atributs propis** quan aquests descriuen l’associació en si mateixa i no les entitats per separat:
- **NotaFinal**: Atribut de la interrelació/matrícula entre *ALUMNE* i *ASSIGNATURA*.
- **Quantitat**: Atribut de la línia de detall que relaciona una *COMANDA* amb un *PRODUCTE*.

#### 2. Grau de la relació
El **grau** indica el nombre d’entitats que participen en una interrelació:

| Grau | Nom | Exemple |
| :---: | :---: | :---: |
| **1** | **Recursiva o reflexiva** | Un empleat supervisa un altre empleat. |
| **2** | **Binària** | Un professor imparteix un curs. |
| **3** | **Ternària** | Un proveïdor subministra un producte a un magatzem. |
| **n** | **N-ària** | Associació entre més de tres entitats simultànies. |

#### 3. Cardinalitat màxima
Indica quantes instàncies d’una entitat es poden associar, com a màxim, amb una instància de l’altra entitat:

| Tipus | Lectura | Exemple |
| :---: | :---: | :---: |
| **1:1** | Cada instància d’A s’associa, com a màxim, amb una de B, i a l'inrevés. | Una persona té com a màxim un passaport vigent. |
| **1:N** | Una instància d’A pot associar-se amb moltes de B; cada B amb una sola d’A. | Un departament té molts empleats; cada empleat pertany a un departament. |
| **M:N** | Cada instància d’A pot associar-se amb moltes de B i a l’inrevés. | Un alumne cursa diverses assignatures i una assignatura té diversos alumnes. |

#### 4. Cardinalitat mínima i participació
Expressa l’obligatorietat de participar en una interrelació:
- **0**: Participació **opcional**.
- **1**: Participació **obligatòria**.

En la notació min-max expressada com `DEPARTAMENT (0,N) ---- té ---- EMPLEAT (1,1)`:
- Un departament pot tenir zero o molts empleats (`0,N`).
- Un empleat ha de treballar obligatòriament en un únic departament (`1,1`).

#### 5. Tipus de relacions i particularitats

1. Relacions 1:1
Són poc freqüents. Cal verificar que no s’hagi dividit una mateixa entitat de manera artificial.
    - *Exemple*: `EMPLEAT` (0,1) — assignat — `TAQUILLA` (0,1).
    - *Preguntes de disseny*: Pot existir la taquilla sense empleat? Tots els empleats en tenen? Les dades es consulten amb permisos o freqüències diferents?
2. Relacions 1:N
Són les més habituals en el disseny de bases de dades.
    - *Exemple*: `DEPARTAMENT` (0,N) — té — `EMPLEAT` (1,1).

3. Relacions M:N i entitats associatives
Una relació molts a molts (**M:N**) no es pot implementar directament només afegint una clau forana. Requereix la creació d'una **entitat o taula associativa** (`MATRICULA`, `LINEA_COMANDA`) que absorbeix la relació i els seus atributs propis.

4. Relacions recursives
Són relacions on la mateixa entitat participa jugant rols diferents. Cal anomenar clarament els rols per evitar ambigüitats:
    - **Recursiva 1:N**: `EMPLEAT` supervisa `EMPLEAT` (Rols: *cap* i *subordinat*).
    - **Recursiva M:N**: `ASSIGNATURA` és requisit de `ASSIGNATURA` (Rols: *prerequisit* i *assignatura dependent*).

5. Relacions n-àries
S'utilitzen quan un fet de negoci depèn simultàniament de més de dues entitats i separar-lo en relacions binàries faria perdre el seu significat global.
    - *Exemple*: `SUBMINISTRAMENT` (`Proveïdor`, `Producte`, `Magatzem`, `Preu`, `Termini`).

> **Atenció de disseny:** No transformis automàticament qualsevol relació ternària en tres binàries independents sense comprovar primer si les tres entitats intervenen en un únic fet de negoci conjunt.

Veure [Exercici 10. Triar cardinalitats](../exercicis/ex10-triar-cardinalitats.md)


## 17. Extensions del model ER

#### 1. Entitats febles: Una **entitat feble** és aquella que no es pot identificar unívocament per si mateixa i necessita la clau d'una altra entitat (anomenada **entitat propietària o forta**) per poder ser completament identificada.
- **Dependència d'identificació**: La seva clau primària (PK) serà una clau composta formada per la clau de l'entitat forta més un identificador parcial propi.

*Exemple*:
- `LLIBRE` (`ISBN`, `Titol`, `Editorial`) $\rightarrow$ Entitat forta.
- `EXEMPLAR` (`ISBN`, `NumExemplar`, `Estat`, `Ubicacio`) $\rightarrow$ Entitat feble.
- **PK d'EXEMPLAR**: (`ISBN`, `NumExemplar`).

> **Concepte clau:** Una entitat feble no és una entitat "poc important", sinó que té una dependència d'existència i identificació respecte d'una altra.

#### 2. Generalització i especialització
- **Generalització**: Procés d'identificar característiques comunes de diverses entitats per crear una **superclasse** (de baix cap a dalt).
- **Especialització**: Procés de crear **subclasses** més específiques a partir d'una entitat general (de dalt cap a baix).

*Exemple*: L'entitat `PERSONA` pot tenir les subclasses `ALUMNE` i `PROFESSOR`. En modelar la jerarquia, cal definir dues restriccions fonamentals:

| Restricció | Opcions | Pregunta de disseny |
| :---: | :---: | :---: |
| **Disjunció** | **Disjunta** / **Solapada** | Una mateixa instància pot pertànyer a més d'una subclasse alhora? *(Ex. Pot una persona ser alhora alumne i professor?)* |
| **Totalitat** | **Total** / **Parcial** | Tota instància de la superclasse ha de pertànyer obligatòriament a alguna subclasse? |

#### 3. Agregació i entitats associatives
S'utilitza quan una associació entre entitats necessita, al seu torn, relacionar-se amb una altra entitat. En el disseny pràctic, això se sol resoldre convertint la relació en una **entitat associativa** amb clau primària pròpia o composta. Per exemple, la relació de `MATRICULA` (que associa alumne, assignatura i curs) es pot relacionar posteriorment amb una `FACTURA`.

#### 4. Decisions de disseny freqüents

| Dubte de disseny | Criteri orientatiu | Exemple |
| :--- | :--- | :--- |
| **Atribut o entitat?** | Es converteix en **entitat** si té atributs propis, un identificador, relacions amb altres entitats o pot tenir diversos valors. | `telefon` pot ser un atribut simple, però `TELEFON` serà una entitat si es vol guardar el tipus, la preferència i l'historial. |
| **Entitat o interrelació?** | Una interrelació descriu una associació; si aquesta associació adquireix atributs, data o esdeveniments propis, passa a **entitat associativa**. | `MATRICULA` comença com una relació i esdevé entitat associativa en afegir-hi `data_matricula`, `curs` i `nota_final`. |
| **Binària o ternària?** | Mantén la relació **n-ària** quan el fet registrat depengui de totes les entitats de manera simultània. | Subministrament conjunt de `PRODUCTE`, `PROVEÏDOR` i `MAGATZEM`. |
| **Atribut derivat o emmagatzemat?** | Calcula'l dinàmicament si es pot obtenir fàcilment i no cal conservar-ne un historial immutable. | `edat` es calcula a partir de `data_naixement`; en canvi, el `preu_total` d'una factura antiga s'emmagatzema. |


## 18. Representació i lectura de diagrames

#### 1. Simbolisme habitual
No existeix una única notació universal per als diagrames ER. Per treballar en equip, cal declarar la notació adoptada abans de començar.

| Element | Notació Chen clàssica | Notació habitual en eines modernes |
| :---: | :---: | :---: |
| **Entitat** | Rectangle. | Caixa o taula. |
| **Atribut** | El·lipse. | Camp / columna dins de la caixa. |
| **Interrelació** | Rombe. | Línia etiquetada o taula associativa. |
| **Clau primària** | Atribut subratllat. | Marca `PK`, icona de clau o camp destacat. |
| **Atribut derivat** | El·lipse discontínua. | Camp calculat o anotació. |
| **Atribut multivaluat** | El·lipse doble. | Taula relacionada en el model relacional. |
| **Cardinalitat** | $1$, $N$ i/o min-max. | Peu de corb (*Crow's foot*), `0..1`, `1..*`, etc. |

#### 2. Convenció de treball recomanada

En els exercicis de disseny és recomanable seguir aquestes convencions:
- Noms d’entitat en **majúscules i singular** (`ALUMNE`, `LLIBRE`).
- Noms d’atribut en `camelCase` o `snake_case` de manera coherent (`data_naixement`, `idAlumne`).
- Cardinalitats en format min-max: `(0,1)`, `(1,1)`, `(0,N)` i `(1,N)`.
- Acompanyar el diagrama d'una **llista textual de regles de negoci**.
- Expressar els esquemes relacionals marcant clarament la **PK** i documentant les **FK**.

#### 3. Eines gràfiques de disseny

| Tipus | Eines possibles | Ús recomanat |
| :---: | :---: | :---: |
| **Local** | Dia, DBeaver, MySQL Workbench. | Disseny sense connexió o integració directa amb la BD. |
| **Web** | dbdiagram.io, ERDPlus, Creately, Lucidchart, draw.io. | Treball col·laboratiu i exportació gràfica ràpida. |
| **Textual** | Mermaid, PlantUML, DBML. | Documents d'esquema versionables amb Git. |

> **Principi de qualitat:** La qualitat del disseny no depèn de l’eina. Un diagrama molt atractiu visualment però ambigu o incorrecte no constitueix un bon model.

---

#### 4. Ús de DBeaver per al modelat lògic

DBeaver és un gestor de bases de dades especialment adequat per representar el **model lògic relacional**: taules, columnes, claus primàries (PK), claus foranes (FK), unicitat i restriccions.

> **Diferència conceptual:** DBeaver no substitueix un model conceptual Chen. DBeaver mostra objectes reals de base de dades. Atributs multivaluats o derivats del model conceptual s'han d'haver transformat prèviament abans de passar a DBeaver.

#### Correspondència de conceptes entre el Model i DBeaver

| Concepte ER / Lògic | Com es representa a DBeaver | Què cal comprovar |
| :--- | :--- | :--- |
| **Entitat** | **Taula**. | Nom en singular, significatiu i únic. |
| **Atribut** | **Columna o camp**. | Tipus de dada, nul·labilitat (`NULL`/`NOT NULL`) i domini. |
| **Identificador** | **PK** o restricció **UNIQUE**. | Garanteix la unicitat de les files. |
| **Relació 1:N** | **FK** a la taula del costat $N$. | La línia uneix la FK amb la PK referenciada. |
| **Relació M:N** | **Taula associativa** amb dues o més FK. | La taula intermèdia té la seva PK i els atributs propis. |
| **Participació obligatòria** | **FK `NOT NULL`**. | La FK no admet `NULL` si la participació és obligatòria. |
| **Regla de negoci complexa** | **CHECK, triggers, notes o comentaris**. | No confondre una regla complexa amb una línia simple. |

#### Flux de treball i bones pràctiques a DBeaver

1. **Creació d'esquema**: Crear les taules, definir atributs, assignar la PK i crear les restriccions FK explicitant quina taula pare i camp referencien.
2. **Generació i maquetació del diagrama**:
   - Obrir la vista de diagrama de l'esquema.
   - Usar la notació de **peu de corb (*Crow's foot*)** de manera consistent.
   - Ordenar les taules: **taules pare a l'esquerra/dalt**, **taules filles a la dreta/baix** i **taules associatives al centre**.
   - Evitar línies creuades o que passin per sobre de les taules.
   - Desar la disposició amb *Keep layout* i exportar en **PNG** o **SVG**.

> **Nota sobre l'Edit Mode:** El mode d'edició directa de diagrames (*Edit mode*) requereix edicions de pagament (Enterprise/Ultimate). En l'edició **Community**, el flux correcte consisteix a crear/modificar les taules mitjançant l'SQL o el navegat i visualitzar-les posteriorment en el diagrama.

No utilitzem DBeaver (sinó Asciidoctor), tot i així aquí podeu veure una pràctica guiada: [Exercici 11. Pràctica guiada amb DBeaver](../exercicis/ex11-practica-guiada.md)


## 19. El model relacional

El model relacional organitza les dades en **relacions**, les quals es representen habitualment com a taules estructurades.

#### 1. Relacions, tuples i atributs
- **Relació**: Estructura lògica amb un nom, un conjunt d’atributs (columnes) i un conjunt variable de tuples (files).
- **Tupla**: Fila d’una relació que representa una instància o un fet concret del món real.
- **Atribut**: Columna d’una relació definida sobre un domini concret de valors.
- **Esquema**: Definició de la relació que inclou el seu nom i els seus atributs (p. ex., `ALUMNE(id_alumne, nom, email)`).
- **Extensió**: Conjunt de tuples contingudes en la relació en un moment determinat.
- **Grau**: Nombre d’atributs (columnes) que té la relació.
- **Cardinalitat de la relació**: Nombre de tuples (files) contingudes en l'extensió. *(No s'ha de confondre amb la cardinalitat d'una interrelació ER)*.

| id_alumne | nom | email | data_naixement |
| :---: | :---: | :---: | :---: |
| **101** | Laia Puig | laia@exemple.net | 2006-05-17 |
| **102** | Marc Vidal | marc@exemple.net | 2005-11-02 |

#### 2. Propietats lògiques d’una relació
Dins de la teoria del model relacional es compleixen les següents regles fonamentals:
- **Sense ordre en atributs**: L'ordre de les columnes no té cap significat lògic.
- **Sense ordre en tuples**: L'ordre de les files no té significat lògic. En SQL, l'única manera de garantir un ordre és utilitzant la clàusula `ORDER BY`.
- **Sense duplicats**: No poden existir dues tuples exactament iguals.
- **Valors atòmics**: Cada cel·la ha de contenir un únic valor atòmic segons el domini de l'atribut.
- **Existència de clau**: Tota relació ha de disposar, com a mínim, d'una clau candidata.

#### 3. Claus al model relacional

| Concepte | Definició |
| :---: | :---: |
| **Superclau** | Conjunt d’atributs que identifica unívocament una tupla, tot i que pugui incloure atributs innecessaris. |
| **Clau candidata** | Superclau mínima: si se li treu qualsevol atribut, deixa d’identificar les tuples de manera única. |
| **Clau primària (PK)** | Clau candidata escollida com a identificador principal de la relació. |
| **Clau alternativa** | Qualsevol clau candidata que no ha estat seleccionada com a clau primària. |
| **Clau forana (FK)** | Atribut o conjunt d’atributs que referencia la clau (PK o Unique) d’una altra relació o de la mateixa. |

> **Requisit de Clau Forana:** Una FK ha de tenir el mateix nombre d’atributs que la clau que referencia i utilitzar dominis de dades compatibles.

#### 4. Valors nuls en el model relacional
Els valors nuls (`NULL`) han de ser excepcionals i estar justificats, ja que representen absència d'informació, desconeixement o no-aplicabilitat.

| Exemple | Admet NULL? | Motiu / Justificació |
| :--- | :--- | :--- |
| **DataRetorn d’un préstec actiu** | **Sí** | El préstec continua obert i l'exemplar encara no s'ha retornat. |
| **DNI d’un alumne quan és PK** | **No** | La clau primària mai no pot contenir valors nuls. |
| **Telèfon d’un alumne** | **Sí / Opcional** | Pot no existir o no haver estat facilitat per l'usuari. |
| **Preu d’una línia de factura** | **No** | Es requereix un import econòmic per calcular el total de la factura. |


## 20. Regles d’integritat i restriccions
Les regles d’integritat garanteixen la coherència, correcció i fiabilitat de les dades contingudes en la base de dades.

#### 1. Integritat d’entitat
- **Regla d’integritat d’entitat**: La clau primària (PK) identifica de manera única cada fila d'una relació; per tant, **ha de ser única i mai no pot contenir valors nuls (`NOT NULL`)**.

```sql
CREATE TABLE alumne (
  id_alumne INTEGER PRIMARY KEY,
  nom VARCHAR(100) NOT NULL
);
```
#### 2. Integritat referencial
Regla d’integritat referencial: Tot valor present en una clau forana (FK) ha d'existir prèviament com a clau en la relació pare, o bé ser NULL si la participació és opcional i la FK ho permet.

```sql
CREATE TABLE departament (
  id_departament INTEGER PRIMARY KEY,
  nom VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE empleat (
  id_empleat INTEGER PRIMARY KEY,
  nom VARCHAR(100) NOT NULL,
  id_departament INTEGER NOT NULL,
  CONSTRAINT fk_empleat_departament
    FOREIGN KEY (id_departament)
    REFERENCES departament(id_departament)
);
```
#### 3. Accions davant modificacions i eliminacions
Quan una fila pare s'elimina o modifica, el SGBD aplica l'acció configurada per mantenir la integritat de les files filles relacionades:

| Acció | Efecte | Ús habitual |
| :---: | :---: | :---: |
| `RESTRICT / NO ACTION` | Impedeix la modificació o eliminació de la fila pare si existeixen files filles relacionades | Evitar esborrar un client que té comandes o factures històriques |
| `CASCADE` | Propaga l'actualització o l'eliminació automàticament a les files filles | Eliminar les línies de detall quan s'elimina una comanda |
| `SET NULL` | Posa el camp de la clau forana (FK) a `NULL` a les files filles | Conservar una incidència quan s'esborra l'usuari assignat |
|`SET DEFAULT` | Assigna un valor per defecte configurat prèviament a la FK | Reassignar un departament genèric predefinit |

> **Nota:** No s'ha de seleccionar l'opció `CASCADE` per comoditat. Cal avaluar-ne l'impacte, ja que una eliminació en cascada pot propagar-se a múltiples taules i esborrar informació important que calia conservar.

#### 4. Integritat de domini
La integritat de domini delimita el conjunt de valors vàlids i admesos per a un atribut mitjançant tipus de dades i clàusules de verificació (`CHECK`).
```SQL
CREATE TABLE avaluacio (
  id_avaluacio INTEGER PRIMARY KEY,
  nota DECIMAL(4,2),
  estat VARCHAR(12) NOT NULL,
  CONSTRAINT chk_nota
    CHECK (nota IS NULL OR nota BETWEEN 0 AND 10),
  CONSTRAINT chk_estat
    CHECK (estat IN ('pendent', 'avaluada', 'anullada'))
);
```

#### 5. Restriccions de negoci
Moltes regles de negoci complexes no es poden validar únicament mitjançant restriccions estàndard (`PK`, `FK` o `CHECK` simples).

- Exemples de regles de negoci complexes:
    - Un alumne no pot tenir més de 3 préstecs actius simultanis.
    - Un professor no pot impartir dues classes al mateix temps.
    - L’import total d’una factura ha de coincidir amb la suma de les seves línies.
    - Un producte només pot ser desactivat si no té comandes pendents.
- Mecanismes d'implementació:
    - Validacions directes des de la lògica de l'aplicació.
    - ús de TRIGGERS o procediments emmagatzemats al SGBD.
    - Control de transaccions.
    - Processos de verificació i auditoria periòdica.
    - Restriccions mitjançant el control de permisos i rols d'usuari.


Veure [Exercici 12. Restriccions implementables i no implementables](../exercicis/ex12-restriccions.md)


## 21. Transformació del model ER al model relacional

La transformació del model Entitat-Relació (ER) al model relacional permet convertir un disseny conceptual en una estructura lògica de taules, claus i restriccions a punt per ser implementada en un SGBD.

#### 1. Preparació prèvia

Abans d'iniciar la transformació a taules, cal realitzar la següent revisió del diagrama ER:

1. **Atributs compostos**: Desglossar-los en els atributs simples necessaris per a les consultes.
2. **Atributs multivaluats**: Convertir-los en entitats o relacions independents.
3. **Claus identificadores**: Assegurar que cada entitat disposi d'una clau identificadora clara.
4. **Cardinalitats**: Definir de manera explícita les cardinalitats mínimes i màximes.
5. **Regles de negoci**: Documentar per escrit aquelles regles que no es puguin deduir directament del diagrama.

#### 2. Regla bàsica: transformació d’entitats

Cada entitat forta es converteix en una relació (taula). Els seus atributs simples passen a ser columnes i la seva clau identificadora es converteix en la Clau Primària (PK).

- **ER**: `ALUMNE(IdAlumne, Nom, Email)`
- **Relacional**: `ALUMNE(id_alumne, nom, email)`  
  - **PK**: `id_alumne`

```sql
CREATE TABLE alumne (
  id_alumne INTEGER PRIMARY KEY,
  nom VARCHAR(100) NOT NULL,
  email VARCHAR(255) UNIQUE
);
```

#### 3. Atributs compostos
Un atribut compost es divideix en els seus components simples quan aquests s'han de tractar o consultar per separat.
- ER: PERSONA(Adreca = Via, Numero, CodiPostal, Municipi)
- Relacional: PERSONA(id_persona, via, numero, codi_postal, municipi)

Criteri de disseny: No cal separar un atribut pel simple fet que es pugui dividir teòricament. La decisió depèn exclusivament de les consultes i regles de negoci que calgui aplicar.

#### 4. Atributs multivaluats
Un atribut multivaluat es transforma en una nova relació que inclou la PK de l'entitat propietària i el valor propi de l'atribut.
- ER: ALUMNE(Telefon {multivaluat})
- Relacional:
    - ALUMNE(id_alumne, nom)
    - TELEFON_ALUMNE(id_alumne, telefon, tipus)
        - PK: (id_alumne, telefon)
        - FK: id_alumne $\rightarrow$ ALUMNE(id_alumne)
```SQL
CREATE TABLE telefon_alumne (
  id_alumne INTEGER NOT NULL,
  telefon VARCHAR(25) NOT NULL,
  tipus VARCHAR(20),
  PRIMARY KEY (id_alumne, telefon),
  FOREIGN KEY (id_alumne)
    REFERENCES alumne(id_alumne)
    ON DELETE CASCADE
);
```

#### 5. Relació binària 1:1
En una relació 1:1, la PK d'una de les entitats es passa a l'altra taula com a FK, afegint la restricció `UNIQUE` per mantenir la unicitat.

La selecció de la taula que rep la FK es realitza avaluant:
* La participació obligatòria.
* La reducció de valors nuls (`NULL`).
* El cicle de vida de les entitats.
* Les consultes freqüents i requisits de seguretat o privacitat.

Exemple relacional:
* **EMPLEAT**(`id_empleat`, `nom`)
* **TAQUILLA**(`id_taquilla`, `ubicacio`, `id_empleat`)
* **PK TAQUILLA:** `id_taquilla`
* **FK TAQUILLA:** `id_empleat` $\rightarrow$ `EMPLEAT(id_empleat)`
* **Restricció:** `UNIQUE(id_empleat)`

> **Nota:** Si tota taquilla ha d'estar assignada obligatòriament a un empleat, `id_empleat` serà `NOT NULL`. Si pot estar lliure, admetrà valors nuls.

#### 6. Relació binària 1:N
En una relació 1:N, la PK de la part 1 es propaga a la taula del costat N com a FK. Els atributs propis de la relació també s'incorporen a la taula del costat N.

Exemple relacional:
* **DEPARTAMENT**(`id_departament`, `nom`)
* **EMPLEAT**(`id_empleat`, `nom`, `id_departament`)
* **PK DEPARTAMENT:** `id_departament`
* **PK EMPLEAT:** `id_empleat`
* **FK EMPLEAT:** `id_departament` $\rightarrow$ `DEPARTAMENT(id_departament)`

> **Nota:** Si un empleat ha de pertànyer obligatòriament a un departament, `id_departament` serà `NOT NULL`. Si pot estar temporalment sense assignar, serà nul·lable.

#### 7. Relació binària M:N
En una relació M:N es crea una nova relació (taula associativa). Aquesta inclou com a FK les claus de les dues entitats participants i els atributs propis de l'associació.

Exemple relacional:
* **ALUMNE**(`id_alumne`, `nom`)
* **ASSIGNATURA**(`id_assignatura`, `nom`)
* **MATRICULA**(`id_alumne`, `id_assignatura`, `curs_academic`, `data_matricula`, `nota`)
* **PK MATRICULA:** (`id_alumne`, `id_assignatura`, `curs_academic`)
* **FK MATRICULA:** `id_alumne` $\rightarrow$ `ALUMNE(id_alumne)`
* **FK MATRICULA:** `id_assignatura` $\rightarrow$ `ASSIGNATURA(id_assignatura)`

> **Nota sobre Claus Artificials:** Una PK composta és correcta quan la combinació d'atributs és estable. Si s'afegeix una clau artificial (`id_matricula`) per simplificar referències, cal mantenir una restricció `UNIQUE` sobre la combinació original per evitar duplicats.

#### 8. Relacions n-àries
En una relació n-ària es crea una nova relació que conté les FK de totes les entitats participants i els atributs propis de la interrelació.

Exemple relacional:
* **PROVEIDOR**(`id_proveidor`, `nom`)
* **PRODUCTE**(`id_producte`, `nom`)
* **MAGATZEM**(`id_magatzem`, `nom`)
* **SUBMINISTRAMENT**(`id_proveidor`, `id_producte`, `id_magatzem`, `preu`, `termini_dies`)
* **PK:** (`id_proveidor`, `id_producte`, `id_magatzem`)
* **FKs:** Referencien respectivament `PROVEIDOR`, `PRODUCTE` i `MAGATZEM`.

> **Nota:** La combinació de totes les FK és la clau candidata inicial, però cal revisar les cardinalitats màximes. Si una entitat participa amb un màxim de 1, la seva clau pot no formar part de la PK composta.

#### 9. Relacions recursives
1. **Relació recursiva 1:N** Es resol afegint una FK a la mateixa taula que referencia la PK de la mateixa entitat. Exemple:
    - **EMPLEAT**(`id_empleat`, `nom`, `id_cap`)
    - **PK:** `id_empleat`
    - **FK:** `id_cap` $\rightarrow$ `EMPLEAT(id_empleat)` *(nul·lable per al màxim nivell organitzatiu)*

2. **Relació recursiva M:N** Es crea una taula addicional amb dues FK que apunten a la mateixa taula principal, utilitzant noms de rol diferents. Exemple:
    - **ASSIGNATURA**(`id_assignatura`, `nom`)
    - **PREREQUISIT**(`id_assignatura`, `id_assignatura_prerequisit`)
    - **PK:** (`id_assignatura`, `id_assignatura_prerequisit`)
    - **FK1:** `id_assignatura` $\rightarrow$ `ASSIGNATURA(id_assignatura)`
    - **FK2:** `id_assignatura_prerequisit` $\rightarrow$ `ASSIGNATURA(id_assignatura)`

#### 10. Entitats febles
Una entitat feble genera una taula la PK de la qual està formada per la PK de l'entitat propietària (forta) més la seva pròpia clau parcial (discriminador).

Exemple relacional:
* **LLIBRE**(`ISBN`, `titol`)
* **EXEMPLAR**(`ISBN`, `num_exemplar`, `estat`)
* **PK EXEMPLAR:** (`ISBN`, `num_exemplar`)
* **FK EXEMPLAR:** `ISBN` $\rightarrow$ `LLIBRE(ISBN)`

#### 11. Generalització i especialització
Es poden aplicar diferents estratègies de transformació segons les restriccions i el patró d'accés a les dades:

| Estratègia | Descripció | Adequada quan |
| :---: | :---: | :---: |
| **Superclasse + subclasses** | Una taula per a la superclasse i una per a cada subclasse. La PK de la subclasse és alhora FK a la superclasse. | Cal mantenir dades comunes, subclasses solapades o extensions futures. |
| **Una única taula** | Una sola taula amb tots els camps de totes les subclasses i un atribut discriminador de tipus. | Jerarquia disjunta, relativament estable i amb pocs atributs específics. |
| **Taules només per subclasses** | Cada subclasse rep els atributs comuns i els específics; no existeix taula de superclasse. | Generalització total i disjunta, amb consultes separades per tipus. |

```SQL
-- Exemple: Superclasse + subclasses
-- PERSONA(id_persona, nom, email)
-- ALUMNE(id_persona, numero_expedient)
-- PROFESSOR(id_persona, departament)

CREATE TABLE persona (
  id_persona INTEGER PRIMARY KEY,
  nom VARCHAR(100) NOT NULL,
  email VARCHAR(255)
);

CREATE TABLE alumne (
  id_persona INTEGER PRIMARY KEY,
  numero_expedient VARCHAR(20) UNIQUE NOT NULL,
  FOREIGN KEY (id_persona) REFERENCES persona(id_persona)
);

CREATE TABLE professor (
  id_persona INTEGER PRIMARY KEY,
  departament VARCHAR(50) NOT NULL,
  FOREIGN KEY (id_persona) REFERENCES persona(id_persona)
);
```

#### 12. Ordre de les claus compostes i índexs
L'ordre dels atributs dins d'una clau primària composta influeix en l'estructura dels índexs físics generats pel SGBD. Exemple:
- MATRICULA(id_alumne, id_assignatura, curs_academic)
- PK: (id_alumne, id_assignatura, curs_academic)

> **NOTA:** L'ordre definit afavoreix directament les consultes que cerquen pel primer camp (id_alumne), com ara "obtenir totes les matrícules d'un alumne", però pot no ser igual d'eficient per a consultes filtrades només per id_assignatura.

Veure [Exercici 13. Transofrmar un ER a relacionl](../exercicis/ex13-transformar.md)



## 22. Normalització
La normalització és un conjunt de regles i tècniques que permeten detectar i eliminar problemes de disseny en el model relacional. El seu objectiu principal no és crear el màxim nombre de taules, sinó **reduir la redundància perjudicial** i **mantenir la coherència de les dades**.

#### 1. Per què cal normalitzar?
Un disseny sense normalitzar o mal estructurat pot provocar greus anomalies en l'operativa diària de la base de dades:

- **Redundància innecessària**: La mateixa informació es troba duplicada en múltiples files.
- **Anomalies d'inserció**: Impossible afegir certes dades sense introduir obligatòriament informació no relacionada o desconeguda.
- **Anomalies de modificació**: Canviar un dada obliga a actualitzar múltiples tuples; si se n'oblida una, es genera inconsistència.
- **Anomalies d'esborrat**: Eliminant una fila es pot perdre involuntàriament informació valuosa diferent.
- **Dificultat per aplicar restriccions**: Es complica la definició de regles d'integritat.

| Autor | Nacionalitat | CodiLlibre | Titol | Editorial | Any |
| :---: | :---: | :---: | :---: | :---: | :---: |
| Codd, E. F. | Nordamericana | 45678 | Relational Model | Addison-Wesley | 1990 |
| Gardarin | Francesa | 56789 | Base de datos | Paraninfo | 1986 |
| Gardarin | Francesa | 67890 | Comparación BD | Eyrolles | 1984 |

> **Anàlisi del problema:** Si la nacionalitat d'un autor canvia, cal modificar múltiples files. A més, si esborrem l'únic llibre existent de Gardarin, es perdria totalment el registre de la seva nacionalitat.

#### 2. Dependències funcionals
Una **dependència funcional ($X \rightarrow Y$)** expressa que cada valor del conjunt d'atributs $X$ determina de manera única i unívoca el valor de $Y$.

- **Exemples de dependència funcional**:
  - `id_alumne` $\rightarrow$ `nom, data_naixement, email`
  - `ISBN` $\rightarrow$ `titol, editorial, any`
  - `(id_alumne, id_assignatura, curs)` $\rightarrow$ `nota_final`

| Tipus de dependència | Concepte | Exemple |
| :---: | :---: | :---: |
| **Plena** | $Y$ depèn de la totalitat de la clau $X$, no de cap dels seus subconjunts. | `(id_alumne, id_assignatura)` $\rightarrow$ `nota` |
| **Parcial** | $Y$ depèn només d'un subconjunt de la clau composta $X$. | En `(id_alumne, id_assignatura)`, el `nom_alumne` depèn només de `id_alumne`. |
| **Transitiva** | $X \rightarrow Y$ i $Y \rightarrow Z$; per tant, $Z$ depèn transitivament de $X$ a través de $Y$. | `id_empleat` $\rightarrow$ `id_departament` i `id_departament` $\rightarrow$ `nom_departament`. |

> Una **clau candidata** determina funcionalment tots els atributs de la relació, però un atribut que determina un altre no és necessàriament una clau candidata.

#### 3. Primera forma normal (1FN)
Una relació està en **1FN** quan tots els seus atributs contenen **valors atòmics** (indivisibles) i no existeixen grups repetits ni llistes de valors dins de la mateixa cel·la. Exemple de transformació a 1FN:

**Taula no adequada (no 1FN)**:
| id_alumne | telefons |
| :---: | :---: |
| **101** | 600111222, 931234567 |

**Transformació a 1FN**:
| id_alumne | telefon | tipus |
| :---: | :---: | :---: |
| **101** | 600111222 | mòbil |
| **101** | 931234567 | fix |

> La solució relacional correcta per gestionar atributs multivaluats és crear una nova taula `TELEFON_ALUMNE`, evitant afegir columnes repetitives com `telefon1`, `telefon2`, `telefon3`.

#### 4. Segona forma normal (2FN)
Una relació està en **2FN** si:
1. Es troba en **1FN**.
2. Tots els atributs no clau depenen funcionalment de manera **plena de tota la clau candidata** (no hi ha dependències parcials).

> **Aplicabilitat:** La 2FN és especialment rellevant quan la clau primària és composta.

Exemple de normalització a 2FN

- **Relació inicial**: `MATRICULA(id_alumne, id_assignatura, nom_alumne, nom_assignatura, nota)`
  - **PK**: `(id_alumne, id_assignatura)`
  - **Problema de dependències parcials**:
    - `id_alumne` $\rightarrow$ `nom_alumne`
    - `id_assignatura` $\rightarrow$ `nom_assignatura`
    - Només `nota` depèn de tota la clau composta.

- **Descomposició en 2FN**:
  - `ALUMNE(id_alumne, nom_alumne)` $\rightarrow$ **PK**: `id_alumne`
  - `ASSIGNATURA(id_assignatura, nom_assignatura)` $\rightarrow$ **PK**: `id_assignatura`
  - `MATRICULA(id_alumne, id_assignatura, nota)` $\rightarrow$ **PK**: `(id_alumne, id_assignatura)`

#### 5. Tercera forma normal (3FN)
Una relació està en **3FN** si:
1. Es troba en **2FN**.
2. **No té dependències transitives** entre atributs no clau (cap atribut no clau depèn d'un altre atribut no clau).

Exemple de normalització a 3FN

- **Relació inicial**: `EMPLEAT(id_empleat, nom_empleat, id_departament, nom_departament)`
  - **PK**: `id_empleat`
  - **Dependències**:
    - `id_empleat` $\rightarrow$ `nom_empleat, id_departament`
    - `id_departament` $\rightarrow$ `nom_departament` *(dependència transitiva d'`id_empleat` cap a `nom_departament`)*

- **Descomposició en 3FN**:
  - `DEPARTAMENT(id_departament, nom_departament)` $\rightarrow$ **PK**: `id_departament`
  - `EMPLEAT(id_empleat, nom_empleat, id_departament)` $\rightarrow$ **PK**: `id_empleat`, **FK**: `id_departament`

#### 6. Forma normal de Boyce-Codd (BCNF)
Una relació està en **BCNF** si, per a tota dependència funcional no trivial $X \rightarrow Y$, **$X$ és una superclau**.
- La BCNF és una versió més estricta de la 3FN que resol certs casos especials quan existeixen múltiples claus candidates que es solapen.
- En l'àmbit acadèmic i professional, aconseguir la **3FN** és el mínim exigible; la BCNF s'aplica quan és possible sense perdre dependències ni complicar en excés el disseny.

#### 7. Quarta (4FN) i Cinquena forma normal (5FN)
- **4FN**: Elimina les dependències multivaluades independents.
- **5FN**: Tracta les dependències de projecció-combinació (*join dependencies*).
- S'apliquen en casos molt especialitzats i poc habituals. En la majoria de projectes, un model ER ben dissenyat i normalitzat fins a **3FN / BCNF** resol la totalitat dels problemes de redundància.

#### 8. Desnormalització controlada
De vegades es decideix mantenir dades derivades o duplicades de manera conscient per motius de **rendiment, velocitat de consulta o generació d'informes**.

| Requisits obligatoris per a la desnormalització |
| :---: |
| **1.** Existència d'una necessitat de rendiment real i demostrada. |
| **2.** Documentar de manera explícita quines dades es mantenen duplicades. |
| **3.** Implementar un mecanisme d'actualització automàtic i fiable (`TRIGGERS` o transaccions). |
| **4.** Verificar que no es posa en risc la integritat de les dades. |

> **Exemple:** Emmagatzemar `import_total` a la taula `COMANDA`, tot i poder-se calcular sumant `LINIA_COMANDA`. Útil per a consultes i informes ràpids, però exigeix l'ús de transaccions o *triggers* per mantenir-lo sincronitzat.

#### 9. Propietats desitjables d’una descomposició
Tota descomposició d'una relació durant el procés de normalització ha de complir dues propietats fonamentals:
1. **Preservació de la informació (Recombinació sense pèrdua / *Lossless-join*)**: Les noves taules s'han de poder tornar a unir mitjançant operacions `JOIN` sense generar tuples fictícies ni perdre informació original.
2. **Preservació de dependències**: Totes les dependències funcionals originals s'han de poder comprovar directament en les noves relacions sense haver de fer operacions d'unió complexes.

> **Avís:** Normalitzar no consisteix en dividir taules de manera intuïtiva. Cada descomposició s'ha de justificar estrictament mitjançant les dependències funcionals i l'ús real de les dades.

Veure [Exercici 14. Normalitzar una relació](../exercicis/ex14-normalitzar.md)

# 23. Diccionari de dades i documentació de restriccions
El disseny d'una base de dades no acaba amb la creació del diagrama Entitat-Relació o del model relacional. Per tal que el sistema sigui extensible, vàlid i mantenívol, cal acompanyar-lo d'una documentació detallada que especifiqui el significat de les dades i les regles que les regeixen.

#### 1. Per què documentar?
Un diagrama no és suficient per transmetre totes les decisions de disseny. El **dossier de disseny** ha de permetre que qualsevol altre professional (desenvolupadors, administradors de bases de dades o auditors) pugui entendre, implementar i mantenir la base de dades sense ambigüitats.

Documentar permet:
- **Evitar interpretacions incorrectes** sobre el significat o format dels camps.
- **Garantir la continuïtat** del projecte davant canvis en l'equip de desenvolupament.
- **Formalitzar la validació** de les regles de negoci amb els usuaris o clients.

#### 2. Plantilla de diccionari de dades
El **diccionari de dades** és un repositori centralitzat d'informació sobre les taules, atributs, tipus de dades i restriccions de la base de dades.

| Taula | Camp | Tipus | Nul? | Clau / Restricció | Descripció |
| :---: | :---: | :---: | :---: | :---: | :---: |
| `alumne` | `id_alumne` | `INTEGER` | No | **PK** | Identificador intern immutable de l'alumne. |
| `alumne` | `email` | `VARCHAR(255)` | Sí | **UNIQUE** | Correu de contacte; es valida principalment a l'aplicació. |
| `matricula` | `nota_final` | `DECIMAL(4,2)` | Sí | **CHECK** (`0 <= nota_final <= 10`) | Qualificació final quan l'avaluació està tancada. |
| `matricula` | `id_alumne` | `INTEGER` | No | **FK** $\rightarrow$ `alumne` | Alumne que formalitza la matrícula. |

#### 3. Registre de regles de negoci
Moltes regles de negoci no es poden expressar únicament mitjançant claus primàries o foranes. Cal catalogar-les i especificar el seu mecanisme d'implementació.

| Codi | Regla | Mecanisme d'implementació | Observacions |
| :---: | :---: | :---: | :---: |
| **RN-01** | No hi pot haver més de tres préstecs actius per alumne. | Trigger o servei d'aplicació transaccional. | Cal considerar la lògica per a préstecs anul·lats o perduts. |
| **RN-02** | La data de retorn no pot ser anterior a la data de préstec. | Restricció `CHECK` (si el SGBD ho permet) o validació d'aplicació. | Evita dates incoherents a la base de dades. |
| **RN-03** | Només la secretaria pot modificar dades personals. | Rols, permisos del SGBD i control d'accés a l'aplicació. | Regla de seguretat i governança, no només d'estructura. |
| **RN-04** | El preu aplicat a una línia de comanda no canvia en modificar el preu actual del producte. | Atribut `preu_aplicat` integrat a `LINIA_COMANDA`. | Conserva l'històric comercial original de la venda. |

#### 4. Checklist de revisió del disseny

Abans de donar per finalitzat un model de dades, cal revisar la següent llista de verificació:

1. **Identificadors:** Cada entitat té una clau primària (PK) clarament definida?
2. **Atributs:** Cada atribut té el seu nom, significat, domini i nul·labilitat documentats?
3. **Cardinalitats:** Les cardinalitats mínimes i màximes estan clarament indicades en el model?
4. **Relacions M:N:** Les relacions molts-a-molts s'han transformat en una entitat o taula associativa?
5. **Ubicació d'atributs:** Els atributs propis de les relacions es troben a la taula correcta?
6. **Claus foranes (FK):** Les FK són coherents amb les regles de participació del model?
7. **Integritat referencial:** S'han definit les accions d'actualització i eliminació en cascada o restricció (`ON DELETE`, `ON UPDATE`)?
8. **Valors atòmics (1FN):** S'han eliminat valors multivaluats amagats en cadenes de text (com llistes separades per comes)?
9. **Normalització (2FN/3FN):** S'han detectat i eliminat dependències parcials o transitives?
10. **Regles de negoci:** Les regles no implementables directament amb claus o restriccions estàndard s'han documentat adequadament?
11. **Comprensió:** El disseny és comprensible i vàlid per a l'usuari que va formular els requeriments inicials?

## 24. Glossari
- **Atribut:** Propietat d’una entitat o relació.
- **BCNF:** Forma normal de Boyce-Codd; exigeix que tot determinant sigui una superclau.
- **Cardinalitat:** En ER, nombre d’instàncies que poden participar en una relació. En el model relacional, nombre de tuples d’una relació.
- **Clau candidata:** Superclau mínima que identifica una tupla de manera única.
- **Clau forana:** Camp o conjunt de camps que referencia una clau d’una altra taula.
- **Clau primària:** Clau candidata escollida com a identificador principal.
- **Dependència funcional:** Relació `X → Y` en què un valor de X determina un únic valor de Y.
- **Domini:** Conjunt de valors admissibles per a un atribut.
- **Entitat feble:** Entitat identificada parcialment que requereix la clau d’una entitat propietària.
- **Entitat associativa:** Entitat que representa una relació, especialment quan aquesta té atributs o identitat pròpia.
- **Esquema relacional:** Conjunt de relacions, atributs, claus i restriccions d’una BD relacional.
- **Integritat d’entitat:** Regla que exigeix PK única i no nul·la.
- **Integritat referencial:** Regla que exigeix que una FK referenciï un valor existent o sigui nul·la quan sigui permès.
- **Normalització:** Procés de descompondre relacions per reduir anomalies i redundància perjudicial.
- **Participació:** Obligatorietat mínima d’una entitat en una relació.
- **Relació:** Taula lògica del model relacional; també, segons el context, associació ER entre entitats.
- **Tupla:** Fila d’una relació.
- **Valor nul:** Absència de valor; no equival a zero ni a cadena buida.

## 25. Resum final de la unitat
1. El model ER permet representar de manera comprensible les entitats, els atributs, les interrelacions i
les regles principals d’un domini.
2. El model relacional transforma aquest coneixement en taules, camps, claus i restriccions.
3. Les cardinalitats i la participació determinen en gran part com es col·loquen les claus foranes.
4. Les relacions M:N, els atributs multivaluats, les relacions n-àries i les jerarquies requereixen
transformacions específiques.
5. La integritat d’entitat, la integritat referencial i la integritat de domini protegeixen la coherència de
les dades.
6. La normalització ajuda a reduir anomalies; 3FN és una meta habitual i BCNF una opció més estricta
quan és adequada.
7. Un disseny professional també documenta els dominis, les decisions, les accions referencials i les
regles de negoci que el diagrama no pot expressar completament.


Veure [Exercici 15. Avaluació final](../exercicis/Ex15-avaluacio-final.md)