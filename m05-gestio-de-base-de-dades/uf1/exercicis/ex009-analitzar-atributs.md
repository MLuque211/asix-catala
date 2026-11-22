## Exercici 9. Analitzar atributs
Per a l’entitat PRODUCTE, classifica cadascun dels atributs següents (simple, compost, monovaluat, multivaluat, derivat, etc.) i indica clarament si el desaries a la base de dades o el calcularies en temps d'execució:

codi_producte, nom, preu_base, IVA, preu_final, categories, dimensions, existencies, data_alta.

<details>
<summary><b>🔍 Veure respostes</b></summary>

- codi_producte: Simple, monovaluat, identificador principal (clau primària) i obligatori. Es desa.
- nom: Simple, monovaluat, de tipus text i obligatori. Es desa.
- preu_base: Simple, monovaluat, numèric decimal i obligatori. Es desa.
- IVA: Simple o associat a un tipus impositiu (p. ex., 21%). Depèn del domini es pot emmagatzemar com un percentatge o relacionar amb una taula d'impostos. Es desa.
- preu_final: Atribut derivat o calculat. S'obté directament a partir de preu_base i IVA ($\text{preu\_base} \cdot (1 + \text{IVA})$). No es desa (es calcula en temps d'execució o en una vista per evitar redundàncies).
- categories: Multivaluat (un producte pot tenir diverses categories). Per evitar vulnerar la primera forma normal, és millor no emmagatzemar-lo com un text separat per comes sinó modelar una entitat CATEGORIA i una relació M:N.
- dimensions: Atribut compost. Es recomana descompondre'l en subatributs simples (amplada, alçada, profunditat) si cal fer cerques o filtres per aquests valors. Es desa descompost.
- existencies: Simple, monovaluat, numèric enter amb restricció de valor no negatiu ($\ge 0$). Es desa.
- data_alta: Simple, monovaluat, de tipus data i obligatori (sol prendre el valor del sistema en crear el registre). Es desa.

</details>