# El sistema operatiu

Un sistema operatiu (SO) és el conjunt de programes informàtics de sistema que gestiona els recursos de maquinari (com la CPU, la memòria i els dispositius d'entrada/sortida) i proveeix serveis als programes d'aplicació, actuant com a intermediari entre l'usuari i la màquina. Com a curiositat, un [article](https://www.xataka.com/basics/que-significa-que-mi-cpu-sea-de-32-o-64-bits-y-cual-es-la-diferencia) que us explica la diferència entre x32 i x64 d'una CPU.

## Concepte de procés

La informació pertinent s'ha extret del [PDF](./a1-bloc2-gestio-processos.pdf) del moodle i del [vídeo](https://www.youtube.com/watch?v=V4--MPYajUk) **no actual** sobre el mateix tema.

### Definició
- Programa: Entitat passiva. Conjunt d'instruccions emmagatzemades en un mitjà d'emmagatzematge (disc) o memòria sense executar-se.
- Procés: Entitat activa. És un programa en curs d'execució al qual el Sistema Operatiu (SO) ha assignat recursos (CPU, memòria, fitxers i dispositius d'E/S).

Inneficiència de l'E/S: Els temps d'accés als perifèrics (discs, xarxa, impressores) són entre 7 i 8 ordres de magnitud més lents que els temps de cicle de la CPU. Per això, el SO necessita gestionar els processos de forma eficient per no tenir la CPU inactiva.

```
┌──────────────────────────────────────────────────────────┐
│              Estructura de Memòria d'un Procés           │
├──────────────────────────────────────────────────────────┤
│  Pila (Stack)      → Dades temporals, crides a funcions  │
│  Lliure / Heap     → Memòria dinàmica                    │
│  Dades (Data)      → Variables globals i estàtiques      │
│  Codi (Text)       → Instruccions del programa (PC)      │
└──────────────────────────────────────────────────────────┘
```

### Fils d'execució (Threads)
Un procés pot contenir múltiples fils d'execució (processos lleugers).
- **Compartit**: Comparteixen l'espai de memòria, les variables globals i els fitxers oberts del procés pare.
- **Propi**: Cada fil té el seu propi Comptador de Programa (PC), registres de CPU i pila.

Exemple: Dins d'un processador de text, un fil gestiona l'escriptura de l'usuari i un altre passa el corrector ortogràfic en segon pla.

## Modes d'execució, arquitectures i memòria

### Evolució del Processament
- **Monoprogramació**: Només hi ha un procés en memòria. Quan el procés espera una operació d'E/S, la CPU queda inactiva.
- **Multiprogramació**: Diversos processos resideixen en memòria simultàniament. Quan un es bloqueja per E/S, la CPU passa a executar-ne un altre, aconseguint execució concurrent i alt aprofitament.
- **Temps Compartit (Time-Sharing)**: Evolució de la multiprogramació on s'assigna una ranura o quantum de temps (ex. 20 ms) a cada procés per donar la il·lusió que tots s'executen alhora (ideal per a entorns interactius).
- **Processament per Lots (Batch)**: Els treballs s'agrupen i s'executen seqüencialment sense interacció de l'usuari.

### Tipus de Sistemes i Arquitectures
- **Sistemes de temps real**: Rerequereixen temps de resposta deterministes i immediats. Exemple: En un vehicle, la màxima prioritat la té el disparament de l'airbag, seguida dels frens ABS, el navegador i el climatitzador.
- **Processament de transaccions**: Enfocat a operacions atòmiques (tot o res). Si falla una transacció bancària a meitat de camí, es reverteixen tots els canvis (rollback).
- **Multiprocessament (múltiples CPUs/nuclis)**:
  - Asimètric: Un processador principal (mestre) planifica i distribueix la feina als altres (esclaus).
  - **Simètric (SMP)**: Tots els processadors comparteixen memòria i tenen capacitat per planificar-se de manera autònoma.

## Cicle de vida, estats i PCB

### Bloc de Control del Procés (PCB / BCP)
L'estructura de dades central on el SO guarda la informació d'un procés:
- **PID (Process ID)**: Identificador únic.
- **Estat del procés**: Nou, Preparat, Execució, Bloquejat, Finalitzat, Suspès.
- **Comptador de Programa (PC) i Registres**: Estat exacte de la CPU quan el procés s'atura.
- **Informació de Planificació**: Prioritats, cues, algorismes.
- **Gestió de Memòria i E/S**: Taules de pàgines, fitxers oberts i dispositius assignats.

### Diagrama d'Estats del Procés
```
┌──────────┐      Admès      ┌──────────┐   Planificat   ┌──────────┐
│   NOU    ├────────────────►│ PREPARAT ├───────────────►│ EXECUCIÓ │
└──────────┘                 └▲─────────┘                └┬────────┬┘
                              │   │                       │        │ Finalitzat
                              │   └──────── Quantum ──────┘        ▼
                       E/S acabada   (Expulsió / Interrupció)  ┌────────────┐
                              │                                │ FINALITZAT │
                           ┌──┴─────────┐                      └────────────┘
                           │ BLOQUEJAT  │◄── Esdeveniment/E/S
                           └────────────┘
```

### Descripció dels estats
1. **Nou (New):** El procés s'està creant.
2. **Preparat (Ready):** El procés està a la memòria principal esperant que el planificador li assigni temps de CPU.
3. **Execució (Running):** Les instruccions del procés s'estan executant a la CPU.
4. **En espera / Bloquejat (Waiting/Blocked):** El procés no pot executar-se fins que es produeixi un esdeveniment extern (per exemple, una operació d'E/S o recepció d'un senyal).
5. **Finalitzat (Terminated):** El procés ha acabat la seva execució i el SO n'allibera els recursos.

- **Canvi de Context (Context Switch)**: Procés pel qual el SO desa l'estat d'execució d'un procés al seu PCB i carrega l'estat d'un altre per executar-lo. Aquest canvi genera una sobrecàrrega (overhead) de temps on la CPU no fa treball útil.
- **Swapping (Intercanvi)**: Quan la memòria RAM s'omple, el planificador a mig termini mou processos bloquejats o preparats al disc (memòria secundària) i els torna a carregar quan hi ha espai (rollout / rollin).

## Planificació de la COU (Scheduling)

### Nivells de planificació
1. **Llarg Termini (Job Scheduler)**: Controla el grau de multiprogramació decidint quins processos passen del disc a la memòria RAM.
2. **Mig Termini**: Gestiona l'intercanvi (swapping) de processos entre la RAM i el disc.
3. **Curt Termini (CPU Scheduler)**: Tria quina dels processos preparats en RAM s'executarà immediatament a la CPU.

### Mètriques de Rendiment
- **Utilització de CPU**: Percentatge de temps que la CPU està treballant (objectiu: maximitzar).
- **Rendiment (Throughput)**: Nombre de processos completats per unitat de temps.
- **Temps de Retorn (Turnaround Time)**: Temps total des que s'envia un procés fins que acaba.
- **Temps d'Espera (Waiting Time)**: Temps total passat a la cua de preparats.
- **Temps de Resposta (Response Time)**: Temps des que s'envia una sol·licitud fins a la primera resposta.

