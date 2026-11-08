# Projecte 1.1: Gestió de Processos II

## 1. Objectiu
Aprofundir en la gestió dels processos d'un sistema Linux mitjançant noves ordres i situacions pràctiques. 

En aquesta activitat treballarem:
* Processos en primer i segon pla
* Gestió de treballs (*jobs*)
* Senyals
* Prioritat dels processos
* Informació del sistema de fitxers `/proc`
* Processos orfes i processos zombies
* Filtratge i ordenació de processos
* Automatització mitjançant *scripts* Bash

## 2. Enunciat i Instruccions de Lliurament
Realitza les activitats següents utilitzant la terminal del teu ordinador amb Linux.

Per a cada activitat hauràs de:
1. **Executar** les ordres indicades.
2. **Fer una captura de pantalla** del resultat.
3. **Explicar breument** què has observat.

> **Important:** Les captures han de correspondre a les proves realitzades pel mateix alumne. No cal fer una explicació teòrica extensa: l'objectiu és experimentar i entendre què està passant.

## 3. Desenvolupament de les Activitats

### Activitat 1 – Treballs en segon pla

#### Ordres a executar:
```bash
sleep 120 &
jobs

# Crea dos processos més:
sleep 180 &
sleep 240 &
jobs
```

#### Preguntes a respondre:
* **a.** Quants treballs apareixen?
* **b.** Quin número de treball (*job*) té cadascun?
* **c.** Què significa el símbol `&`?
* **d.** Quina diferència hi ha entre un *job* i un PID?

> *[Inserir captura de pantalla de la sortida de `jobs` aquí]*

### Activitat 2 – Primer pla i segon pla

#### Ordres a executar:
```bash
sleep 120
# Mentre s'està executant, prem: Ctrl + Z

jobs
bg
jobs
fg
```

#### Preguntes a respondre:
* **a.** Què ha fet `Ctrl + Z`?
* **b.** Què fa `bg`?
* **c.** Què fa `fg`?
* **d.** En quin estat es trobava el treball abans de `bg`?
* **e.** Quina diferència hi ha entre primer pla i segon pla?

> *[Inserir captures de pantalla del procés aturat i reactivat amb `bg`/`fg` aquí]*

---

### Activitat 3 – Buscar processos

#### Ordres a executar:
```bash
ps aux
ps aux | grep firefox
# (Si Firefox no està instal·lat o actiu, utilitza un altre programa com 'bash' o 'sleep')

ps aux | grep bash
```

#### Preguntes a respondre:
* **a.** Per a què serveix `grep` en aquestes ordres?
* **b.** Quina diferència hi ha entre mostrar tots els processos i filtrar-los?
* **c.** Quants processos relacionats amb `bash` apareixen?
* **d.** Quina informació pots obtenir de cada procés?

> *[Inserir captura de pantalla dels filtres amb `grep` aquí]*

### Activitat 4 – Ordenar els processos

#### Ordres a executar:
```bash
ps aux --sort=-%cpu
# Observa els primers processos de la llista

ps aux --sort=-%mem
```

#### Preguntes a respondre:
* **a.** Què està ordenant la primera ordre?
* **b.** Què està ordenant la segona?
* **c.** Quin procés utilitza més CPU?
* **d.** Quin procés utilitza més memòria?
* **e.** El procés que més CPU utilitza és necessàriament el que més memòria utilitza?

