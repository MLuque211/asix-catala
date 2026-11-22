## Exercici 2: Detecció de redundàncies
Fitxer alumnes.csv
```
id_alumne,nom,email,modul,professor
1,Laia,laia@example.net,Bases de dades,Marta Soler
2,Marc,marc@example.net,Bases de dades,Marta Soler
3,Nora,nora@example.net,Sistemes operatius,Jordi Roca
```
Fitxer notes.csv
```
id_alumne,nom,email,modul,nota
1,Laia,laia@example.net,Bases de dades,8.5
2,Marc,marc@example.net,Bases de dades,6.2
3,Nora,nora@example.net,Sistemes operatius,7.1
```
1. Quines dades estan repetides entre els dos fitxers?

2. Què passaria si la Laia canvia el seu correu en un fitxer però no en l’altre?

3. Quines taules proposaries per dissenyar una base de dades relacional optimitzada?
<details>
<summary><b>🔍 Veure respostes</b></summary>

1. **Dades repetides:** Les columnes nom, email i modul apareixen duplicades en tots dos fitxers per a cada un dels alumnes.
2. **Inconsistència de dades:** Es produiria una falta d'integritat. El sistema tindria informació contradictòria sobre el correu de la Laia, fent impossible saber quin és el dada vàlida o actualitzada.
3. **Proposta de taules en BD relacional:**
    - alumne (id_alumne, nom, email)
    - professor (id_professor, nom)
    - modul (codi_modul, nom, id_professor)
    - matricula (id_alumne, codi_modul, nota)
</details>