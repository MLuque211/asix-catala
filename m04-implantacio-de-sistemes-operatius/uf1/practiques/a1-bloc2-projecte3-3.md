# Projecte 3.3: Pràctica guiada - Navegant pel sistema de fitxers de Linux (nivell inicial)

## Activitat 1. Explorant el teu entorn
1. Mostra el contingut del teu directori amb `ls`.
2. Mostra també els fitxers ocults amb `ls -a`.
3. Entra dins de `Documents` amb `cd Documents` (si existeix).
4. Comprova el camí actual amb `pwd`.
5. Torna al directori personal amb `cd ~`.
6. Esborra la pantalla amb `clear`.

## Activitat 2. Creació del projecte
1. Crea una carpeta `projecte_empresa` amb `mkdir projecte_empresa`.
2. Entra-hi amb `cd projecte_empresa`.
3. Crea la carpeta `documents` amb `mkdir documents`.
4. Crea la carpeta `scripts` amb `mkdir scripts`.
5. Crea la carpeta `dades` amb `mkdir dades`.
6. Crea la carpeta `resultats` amb `mkdir resultats`.
7. Entra dins de `dades` amb `cd dades`.
8. Crea la subcarpeta `originals` amb `mkdir originals`.
9. Crea la subcarpeta `processats` amb `mkdir processats`.
10. Torna a la carpeta principal amb `cd ..`.
11. Comprova el contingut amb `ls`.

## Activitat 3. Fitxers dins de "documents"
1. Entra dins la carpeta `documents` amb `cd documents`.
2. Crea un fitxer `informe.txt` amb `touch informe.txt`.
3. Crea un fitxer `resum.txt` amb `touch resum.txt`.
4. Crea un fitxer `notes.txt` amb `touch notes.txt`.
5. Comprova el contingut amb `ls`.
6. Escriu text a `informe.txt` amb `echo "Informe del projecte empresa 2025" > informe.txt`.
7. Mostra el contingut amb `cat informe.txt`.
8. Torna a `projecte_empresa` amb `cd ..`.

## Activitat 4. Explorant el sistema
1. Ves al directori arrel amb `cd /`.
2. Mostra el contingut amb `ls`.
3. Entra a la carpeta `etc` amb `cd etc`.
4. Mostra el contingut amb `ls`.
5. Busca visualment el fitxer `hosts`.
6. Mostra el contingut de `hosts` amb `cat hosts`.
7. Torna al teu directori personal amb `cd ~`.

## Activitat 5. Fitxers i permisos
1. Entra a `projecte_empresa` amb `cd projecte_empresa`.
2. Entra a `scripts` amb `cd scripts`.
3. Crea un fitxer `analisi.sh` amb `touch analisi.sh`.
4. Crea un fitxer `neteja.sh` amb `touch neteja.sh`.
5. Crea un fitxer `resum.sh` amb `touch resum.sh`.
6. Mostra el contingut amb `ls -l` per veure els permisos per defecte.
7. Dona permisos d'execució a l'usuari amb valors numèrics: `chmod 744 analisi.sh` (usuari: $7 =$ lectura + escriptura + execució).
8. Dona permisos de lectura i escriptura només a l'usuari: `chmod 600 resum.sh` (usuari: $6 =$ lectura + escriptura).
9. Crea una carpeta `antics` amb `mkdir antics`.
10. Mou `neteja.sh` dins `antics` amb `mv neteja.sh antics/`.
11. Comprova de nou els permisos amb `ls -l`.
12. Torna a la carpeta principal amb `cd ..`.

## Activitat 6. Eliminació i reorganització
1. Entra a `documents` amb `cd documents`.
2. Mostra el contingut amb `ls`.
3. Elimina `notes.txt` amb `rm notes.txt`.
4. Crea una carpeta `vells` amb `mkdir vells`.
5. Mou `resum.txt` dins `vells` amb `mv resum.txt vells/`.
6. Entra dins `vells` amb `cd vells`.
7. Mostra el contingut amb `ls`.
8. Elimina `resum.txt` amb `rm resum.txt`.
9. Torna a `documents` amb `cd ..`.
10. Elimina la carpeta `vells` amb `rmdir vells`.
11. Torna al directori personal amb `cd ~`.
12. Elimina tot el projecte amb `rm -r projecte_empresa`.
13. Comprova que s'ha eliminat amb `ls`.

## Activitat 7. Repte final
1. Crea la carpeta `empresa` amb `mkdir empresa`.
2. Entra-hi amb `cd empresa`.
3. Crea la carpeta `informes` amb `mkdir informes`.
4. Crea la carpeta `scripts` amb `mkdir scripts`.
5. Crea la carpeta `dades` amb `mkdir dades`.
6. Entra a `dades` amb `cd dades`.
7. Crea `originals` amb `mkdir originals`.
8. Crea `nets` amb `mkdir nets`.
9. Torna a `empresa/informes` amb `cd ../informes`.
10. Crea el fitxer `resum.txt` amb `touch resum.txt`.
11. Torna a `scripts` amb `cd ../scripts`.
12. Crea `run.sh` amb `touch run.sh`.
13. Dona permisos d'execució amb `chmod 755 run.sh`.
14. Comprova el contingut amb `ls` i el camí amb `pwd`.

## Activitat 8. Autoavaluació final
1. Quina ordre serveix per veure el directori actual?
2. Què fa `cd ..`_?
3. Quina diferència hi ha entre `rm` i `rmdir`_?
4. Quina ordre serveix per crear fitxers buits?
5. Com expresses els permisos d'un fitxer amb valors numèrics?