## Exercici 1: Elecció del sistema d'emmagatzematge
Per a cada un dels següents casos, indica quin sistema d'emmagatzematge triaries (fitxer pla, índex, hashing o base de dades completa) i justifica la teva resposta:

a) Fitxer de configuració d’una aplicació amb 20 línies.

b) Cerca d’un alumne per DNI entre 20.000 registres.

c) Exportació mensual de factures a un altre sistema.

d) Aplicació web amb 500 usuaris modificant comandes.

e) Registre de logs que només s’afegeix al final.

<details>
<summary><b>🔍 Veure respostes</b></summary>

- **a)** Fitxer pla: Com que el volum de dades és molt petit i simple, no cal una estructura complexa ni concurrència; un fitxer pla (com un JSON, YAML o INI) és fàcil de llegir i editar.
- **b)** Índex o Hashing: Per trobar un registre concret per una clau única (DNI) entre un volum mitjà de dades, cal un accés directe i ràpid sense haver de recórrer tot el fitxer seqüencialment.
- **c)** Fitxer pla d'intercanvi (CSV/JSON/XML): L'objectiu principal és la portabilitat i la facilitat d'exportació/importació entre sistemes diferents en un moment puntual.
- **d)** Base de dades completa (SGBD): Es requereix gestionar múltiples connexions simultànies (concurrència), garantir que les dades no es corrompin (transaccions i integritat) i controlar els permisos d'accés.
- **e)** Fitxer pla seqüencial (append-only): L'operació principal és l'escritura ràpida al final del fitxer sense necessitat de modificar ni cercar dades de forma complexa en temps real
</details>