# PROJECTE 3.2: Valoració de coneixements
«S'ha sintetitzat el contingut del document original per tal de centrar-se en els aspectes clau, havent depurat i omès qualsevol informació de caràcter personal.»

## Activitat 1. Navegació pel sistema

1. **Quina comanda utilitzaries?**

Faria servir la comanda "pwd" per determinar la posició exacta en la que em trobo.

2. **Ara vols veure els fitxers i directoris que hi ha dins. Quina comanda utilitzaries?**

Faria servir la comanda "ls nom_directori" per poder veure el què hi ha dins d'aquest mateix.

3. **Vols entrar en un directori anomenat projecte. Quina comanda utilitzaries?**

Faria servir el directori "cd projecte/" per entrar dins aquest directori.

## Activitat 2. Crear una estructura

1. **Escriu les comandes necessàries per crear-la.**

Es pot fer directori a directori però també aprofitar i fer-ho en un únic pas. D'aquesta manera amb una única comanda es creen tots els directoris junts. Aquest seria:

_mkdir Empresa && mkdir Empresa/documents/ && mkdir Empresa/copies/ && mkdir Empresa/temporal/_

2. **Explica què fa la comanda que has utilitzat per crear els directoris.**

Aquesta comanda crea no només el directori "pare" sinó també els directoris "fills" en un "únic" pas. Crea la segona comanda si la primera no ha donat error.

3. **Indica una manera de comprovar que l'estructura s'ha creat correctament.**

Suposant que ens trobem un nivell superior al directori "pare" creat s'ha de fer servir la comanda "ls Empresa/" per mostrar els directoris "fills" que presenta. Si dona error, el directori "pare" o no existeix o s'ha creat en un altre lloc. Si no dona error, es pot comprovar si els directoris "fills" hi són tots. La comanda "&&" significa que primer s'executa la primera comanda, si aquesta és positiva, es crea la segona, sinó dona error i no es crea cap.

## Activitat 3. Crear i escriure en fitxers

1. **Quina comanda o conjunt de comandes utilitzaries?**

Primer es fa servir la comanda "touch informe.txt" per crear l'arxiu. Segon es fa servir la comanda "echo "Informe del projecte" > informe.txt && echo "Autor: Joan" >> informe.txt

2. **Com comprovaries després el contingut del fitxer?**

Fent servir la comanda "cat informe.txt" que et remet la informació del fitxer per la terminal.

## Activitat 4. Entendre > i >>

1. **Quina redirecció utilitzaries: > o >>?**

Faria servir la redirecció >> per enviar la informació a continuació de la que ja existeix.

2. **Escriu una comanda que permeti fer aquesta operació.**

La faria amb aquesta comanda: _echo "Revisar permisos" >> tasques.txt

3. **Què passaria si utilitzessis > en lloc de >>?**

En comptes d'enviar la informació a continuació de la que ja hi havia, restauraries el fitxer de zero (sense cap mena d'informació) i llavors apareixeria només, si es comprova amb "cat" la frase _Revisar permisos_. La resta hauria sigut esborrada.

4. **Explica amb les teves paraules la diferència entre > i >>**.

Si només col·loques un ">" esborres el que hi ha a dins (si hi ha alguna cosa) i li instaures una nova frase. En canvi, si li col·loques ">>" la informació (hi hagi o no) queda al darrere de tot.

## Activitat 5. Copiar o moure?

**Situació A**
1. **Quina operació has de fer?**

En aquest cas s'ha de fer servir la comanda "cp" de l'arxiu que es vol copiar amb el nom del qual es vol deixar la còpia.

2. **Escriu la comanda.**

La comanda seria: _cp informe.txt ../copies/informe.txt_

**Situació B**
1. **Quina operació has de fer?**

S'ha de fer servir la comanda "mv" perquè en aquest cas es vol traslladar l'arxiu de localització.

2. **Esciu la comanda.**

La comanda seria: _mv informe.txt ../temporal/"

3. **Explica la diferència entre les dues operacions.**

La primera operació, la "cp" duplica la informació i la guarda en el mateix directori (nom diferent) o en un altre. En canvi, el "mv" no duplica res sinó que ho canvia directament de localització. 

## Activitat 6. Detecta l'error

