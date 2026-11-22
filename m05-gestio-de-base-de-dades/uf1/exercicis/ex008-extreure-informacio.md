## Exercici 8. Extreure informació d'un enunciat
Llegeix atentament el cas d'ús següent d'una acadèmia i respon a les preguntes plantejades per construir-ne el model dades conceptual:"Una acadèmia ofereix cursos. Cada curs té un codi, un nom, una durada i un preu. Els alumnes es poden matricular a diversos cursos i de cada matrícula cal registrar la data i l’import pagat. Cada curs és impartit per un professor, però un professor pot impartir diversos cursos."
1. Marca els possibles noms d’entitat.
2. Proposa atributs principals per a cada una de les entitats.
3. Identifica les interrelacions entre les entitats.
4. Indica les cardinalitats màximes i mínimes deduïbles.
5. Escriu dues o tres preguntes clau que caldria fer a l’usuari abans de tancar el model.

<details>
<summary><b>🔍 Veure respostes</b></summary>

1. Entitats inicials: ALUMNE, CURS, PROFESSOR i posteriorment MATRICULA (com a entitat o interrelació M:N amb atributs).
2. Atributs proposats:ALUMNE: id_alumne, nom, cognoms, email, telefon.CURS: codi_curs, nom, durada, preu.PROFESSOR: id_professor, nom, especialitat, email.MATRICULA (Atributs propis): data_matricula, import_pagat.
3. Interrelacions:
4. Cardinalitats:
    - ALUMNE - CURS (Matricular-se): Relació de tipus M:N (Molts a Molts).
      - Un alumne es pot matricular a $(0,N)$ cursos.
      - Un curs pot tenir $(1,N)$ alumnes matriculats.
      - (Els atributs "data_matricula" i "import_pagat" s'associen directament a aquesta relació/taula intermèdia).
    - PROFESSOR - CURS (Impartir): Relació de tipus 1:N (Un a Molts).
      - Un professor pot impartir $(0,N)$ cursos.
      - Un curs és impartit per $(1,1)$ únic professor.
5. Preguntes pendents per a l'usuari:
    - Un alumne es pot matricular més d'una vegada al mateix curs (per exemple, en edicions o semestres diferents)?
    - Un curs pot ser compartit per diversos professors (co-docència o relació M:N)?
    - Hi pot haver cursos creats al sistema que temporalment no tinguin cap professor assignat?

</details>