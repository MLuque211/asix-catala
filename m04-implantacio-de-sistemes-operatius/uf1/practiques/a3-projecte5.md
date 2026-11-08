# Projecte 5: Instal·lació i administració de programari base

## Objectius
L'objectiu principal d'aquesta pràctica és posar en pràctica conceptes bàsics sobre l'administració d'un sistema operatiu mitjançant el desenvolupament d'una sèrie de tasques de forma individual.

## Competències professionals, personals i socials
Avaluar el rendiment dels dispositius maquinari identificant-ne possibilitats de millora segons les necessitats de funcionament.

## Requeriments
A partir d'una màquina virtual ja existent amb Ubuntu, crea un clon. Recorda reiniciar l'adreça MAC d'aquesta nova màquina per a no tenir conflictes.

## Enunciat

### Apartat A. Comandes bàsiques arxius i carpetes
1. Crea al teu home, el directori `ACTIVITAT7`. Dins, crea la següent estructura de directoris, creant els directoris d'un en un:
   * `Exercici1`
     * `Primer`
       * `aplicacions`
       * `programacio`
       * `maquinari`
     * `Segon`
       * `bd`
       * `fol`
       * `sistemes`

2. Crea a `ACTIVITAT7` el directori `exercici2` i dins, els directoris amb una sola ordre, segons la següent estructura de directoris:
   * `Exercici2`
     * `Primer`
       * `ofimatica`
       * `xarxes`
     * `Segon`
       * `empresa`
       * `administracio`

3. Crea a `ACTIVITAT7` el directori `Exercici3`. Situa't a `Exercici2` i crea dins de `Exercici3` els directoris `Primer` i `Segon`. Situa't al directori `/home/usuari/practica2/exercici3/primer` i crea els directoris `projecte` i `practiques`.

4. Situa't al teu directori home i executa les següents comandes:
   ```bash
   man ls > llistat.txt
   man cp > copia.txt
   ```

5. Mostra per pantalla el contingut del teu directori de treball o directori home.

6. Fes una còpia de l'arxiu `llistat.txt` a `llistat2.txt`.

7. Crea amb una comanda l'arxiu `notes.txt`.

8. Mou l'arxiu `notes.txt` al directori `primer` (de `Exercici3`).

9. Renombra l'arxiu `notes.txt` com a `expedient.txt` des del teu directori de treball.

10. Esborra el fitxer `llistat.txt` des del teu directori de treball.

11. Esborra el directori `primer` (de `Exercici3`), utilitzant ruta absoluta.

12. Esborra el directori `segon` (de `Exercici3`), des del teu directori de treball, utilitzant ruta relativa.

13. Situa't al directori `Exercici1` i esborra el directori `Exercici3`.

14. Situa't al directori `primer` (de `Exercici2`) i esborra el directori `segon` (de `Exercici1`).

15. Situa't al directori `Exercici2` i esborra `Exercici1`.

16. Esborra el directori `ACTIVITAT7`.

### Apartat B. Administració de la xarxa

1. Canvia la configuració de xarxa de la màquina virtual a mode "Adaptador Pont" i engega la màquina virtual.
2. Comprova l'adreça IP que té la teva màquina.
3. Qui t'ha assignat aquesta adreça IP?
4. A quina classe pertany l'adreça IP assignada?
5. Quina és la seva màscara de xarxa assignada?
6. Fes el necessari per configurar aquesta adreça IP fixa. Ho has de fer en mode comanda.
7. Comprova la taula ARP i la taula d'enrutament.


### Apartat C. Instal·lació de programari i actualitzacions

1. Comprova que el sistema base està actualitzat. Si no està actualitzat, l'has d'actualitzar.
2. Utilitzant tots els mètodes d'instal·lació que coneixes, instal·la programari, a la teva elecció, a la màquina virtual.
3. Visualitza amb alguna comanda el programari que has instal·lat (versió i directoris d'instal·lació).
4. Utilitza també un mètode de desinstal·lació.


### Apartat D. Logs de sistema i registre
Visualitza els logs del sistema per comprovar que apareixen registres de les instal·lacions fetes als exercicis anteriors.

### Apartat E. Usuaris i grups

1. Crea tres usuaris: 
   * `usuari1` = nom
   * `usuari2` = cognom1
   * `usuari3` = cognom2 
   *(amb les teves dades)*.

2. Crea dues carpetes a `/home`: 
   * `carpeta1` = nomCognom1
   * `carpeta2` = cognom2

3. Permisos i propietaris:
   * L'usuari 1 és el propietari de la carpeta 1.
   * L'usuari 3 és el propietari de la carpeta 2.
   * L'usuari 1 i 2 podran accedir a la carpeta 1 i crear, modificar i eliminar fitxers.
   * L'usuari 3 pot accedir a la carpeta 1, però tan sols pot llistar i visualitzar els fitxers.
   * L'usuari 2 i 3 podran accedir a la carpeta 2, però l'usuari 1 no pot accedir-hi.

4. Comprova als fitxers de configuració corresponents que t'ha creat els usuaris i els grups.

### Apartat F. Memòria, processos i serveis

1. Llista els processos que s'estan executant al sistema. Obre OpenOffice (prèviament ha d'estar tancat) i comprova que hi és a la llista. Elimina'l de la llista amb una comanda.
2. Amb una comanda, obre Firefox en segon pla (prèviament ha d'estar tancat). Elimina'l.
3. Amb una comanda obre Firefox, què li passa a la terminal? Amb una combinació de tecles, para el Firefox.
4. Amb una comanda obre Firefox i atura el procés (posa'l en espera). Podem navegar? Recupera el procés amb una comanda.
5. Mostra l'activitat del sistema en temps real:
   * Quanta memòria en MB té el sistema?
   * Quanta memòria en MB està en ús?
   * Quanta memòria en MB tenim a la swap?