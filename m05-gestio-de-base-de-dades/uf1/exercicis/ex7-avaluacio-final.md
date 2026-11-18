## Exercici 7. Avaluació final

Preguntes curtes
1. Defineix dada, informació i metadada.
2. Quina diferència hi ha entre entitat tipus i entitat instància?
3. Què és un domini? Posa’n un exemple.
4. Per què NULL no és el mateix que zero?
5. Què és una clau primària?
6. Què és una clau forana?
7. Què és un fitxer pla?
8. Quina diferència hi ha entre accés seqüencial i accés directe?
9. Per què un índex accelera consultes?
10. Quins problemes apareixen quan es treballa només amb fitxers?
11. Defineix SGBD.
12. Explica dues funcionalitats d’un SGBD.
13. Què és una transacció?
14. Què vol dir atomicitat?
15. Què és el diccionari de dades?
16. Quina funció té el DBA?
17. Quins són els tres nivells ANSI/X3/SPARC?
18. Quina diferència hi ha entre model jeràrquic i model en xarxa?
19. Quina és la idea principal del model relacional?
20. Què és una base de dades distribuïda?

<details>
<summary><b>🔍 Veure respostes</b></summary>

1. **Defineix dada, informació i metadada.**
- Dada: Valor o fet brut sens context (ex.: 23).
- Informació: Dada processada i contextualitzada que aporta significat i redueix la incertesa (ex.: 23 °C de temperatura ambient).
- Metadada: Dades sobre les dades; descriuen l'estructura, el tipus, el significat i les restriccions (ex.: nom_camp, tipus VARCHAR(50)).
2. **Quina diferència hi ha entre entitat tipus i entitat instància?**
- Entitat tipus: És la definició o plantilla d'un conjunt d'elements similars (p. ex., ALUMNE).
- Entitat instància: És un cas o element concret d'aquesta plantilla (p. ex., l'alumne Marc Pérez).
3. **Què és un domini? Posa’n un exemple.**
- Concepte: Conjunt de valors vàlids que pot prendre un atribut.
- Exemple: L'atribut Nota té un domini de nombres reals entre 0 i 10.
4. **Per què NULL no és el mateix que zero?**
- NULL representa l'absència de valor, un valor desconegut o no aplicable, mentre que el número 0 o una cadena buida "" són valors concrets.
5. **Què és una clau primària?**
- Atribut o conjunt d'atributs que identifica de manera única cada registre d'una taula. No pot ser NULL.
6. **Què és una clau forana?**
- Atribut o conjunt d'atributs d'una taula que fa referència a la clau primària d'una altra taula per establir relacions i mantenir la integritat referencial.
7. **Què és un fitxer pla?**
- Fitxer de text que emmagatzema informació sense una estructura jeràrquica complexa ni índexs integrats, sovint amb delimitadors com comes o tabuladors (p. ex., un fitxer .csv).
8. **Quina diferència hi ha entre accés seqüencial i accés directe?**
- Accés seqüencial: Per llegir un registre cal passar per tots els anteriors.
- Accés directe: Permet anar directament a la posició d'un registre mitjançant una adreça o una clau sense llegir els anteriors.
9. **Per què un índex accelera consultes?**
- Perquè crea una estructura auxiliar ordenada (com un arbre o una taula de cerca) que permet localitzar els registres per un valor d'atribut sense haver d'escanejar tot el fitxer o taula (evita el full table scan).
10. **Quins problemes apareixen quan es treballa només amb fitxers?**
- Redundància i inconsistència de dades, dificultat d'accés, aïllament de les dades, problemes d'integritat, manca d'atomicitat davant d'errors, accesos concurrents no controlats i problemes de seguretat.
11. **Defineix SGBD.**
- Sistema de Gestió de Bases de Dades (SGBD) / Database Management System (DBMS): Conjunt de programes que permet crear, mantenir, gestionar i accedir de manera eficient i segura a una base de dades.
12. **Explica dues funcionalitats d’un SGBD.**
- Control de concurrència: Gestió dels accesos simultanis de diversos usuaris per evitar inconsistències.
- Gestió de seguretat i autorització: Control de qui pot accedir a quines dades i quines operacions pot fer.
- Gestió de transaccions i recuperació: Garantia de l'execució d'operacions complexes i recuperació davant d'errors.
- Optimització de consultes: Interpretació i execució de consultes d'alta nivell (com SQL) de la manera més eficient.
13. **Què és una transacció?**
- Conjunt d'operacions sobre la base de dades que s'executen com una unitat lògica de treball. O s'executen totes amb èxit o no se n'aplica cap.
14.**Què vol dir atomicitat?**
Propietat d'una transacció que garanteix que aquesta s'executa completament o no s'executa gens (tot o res). Si falla una operació, es fan enrere tots els canvis.
15. **Què és el diccionari de dades?**
- Dipòsit centralitzat que conté les metadades de la base de dades (estructures de taules, tipus de dades, restriccions, usuaris, permisos, etc.). També s'anomena catàleg del sistema.
16. **Quina funció té el DBA?**
El DBA (Database Administrator) respon del disseny físic, el manteniment, el rendiment, la seguretat, les còpies de seguretat i l'autorització d'accés a la base de dades.
17. **Quins són els tres nivells ANSI/X3/SPARC?**
- Nivell extern (o de vistes): Com veuen les dades els usuaris o aplicacions finals.
- Nivell conceptual: Descripció lògica global de tota la base de dades (entitats, atributs, relacions, restriccions).
- Nivell intern (o físic): Descripció de com s'emmagatzemen realment les dades en el suport físic (estructures de fitxers, índexs, adreçament).
18. **Quina diferència hi ha entre model jeràrquic i model en xarxa?**
- Model jeràrquic: Organitza les dades en una estructura d'arbre on cada registre fill té un sol registre pare (relació 1:N).
- Model en xarxa: Permet estructures de graf on un fill pot tenir múltiples pares (relacions M:N directes).
19. **Quina és la idea principal del model relacional?**
- Organitzar les dades en taules bidimensionals (relacions) compostes per files (tuples) i columnes (atributs), interconnectades mitjançant valors comuns (claus primàries i foranes).
20. **Què és una base de dades distribuïda?**
- Base de dades en què les dades estan emmagatzemades físicament en múltiples ordinadors o nodes interconnectats per una xarxa, però que apareix davant l'usuari com un únic sistema lògic integrat.
</details>
<br>

