# Projecte 3.2: Valoració coneixements

## 1. Navegació pel sistema

Et trobes en un directori qualsevol i vols saber exactament en quin directori estàs.

* **a)** Quina comanda utilitzaries?
* **b)** Ara vols veure els fitxers i directoris que hi ha dins. Quina comanda utilitzaries?
* **c)** Vols entrar en un directori anomenat `projecte`. Quina comanda utilitzaries?

## 2. Crear una estructura

Vols crear aquesta estructura:

```
empresa
├── documents
├── copies
└── temporal
```

* **a)** Escriu les comandes necessàries per crear-la.
* **b)** Explica què fa la comanda que has utilitzat per crear els directoris.
* **c)** Indica una manera de comprovar que l'estructura s'ha creat correctament.

## 3. Crear i escriure en fitxers

Dins del directori `documents` vols crear un fitxer anomenat: `informe.txt` i introduir-hi aquestes dues línies:

```
Informe del projecte
Autor: Joan
```

* **a)** Quina comanda o conjunt de comandes utilitzaries?
* **b)** Com comprovaries després el contingut del fitxer?

## 4. Entendre > i >>

Un fitxer `tasques.txt` conté:

```
Configurar servidor
Crear usuaris
Fer còpia de seguretat
```

Vols afegir al final: `Revisar permisos`

* **a)** Quina redirecció utilitzaries: `>` o `>>`?
* **b)** Escriu una comanda que permeti fer aquesta operació.
* **c)** Què passaria si utilitzessis `>` en lloc de `>>`?
* **d)** Explica amb les teves paraules la diferència entre `>` i `>>`.

## 5. Copiar o moure?

Tens:

```
documents/
└── informe.txt
```

### Situació A
El responsable vol conservar l'original i crear una còpia dins de `copies`.

* **a)** Quina operació has de fer?
* **b)** Escriu la comanda.

### Situació B
El responsable vol que `informe.txt` deixi de ser dins de `documents` i passi a `temporal`.

* **c)** Quina operació has de fer?
* **d)** Escriu la comanda.
* **e)** Explica la diferència entre les dues operacions.

## 6. Detecta l'error

Un alumne vol afegir una línia al final de `notes.txt` i executa:

```bash
echo "Revisar documentació" > notes.txt
```

Després comprova el fitxer i només apareix: `Revisar documentació`

* **a)** Quin error ha comès?
* **b)** Per què ha desaparegut el contingut anterior?
* **c)** Com hauria d'haver escrit la comanda si volia conservar el contingut anterior?

## 7. Eliminar un fitxer

Existeix el fitxer: `temporal/prova.txt`. Vols eliminar-lo.

* **a)** Quina comanda utilitzaries?
* **b)** Per què és convenient comprovar abans que estàs treballant amb el fitxer correcte?
* **c)** Què passa amb el fitxer després d'executar l'operació?

## 8. Interpretar permisos

Executant una comanda d'informació detallada obtens:

```
-rw-r--r-- 1 ferran alumnes 245 oct 7 18:30 informe.txt
```

Respon:

* **a)** És un fitxer o un directori?
* **b)** Qui és el propietari?
* **c)** Quin és el grup?
* **d)** Quins permisos té el propietari?
* **e)** Quins permisos té el grup?
* **f)** Quins permisos tenen els altres usuaris?
* **g)** Què significa la lletra `r`?
* **h)** Què significa la lletra `w`?
* **i)** Què significa la lletra `x`?

## 9. Quin és el resultat?

Comences amb:

```
projecte/
├── document.txt
└── notes.txt
```

I executes:

```bash
cp document.txt document_backup.txt
mv notes.txt temporal/
```

* **a)** Com queda el directori `projecte`?
* **b)** Què hi haurà dins de `temporal`?
* **c)** Què ha passat amb `document.txt`?
* **d)** Què ha passat amb `notes.txt`?

*(Representa l'estructura final).*

## 10. Cas pràctic de raonament

Un company t'envia aquesta informació:

> «He creat `backup.txt`, però ara necessito que sigui dins del directori `copies`. No vull tenir dues còpies del fitxer.»

Actualment tens:

```
projecte/
├── backup.txt
└── copies/
```

* **a)** Quina operació faries?
* **b)** Escriu la comanda.
* **c)** Després de fer-la, on estarà `backup.txt`?
* **d)** Existirà encara `projecte/backup.txt`?
* **e)** Per què no utilitzaries `cp`?

## 11. Pregunta final de comprensió

Explica amb les teves paraules la diferència entre: **«Saber una comanda»** i **«Saber utilitzar una comanda»**.

Posa un exemple concret relacionat amb alguna de les comandes treballades a l'activitat.