# Projecte 1: Gestió de processos d’un sistema operatiu

## 1. Objectiu
Conèixer de manera pràctica com un sistema operatiu gestiona els processos. L’activitat treballarà els conceptes de:

* Processos
* PID i PPID
* Estats d’un procés
* Planificació
* Concurrència
* Sincronització
* Creació i finalització de processos

## 2. Enunciat i Instruccions de Lliurament
Realitza les activitats següents utilitzant la terminal del teu ordinador amb Linux.

Per a cada activitat hauràs de:
1. **Executar** les ordres indicades.
2. **Fer una captura de pantalla** del resultat.
3. **Explicar breument** què has observat.

> **Important:** Les captures han de correspondre a les proves realitzades pel mateix alumne. No cal fer una explicació teòrica extensa: l'objectiu és experimentar i explicar què està passant.

## 3. Desenvolupament de les Activitats

### Activitat 1 – Quins processos s'estan executant?

#### Ordres a executar:
```bash
ps
ps aux
```

#### Preguntes a respondre:
* **a.** Què és un procés?
* **b.** Quina informació apareix sobre cada procés?
* **c.** Què és el PID?
* **d.** Escull dos processos de la llista i indica el seu PID i el programa que executen.

> *[Inserir captura de pantalla de `ps` i `ps aux` aquí]*

---

### Activitat 2 – Crear un procés

#### Ordres a executar:
```bash
sleep 120 &
ps -p <PID> -o pid,ppid,state,cmd
```
*(Substitueix `<PID>` pel número que t'hagi assignat el sistema en llançar el `sleep`).*

#### Preguntes a respondre:
* **a.** Quin PID té el procés?
* **b.** Quin PPID té?
* **c.** Quin estat presenta?
* **d.** Quin programa està executant?
* **e.** Per què el procés continua apareixent si nosaltres no estem fent res?

> *[Inserir captura de pantalla de la creació i consulta del PID aquí]*

### Activitat 3 – Observar un procés

#### Ordres a executar:
```bash
top
# Per sortir de top prem: q
```
*(Busca el procés `sleep` creat a l'activitat anterior).*

#### Preguntes a respondre:
* **a.** El procés està utilitzant molta CPU?
* **b.** Quanta memòria utilitza aproximadament?
* **c.** Quin estat apareix?
* **d.** Què creus que està fent el procés en aquest moment?

> *[Inserir captura de pantalla de `top` destacant el procés `sleep` aquí]*

### Activitat 4 – Procés que utilitza la CPU

#### Ordres a executar:
```bash
yes > /dev/null &
top
# Finalitza el procés en acabar:
kill <PID>
```

#### Preguntes a respondre:
* **a.** Què ha passat amb el consum de CPU?
* **b.** Per què aquest procés consumeix CPU?
* **c.** Compara'l amb el procés `sleep`.

> *[Inserir captura de pantalla de `top` mostrant el consum de `yes` i la comanda `kill` aquí]*

### Activitat 5 – Crear i finalitzar un procés

#### Ordres a executar:
```bash
sleep 300 &
ps -p <PID>
kill <PID>
ps -p <PID>
```

#### Preguntes a respondre:
* **a.** Què ha passat després d'executar `kill`?
* **b.** Per què el procés ja no apareix?
* **c.** Què significa que un procés estigui finalitzat?

> *[Inserir captura de pantalla de la seqüència de creació, comprovació, `kill` i comprovació final aquí]*

### Activitat 6 – Procés pare i procés fill

#### Ordres a executar:
* **Terminal 1:**
  ```bash
  bash -c 'sleep 60 & wait'
  ```
* **Terminal 2 (mentre s'executa l'anterior):**
  ```bash
  ps -ef --forest
  ```

#### Preguntes a respondre:
* **a.** Quin és el PID del `bash`?
* **b.** Quin és el PID del `sleep`?
* **c.** Quin és el PPID del `sleep`?
* **d.** Quin procés és el pare?
* **e.** Quin procés és el fill?

#### Esquema de relació (amb PIDs reals):
```text
Procés pare (PID: ____)
   └── Procés fill (PID: ____)
```

> *[Inserir captura de pantalla de l'arbre de processos amb `--forest` aquí]*

### Activitat 7 – Execució concurrent

#### Ordres a executar:
```bash
sleep 30 &
sleep 30 &
sleep 30 &
ps
```

#### Preguntes a respondre:
* **a.** Quants processos `sleep` hi ha?
* **b.** S'estan executant al mateix temps?
* **c.** Què significa que els processos s'executin de manera concurrent?
* **d.** Els tres processos tenen el mateix PID?

> *[Inserir captura de pantalla de la sortida de `ps` amb els tres `sleep` actius aquí]*

### Activitat 8 – Planificació

#### Ordres a executar:
```bash
yes > /dev/null &
yes > /dev/null &
yes > /dev/null &
top
# Finalitza els processos en acabar:
kill <PID1> <PID2> <PID3>
```

#### Preguntes a respondre:
* **a.** Els tres processos reben temps de CPU?
* **b.** Tots consumeixen exactament el mateix percentatge de CPU?
* **c.** Per què el sistema operatiu ha de decidir quin procés utilitza la CPU?
* **d.** Què és la planificació de processos?

> *[Inserir captura de pantalla de `top` amb els tres processos `yes` competint per la CPU aquí]*

### Activitat 9 – Sincronització

#### Ordres a executar:
```bash
rm -f resultat.txt
for i in {1..100}; do echo A >> resultat.txt; done &
for i in {1..100}; do echo B >> resultat.txt; done &

# En acabar els bucles:
wc -l resultat.txt
head -20 resultat.txt
```

#### Preguntes a respondre:
* **a.** Quantes línies esperaves trobar?
* **b.** Quantes línies hi ha realment?
* **c.** Apareixen les A i les B agrupades o barrejades?
* **d.** Per què dos processos poden interferir quan treballen sobre un mateix recurs?
* **e.** Què és la sincronització de processos?

> *[Inserir captura de pantalla dels resultats de `wc -l` i `head -20` aquí]*

### Activitat 10 – Diagrama final

A partir de les activitats realitzades, dibuixa o dissenya un diagrama propi que representi el cicle de vida d'un procés.

#### Requisits del diagrama:
* Incloure els estats: **NOU**, **PREPARAT**, **EXECUCIÓ**, **BLOQUEJAT / ESPERANT**, i **FINALITZAT**.
* Afegir fletxes que representin la transició entre estats.
* Indicar al costat de cada canvi un exemple d'ordre/situació observada durant el projecte (p. ex., execució de `sleep`, pas a `top`, execució de `kill`, etc.).

## 4. Conclusions

*(Escriu aproximadament mitja pàgina redactada amb les teves pròpies paraules, contestant de forma fluida a les preguntes següents):*

* Què és un procés?
* Quina funció té el PID?
* Quins estats pot tenir un procés?
* Per què el sistema operatiu necessita planificar els processos?
* Què significa que diversos processos s'executin concurrentment?
* Per què és necessària la sincronització?