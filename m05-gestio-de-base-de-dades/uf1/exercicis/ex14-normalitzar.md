## Exercici 14. Normalitzar una relació
Considera la relació:
```SQL
INCRIPCIO(
  id_alumne,
  nom_alumne,
  email_alumne,
  id_surs,
  nom_curs,
  id_profesor,
  nom_profesor,
  data_inscripcio,
  import
)
PK: (id_alumne, id_curs)
```
1. Indica dependències funcionals probables.
2. Detecta dependències parcials.
3. Proposa una descomposició fins a 3FN.
4. Explica quina informació ha de continuar a `INSCRIPCIO`.


<details>
<summary><b>🔍 Veure respostes</b></summary>

Dependències:
```SQL
id_alumne -> nom_alumne, email_alumne
id_curs -> nom_curs, id_professor
id_professor -> nom_professor
(id_alumne, id_curs) -> data_inscripcio, import
```
Descomposició:
```SQL
ALUMNE(id_alumne, nom_alumne, email_alumne)
PROFESSOR(id_professor, nom_professor)
CURS(id_curs, nom_curs, id_professor)
INSCRIPCIO(id_alumne, id_curs, data_inscripcio, import)
```
</details>