## Exercici 15. Avaluació final
Preguntes curtes
1. Quina diferència hi ha entre una entitat tipus i una entitat instància?
2. Què és un domini?
3. Per què una clau primària no pot tenir valors nuls?
4. Quan un atribut ha de convertir-se en una entitat?
5. Quina diferència hi ha entre una relació 1:N i una M:N?
6. Per què una relació M:N necessita una taula associativa?
7. Què és una entitat feble?
8. Què és una clau forana?
9. Quina diferència hi ha entre integritat d’entitat i integritat referencial?
10. Què significa que una relació estigui en 3FN?
11. Què és una dependència funcional transitiva?
12. Quines regles no es poden modelar només amb PK, FK i CHECK?


<details>
<summary><b>🔍 Veure respostes</b></summary>

1. Quina diferència hi ha entre una entitat tipus i una entitat instància?
    - **Entitat tipus (o conjunt d'entitats):** És la definició abstracta o plantilla que descriu una classe d'objectes del món real amb les mateixes propietats o atributs (ex. l'entitat `ALUMNE`).
    - **Entitat instància:** És un element individual, concret i únic que pertany a una entitat tipus amb valors específics per als seus atributs (ex. l'alumne concret *Marc García*, amb ID `123`).

2. Què és un domini?
El **domini** és el conjunt de valors vàlids, indivisibles i admesos que pot prendre un atribut determinat. Defineix:
    - El tipus de dada (ex. enter, text, data).
    - El seu format i rang permès (ex. enters entre `0` i `10`).
    - Restriccions de valors possibles (ex. `{'mòbil', 'fix'}`).

3. Per què una clau primària no pot tenir valors nuls?
Per la **regla d'integritat d'entitat**. La clau primària (PK) té com a funció principal identificar de forma única i unívoca cada fila o tuple d'una taula. Si contingués valors nuls (`NULL`), no es podria assegurar la identificació ni la diferenciació d'aquella instància respecte de les altres.

4. Quan un atribut ha de convertir-se en una entitat?
Un atribut s'ha de convertir en una entitat independent quan:
    1. **Té propietats o atributs propis** que cal descriure (ex. l'adreça passa d'atribut a entitat si en volem desar el codi postal, la ciutat, la regió i el país).
    2. **És un atribut multivaluat o repetitiu** (ex. un alumne té múltiples telèfons o idiomes).
    3. **Es relaciona amb altres entitats** del model de forma independent.

5. Quina diferència hi ha entre una relació 1:N i una M:N?
    - **Relació 1:N (un a molts):** Una instància de l'entitat A es relaciona amb múltiples instàncies de l'entitat B, però una instància de B només es relaciona amb una sola instància d'A (ex. un `Departament` té molts `Empleats`, però un `Empleat` pertany a un sol `Departament`).
    - **Relació M:N (molts a molts):** Una instància de l'entitat A es pot relacionar amb moltes de B, i una de B amb moltes d'A (ex. un `Alumne` es maticula de moltes `Assignatures`, i una `Assignatura` té molts `Alumnes`).

6. Per què una relació M:N necessita una taula associativa?
Perquè el model relacional no permet emmagatzemar llistes o grups repetits directament en una sola cel·la (per complir la **1FN**). La **taula associativa** (o d'enllaç) descompon la relació M:N en dues relacions 1:N, utilitzant com a clau primària la combinació de les claus foranes de les dues entitats relacionades.

7. Què és una entitat feble?
És una entitat que no té suficients atributs per formar una clau primària pròpia per si mateixa i depèn de l'existència d'una altra entitat (anomenada **entitat forta o propietària**). Es fa servir una identificació parcial (discriminador) combinada amb la clau primària de l'entitat forta per identificar-ne les instàncies.

8. Què és una clau forana?
Una **clau forana (FK)** és un atribut o conjunt d'atributs d'una taula que fa referència directament a la clau primària (PK) d'una altra taula (o de la mateixa taula). S'utilitza per establir i mantenir enllaços entre dades i garantir la integritat referencial.

9. Quina diferència hi ha entre integritat d’entitat i integritat referencial?
    - **Integritat d'entitat:** S'aplica a les claus primàries (PK). Estableix que tota taula ha de tenir una PK i que cap dels atributs que la formen pot ser nul (`NULL`).
    - **Integritat referencial:** S'aplica a les claus foranes (FK). Estableix que qualsevol valor d'una FK ha d'existir prèviament a la PK de la taula referenciada, o bé ser un valor nul (`NULL`, si la regla de participació ho permet).

10. Què significa que una relació estigui en 3FN?
Significa que la taula compleix la **1FN** i la **2FN** (tots els atributs depenen plenament de tota la clau primària) i, a més, **no conté dependències transitives**, és a dir, cap atribut no clau depèn d'un altre atribut no clau.

11. Què és una dependència funcional transitiva?
És una dependència indirecta de la forma $X \rightarrow Z$ que es produeix quan un atribut no clau $Z$ depèn d'un altre atribut no clau $Y$, el qual al seu torn depèn de la clau primària $X$ ($X \rightarrow Y$ i $Y \rightarrow Z$).

12. Quines regles no es poden modelar només amb PK, FK i CHECK?
No es poden modelar regles de negoci complexes, especialment aquelles que impliquen:
    - **Validacions entre múltiples taules o línies diferents** (ex. no permetre que un alumne tingui més de 3 préstecs actius).
    - **Control d'accés i seguretat basada en rols** (ex. només la secretaria pot modificar certes dades).
    - **Històrics o auditories de canvis** (ex. conservar el preu d'un producte en el moment de la compra tot i que canviï el preu del catàleg).
    - **Consultes o càlculs complexos** sobre dades agrupades o agregades.

> **Nota:** Aquestes regles requereixen *triggers*, transaccions, procediments emmagatzemats o lògica a nivell d'aplicació.

</details>

Preguntes tipu test
1. Una relació M:N entre ALUMNE i ASSIGNATURA es transforma habitualment en:
- A) Afegir la PK d'`ALUMNE` a ASSIGNATURA.
- B) Afegir la PK d'`ASSIGNATURA` a ALUMNE.
- C) Crear una taula associativa amb FK cap a totes dues.
- D) Eliminar la relació perquè és redundant.
2. Una FK pot tenir valor NULL:
- A) Mai.
- B) Sempre.
- C) Només si la participació és opcional i el disseny ho permet.
- D) Només si també és PK.
3. La 2FN tracta principalment:
- A) Valors multivaluats.
- B) Dependències parcials respecte d’una clau composta.
- C) Dependències transitives.
- D) Permisos d’usuari.
4. En una relació 1:N:
- A) La FK se situa normalment a la taula del costat N.
- B) La FK se situa sempre a la taula del costat 1.
- C) Cal crear sempre una tercera taula.
- D) No es poden tenir atributs de relació.

<details>
<summary><b>🔍 Veure respostes</b></summary>

1. C
2. C
3. B
4. A

</details>