1. **Quin error ha comès?**

En comptes de col·locar dues ">>", només n'ha col·locat una ">". Això ha fet que esborres tota la informació prèvia i només deixes la nova entrada.

2. **Per què ha desaparegut el contingut anterior?**

Perquè en la comanda ha col·ocat una ">" en comptes de dues ">>".

3. **Com hauria d'haver escrit la comanda si volia conservar el contingut anterior?**

L'hauria d'haver escrit així: _echo "Revisar documentació" >> notes.txt_

## Activitat 7. Eliminar un fitxer

1. **Quina comanda utilitzaries?**

Utilitzaria la comanda rm, especificant sobretot la direcció del directori, quedant "rm temporal/prova.txt". (s'entén que estas al directori anterior i per això se li especifica dintre de quin directori està l'arxiu que es vol eliminar).

2. **Per què és convenient comprovar abans que estàs treballant amb el fitxer correcte?**

Per evitar cometre errors irreparables, sobretot els importants.

3. **Què passa amb el fitxer després d'executar l'operació?**

El fitxer en concret s'esborra de manera definitiva.

## Activitat 8. Interpretar permisos

1. **És un fitxer o un directori?**

Hi ha dues maneres de saber-ho: La primera, és un fitxer perquè el nom del mateix acaba en .txt (informes.txt). La segona, perque el primer "-" dels permisos al no dir res, significa que és un fitxer.

2. **Qui és el propietari?**

El propietari es diu Ferran.

3. **Quin és el grup?**

El grup és alumnes.

4. **Quins permissos té el propietari?**

Recordem que els permisos es separen en blocs de tres. Per tant en Ferran té els permisos de lectura i escriptura ("r" i "w").

5. **Quins permisos té el grup?**

El grup té els permisos de lectura només ("r").

6. **Quins permisos tenen els altres usuaris?**

Els altres usuaris només tenen els permisos de lectura ("r"), igual que el de grup.

7. **Què significa la lletra r?**

Significa que aquest arxiu és de lectura.

8. **Què significa la lletra w?**

Significa que aquest arxiu és d'escriptura.

9. **Què significa la lletra x?**

Significa que aquest arxiu és d'execució.

## Activitat 9. Quin és el resultat?

1. **Com queda el directori projecte?**

El directori projecte es quedaria amb dos documents: el _document.txt_ i el _document_backup.txt_.

2. **Què hi haurà dins de temporal?**

Hi haurà el document _notes.txt_. I si tenim en compte que en l'activitat 5, en la situació B, haviem traslladat un document anomenat _informe.txt_, també hi seria aquest.

3. **Què ha passat amb document.txt?**

La informació que tenia s'ha duplicat i ara estan en dos fitxers de noms diferents.

4. **Què ha passat amb notes.txt?**

S'ha traslladat dins del directori anomenat temporal.

5. **Representa l'estructura final.**
```
Projecte
  |__ document.txt
  |__ document_backup.txt
  |__ temporal 
        |__ notes.txt
```

## Activitat 10. Cas pràctic de raonament

1. **Quina operació faries?**

El que has de fer és moure l'arxiu "backup.txt" dins el directori anomenada "copies".

2. **Escriu la comanda.**

Amb aquesta comanda: "mv backup.txt copies/"

3. **Després de fer-la, on estarà backup.txt?**

L'arxiu anomenat "backup.txt" es trobarà dintre del directori "copies".

4. **Existirà encara projecte/backup.txt?**

No existirà, perquè l'arxiu s'ha mogut a un altre directori.

5. **Per què no utilitzaries cp?**

No s'utilitza "cp" perquè aquest duplicaria la informació, i el que es necessita aquí és moure'l a un altre lloc.

## Activitat 11. Pregunta final de comprensió

La diferència radica en que saber una comanda significa entendre què fa cada cosa i perquè. En canvi, saber fer servir una comanda significa entendre què passarà després amb allò que estiguis treballant abans de fer-la servir. Un exemple directa és la comanda "> o >>". Saber-la és conèixer que inclou informació nova o sobreescriure la vella. En canvi, saber-la fer servir implica coneixer els riscos que comporta equivocar-se amb ">" si volies fer servir ">>".