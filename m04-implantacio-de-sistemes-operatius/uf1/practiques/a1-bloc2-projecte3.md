# Projecte 3: Gestió d'arxius i E/S en un SO

## 1. Objectiu del projecte
En aquest projecte aprendràs, de manera pràctica, com funciona la gestió de fitxers, directoris, permisos i dispositius en un sistema Linux.

També aprendràs les idees bàsiques relacionades amb les entrades i sortides (E/S) d'un ordinador.

No cal que coneguis les comandes de Linux abans de començar. Al llarg del projecte trobaràs les comandes que has d'utilitzar i una explicació de cadascuna.

L'objectiu no és memoritzar les comandes, sinó entendre què estàs fent i què passa quan les executes.

## 2. Normes de treball
- Has de realitzar totes les activitats al teu ordinador.
- Les captures de pantalla han de correspondre a les teves pròpies proves.
- No copiïs les explicacions d'Internet. Explica les coses amb les teves paraules.
- No executis una comanda si no saps què estàs fent.
- Quan es demani una captura, comprova que es pugui llegir correctament.
- Les respostes han d'anar acompanyades de les evidències que es demanin.

## 3. Desenvolupament de les activitats

### Activitat 1 – On sóc?
1. Obre una terminal.
2. Escriu:
   ```bash
   pwd
   ```
   *Què fa aquesta comanda?*  
   La comanda `pwd` ens indica en quin directori estem treballant.

#### Tasca
Executa la comanda. Fes una captura de pantalla. Escriu:  
*El resultat de `pwd` indica que estic al directori:* ____________________

### Activitat 2 – Què hi ha al directori?
Executa:
```bash
ls
```
Ara executa:
```bash
ls -l
```
La comanda `ls` ens permet veure els fitxers i directoris que hi ha en un lloc. L'opció `-l` mostra informació addicional.

#### Respon
1. Quina diferència observes entre `ls` i `ls -l`?
2. Quants elements apareixen amb `ls`?

*(Fes una captura de pantalla on es vegin les dues comandes).*

### Activitat 3 – Crear un directori
Ara crearàs una carpeta per fer les proves del projecte.

1. Executa:
   ```bash
   mkdir projecte3
   ```
   *La comanda `mkdir` serveix per crear un directori.*
2. Comprova que s'ha creat:
   ```bash
   ls
   ```
3. Ara entra al directori:
   ```bash
   cd projecte3
   ```
4. I comprova on ets:
   ```bash
   pwd
   ```

#### Respon
- Què fa `mkdir`?
- Què fa `cd`?

*(Fes una captura de pantalla del resultat).*

### Activitat 4 – Crear un fitxer
Ara crearàs el teu primer fitxer.

1. Executa:
   ```bash
   touch document.txt
   ```
   *La comanda `touch` permet crear un fitxer buit.*
2. Comprova que existeix:
   ```bash
   ls
   ```
3. Ara escriu informació dins del fitxer:
   ```bash
   echo "Aquest és el meu primer fitxer Linux" > document.txt
   ```
4. Per veure el contingut:
   ```bash
   cat document.txt
   ```

#### Respon
1. Quin nom té el fitxer?
2. Quin text conté?
3. Per a què serveix `cat`?

*(Fes una captura on es vegi el fitxer i el seu contingut).*

### Activitat 5 – Afegir informació
Ara afegirem una segona línia al fitxer.

1. Executa:
   ```bash
   echo "Estic aprenent a utilitzar Linux" >> document.txt
   ```
2. I comprova el resultat:
   ```bash
   cat document.txt
   ```

#### Observa
- Abans havíem utilitzat: `>`
- Ara hem utilitzat: `>>`

#### Respon
- Quina diferència observes?

### Activitat 6 – Copiar un fitxer
1. Executa:
   ```bash
   cp document.txt copia.txt
   ```
   *La comanda `cp` serveix per copiar fitxers.*
2. Comprova-ho:
   ```bash
   ls
   ```
   *(Ara tens dos fitxers).*
