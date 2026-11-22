## Exercici 11. Pràctica guiada amb DBeaver
**Objectiu de la pràctica**: Representar amb DBeaver el model lògic d’un sistema de gestió de tutories.
**Enunciat**: Un institut registra professors, alumnes i entrevistes de tutoria. Cada alumne té un tutor assignat, però un professor pot ser tutor de molts alumnes. Es poden programar diverses entrevistes entre un tutor i el seu alumne. De cada entrevista cal guardar data, hora, motiu, observacions i estat. Un alumne pot no haver tingut encara cap entrevista.

1. Pas 1. Anàlisi abans d’obrir DBeaver
Proposta inicial:
- Entitats: `PROFESSOR`, `ALUMNE` i `ENTREVISTA`.
- `PROFESSOR — ALUMNE`: 1:N.
- `ALUMNE — ENTREVISTA`: 1:N.
- Una entrevista també ha de quedar vinculada amb el professor que la realitza. En aquest cas, és coherent incorporar `id_professor` com a FK a `entrevista` o deduir-lo a partir del tutor de l’alumne, segons si sempre és el mateix tutor qui l’atén.
Abans de dissenyar, cal preguntar: pot un alumne tenir una entrevista amb un professor diferent del seu tutor? Aquesta resposta modifica el model.

2. Crear un primer esquema
Si es respon que les entrevistes sempre les realitza el tutor assignat, un primer model pot ser:
```DBeaver
CREATE TABLE professor (
  id_professor INTEGER PRIMARY KEY,
  nom TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE
);
CREATE TABLE alumne (
  id_alumne INTEGER PRIMARY KEY,
  nom TEXT NOT NULL,
  id_tutor INTEGER NOT NULL,
  FOREIGN KEY (id_tutor)
    REFERENCES professor (id_professor)
    ON DELETE RESTRICT
);
CREATE TABLE entrevista (
  id_entrevista INTEGER PRIMARY KEY,
  id_alumne INTEGER NOT NULL,
  data_hora DATETIME NOT NULL,
  motiu TEXT NOT NULL,
  observacions TEXT,
  estat TEXT NOT NULL CHECK (estat IN ('programada', 'realitzada', 'anullada')),
  FOREIGN KEY (id_alumne)
    REFERENCES alumne (id_alumne)
    ON DELETE RESTRICT
);
```
3. Construir i revisar la visualització
    1. Executa l’script a la connexió de pràctiques.
    2. Obre el diagrama de l’esquema.
    3. Col·loca `PROFESSOR` a l’esquerra, `ALUMNE` al centre i `ENTREVISTA` a la dreta.
    4. Verifica que existeix una FK de `alumne.id_tutor` cap a `professor.id_professor`.
    5. Verifica que existeix una FK de `entrevista.id_alumne` cap a `alumne.id_alumne`.
    6. Escriu, fora del diagrama, la cardinalitat min-max completa que dedueixes de les FK i de la nul·labilitat.
    7. Exporta el diagrama en PNG amb el nom `tutories_ra2_cognom_nom.png`.

4. Validació entre iguals
Una parella ha de revisar el diagrama d’una altra amb aquesta llista:
    1. Totes les taules tenen PK?
    2. Cada FK apunta a una PK o clau única existent?
    3. Les taules del costat N contenen la FK correcta?
    4. Hi ha camps multivaluats guardats com a text?
    5. La nul·labilitat de les FK coincideix amb la participació indicada?
    6. Quines regles de negoci no es poden deduir només mirant el diagrama?
    7. El diagrama és llegible quan s’obre l’arxiu PNG exportat?

5. Problemes habituals a DBeaver i com resoldre’ls

| Problema | Causa probable | Acció recomanada |
| :---: | :---: | :---: |
| No apareix cap línia entre dues taules | S’ha creat una columna amb el mateix nom que una PK, però no una FK real | Defineix la restricció `FOREIGN KEY ··· REFERENCES ···`, desa els canvis i actualitza el diagrama |
| El diagrama no mostra les taules noves | El navegador o el diagrama no s’han actualitzat | Actualitza la connexió o el diagrama; tanca’l i torna’l a obrir si cal |
| No es pot crear una taula fent clic al llenç | El diagrama és de només lectura o l’edició directa no està disponible en l’edició instal·lada | Crea la taula des de `Tables → Create New Table` o amb un script SQL |
| No es pot desar l’estructura | L’usuari de la connexió no té permisos DDL o la BD és de només lectura | Comprova els permisos o utilitza una BD local de pràctiques |
| Les cardinalitats no expressen tota la regla | El diagrama llegeix les FK, però no coneix totes les regles de negoci | Completa el lliurament amb cardinalitats min-max textuals, diccionari de dades i registre de regles |
| L’exportació queda il·legible | Les taules són massa petites, hi ha massa camps visibles o el diagrama té encreuaments | Reordena les taules, ajusta el zoom i exporta de nou a una resolució adequada |