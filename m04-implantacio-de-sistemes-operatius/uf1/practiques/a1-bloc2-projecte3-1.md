# Projecte 3.1: MISSIÓ: ADMINISTRADOR LINUX

## Situació

Imagina que acabes d'entrar a treballar com a tècnic de sistemes. Un company t'ha deixat una carpeta amb informació desordenada i t'ha demanat que la preparis abans de lliurar-la a un altre usuari.

No trobaràs les comandes que has d'utilitzar. Has de decidir quina comanda és adequada en cada situació a partir del que has aprendre durant el projecte.

> **Important:** No es tracta només d'aconseguir el resultat final. Has de poder explicar què has fet i per què.

## 1. Preparar l'entorn

Crea una carpeta anomenada: `missio_linux`

A dins hauràs de construir aquesta estructura:

```text
missio_linux
├── personal
├── projecte
├── copia_seguretat
└── temporal
```

### Condicions
* Has de fer-ho des del terminal.
* No pots utilitzar un gestor gràfic de fitxers.
* Has de demostrar amb captures que has creat l'estructura.

### Respon
1. Quina comanda has utilitzat per crear la carpeta?
2. Quina comanda has utilitzat per entrar-hi?
3. Com has comprovat que eres dins de `missio_linux`?

## 2. Crear la informació

* Dins de `personal`, crea: `alumne.txt`, `contacte.txt`
* Dins de `projecte`, crea: `projecte.txt`, `tasques.txt`

Els fitxers no poden quedar buits.

* El fitxer `alumne.txt` ha de contenir:
  ```text
  Nom:
  Curs:
  Ordinador:
  ```
  *(El valor d'Ordinador ha de correspondre a l'ordinador on estàs treballant).*

* El fitxer `projecte.txt` ha de contenir:
  ```text
  Projecte de gestió de fitxers
  Autor: [el teu nom]
  Data: [data d'avui]
  ```

* El fitxer `tasques.txt` ha de tenir com a mínim quatre línies escrites per tu.

### Respon
1. Quina comanda has utilitzat per crear els fitxers?
2. Quina comanda has utilitzat per escriure informació?
3. Quina comanda has utilitzat per consultar el contingut?

*(Fes una captura que permeti comprovar els continguts dels quatre fitxers).*

## 3. Un error intencionat

Afegeix al fitxer `tasques.txt` la línia: `Tasques pendents de revisar`

Comprova el contingut del fitxer.

### Respon abans de continuar
* Què creus que passaria si utilitzessis `>` en lloc de `>>`?

A continuació, crea una còpia de `tasques.txt` anomenada: `prova.txt`  
A `prova.txt`, fes una prova utilitzant `>`.  
Comprova el resultat i compara els dos fitxers.

### Respon
1. Què ha passat?
2. Quina diferència hi ha entre `>` i `>>`?
3. Quina de les dues utilitzaries per afegir informació al final d'un fitxer? Per què?

*(Fes una captura que permeti comprovar el resultat).*

## 4. Organitzar un desastre

Ara `prova.txt` ha d'acabar dins de: `temporal`  
Però no has de crear una segona còpia del fitxer.

### Respon abans d'executar la comanda
1. Quina comanda utilitzaràs? Per què?
2. Què creus que passarà amb `prova.txt` a la seva ubicació actual?

### Després:
* Executa l'operació.
* Comprova que `prova.txt` ja no es troba a la ubicació anterior.
* Comprova que es troba dins de `temporal`.

*(Fes una captura del resultat).*

## 5. Crear una còpia de seguretat

El responsable et demana una còpia de seguretat dels documents importants del projecte.

Els documents són: `projecte.txt` i `tasques.txt`

Has de crear les còpies dins de: `copia_seguretat`  
Les còpies han de tenir aquests noms: `projecte_backup.txt` i `tasques_backup.txt`

### Comprova
Has de demostrar que:
* Els fitxers originals continuen existint.
* Les còpies existeixen.
* Les còpies tenen el mateix contingut que els originals.

