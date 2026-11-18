## Exercici 3: consultar el diccionari de dades amb SQLite
1. Crea una base de dades SQLite.
2. Crea les dues taules següents: alumne i modul.
3. Consulta l’estructura amb .schema i PRAGMA table_info.
4. Explica quines metadades has obtingut.

<details>
<summary><b>🔍 Veure respostes</b></summary>

1. Execució de les comandes SQL CREATE TABLE en SQLite per generar les taules alumne i modul amb les seves corresponents restriccions (PRIMARY KEY, NOT NULL, UNIQUE).
2. Veure taula
```
CREATE TABLE alumne (
  id_alumne INTEGER PRIMARY KEY,
  nom TEXT NOT NULL,
  email TEXT UNIQUE
);

CREATE TABLE modul (
  codi TEXT PRIMARY KEY,
  nom TEXT NOT NULL
);
```
3. Consultes:
- `.schema`: Mostra la comanda SQL exacta que es va utilitzar per crear les taules de la base de dades.
- `PRAGMA table_info(alumne);`: Retorna una taula amb la informació detallada de cada columna de la taula alumne.

4. Metadades obtingudes:
- cid: L'identificador numèric de la columna dins de la taula (ordre).
- name: El nom de la columna (p. ex., id_alumne, nom, email).
- type: El tipus de dada assignat (INTEGER, TEXT).
- notnull: Indica si la columna té la restricció NOT NULL (1 si és obligatòria, 0 si admet nuls).
- dflt_value: El valor per defecte de la columna (si n'hi ha cap definit).
- pk: Indica si la columna forma part de la clau primària (1 si és clau primària, 0 si no ho és).
</details>