### Tipus d'Estratègies
- **No Apropiativa (Non-Preemptive)**: Un cop el procés agafa la CPU, no la deixa fins que acaba o es bloqueja voluntàriament per E/S. Un procés pot ser "usurer" i monopolitzar la CPU.
- **Apropiativa / Expulsiva (Preemptive)**: El SO pot retirar la CPU a un procés en qualsevol moment per assignar-la a un altre (per exemple, si s'exgota el quantum o arriba un procés més prioritari).

## Algorismes de planificació principals

### FCFS (First-Come, First-Served)
* **Tipus:** No apropiatiu.
* **Funcionament:** Els processos s'atenen en l'ordre estricte d'arribada (cua FIFO).
* **Inconvenient:** Efecte *convoy* (si arriba un procés llarg primer, tots els altres breus s'han d'esperar molt de temps, augmentant el temps mitjà d'espera).

### SJF (Shortest Job First)
* **Tipus:** No apropiatiu o Apropiatiu (SRTF - Shortest Remaining Time First).
* **Funcionament:** Assigna la CPU al procés amb la ràfega de CPU més curta.
* **Avantatge:** És l'algorisme òptim per minimitzar el temps mitjà d'espera.
* **Inconvenient:** És difícil conèixer la durada de la següent ràfega i pot produir **inanició** en processos llargs.

### Round Robin (RR)
* **Tipus:** Apropiatiu.
* **Funcionament:** Dissenyat per a sistemes de temps compartit. Assigna a cada procés un temps màxim d'execució contínua anomenat **quantum** ($Q$). Si el procés no acaba abans que expiri el $Q$, s'interromp i es posa al final de la cua de preparats.
* **Clau d'eficiència:**
  * Si el quantum és molt gran $\to$ es comporta com FCFS.
  * Si el quantum és molt petit $\to$ es produeixen massa canvis de context (ineficiència).

### Planificació per prioritats
* **Tipus:** Apropiatiu o No apropiatiu.
* **Funcionament:** S'assigna un valor numèric de prioritat a cada procés i la CPU s'entrega al de major prioritat.
* **Inconvenient:** Inanició de processos de baixa prioritat.
* **Solució:** **Envelliment** (*Aging*), tècnica que augmenta gradualment la prioritat dels processos que porten molt de temps esperant.

## Gestió de processos en sistemes operatius reals

### Linux (CLI)

* **`ps`**: Mostra l'estat dels processos actuals.
  * `ps aux` : Mostra tots els processos del sistema detalladament.
  * `ps -ef` : Mostra la jerarquia de processos amb PID i PPID.
* **`top`**: Monitoritza en temps real l'ús de CPU, memòria i processos interactivament.
* **`htop`**: Versió millorada i interactiva de `top` (amb colors, barres visuals i opcions de cerca/filtraje).
* **`kill`**: Envia senyals als processos (per defecte SIGTERM = 15).
  * `kill <PID>` : Finalització amigable.
  * `kill -9 <PID>` : Força la finalització immediata (SIGKILL).
* **`nice` / `renice`**:
  * `nice -n <valor> <comanda>` : Executa un procés establint una prioritat inicial (de -20 [màxima] a 19 [mínima]).
  * `renice -n <valor> -p <PID>` : Modifica la prioritat d'un procés ja en execució.

### Windows

* **Administrador de Tasques (Task Manager):** Eina gràfica (`Ctrl + Shift + Esc`) per monitorar la CPU, RAM, xarxa i finalitzar tasques.
* **`tasklist`**: Comanda de CMD/PowerShell que llista tots els processos actius amb el seu PID i ús de memòria.
* **`taskkill`**: Finalitza un o més processos des de la línia de comandes.
  * `taskkill /PID <PID>` : Tanca un procés pel seu PID.
  * `taskkill /F /IM notepad.exe` : Força (`/F`) la tancada de tots els processos amb el nom d'imatge especificat.
* **PowerShell:**
  * `Get-Process` (àlies `ps`): Obté la llista de processos interactius i de sistema.
  * `Stop-Process -Id <PID>` o `Stop-Process -Name "<nom>"`: Atura un o diversos processos actius.



## Concurrència entre processos

La [concurrència](./a1-bloc2-concurrencia-processos.pdf) és la capacitat d'un sistema operatiu per executar de manera simultània o intercalada múltiples processos que comparteixen recursos. Aquest document analitza en profunditat els problemes derivats de l'execució concurrent i els diferents mecanismes de sincronització i comunicació dissenyats per evitar inconsistències en les dades i interbloquejos.

## Processament concurrent

### Model de computació i justificació
La concurrència es pot manifestar en diferents arquitectures de fons:
1. **Multiprogramació en un únic processador:** La CPU intercala l'execució de diversos processos mitjançant canvis de context. En un moment donat, només un procés s'està executant realment, però la velocitat d'alternança crea la il·lusió de simultaneïtat.
2. **Multiprocessador:** Diverses CPUs o nuclis permeten la superposició real i simultània del temps d'execució dels processos.
3. **Multicomputador:** Sistemes distribuïts on la concurrència s'estén a través de múltiples nodes independents connectats per xarxa.

Les raons principals per habilitar l'execució concurrent són l'aprofitament màxim dels recursos físics i lògics (evitant que la CPU quedi inactiva mentre s'esperen operacions d'E/S) i la millora de l'eficiència i modularitat en el desenvolupament de programari complex.

### Classificació de processos concurrents
* **Processos Independents:** S'executen sense interaccionar amb cap altre procés. L'execució d'un no afecta ni es veu afectada per la dels altres.
* **Processos Cooperants:** Comparteixen informació o recursos de memòria. Requereixen mecanismes de sincronització explicitats pel sistema operatiu per evitar que les operacions s'intercalin de forma no desitjada i generin inconsistències en les dades compartides.

## El Problema de la secció crítica

### Plantejament del problema
Quan dos o més processos competeixen per accedir a dades compartides, la secció de codi on es modifica aquesta informació s'anomena **Secció Crítica (SC)**. Si més d'un procés executa la seva secció crítica al mateix temps, es pot produir una *condició de carrera* (*race condition*), deixant les dades en un estat corromput o impredictible. Per evitar-ho, el sistema ha de controlar l'accés afegint un protocol d'entrada i de sortida al voltant de la secció crítica.

### Requisits d'una Ssolució vàlida
Qualsevol mecanisme que solucioni el problema de la secció crítica ha de satisfer obligatòriament tres condicions:
1. **Exclusió Mutua (*Mutual Exclusion*):** Només un procés pot estar executant la seva secció crítica en un moment donat.
2. **Progrés (*Progress*):** Si cap procés està a la secció crítica i n'hi ha que volen entrar-hi, només aquells processos que no estan executant el seu codi restant poden participar en la decisió de quin procés entrarà a continuació. Un procés fora de la SC no pot bloquejar l'accés als altres.
3. **Espera Limitada (*Bounded Waiting*):** Hi ha d'haver un límit en el nombre de vegades que es permet que altres processos entrin a la seva secció crítica des que un procés fa una sol·licitud d'entrada fins que se li concedeix el permís. Això evita la **inanició** (*starvation*).

## Semàforos

### Definició i funcionament
Un semàfor és un mecanisme d'abstracció proposat per Dijkstra. Es tracta d'una estructura de dades composta per un valor enter i una cua de processos bloquejats. Només es pot manipular mitjançant tres operacions atòmiques (que no poden ser interrompudes):

1. **Inicialització:** Estableix el valor inicial del comptador (representa el nombre de recursos disponibles).
2. **`wait(S)` (o `P(S)` / `sem_wait`):** Decrementa el valor del semàfor (`S.valor--`). Si el resultat és negatiu, el procés que ha invocat la funció es bloqueja i s'afageix a la llista d'espera del semàfor.
3. **`signal(S)` (o `V(S)` / `sem_post`):** Incrementa el valor del semàfor (`S.valor++`). Si el valor resultant és menor o igual a zero, extreu un procés bloquejat de la cua i el passa a l'estat de preparat.

### Implementació sense espera activa
En lloc de consumir cicles de CPU fent comprovacions contínues (espera activa / *busy waiting*), la implementació moderna dels semàforos utilitza les crides del sistema operatiu per bloquejar el procés i cedir el processador a un altre fil d'execució fins que es produeixi el senyal de desbloqueig.

### Semàfors en l'estàndard POSIX
POSIX defineix el tipus `sem_t` i ofereix dos enfocaments:
* **Semàfors sense nom (`sem_init`):** S'utilitzen principalment per sincronitzar fils (*threads*) d'un mateix procés o processos relacionats que hereden la memòria per `fork()`.
* **Semàfors amb nom:** Identificats al sistema de fitxers, permeten la sincronització entre processos no emparentats.

## Mutex i variables de condició

### Mutex (*Mutual Exclusion Lock*)
Un **Mutex** és un semàfor binari optimitzat per a l'accés exclusiu a recursos en entorns de programació amb fils. Té dos estats: bloquejat (*locked*) i desblocat (*unlocked*). 

* **Diferència clau amb els semàfors:** L'operació de desblocatge (`unlock`) l'ha d'executar obligatòriament el mateix fil que va adquirir el bloqueig (`lock`).

### Variables de condició
Són eines de sincronització que s'utilitzen **sempre en combinació amb un Mutex**. Permeten que un fil s'adormi completament mentre espera que es compleixi un determinat estat lògic en el programa, alliberant el Mutex de manera atòmica per no bloquejar els altres fils.

* **`wait(cond, mutex)`:** Libera el Mutex d'immediat i suspèn el fil fins que rep una senyal. Quan es desperta, re-adquireix automàticament el Mutex abans de continuar.
* **`signal(cond)`:** Desperta almenys un dels fils bloquejats a la variable de condició. Si no hi ha cap fil esperant, el senyal es perd (a diferència dels semàfors, no té memòria).
* **`broadcast(cond)`:** Desperta **tots** els fils que estaven esperant la condició.

## Senyals en sistemes operatius (POSIX)

### Definició i processament
Un senyal és un mecanisme d'interrupció software enviat a un procés per notificar-li un esdeveniment asíncron. Poden ser generats per:
* **Errors del propi procés:** Com una divisió per zero (`SIGFPE`) o un accés invàlid a memòria (`SIGSEGV`).
* **Esdeveniments externs:** Sol·licitud de l'usuari des del terminal (`SIGINT` via Ctrl+C, `SIGTSTP` via Ctrl+Z) o accions d'altres processos (`SIGTERM`, `SIGKILL`).

### Reacció d'un procés davant un senyal
Quan un procés rep un senyal, pot actuar de tres maneres:
1. Executar l'**acció per defecte** definida pel sistema (acostuma a ser la finalització del procés o la parada temporitzada).
2. **Ignorar** el senyal (descartar-lo).
3. **Capturar el senyal (Armar el senyal):** Assignar una funció pròpia (rutina de tractament o *signal handler*) que s'executarà de forma interrompuda quan arribi el senyal.

> **Excepció important:** Els senyals `SIGKILL` (finalització forçada) i `SIGSTOP` (aturada forçada) no es poden ignorar ni capturar per cap manejador de programari.

## Pas de missatges

El pas de missatges és un mecanisme de comunicació i sincronització que no requereix memòria compartida, essent ideal per a entorns distribuïts i arquitectures de micronucli.

### Primitives bàsiques
Es fonamenta en dues operacions principals gestionades pel nucli:
* `send(destí, missatge)`
* `receive(origen, missatge)`

### Característiques i tipus de sincronització
* **Nominació Directa vs. Indirecta:** A la directa s'especifica clarament el PID del procés font/destí. A l'indirecta els missatges s'envien a bústies o canals intermediate (*mailboxes/ports*).
* **Capacitat de l'Enllaç:** Pot ser nula (sense memòria intermèdia), finita o infinita.
* **Tècnica Rendezvous (Cita):** Quan la capacitat de l'enllaç és zero i les operacions `send` i `receive` són bloquejants, l'emissor o el receptor es bloquejaran mútuament fins que tots dos estiguin en el mateix punt de comunicació. La transferència de dades es fa directament de memòria a memòria.

### Cas d'estudi: El micronucli MINIX
En sistemes com MINIX, tota l'arquitectura del SO es basa en el pas de missatges amb la tècnica *rendezvous*. Les crides al sistema (com llegir o escriure un fitxer) no són funcions directes del nucli, sinó missatges enviats des del procés d'usuari cap als servidors de fitxers (`FS`) o memòria (`MM`). Fins i tot les interrupcions de hardware es tradueixen internament en missatges generats per tasques especials.

## Monitors

### Concepte i avantatges sobre els semàfors
Tot i ser molt potents, els semàfors són estructures de baix nivell propenses a errors humans greus, com el **bloqueig mutu** (*deadlock*) si les operacions `wait` i `signal` s'ordenen malament.

Un **Monitor** és un mecanisme de sincronització d'alt nivell integrat en el propi llenguatge de programació (com Java o Concurrent Pascal). Encapsula les dades compartides, les estructures i els procediments en un únic mòdul.

### Exclusió mútua automàtica
El compilador garanteix automàticament que **només un procés pot estar actiu executant un procediment dins del monitor** en un moment donat. Si un altre procés intenta entrar-hi mentre està ocupat, el sistema el posa en una cua d'ingrés sense que el programador hagi d'escriure codi explicit d'exclusió mútua.

Per gestionar la sincronització interna utilitzen variables de tipus `condition` amb dues operacions bàsiques: `delay()` (per posar el procés en espera) i `resume()` (per reactivar un procés adormit).

## Concurrència en sistemes operatius reals

### Windows (NT / 2000 / XP)
Windows utilitza un enfocament basat en **Objectes de Sincronització**. Qualsevol objecte del sistema (processos, fils, fitxers, esdeveniments, semàfors, mutants) pot estar en dos estats:
* **Marcat (*signaled*):** L'objecte està disponible o ha finalitzat el seu esdeveniment.
* **No marcat (*nonsignaled*):** L'objecte està ocupat o en procés.

Un fil es pot bloquejar esperant que un objecte passi a l'estat *marcat*. Quan això passa, el nucli de Windows allibera automàticament un o tots els fils bloquejats en aquell objecte.

### Comparativa de mecanismes de concurrència
| Mecanisme | Àmbit Principal | Exclusió Mútua | Gestió de Memòria |
| :--- | :--- | :--- | :--- |
| **Semàfors** | Processos / Fils | Manual (`wait`/`signal`) | Memòria compartida |
| **Mutex / Var. Condició** | Fils (Threads) | Manual (`lock`/`unlock`) | Espai d'adreçament comú |
| **Monitors** | Processos / Fils | Automàtica (Compilador) | Tipus abstracte de dades |
| **Pas de Missatges** | Processos / Xarxa | Implícita en la recepció | Copia de missatges (Sense memòria compartida) |
| **Senyals** | Processos (Unix) | Asíncrona (Interrupció) | Notificació d'esdeveniments |

## Gestió i monitoratge de processos a Linux
Aquesta guia complementa la teoria de sistemes operatius mostrant com analitzar, crear, administrar i finalitzar processos directament des d'una terminal de Linux (CLI), així com comprovar el seu cicle de vida i comportament concurrent.

## 1. Identificació i inspecció de processos
Cada procés en execució al sistema té un identificador únic conegut com a **PID** (*Process ID*) i un identificador del procés que l'ha creat, el **PPID** (*Parent Process ID*).

### La comanda `ps` (Process Status)
Permet obtenir una fotografia estàtica dels processos que s'estan executant en el sistema.

* **Consultar els processos de la sessió actual:**

  El `ps` mostra únicament els processos associats a la teva terminal activa.

* **Llistat complet de tots els processos del sistema:**
  
  El `ps aux` exhibeix informació detallada com l'usuari propietari, ús de CPU (`%CPU`), ús de memòria RAM (`%MEM`), PID, hora d'inici i la comanda executada.

* **Consultar un procés específic per PID:**

  El `ps -p <PID> -o pid,ppid,state,cmd`.
  
  El paràmetre `-o` permet triar exactament les columnes a mostrar:
  * `pid`: Identificador del procés.
  * `ppid`: Identificador del procés pare.
  * `state`: Estat actual de la CPU (ex. `R` per Execució/Preparat, `S` per Bloquejat/Lectura).
  * `cmd`: Comanda o executable associat.

* **Visualitzar la jerarquia de processos pare/fill:**
  
  `ps -ef --forest` mostra tots els processos en una estructura en arbre, facilitant la visualització clara de quin procés n'ha creat un altre.

## 2. Monitoratge en temps real

### La comanda `top`

A diferència de `ps`, `top` ofereix una vista interactiva i contínua de l'activitat de la CPU i la memòria del sistema.
* **Ús pràctic:** Permet identificar quins processos estan consumint més recursos en temps real i observar els canvis d'estat de la CPU.
* **Com sortir:** Prem la tecla `q` per tancar la interfície.

## 3. Gestió de processos en segon pla (Background)
Per defecte, quan s'executa una comanda a la terminal, aquesta bloqueja la línia d'ordres fins que finalitza (primer pla o *foreground*).

### L'Operador `&`

Afegir el símbol `&` al final d'una ordre fa que s'executi en **segon pla** (*background*), alliberant immediatament la terminal per continuar treballant. Ex: `sleep 120 &`: Aquesta comanda crea un procés que espera 120 segons sense bloquejar la terminal. El sistema retora el PID assignat.

## 4. Simulació de càrrega i comparativa de recursos
Per entendre la diferència entre un procés en espera (bloquejat) i un procés actiu que consumeix temps de CPU, es poden comparar les comandes `sleep` i `yes`:

1. **Procés en Espera (Inactiu):**
   ```bash
   sleep 300 &
   ```
   *Pràcticament no utilitza temps de CPU, ja que està bloquejat pel temporitzador.*

2. **Procés Actiu (Càrrega Intensa de CPU):**
   ```bash
   yes > /dev/null &
   ```
   *Genera un flux continu de text redireccionat a buit (`/dev/null`). Aquest procés requereix temps constant de CPU.*

Si s'executa `top` mentre tots dos estan actius, es pot observar visualment com `yes` s'enfila al capdamunt del consum de CPU mentre que `sleep` es manté inactiu.

## 5. Control i finalització de processos

### La Comanda `kill`

Per enviar senyals a un procés (com la petició de finalització), s'utilitza la comanda `kill` acompanyada del PID real assignat pel sistema.

* **Finalització amigable (SIGTERM - Senyal 15 per defecte):**
  ```bash
  kill <PID>
  ```
  Sol·licita al procés que tanqui les seves tasques i finalitzi de manera ordenada.

* **Exemple complet de comprovació:**
  ```bash
  sleep 300 &             # 1. Crear procés en segon pla
  ps -p <PID_ASSIGNAT>    # 2. Verificar que existeix
  kill <PID_ASSIGNAT>     # 3. Enviar senyal de finalització
  ps -p <PID_ASSIGNAT>    # 4. Comprovar que ha hagut de desaparèixer
  ```

## 6. Prova pràctica de concurrència i condició de carrera

Quan dos processos s'executen simultàniament i intenten escriure en un mateix recurs compartit (com un fitxer) sense mecanismes de sincronització, s'observen les interferències de l'execució concurrent:

```bash
# 1. Eliminar el fitxer si existia prèviament
rm -f resultat.txt

# 2. Executar dos bucles concurrents en segon pla que escriuen en el mateix fitxer
for i in {1..100}; do echo A >> resultat.txt; done &
for i in {1..100}; do echo B >> resultat.txt; done &

# 3. Comprovar quantes línies s'han escrit en total
wc -l resultat.txt

# 4. Inspeccionar les primeres 20 línies per veure la disposició
head -20 resultat.txt
```

### Què s'observa?
Les línies `A` i `B` apareixeran barrejades de forma no seqüencial. Això demostra que ambdós bucles s'estaven executant simultàniament i que el planificador de la CPU anava alternant el temps d'execució entre l'un i l'altre.

## 7. Resum de comandes principals

| Comanda / Sintaxi | Descripció / Utilitat |
| :---: | :---: |
| `ps` | Llista els processos actius a la terminal actual. |
| `ps aux` | Mostra una llista detallada de tots els processos del sistema. |
| `ps -p <PID> -o ...` | Consulta informació personalitzada d'un PID concret. |
| `ps -ef --forest` | Dibuixa la jerarquia d'arbre entre processos pare i fill. |
| `top` | Monitoritza en temps real l'ús de CPU i RAM dels processos. |
| `<comanda> &` | Executa una ordre en segon pla (*background*). |
| `kill <PID>` | Transmet un senyal de finalització al procés indicat. |
| `sleep <segons>` | Crea un procés inactiu que espera durant el temps indicat. |
| `yes > /dev/null &` | Genera un procés amb un consum intensiu de CPU per a proves. |
| `wc -l <fitxer>` | Compta el nombre total de línies d'un fitxer. |
| `head -20 <fitxer>` | Mostra les primeres 20 línies d'un fitxer de text. |

En aquest apartat trobaràs l'[exercici 11](../exercicis/ex11-diferents-aspectes.md) per practicar.

En aquest apartat trobaràs l'[exercici 12](../exercicis/ex12-primer-contacte.md) per practicar ja amb la terminal.


---
## Projecte nº1
Per posar en pràctica tots els conceptes d'aquest bloc, realitza el [Projecte nº 1](../practiques/a1-bloc2-projecte1.md).

Si necessites consolidar els coneixements o practicar més, també pots fer el [Projecte nº 1 de reforç](../practiques/a1-bloc2-projecte1-1.md) de manera opcional.

---

## Gestió de la memòria en sistemes operatius
La informació pertinent s'ha extret del [PDF](./a1-bloc2-gestio-memoria.pdf) del moodle i del [vídeo](https://www.youtube.com/watch?v=6y5xNcaOI-c) **no actual** sobre el mateix tema.

La gestió de la memòria per part del sistema operatiu té com a objectiu principal ubicar el màxim nombre de processos a la memòria principal garantint-ne l'aprofitament òptim en entorns de multiprogramació. Aquest resum combina els fonaments teòrics i les arquitectures utilitzades per aconseguir una administració eficient dels recursos de memòria.

## 1. Introducció i jerarquia de memòria
Per comprendre la gestió de memòria, cal situar-la dins de la **jerarquia de memòria** del sistema, dissenyada per equilibrar velocitat, capacitat i cost:

1. **Registres de la CPU:** Els més ràpids, de menor capacitat i més cars per byte.
2. **Memòria Caché:** Memòria d'accés ràpid integrada o molt propera al processador.
3. **Memòria Principal (RAM):** On resideixen els processos i dades en execució.
4. **Emmagatzematge Secundari (Disc / Memòria Virtual):** Més lent, econòmic i de gran capacitat.

A mesura que es descendeix en aquesta jerarquia, la capacitat augmenta, però la velocitat d'accés disminueix. L'**administrador de memòria** del SO s'encarrega de controlar quines parts de la memòria estan lliures o ocupades, assignar i alliberar espai per als processos i gestionar l'intercanvi (*swapping*) entre la RAM i el disc.

## 2. Cicle de compilació, càrrega i reubicació d'adreces
Un programa passa per diferents etapes des del codi font fins a la seva execució: **Compilació/Ensamblatge $\to$ Edició d'enllaços (Linker) $\to$ Càrrega $\to$ Execució**. La traducció o enllaç d'adreces es pot dur a terme en tres moments diferents:

* **Temps de Compilació:** Genera codi absolut; cal conèixer prèviament la posició exacta a la RAM.
* **Temps de Càrrega (Reubicació estàtica):** El compilador genera codi relocalitzable i les adreces absolutes s'uneixen quan el programa es carrega en memòria.
* **Temps d'Execució (Reubicació dinàmica):** El programa es pot moure de posició en memòria mentre s'executa. Requereix suport de maquinari (*Hardware*) com els registres base i límit.

### Adreça lògica vs. Adreça física
Per habilitar aquesta flexibilitat, el sistema distingeix entre dos tipus d'adreces:
* **Adreça Virtual o Lògica:** Les posicions relatives generades pel programa des de la instrucció $0$ fins a $n-1$.
* **Adreça Física:** Les posicions reals on es carrega el programa a la memòria RAM a partir d'una adreça base.

Aquesta conversió d'adreces s'executa constantment i a gran velocitat mitjançant maquinari especialitzat integrat en el microprocessador, conegut com a **Unitat de Gestió de Memòria (MMU)**, evitant la lentitud que suposaria fer la transformació per programari. En esquemes dinàmics senzills, la MMU simplement suma el valor d'un **Registre Base** a l'adreça lògica ($\text{Adreça Física} = \text{Adreça Lògica} + \text{Registre Base}$) i comprova que no superi un **Registre Límit** per protegir els processos entre ells.

## 3. Esquemes d'organització de memòria
Per a l'assignació de l'espai de memòria, els sistemes operatius utilitzen diferents esquemes d'organització.

### A. Sistemes monoprogramats
En els sistemes monoprogramats, la memòria es divideix únicament en dues particions: una per al Sistema Operatiu (en memòria baixa o alta) i una altra per a l'únic procés d'usuari en execució.

### B. Particions estàtiques (fixes)
La memòria es divideix prèviament en zones de mida fixa (totes iguals o de mides diferents), assignant cada procés a una partició i gestionant l'estat mitjançant una taula de particions.
* **Inconvenients:** Limita el nivell de multiprogramació al nombre de particions. Genera **fragmentació interna** (espai desaprofitat dins d'una partició assignada més gran que el procés) i **fragmentació externa** (particions lliures que queden petites per als processos entrants).

### C. Particions dinàmiques (variables)
En les particions dinàmiques, els programes es van carregant en posicions consecutives segons l'espai lliure existent, sense zones predefinides. Quan un procés acaba, el seu espai s'allibera i es fusiona amb els espais lliures adjacents.

* **Estratègies d'assignació d'espai (*Asignación dinámica de almacenamiento*):**
  * **Primer Ajust (*First Fit*):** Escull el primer espai lliure de mida suficient.
  * **Millor Ajust (*Best Fit*):** Escull l'espai lliure més petit on capiga el procés, deixant el residu més petit possible.
  * **Pitjor Ajust (*Worst Fit*):** Escull l'espai lliure més gran disponible per intentar deixar espais residus grans.

#### Fragmentació externa i compactació
La finalització progressiva de processos en particions dinàmiques genera el problema de la **fragmentació externa**, deixant buits dispersos impossibles d'aprofitar per a nous programes tot i que la suma total d'espai lliure sigui suficient. Aquest inconvenient es resol mitjançant la **compactació**, un procés que desplaça els processos actius cap a la part superior de la memòria per agrupar tots els fragments lliures en un sol bloc continu. No obstant això, la compactació consumeix molt temps de CPU i només és possible si la reubicació és dinàmica.

## 4. Tècniques de memòria no contigua

### A. Segmentació
Com a evolució als esquemes anteriors, la segmentació considera els programes dividits en unitats lògiques de mida variable anomenades **segments**, com ara blocs de codi, pila, dades o subrutines. 

Aquest mètode millora l'eficiència en permetre que diferents processos comparteixin segments reentrants (com rutines o dades comunes) sense duplicar-los a la RAM. La MMU realitza la traducció consultant la **taula de segments** de cada procés, on es comprova primer que el desplaçament de l'adreça virtual no superi la capacitat del segment —generant una excepció o interrupció interna si se sobrepassa— i posteriorment se li suma la direcció base del segment per obtenir la direcció física.

### B. Paginació
Una altra tècnica fonamental és la paginació, on els programes es divideixen en **pàgines** de mida fixa i la memòria RAM s'estructura en **marcs de pàgina** (*frames*) de la mateixa capacitat. 

La gran avantatge de la paginació és que les pàgines d'un procés no necessiten estar emmagatzemades en posicions contigües de la memòria, eliminant completament la fragmentació externa. A més, la transformació d'adreces virtuals a físiques és extremadament ràpida: en lloc de realitzar sumes aritmètiques que requereixen diversos cicles de rellotge, la MMU simplement concatena el codi del marc de pàgina obtingut de la **taula de pàgines** amb el desplaçament.

Per accelerar la traducció, la MMU utilitza una memòria memòria caché d'accés ràpid anomenada **TLB (*Translation Look-aside Buffer*)**, que emmagatzema les traduccions més recents.

### C. Segmentació paginada
Combina el millor dels dos mons: la memòria lògica es divideix en segments des del punt de vista de l'usuari, i cada segment es divideix internament en pàgines de mida fixa que es carreguen en marcs de la RAM.

## 5. Memòria virtual i paginació per demanda

La **memòria virtual** ofereix la percepció d'una memòria principal molt superior a la física real, permetent executar programes de gran mida i augmentar el nombre de processos concurrents. El seu funcionament es basa a mantenir a la RAM només les pàgines en ús actiu, mentre que la resta roman a l'espai d'intercanvi (*swap*) del disc.

### Gestió de fallades de pàgina (*Page Fault*)
La taula de pàgines utilitza un **bit de presència (Vàlid/Invàlid - $v/i$)**:
1. Si un procés fa referència a una pàgina no carregada (bit en $i$), es produeix una **fallada de pàgina (*page fault*)**.
2. Es genera una interrupció que transfereix el control al SO.
3. El SO cerca la pàgina al disc i troba un marc lliure a la RAM.
4. Carrega la pàgina a la RAM, actualitza la taula de pàgines a vàlid ($v$) i repren la instrucció interrompuda.

## 6. Algorismes de reemplaçament de pàgines
Quan la memòria RAM està plena i cal carregar una nova pàgina, el SO ha d'aplicar algorismes de reemplaçament per triar una *pàgina víctima* a desallotjar. Per reduir les escriptures a disc, s'utilitza el **bit de modificació (*dirty bit*)**: si la pàgina no s'ha modificat, no cal desar-la a disc.

Els principals algorismes de reemplaçament són:

* **FIFO (*First-In, First-Out*):** Reemplaça la pàgina que porta més temps en memòria. És simple, però pot patir l'**Anomalia de Belady** (on afegir més marcs de RAM pot augmentar el nombre de fallades de pàgina).
* **Òptim:** Reemplaça la pàgina que trigarà més temps a ser utilitzada en el futur. És l'algorisme ideal amb la menor taxa de fallades, però és **irrealitzable** a la pràctica perquè requereix conèixer el futur.
* **LRU (*Least Recently Used*):** Reemplaça la pàgina que fa més temps que no s'ha utilitzat, basant-se en la localitat temporal.
* **Segona Oportunitat / Rellotge:** Utilitza un **bit de referència**. Funciona de manera circular similar a FIFO: si el bit és $1$, li dona una "segona oportunitat" (posa el bit a $0$) i avança; si és $0$, la reemplaça.
* **Bits Referenciat i Modificat:** Classifica les pàgines en 4 grups segons els seus bits `(Referenciat, Modificat)` i selecciona la víctima del grup de menor valor.

## 7. Hiperpaginació (*Thrashing*)
La **hiperpaginació** es produeix quan el nombre de marcs assignats a un procés és insuficient per mantenir les seves pàgines d'ús freqüent. 

Com a conseqüència, el procés genera fallades de pàgina de manera contínua, el sistema passa més temps intercanviant pàgines amb el disc que executant instruccions a la CPU, i **el rendiment general del sistema cau dràsticament**. La solució passa per reduir el nivell de multiprogramació desallotjant algun procés del tot cap al disc.


---
## Projecte nº2
Per posar en pràctica tots els conceptes d'aquest bloc, realitza el [Projecte nº 2](../practiques/a1-bloc2-projecte2.md).

Si necessites consolidar els coneixements o practicar més, també pots fer el [Projecte nº 2 de reforç](../practiques/a1-bloc2-projecte2-1.md) de manera opcional.

---

## Gestió del sistema de fitxers
La gestió del sistema de fitxers per part del sistema operatiu té com a objectiu principal oferir una interfície lògica que aïlli els usuaris i les aplicacions de les complexitats físiques dels suports d'emmagatzematge. La idea central rau en la dualitat entre la **visió lògica** (fitxers, directoris, rutes i metadades) i la **visió física** (sectors, clústers, pistes i unitats físiques), permetent l'organització persistent i l'accés concurrent a la informació.

## 1. Visió lògica vs. Visió física

El sistema operatiu permet treballar amb noms simbòlics, arxius i estructures de carpetes (visió lògica) traduint-los transparentment a localitzacions físiques concretes com unitats, cilindres, pistes i sectors al disc.

### Què és un fitxer?
Un **fitxer** és la unitat lògica d'informació que el sistema operatiu pot emmagatzemar i gestionar. Cada fitxer conté:
* **Dades:** La informació real (text, imatge, executable, etc.).
* **Metadades o Atributs:** Informació de control associada com el nom, la mida, les dates de creació i modificació, el propietari, els permisos d'accés i la ubicació física al disc.

#### Tractament de les extensions:
* **A Windows:** L'extensió (com `.exe`, `.pdf`, `.jpg`) és una convenció fonamental que determina directament quina aplicació obre el fitxer.
* **A Linux:** Les extensions són recomanables per a l'usuari, però no estrictament obligatòries per al sistema. El contingut real del fitxer i els seus permisos d'execució en determinen el tipus i comportament.

## 2. Estrutura jeràrquica i directoris

Un **directori** o carpeta és un arxiu especial constituït per una taula de metadades que actua com a contenidor per organitzar fitxers i subdirectoris en una estructura arbòria.

### Organització del sistema de fitxers: Windows vs Linux

* **A Windows:** L'estructura es divideix en unitats físiques o lògiques independents, cadascuna identificada amb una lletra de l'abecedari seguida de dos punts i una barra invertida (com `C:\`, `D:\`).
* **A Linux:** Tot el sistema parteix d'una **única jerarquia d'arbre** que comença a l'arrel (`/`). No hi ha lletres d'unitats. Els dispositius externs (com una memòria USB) s'integren dins d'aquest mateix arbre mitjançant un **punt de muntatge** (per exemple a `/media/usuari/USB`).

#### Directoris clau a Linux:
* `/home`: Dades personals i configuracions dels usuaris.
* `/etc`: Fitxers de configuració del sistema operatiu i programes.
* `/var`: Dades variables, bases de dades i fitxers de registre (*logs*).
* `/tmp`: Fitxers temporals eliminats periòdicament.
* `/usr`: Aplicacions i recursos compartits d'usuaris.
* `/dev`: Arxius especials que representen els dispositius de maquinari.

## 3. Estrutures de ruta: absolutes i relatives

Per accedir a qualsevol recurs de l'arbre, cal indicar el camí o **ruta** corresponent:

* **Ruta Absoluta:** Indica la ubicació completa des de l'arrel del sistema (`/` a Linux o `C:\` a Windows).
  * *Linux:* `/home/joan/projecte/dades/clients.txt`
  * *Windows:* `C:\Users\Joan\projecte\dades\clients.txt`
* **Ruta Relativa:** Indica la ubicació a partir del directori de treball actual.
  * Utilitza el símbol `.` per al directori actual i `..` per referir-se al directori pare.

## 4. Gestió física de l'espai: clústers i registres

A nivell d'aplicació es defineixen els **registres lògics** (compostos per camps de dades), mentre que el sistema operatiu gestiona els **registres físics** o **clústers** (grups de sectors contigus en disc). El *factor de blocatge* determina quants registres lògics caben en un registre físic.

### L'equilibri en la mida del clúster
* **Clústers Petits (ex. 4 KB):** Aprofiten millor l'espai, però generen taules d'índexs més grans i més interrupcions d'E/S a la CPU en llegir fitxers grans.
* **Clústers Grans (ex. 64 KB):** Milloren la velocitat de lectura seqüencial, però provoquen **fragmentació interna** i malbaratament d'espai quan s'emmagatzemen molts fitxers petits.

## 5. Arquitectures d'assignació d'espai en disc

L'eficiència en l'accés a les dades depèn de l'estructura utilitzada pel sistema de fitxers:

1. **Llistes d'Enllaços (FAT - File Allocation Table):**
   * Emprat tradicionalment a MS-DOS i primeres versions de Windows.
   * Utilitza una taula de punters en memòria. Pateix de fragmentació externa i requereix **desfragmentacions periòdiques** per reagrupar els clústers dispersos.
   * *Esborrat d'arxius:* L'esborrat és molt ràpid perquè només posa a zero els punters de la taula sense esborrar físicament les dades a disc, permetent la seva recuperació si no es sobreescriuen.

2. **Nodes d'Índex o Inodes (UNIX / Linux):**
   * Utilitza una estructura anomenada *inode* de mida fixa per a cada fitxer, desglossant metadades i adreces de disc directes, així com nivells d'indirecció (simple, doble i triple) per direccionar fitxers de gran capacitat.

3. **Arbres B+ (NTFS - Windows NT i posteriors):**
   * S'organitza mitjançant estructures d'arbre B+ amb baixos temps d'accés, una Taula Mestra d'Arxius (MFT) i registres immediats (*resident attributes*) per a fitxers de mida molt reduïda.

## 6. Operacions bàsiques i administració de permisos

Les 5 operacions fonamentals sobre fitxers són **Crear**, **Copiar**, **Moure**, **Renomenar** i **Eliminar**.

### Equivalència de comandes de terminal

| Operació | Terminal Linux | Windows CMD | Windows PowerShell |
| :--- | :--- | :--- | :--- |
| **Directori actual** | `pwd` | `cd` | `Get-Location` |
| **Llistar contingut** | `ls` | `dir` | `Get-ChildItem` |
| **Canviar directori** | `cd` | `cd` | `Set-Location` |
| **Crear directori** | `mkdir` | `mkdir` | `New-Item -ItemType Directory` |
| **Copiar** | `cp` | `copy` | `Copy-Item` |
| **Moure / Renomenar**| `mv` | `move` / `ren` | `Move-Item` / `Rename-Item` |
| **Eliminar** | `rm` | `del` | `Remove-Item` |

### Permisos a Linux (`r`, `w`, `x`)

A Linux, la seguretat i l'accés als fitxers es basen en tres nivells d'usuaris: **Propietari (u)**, **Grup (g)** i **Altres (o)**.

* **Permisos disponibles:**
  * `r` (*Read* / Lectura): Permet llegir el contingut.
  * `w` (*Write* / Escriptura): Permet modificar o esborrar.
  * `x` (*Execute* / Execució): Permet executar un programa o entrar en un directori.

* **Modificació de Permisos i Propietaris:**
  * `chmod 755 script.sh`: Modifica els permisos (en notació octal: `7`=rwx per al propietari, `5`=r-x per al grup i altres).
  * `chown joan:alumnes script.sh`: Canvia el propietari i el grup associat al fitxer.


## Gestió d'entrades i sortides en els sistemes operatius
La gestió dels recursos de perifèrics i dispositius d'entrada i sortida (E/S) és una de les funcions més complexes i essencials d'un sistema operatiu. L'objectiu fonamental és oferir una transparència màxima a l'usuari respecte a les peculiaritats del maquinari, permetent un accés abstracte, homogeni i unificat als dispositius. 

Simultàniament, el sistema s'encarrega d'optimitzar la compartició eficient d'aquests recursos entre diversos processos concurrents mitjançant tècniques de virtualització, gestió de memòria i sincronització. Mitjançant un model conceptual estructurat per capes, el sistema operatiu enllaça des de les crides d'alt nivell del programa d'usuari fins a la gestió física dels controladors, busos i mecanismes d'alta velocitat com l'Accés Directe a Memòria (DMA).

## 1. Objectius fonamentals i abstracció del maquinari
La gestió d'E/S té dos propòsits bàsics:
1. **Fer transparent la complexitat del maquinari als usuaris i aplicacions**, evitant que hagin de conèixer els detalls físics, adreces de registres o protocols concrets de cada perifèric.
2. **Optimitzar la compartició dels recursos entre processos**, garantint la protecció, l'equitat i el màxim rendiment possible.

### El paper dels drivers o controladors de dispositiu
Gràcies als gestors de perifèrics o *drivers*, els programes d'usuari poden executar operacions d'E/S de forma abstracta mitjançant crides al sistema estàndard (com `read()`, `write()`, `open()`). 

Els *drivers* són els únics mòduls del sistema operatiu dissenyats específicament per entendre, traduir i controlar les peculiaritats del maquinari corresponent. Quan s'instal·la un nou perifèric, s'incorpora el seu *driver* específic al sistema, actuant com un pont de traducció entre la interfície genèrica del SO i les ordres en patrons de bits que entén el controlador físic.

## 2. Classificació dels dispositius i modalitats de gestió
Els dispositius d'E/S es poden classificar segons la unitat de transferència i segons com el sistema operatiu en gestiona l'accés.

### A. Per l'unitat de transferència:
* **Dispositius de Blocs:** Magatzemen la informació en blocs de mida fixa (ex. 512 bytes, 4 KB). Permeten l'accés independent i aleatori a qualsevol bloc (ex. discs dics, SSD, unitats USB).
* **Dispositius de Caràcters:** Envien o reben un flux continu de bytes o caràcters de manera seqüencial, sense estructuració en blocs (ex. teclat, ratolí, impressores, terminals).

### B. Per la modalitat de gestió d'accés:
* **Dispositius Assignats (Dedicats):** S'atorguen en exclusiva a un sol procés durant la seva execució per evitar interferències (ex. teclat, ratolí, impressora).
* **Dispositius Compartits:** Permeten un accés concurrent per part de múltiples processos gràcies a la seva capacitat d'accés aleatori (ex. discs magnètics, SSD).
* **Dispositius Virtuals (*Spooling*):** Tècnica que converteix dispositius en principi dedicats (com una impressora) en recursos aparentment compartibles. Utilitza la tècnica de *spooling* (*Simultaneous Peripheral Operation On-Line*), on les peticions dels usuaris no van directament al perifèric sinó que s'emmagatzemen en una cua de fitxers de treball al disc (*spool*), des d'on un dimoni del sistema les processa una per una sense bloquejar l'execució dels programes.

## 3. Arquitectura Modular per Capes de la Gestió d'E/S
Per garantir la independència i la facilitat de manteniment, la gestió d'E/S s'organitza en un model arquitectònic de 5 capes:

1. **Programes d'usuari (nivell superior):** Inicien les sol·licituds d'E/S mitjançant crides al sistema o funcions de llibreria estàndard.
2. **Software independent del dispositiu:** Realitza funcions comunes a tots els dispositius, com l'obertura, lectura, escriptura i tancament de fitxers, la gestió de la protecció, la verificació de drets d'accés, l'assignació de noms lògics i la gestió de *buffers* generals.
3. **Nivell d'organització física:** Tradueix les referències lògiques en adreces físiques concretes. Aplica tècniques avançades d'optimització com la gestió de RAID, la memòria cau de disc i la planificació del moviment dels capçals de disc.
4. **Gestor software del dispositiu (driver):** Genera la seqüència d'ordres i patrons de bits específics per al controlador, atén les interrupcions de baix nivell i gestiona els errors propis del perifèric.
5. **Controlador físic i hardware (nivell inferior):** Format pels circuits electrònics del controlador i el perifèric mateix, que executen l'operació física de lectura, escriptura o transmissió.

## 4. Mecanismes de Transferència de Dades i Rendiment
L'evolució de la gestió d'E/S cerca minimitzar el temps que la CPU passa esperant o gestionant dispositius lents.

### A. E/S programada (Polling)
La CPU consulta contínuament un registre d'estat del controlador per saber si el dispositiu està a punt.
* **Inconvenient:** Desaprofi ta enormement la CPU, mantenint-la en un bucle d'espera on es podrien executar milions d'instruccions d'altres processos.

### B. E/S per interrupcions
El dispositiu o el seu controlador envia un senyal d'interrupció (*IRQ*) a la CPU quan està preparat per rebre o lliurar dades.
* **Funcionament:** La CPU continua executant altres tasques fins que rep la interrupció. Llavors, pausa la tasca actual, executa la Rutina de Tractament de la Interrupció (RTI) per transferir la dada, i repren el treball anterior.
* **Limitació:** Per a dispositius lents (ex. teclat) és molt eficient (redueix milers de vegades el temps d'ocupació de la CPU). Tanmateix, per a dispositius molt ràpids (ex. discs transmetent MBs/s), generar una interrupció per cada byte o paraula continua saturant la CPU amb milers d'execucions de la RTI.

### C. Accés directe a memòria (DMA - *Direct Memory Access*)
Mecanisme dissenyat per a transferències de grans blocs de dades en dispositius ràpids amb una intervenció mínima del processador.

#### Estructura del controlador DMA (DMAC):
El DMAC actua com a mestre del bus (*Bus Master*) durant la transferència i disposa de registres interns:
* **Registre d'Adreça de Memòria:** Guarda l'adreça inicial de la RAM i s'incrementa/decrementa automàticament.
* **Registre de Nombre de Paraules:** Guarda la quantitat de dades a transferir i es decrementa amb cada dada moguda.
* **Registre de Sentit:** Indica si la transferència és de lectura o d'escriptura.

#### Les 3 etapes d'una transferència DMA:
1. **Inicialització:** La CPU programa el DMAC (indicant adreça de memòria, nombre de bytes, sentit i canal) i el controlador del perifèric. Un cop configurat, la CPU queda lliure per executar altres processos.
2. **Realització:** Quan el perifèric està a punt, envia un senyal `DMA-REQ` al DMAC. Aquest demana el bus, respon amb `DMA-ACK` i transfereix les dades directament entre el perifèric i la RAM sense passar pels registres de la CPU.
3. **Finalització:** En acabar de moure tot el bloc (comptador a zero), el DMAC allibera el bus i genera una **única interrupció** a la CPU per avisar que l'operació d'E/S ha finalitzat.

#### Modes de transferència DMA:
* **Mode Ràfega (*Burst Mode*):** El DMAC manté el control del bus de forma ininterrompuda fins a completar tot el bloc. És molt ràpid, però impedeix que la CPU accedeixi a la RAM durant aquest temps.
* **Mode Robo de Cicle (*Cycle Stealing*):** El DMAC solta i demana el bus alternativa o paraula a paraula. La transferència triga mica més, però gairebé no degrada el rendiment de la CPU.

## 5. Tècniques d'Optimització: *Buffers* i Caches
Per absorbir les diferències de velocitat entre qui produeix i qui consumeix dades, el SO utilitza zones de memòria intermèdia:

* **Buffers:** Zones de RAM que emmagatzemen ràfegues de dades abans de processar-les. Eviten que un procés hagi d'esperar a cada caràcter individual (ex. *buffering* de vídeo, xarxa o impressió).
* **Memòria Cau de Disc (*Disk Cache*):** Utilitza una part de la RAM principal per emmagatzemar blocs de disc d'accés freqüent, basant-se en els principis de localitat temporal i espacial per reduir els accesos físics al disc.
* **Disc RAM:** Part de la memòria principal utilitzada com si fos un disc secundari extremadament ràpid.

## 6. Implementació en Sistemes Operatius Reals

### A. Model UNIX / Linux
* Tracta tots els dispositius com a **fitxers especials** ubicats al directori `/dev` (ex. `/dev/sda` per a un disc, `/dev/tty` per a terminals).
* Les peticions de l'usuari passen des del *shell* o programa d'usuari a través de la interfície unificada de crides al sistema d'arxius, aprofitant la memòria cau de blocs del nucli fins arribar als *drivers*.

### B. Model Windows
* Utilitza una arquitectura basada en serveis del sistema, el gestor d'E/S (*I/O Manager*), el model de *drivers* WDM/KMDF i la **Capa d'Abstracció de Maquinari (HAL - *Hardware Abstraction Layer*)**.
* L'usuari pot visualitzar i gestionar l'estat dels controladors i el maquinari mitjançant l'**Administrador de Dispositius**.

## 7. Taula resum de mecanismes
La gestió d'entrades i sortides és el pilar que permet conciliar la lentitud i heterogeneïtat del maquinari físic amb l'alta velocitat i necessitat de simplicitat de les aplicacions d'usuari.

| Mecanisme | Ocupació de la CPU | Ús Recomanat / Típic |
| :---: | :---: | :---: |
| **E/S Programada (*Polling*)** | Molt alta (espera activa contínua). | Dispositius molt senzills o de control en temps real. |
| **Interrupcions** | Baixa/Mitjana (només intervé quan el dispositiu avisa). | Dispositius lents o d'esdeveniments discontinus (teclat, ratolí). |
| **DMA (*Direct Memory Access*)** | Mínima (només inicialització i interrupció final). | Transferències de grans blocs de dades ràpides (discs, targetes de xarxa). |

## Ampliar informació
Per ampliar informació sobre l'estructura de fitxers, la gestió de permisos, el muntatge de dispositius i l'ús d'enllaços a Linux, podeu consultar els següents enllaços:

- Sistema de fitxers: Organització estructural de les dades al disc -> https://mural.uv.es/oshuso/82_sistema_de_ficheros_de_linux.html

- Permisos i atributs: Control d'accés i privilegis dels usuaris -> https://mural.uv.es/oshuso/8339_permisos_y_atributos.html

- Accés a dispositius: Muntatge de unitats sota el directori arrel `/` -> https://www.ibiblio.org/pub/linux/docs/LuCaS/Tutoriales/CURSOLINUX/curso_linux/node78.html

- Tipus d'enllaços: Funcionament dels enllaços durs i simbòlics -> https://geekland.eu/que-son-para-que-sirven-enlaces-duros-y-simbolicos/