### Respon
1. Quina comanda has utilitzat per crear les còpies?
2. Per què no has utilitzat `mv`?
3. Quina diferència hi ha entre copiar i moure un fitxer?

*(Fes les captures necessàries).*

## 6. Eliminar un fitxer

Ara crea dins de `temporal` un fitxer anomenat: `esborrar.txt`  
Escriu-hi qualsevol text.  
Comprova que existeix.  
Ara elimina'l.

### Comprova
* Que el fitxer existia abans d'eliminar-lo.
* Que ha desaparegut després d'eliminar-lo.

### Respon
1. Quina comanda has utilitzat per eliminar-lo?
2. Què ha passat amb el fitxer?
3. Per què cal utilitzar aquesta comanda amb precaució?

*(Fes una captura del procés).*

## 7. Auditoria

Ara imagina que no recordes què has fet. El responsable et demana que demostris com està organitzada la carpeta `missio_linux`.

Has de comprovar:
* **A. On ets:** Utilitza una comanda que permeti demostrar la ubicació actual.
* **B. Contingut de `missio_linux`:** Mostra els elements que hi ha dins.
* **C. Contingut de `personal`:** Mostra els elements que hi ha dins.
* **D. Contingut de `projecte`:** Mostra els elements que hi ha dins.
* **E. Contingut de `copia_seguretat`:** Mostra els elements que hi ha dins.
* **F. Contingut de `temporal`:** Mostra els elements que hi ha dins.

*(No s'indica quina comanda has d'utilitzar en cada cas. Fes les captures necessàries perquè es pugui comprovar tota l'estructura).*

## 8. Investiga els permisos

Consulta els permisos de `projecte.txt` i `tasques.txt` utilitzant una comanda que permeti veure informació detallada dels fitxers.

### Respon
1. Quines lletres apareixen al principi de la línia?
2. Què significa `r`?
3. Què significa `w`?
4. Què significa `x`?
5. Quines lletres apareixen als permisos de `projecte.txt`?
6. Quines lletres apareixen als permisos de `tasques.txt`?
7. Quin usuari apareix com a propietari?
8. Quin grup apareix?
9. Quina informació proporciona aquesta comanda que no proporciona `ls`?

*(Fes una captura dels permisos).*

## 9. Repte de resolució

Has d'aconseguir que l'estructura final sigui exactament aquesta:

```text
missio_linux
│
├── personal
│   ├── alumne.txt
│   └── contacte.txt
│
├── projecte
│   ├── projecte.txt
│   └── tasques.txt
│
├── copia_seguretat
│   ├── projecte_backup.txt
│   └── tasques_backup.txt
│
└── temporal
    └── prova.txt
```

> **No pots tornar a començar des de zero.** Has d'arribar a aquesta estructura partint de tot el que has fet durant les activitats anteriors.

### Quan ho aconsegueixis:
* Comprova cada directori.
* Comprova els fitxers.
* Comprova el contingut dels fitxers importants.
* Fes les captures necessàries.

## 10. Explica les teves decisions

Completa la taula amb les teves paraules:

| Situació | Comanda | Per què serveix? |
| ----- | ----- | ----- |
| Saber on sóc | | |
| Veure els fitxers | | |
| Entrar en un directori | | |
| Crear un directori | | |
| Crear un fitxer | | |
| Veure el contingut d'un fitxer | | |
| Copiar un fitxer | | |
| Moure un fitxer | | |
| Canviar el nom d'un fitxer | | |
| Eliminar un fitxer | | |
| Consultar els permisos | | |

## Reflexió final

Respon amb les teves paraules:

1. Quina ha estat la part més difícil de l'activitat?
2. Quina comanda has utilitzat més?
3. Quina comanda t'ha resultat més útil?
4. Quina operació podries fer de més d'una manera?
5. Què podria passar si executessis una comanda sense comprovar abans sobre quin fitxer o directori estàs treballant?
6. Quina diferència hi ha entre saber una comanda i saber utilitzar-la?