3. Consulta el contingut de la còpia:
   ```bash
   cat copia.txt
   ```

#### Respon
1. Quins dos fitxers tens ara?
2. Tenen el mateix contingut?
3. Què fa la comanda `cp`?

### Activitat 7 – Crear una carpeta i moure un fitxer
1. Crea una carpeta:
   ```bash
   mkdir documents
   ```
2. Ara mou `copia.txt` dins de la carpeta:
   ```bash
   mv copia.txt documents/
   ```
3. Comprova què tens:
   ```bash
   ls
   ```
4. I després:
   ```bash
   ls documents
   ```

#### Respon
- On es troba ara `copia.txt`?
- Quina funció té `mv`?

#### Representa l'estructura
Completa:
```text
projecte3
│
├── document.txt
│
└── documents
    └── __________________
```

### Activitat 8 – Canviar el nom d'un fitxer
Ara canvia el nom de `document.txt`.

1. Executa:
   ```bash
   mv document.txt informe.txt
   ```
2. Comprova:
   ```bash
   ls
   ```

#### Respon
1. Quin era el nom original?
2. Quin és el nom actual?
3. S'ha creat una còpia del fitxer?
4. Per a què podem utilitzar `mv`?

### Activitat 9 – Eliminar un fitxer
Ara elimina `informe.txt`.

1. Executa:
   ```bash
   rm informe.txt
   ```
2. I comprova:
   ```bash
   ls
   ```

*La comanda `rm` serveix per eliminar fitxers.*

>**Important:** La comanda `rm` s'ha d'utilitzar amb molta precaució. Abans d'eliminar alguna cosa, has de comprovar que és realment el fitxer que vols eliminar.

#### Respon
- Què ha passat amb `informe.txt`?

### Activitat 10 – La jerarquia de directoris
Ara veurem una part important de Linux.

1. Executa:
   ```bash
   cd /
   ```
2. Després:
   ```bash
   pwd
   ```
   *El resultat hauria de ser: `/`*
3. Ara:
   ```bash
   ls
   ```

Observa els directoris que apareixen. Entre d'altres, pots trobar: `home`, `etc`, `tmp`, `usr`, `var`, `dev`. No cal memoritzar-los tots.

#### Investiga
Consulta el contingut de:
```bash
ls /home
```
I després:
```bash
ls /tmp
```

#### Respon
1. Què és `/`?
2. Què és `/home`?
3. Quina diferència observes entre `/home` i `/tmp`?

### Activitat 11 – Tornem al nostre directori
Executa:
```bash
cd ~
```
I després:
```bash
pwd
```
*El símbol `~` representa el directori personal de l'usuari.*

#### Respon
- Quina diferència hi ha entre `cd /` i `cd ~`?

### Activitat 12 – Els permisos
1. Torna al directori del projecte:
   ```bash
   cd ~/projecte3
   ```
2. Crea un fitxer:
   ```bash
   touch permisos.txt
   ```
3. Ara executa:
   ```bash
   ls -l permisos.txt
   ```

Al principi de la línia apareixeran unes lletres semblants a: `-rw-r--r--`

En aquesta activitat només ens fixarem en tres lletres:
- `r` = lectura
- `w` = escriptura
- `x` = execució

#### Respon
1. Quina lletra representa la lectura?
2. Quina representa l'escriptura?
3. Quina representa l'execució?
4. Quines lletres apareixen als permisos del teu fitxer?

*(Fes una captura de: `ls -l permisos.txt`)*

### Activitat 13 – Els dispositius
Linux també representa els dispositius de l'ordinador dins del sistema de fitxers.

1. Executa:
   ```bash
   ls /dev
   ```
   *Apareixeran molts elements. No cal que els memoritzis. L'objectiu és entendre que Linux també gestiona els dispositius mitjançant el sistema operatiu.*
2. Si tens disponible la comanda `lsusb`, executa:
   ```bash
   lsusb
   ```
   *Aquesta comanda mostra dispositius USB detectats per l'ordinador.*

