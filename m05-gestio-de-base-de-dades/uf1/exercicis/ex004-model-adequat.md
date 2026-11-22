## Exercici 4. Triar el model adequat
Indica quin model seria més adequat i justifica-ho.
1. Directori d’usuaris d’una organització amb estructura d’unitats i subunitats.
2. Aplicació de facturació amb clients, factures, línies i productes.
3. Xarxa social amb amistats i recomanacions.
4. Catàleg de productes on cada producte té atributs molt diferents.
5. Sistema històric molt antic basat en relacions pare-fill.

<details>
<summary><b>🔍 Veure respostes</b></summary>

1. Jeràrquic o directori LDAP: Ideal per a estructures en arbre (organigrames, unitats i subunitats) on les consultes principals són de lectura ràpida i organització en nivells.
2. Relacional: Les dades tenen una estructura molt clara i fixa, i és essencial garantir la integritat transaccionals (ACID) per evites errors en factures, línies i imports.
3. Graf: Està optimitzat per gestionar entitats (usuaris) i les seves relacions complexes (amistats, seguidors), permetent fer algorismes de recomanació i cerca de camins de forma molt eficient.
4. Documental: Utilitza un esquema flexible (com JSON) que permet emmagatzemar documents amb camps diferents per a cada producte sense necessitat de tenir molts camps nuls o taules addicionals.
5. Jeràrquic: És el model tradicional utilitzat en sistemes antics (com IMS de IBM) on cada registre fill té un únic registre pare, reflectint una jerarquia rígida.

</details>