> *[Inserir captura de pantalla de cada ordre d'ordenació aquí]*

### Activitat 5 – Prioritat d'un procés

#### Ordres a executar:
```bash
yes > /dev/null &
# Identifica el seu PID i consulta la seva prioritat:
ps -p <PID> -o pid,ni,pri,cmd

# Crea un altre procés amb una prioritat diferent:
nice -n 10 yes > /dev/null &
# Consulta la informació de tots dos processos:
ps -p <PID1>,<PID2> -o pid,ni,pri,cmd

# Finalitza els dos processos en acabar:
kill <PID1> <PID2>
```

#### Preguntes a respondre:
* **a.** Quin valor `NI` té el primer procés?
* **b.** Quin valor `NI` té el segon?
* **c.** Quin procés té una prioritat diferent?
* **d.** Què significa `NI`?
* **e.** Per què pot ser útil modificar la prioritat d'un procés?

> *[Inserir captura de pantalla dels valors de `NI` i `PRI` aquí]*

### Activitat 6 – Els senyals

#### Ordres a executar:
```bash
sleep 300 &
# Identifica el seu PID i executa:
kill -STOP <PID>
ps -p <PID> -o pid,state,cmd

kill -CONT <PID>
ps -p <PID> -o pid,state,cmd

kill <PID>
```

#### Preguntes a respondre:
* **a.** Què fa `SIGSTOP`?
* **b.** Què fa `SIGCONT`?
* **c.** Què passa quan executes `kill <PID>`?
* **d.** Quina diferència hi ha entre aturar un procés i finalitzar-lo?

> *[Inserir captura de pantalla dels canvis d'estat del senyal aquí]*

### Activitat 7 – La informació de `/proc`

#### Ordres a executar:
```bash
sleep 300 &
# Identifica el seu PID real i executa:
ls /proc/<PID>

# Consulta el fitxer status:
cat /proc/<PID>/status
```

#### Preguntes a respondre:
* **a.** Quina informació apareix a `status`?
* **b.** Quin és el nom del procés?
* **c.** Quin és el seu PID?
* **d.** Quin és el seu PPID?
* **e.** Quin usuari està executant el procés?
* **f.** Per què diem que `/proc` és un sistema de fitxers virtual?

> *[Inserir captura de pantalla de la sortida de `cat /proc/<PID>/status` aquí]*

### Activitat 8 – Què passa quan desapareix el procés pare?

#### Ordres a executar:
```bash
bash -c 'sleep 120 &'
# Immediatament, en una altra terminal, busca el procés sleep i consulta el seu PID i PPID:
ps -ef | grep sleep

# Espera uns segons (a que el bash pare finalitzi) i torna a consultar-lo:
ps -ef | grep sleep
```

#### Preguntes a respondre:
* **a.** Quin era el PPID inicial del `sleep`?
* **b.** Ha canviat el seu PPID?
* **c.** Si ha canviat, per què creus que ha passat?
* **d.** Què és un procés orfe?
* **e.** Qui passa a adoptar un procés quan el seu pare desapareix?

> *[Inserir captures de pantalla del canvi de PPID del procés orfe aquí]*

### Activitat 9 – Processos zombies

#### Ordres a executar:
```bash
bash -c 'exit 0' &
ps -ef

# Crear un procés zombie amb un script:
nano zombie.sh
```

Afegeix el contingut següent al fitxer `zombie.sh`:
```bash
#!/bin/bash
(exit 0) &
echo "PID del fill: $!"
sleep 60
```

Guarda el fitxer, dona-li permisos i executa'l:
```bash
chmod +x zombie.sh
./zombie.sh

# Mentre s'està executant, obre una altra terminal i consulta:
ps -ef | grep zombie
```

#### Preguntes a respondre:
* **a.** Què és un procés zombie?
* **b.** Quin estat presenta un procés zombie?
* **c.** Per què pot quedar un procés en aquest estat?
* **d.** Quin procés és el pare del zombie?
* **e.** Què passa quan el pare finalitza?

> *[Inserir captura de pantalla on es pugui identificar el procés zombie aquí]*

### Activitat 10 – Automatitzar la informació dels processos

Crea un script anomenat `processos.sh` que mostri una taula amb el format següent dels processos en execució:

#### Exemple de sortida desitjada:
```text
PID     PPID    ESTAT   USUARI  COMANDA
------------------------------------------------
1234    1000    S       alumne  bash
1250    1234    S       alumne  firefox
...
```

#### Preguntes a respondre:
* **a.** Quines ordres has utilitzat dins de l'script?
* **b.** Quina informació obtens de cada procés?
* **c.** Què ha estat més difícil de construir?
* **d.** Per què pot ser útil automatitzar aquesta consulta amb un script?

> *[Inserir el codi de l'script i una captura de la seva execució aquí]*

## 4. Repte Final – Gestor de Processos

Crea un script anomenat `gestor.sh` que mostri un menú interactiu per a l'usuari:

```text
GESTOR DE PROCESSOS
1. Mostrar processos
2. Mostrar processos que consumeixen més CPU
3. Mostrar processos que consumeixen més memòria
4. Sortir
```

#### Requisits i Objectiu:
* L'usuari ha de poder escollir una opció del menú.
* No cal que el programa sigui perfecte ni que controli errors complexos.
* **Objectiu:** Utilitzar en un únic programa conceptes com `ps`, `grep`, ordenació, PIDs, processos i *scripts* Bash.

> *[Inserir el codi de `gestor.sh` i una captura de pantalla del menú en funcionament aquí]*

## 5. Conclusions

*(Escriu aproximadament mitja pàgina redactada amb les teves pròpies paraules, contestant de forma fluida a les preguntes següents):*

* Què és un *job*?
* Quina diferència hi ha entre primer pla i segon pla?
* Per a què serveixen els senyals?
* Què és la prioritat d'un procés?
* Quina informació podem trobar a `/proc`?
* Què és un procés orfe?
* Què és un procés zombie?
* Per què és útil automatitzar tasques relacionades amb processos?