#### Respon
1. Quins dispositius USB detecta el teu ordinador?
2. Per què creus que és necessari que el sistema operatiu gestioni aquests dispositius?

### Activitat 14 – Què és l'E/S?
Les sigles **E/S** volen dir **Entrada/Sortida**.

Un ordinador necessita comunicar-se constantment amb dispositius.

* **Exemples d'entrada:** teclat, ratolí, micròfon, càmera.
* **Exemples de sortida:** pantalla, impressora, altaveus.

Alguns dispositius poden fer les dues coses. Per exemple, un disc pot rebre informació quan hi guardem un fitxer i proporcionar informació quan el llegim.

#### Exercici

Completa la taula indicant la funció de cada dispositiu:

| Dispositiu | Entrada | Sortida |
| :---: | :---: | :---: |
| Teclat | [ ] | [ ] |
| Ratolí | [ ] | [ ] |
| Pantalla | [ ] | [ ] |
| Impressora | [ ] | [ ] |
| Micròfon | [ ] | [ ] |
| Altaveus | [ ] | [ ] |
| Disc | [ ] | [ ] |

### Activitat 15 – Un exemple d'E/S
Pensa què passa quan fas aquesta acció: **Obres un fitxer que està guardat al disc.**

#### Esquema a completar:

$$\text{DISC} \longrightarrow \text{SISTEMA OPERATIU} \longrightarrow \text{PANTALLA}$$

#### Explicació
*Explica breument què passa en cada pas:*

* **Pas 1 (Disc $\rightarrow$ Sistema Operatiu):** 
* **Pas 2 (Sistema Operatiu $\rightarrow$ Pantalla):** 

### Activitat 16 – Com gestiona l'ordinador les E/S?
El sistema operatiu disposa de diferents mecanismes per gestionar les operacions d'entrada i sortida. En aquest projecte coneixeràs tres conceptes:

1. **E/S programada:** El sistema operatiu controla directament l'operació d'E/S.
2. **E/S per interrupcions:** El dispositiu avisa el processador quan necessita atenció.
3. **DMA (Direct Memory Access):** Permet transferir dades entre un dispositiu i la memòria amb poca intervenció directa del processador.

#### Tasca
Fes un petit esquema o resum comparant els tres sistemes:

* **E/S PROGRAMADA:** 
* **E/S PER INTERRUPCIONS:** 
* **DMA:** 

*(No cal explicar-los amb molt detall. L'objectiu és saber què són i distingir-los).*

### Activitat 17 – Repàs de comandes
Completa la taula amb les teves paraules:

| Comanda | Per a què serveix? |
| :---: | :---: |
| `pwd` |  |
| `ls` |  |
| `cd` |  |
| `mkdir` |  |
| `touch` |  |
| `cat` |  |
| `cp` |  |
| `mv` |  |
| `rm` |  |
| `ls -l` |  |

> **Important:** No copiïs les definicions del professor o d'Internet. Escriu-les com les explicaries a un company.

### Activitat final – La meva carpeta Linux
Ara hauràs de demostrar que has après les operacions bàsiques.

Crea aquesta estructura:

```text
projecte_final
│
├── fitxer1.txt
├── fitxer2.txt
│
└── documents
    ├── document1.txt
    └── document2.txt
```

Els fitxers han de contenir text escrit per tu. Has de ser capaç de fer-ho utilitzant les comandes que has après durant el projecte.

### Quan acabis:

Executa:
```bash
ls
```
i:
```bash
ls documents
```

Fes captures de pantalla que permetin comprovar l'estructura.

## 4. Conclusions
Respon amb les teves paraules:

1. Què és un fitxer?
2. Què és un directori?
3. Quina diferència hi ha entre copiar i moure un fitxer?
4. Per a què serveixen els permisos?
5. Què significa E/S?
6. Escriu tres comandes que ara saps utilitzar i explica per a què serveixen:
   * **Comanda 1:** \____________________
   * **Comanda 2:** \____________________
   * **Comanda 3:** \____________________
7. Quina comanda t'ha resultat més fàcil?
8. Quina t'ha costat més?