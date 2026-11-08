# Projecte 5.1: Instal·lació i administració de programari base

## Objectius
L'objectiu principal d'aquesta pràctica és posar en pràctica conceptes bàsics sobre l'administració d'un sistema operatiu mitjançant el desenvolupament d'una sèrie de tasques de forma individual.

## Competències professionals, personals i socials
Avaluar el rendiment dels dispositius maquinari identificant-ne possibilitats de millora segons les necessitats de funcionament.

## Requeriments
Ubuntu 18.04 o superior.

## Enunciat

17. Crea dins del directori `ACTIVITAT7` un directori anomenat `Exercici4`. Dins d'aquest directori crea els fitxers següents amb una sola comanda: `arxiu1.txt`, `arxiu2.txt`, `arxiu3.txt`.

18. Escriu el text `"Benvinguts a la pràctica 7"` dins de `arxiu1.txt` utilitzant una comanda. Mostra després el contingut d'aquest fitxer per pantalla.

19. Afegeix al final de `arxiu1.txt` la línia `"Treballant amb comandes bàsiques de Linux"`. Comprova que s'ha afegit correctament mostrant-ne el contingut.

20. Crea una còpia comprimida de tot el directori `Exercici4` en format `.tar.gz` amb el nom `Exercici4_backup.tar.gz`.

21. Mostra el contingut del fitxer `Exercici4_backup.tar.gz` sense descomprimir-lo.

22. Descomprimeix el fitxer `Exercici4_backup.tar.gz` dins del directori `ACTIVITAT7` amb una sola comanda.

23. Busca dins del directori `ACTIVITAT7` tots els fitxers que continguin la paraula `"comandes"`.

24. Mostra per pantalla les 5 primeres línies del fitxer `arxiu1.txt` i després les 3 últimes línies.

25. Mostra la mida de tots els fitxers i subdirectoris dins del directori `ACTIVITAT7` en format llegible (MB/KB).

26. Mostra l'espai lliure disponible al teu disc amb una comanda.

27. Canvia els permisos de `arxiu1.txt` perquè només l'usuari propietari el pugui llegir i escriure.

28. Crea un directori anomenat `protegir` dins `Exercici4` i copia-hi `arxiu1.txt`. Canvia els permisos del directori `protegir` perquè només l'usuari propietari hi pugui accedir.

29. Mostra el camí absolut del teu directori actual. Després, torna al teu directori personal (home) amb una sola comanda.

30. Mostra la data i l'hora actual del sistema i desa aquesta informació dins un fitxer anomenat `data.txt` dins `ACTIVITAT7`.

31. Busca dins del directori `ACTIVITAT7` tots els fitxers que continguin la paraula `"Linux"` fent servir `grep`.  
    *Pista:* `grep -r "Linux" ACTIVITAT7`

32. Mostra tots els fitxers que tinguin l'extensió `.txt` dins del teu directori personal fent servir la comanda `find`.  
    *Pista:* `find ~ -name "*.txt"`

33. Mostra la mida total en MB del directori `ACTIVITAT7` fent servir `du` amb format llegible.  
    *Pista:* `du -sh ACTIVITAT7`

34. Mostra l'espai lliure de tots els sistemes de fitxers del teu equip en format llegible.  
    *Pista:* `df -h`

35. Mostra els 10 processos que més memòria utilitzen al sistema.  
    *Pista:* `ps aux --sort=-%mem | head`

36. Mostra l'activitat del sistema en temps real utilitzant `top`.  
    *Pista:* Prem `q` per sortir del programa.

37. Fes un ping de prova al servidor de Google (`8.8.8.8`) durant 5 intents i mostra el resultat.  
    *Pista:* `ping -c 5 8.8.8.8`

38. Desa en un fitxer anomenat `web.txt` el codi font de la pàgina web `https://www.gencat.cat` fent servir `curl`.  
    *Pista:* `curl https://www.gencat.cat > web.txt`

39. Comprimeix el fitxer `web.txt` en format `.zip` i comprova que s'ha creat correctament.  
    *Pista:* `zip web.zip web.txt` i després `ls -l web.zip`

40. Mostra la data i hora actual, i després mostra el temps que porta encès el sistema.  
    *Pista:* `date` i `uptime`