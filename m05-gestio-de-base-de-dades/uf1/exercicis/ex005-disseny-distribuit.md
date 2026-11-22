## Exercici 5. Disseny distribuït
Una empresa té seus a Barcelona, Girona, Lleida i Tarragona. Cada seu consulta sobretot els seus clients, però la direcció de Barcelona necessita informes globals. Proposa:
    1. Una distribució centralitzada.
    2. Una distribució amb node principal.
    3. Una distribució amb fragmentació horitzontal per seu.
    4. Quina triaries i per què?

Una bona resposta podria proposar fragmentació horitzontal per seu, amb rèplica o consolidació a Barcelona per informes. Si la prioritat és simplicitat, es pot triar centralització. Si la prioritat és disponibilitat i processament local, millor distribució amb rèpliques controlades.

<details>
<summary><b>🔍 Veure respostes</b></summary>

1) Distribució centralitzada: Totes les dades s'emmagatzemen en un únic servidor ubicat a Barcelona. Les seus de Girona, Lleida i Tarragona accedeixen remotament mitjançant la xarxa. La gestió i els informes globals són molt senzills, però depèn totalment de la connexió a Internet i pot generar lentitud o colls d'ampolla.

2) Distribució amb node principal: Barcelona actua com a node principal (master) i conté totes les dades. Les altres seus tenen nodes secundaris que reben rèpliques de lectura. Garanteix consultes ràpides a les seus, però les escriptures s'han de coordinar amb el node central.

3) Fragmentació horitzontal per seu: Es divideix la taula de clients segons la fila/ubicació. Cada seu (Girona, Lleida, Tarragona, Barcelona) guarda exclusivament els registres dels seus clients en el seu node local. Millora l'eficiència i l'autonomia local.

4) Elecció i justificació: La millor opció és la fragmentació horitzontal per seu amb consolidació/rèplica a Barcelona:
    - Autonomia i velocitat local: Girona, Lleida i Tarragona treballen amb els seus clients directament en local sense dependre d'altres seus ni de la xarxa per al dia a dia.
    - Informes globals: La seu de Barcelona rep les rèpliques consolidades de tots els fragments per poder executar els informes globals de directiva sense carregar el treball operatiu de les seus perifèriques.

</details>