# Projecte 2: Gestió de memòria d’un SO

## 1. Objectiu
Investigar com el sistema operatiu gestiona la memòria a partir d'observacions i mesures realitzades sobre el propi ordinador.

> **Nota:** No es tracta de buscar informació i copiar-la. Les conclusions s'han de basar en les dades obtingudes durant les proves realitzades per l'alumne.

## 2. Desenvolupament de les activitats

### ACTIVITAT 1 · Fotografia inicial del sistema

#### Ordres a executar:
```bash
free -h
cat /proc/meminfo
```

D'aquesta execució s'ha d'obtenir:
* Memòria RAM total
* Memòria utilitzada
* Memòria disponible
* Memòria lliure
* Memòria de *swap* (si n'hi ha)

> *[Inserir dues captures de pantalla aquí]*

#### Respon:
1. Quanta RAM té el teu ordinador?
2. Quanta memòria està disponible?
3. El teu ordinador utilitza *swap*?
4. Quina diferència hi ha entre RAM i *swap*?

### ACTIVITAT 2 · Quins programes utilitzen la memòria?

#### Ordres a executar:
```bash
top
```
*Prem `Shift + M` dins de `top` per ordenar els processos per consum de memòria.*

#### Selecció de 5 processos diferents:

| Procés | PID | %MEM | RES | VIRT |
| :---: | :---: | :---: | :---: | :---: |
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |
| 4 | | | | |
| 5 | | | | |

> *[Inserir captura de pantalla on es puguin veure aquests processos a `top`]*

#### Investiga:
*Per a cada procés, explica breument què és i per a què serveix (explicació específica dels 5 processos trobats al teu ordinador):*
* **Procés 1:**
* **Procés 2:**
* **Procés 3:**
* **Procés 4:**
* **Procés 5:**

### ACTIVITAT 3 · Què passa quan obrim programes?

#### Procediment:
1. Comença executant: `free -h` (Anota els valors inicials).
2. Obre un navegador web i carrega 3 pàgines diferents.
3. Torna a executar: `free -h` (Anota els valors).
4. Obre un segon programa (per exemple, LibreOffice Writer).
5. Torna a executar: `free -h` (Anota els valors).
6. Tanca els programes i torna a executar: `free -h` (Anota els valors finals).

#### Taula de seguiment:

| Situació | Memòria disponible | Memòria utilitzada |
| :---: | :---: | :---: |
| Abans d'obrir programes | | |
| Navegador obert | | |
| Navegador + Writer | | |
| Programes tancats | | |

#### Explica:
* Què ha canviat?
* La memòria ha tornat exactament al mateix valor inicial des de la situació de programes tancats?
* Per què creus que passa?

### ACTIVITAT 4 · Investiguem un procés

Escull un dels processos identificats a l'Activitat 2.

#### Ordres a executar:
```bash
ps -p PID -o pid,ppid,cmd,%mem,rss,vsz
pmap PID
```
*(Substitueix `PID` pel PID real del procés triat).*

#### Respon:
1. Quin procés has escollit?
2. Quin PID té?
3. Quin PPID té?
4. Quanta memòria resident utilitza (`rss`)?
5. Quina memòria virtual té (`vsz`)?
6. Quina informació proporciona la comanda `pmap`?

> *[Inserir captura de pantalla de la sortida de `pmap`]*

### ACTIVITAT 5 · Paginació

#### Ordres a executar:
```bash
getconf PAGE_SIZE
```

#### Respon:
1. Quina mida té una pàgina de memòria en el teu sistema (en bytes)?
2. Què és una pàgina de memòria?
3. Per què els sistemes operatius divideixen la memòria en pàgines?
4. Quina relació hi ha entre les pàgines i la memòria virtual?

#### Petit càlcul:
* Suposa que un programa necessita **1 MB** ($1.048.576\text{ bytes}$) de memòria.
* Calcula aproximadament quantes pàgines necessita el programa utilitzant la mida de pàgina del teu sistema.
* **Mostra els càlculs passats a net aquí:**
  $$\text{Nombre de pàgines} = \frac{\text{Mida total (bytes)}}{\text{Mida de pàgina (bytes)}}$$

### ACTIVITAT 6 · Memòria virtual

#### Ordres a executar:
```bash
free -h
swapon --show
```

#### Respon:
1. El teu sistema disposa de *swap*? Quina capacitat té?
2. Quina diferència hi ha entre la memòria RAM i la memòria de *swap*?
3. Per què un sistema operatiu utilitza la memòria virtual?

> **Nota:** No cal provocar una situació de falta de memòria. L'objectiu és observar la configuració real del sistema.

### ACTIVITAT 7 · Abans i després

Escull un programa que utilitzis habitualment (navegador, LibreOffice, reproductor multimèdia, editor de codi, etc.).

#### Seqüència d'execució:
1. Comprova la memòria abans d'obrir-lo: `free -h`
2. Obre el programa.
3. Busca el procés amb: `top`
4. Anota el seu consum de memòria.
5. Utilitza el programa durant 5 minuts.
6. Torna a comprovar-ne el consum.
7. Tanca el programa.
8. Torna a executar: `free -h`

#### Taula de mesura:

| Moment | Memòria disponible | Memòria del programa |
| :--- | :--- | :--- |
| Abans d'obrir-lo | | |
| Just després d'obrir-lo | | |
| Després de 5 minuts d'ús | | |
| Després de tancar-lo | | |

#### Explica:
* Què ha passat amb la memòria durant l'experiment?

### ACTIVITAT 8 · Particions, segmentació i paginació

*Explica amb les teves paraules:*

* **a) Particions:** Què significa dividir la memòria en particions?
* **b) Segmentació:** Què significa dividir l'espai d'adreces en segments?
* **c) Paginació:** Què significa dividir la memòria en pàgines?

#### Comparació teòrica:

| Tècnica | Com divideix la memòria? | Avantatge | Inconvenient |
| :---: | :---: | :---: | :---: |
| **Particions** | | | |
| **Segmentació** | | | |
| **Paginació** | | | |

### ACTIVITAT 9 · Investigació final

Escull un procés diferent del de l'Activitat 7.

#### Ordres a executar:
```bash
ps
pmap PID
cat /proc/PID/status
```

Selecciona **5 dades diferents** que consideris interessants (p. ex., memòria, PID, PPID, nombre de fils, estat, memòria virtual, memòria resident, etc.).

#### Fitxa del procés:
* **Nom del procés:**
* **PID:**
* **PPID:**

| Dada | Valor | Què significa? |
| :---: | :---: | :---: |
| 1. | | |
| 2. | | |
| 3. | | |
| 4. | | |
| 5. | | |

> *[Inserir almenys dues captures de pantalla]*

## 3. ACTIVITAT 10 · Conclusions

*(Redacta una conclusió d'aproximadament una pàgina explicant què has descobert durant les proves. Fes referència a les dades obtingudes durant els experiments).*

**Aconselat abordar els següents punts:**
* Com gestiona la memòria el teu sistema.
* Quins programes consumeixen més memòria.
* Què passa quan obres i tanques aplicacions.
* Què és la memòria virtual.
* Què és la paginació.
* Quina diferència hi ha entre particions, segmentació i paginació.
* Quina prova t'ha resultat més interessant i per què.