Preguntes tipu test
1. Quina afirmació és correcta?
- A) Una dada sempre té significat sense context.
- B) Una dada és una representació informàtica d’informació.
- C) Una base de dades no pot tenir relacions.
- D) Un SGBD només serveix per fer còpies de seguretat.
2. En una taula relacional, una fila representa normalment:
- A) Un atribut.
- B) Una entitat instància.
- C) Un tipus de dada.
- D) Un índex.
3. Quin element evita identificar dos registres amb el mateix valor?
- A) Clau primària.
- B) Vista.
- C) Log.
- D) Consulta.
4. Quin llenguatge s’utilitza habitualment en SGBD relacionals?
- A) HTML.
- B) SQL.
- C) CSS.
- D) Bash exclusivament.
5. Quina propietat ACID indica que una transacció confirmada no es perd?
- A) Atomicitat.
- B) Consistència.
- C) Aïllament.
- D) Durabilitat.
6. Una base de dades distribuïda:
- A) Sempre és un fitxer CSV.
- B) Guarda les dades només en un ordinador personal.
- C) Pot repartir dades entre diversos nodes connectats.
- D) No necessita SGBD.
7. El diccionari de dades guarda:
- A) Només imatges.
- B) Metadades sobre l’estructura de la BD.
- C) Només contrasenyes en text pla.
- D) Únicament consultes SELECT.
8. Una vista pertany principalment al nivell:
- A) Extern.
- B) Intern.
- C) Físic de disc.
- D) Hardware.
9. Un índex pot empitjorar:
- A) Algunes insercions o actualitzacions.
- B) Només les consultes per clau.
- C) La definició del domini.
- D) El concepte de dada.
10. Quin model representa dades com nodes i arestes?
- A) Relacional.
- B) Graf.
- C) Seqüencial.
- D) Fitxer pla.

<details>
<summary><b>🔍 Veure respostes</b></summary>

1. B
2. B
3. A
4. B
5. D
6. C
7. B
8. A
9. A
10. B
</details>
<br>