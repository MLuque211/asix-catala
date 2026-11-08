# Projecte 2.1: Memòria sota pressió

**Objectiu:** Investigar el comportament de la memòria del sistema Linux quan diversos processos o experiments d'assignació consumeixen recursos de manera progressiva.

## 1. Observem la memòria en temps real

### Ordre executada:
```bash
watch -n 1 free -h
```

*(En una segona terminal s'obren aplicacions progressivament).*

> **[INSERIR CAPTURA DE PANTALLA: `watch -n 1 free -h` amb diverses aplicacions obertes]**

### Respostes:
* **Què passa amb la memòria disponible?**  
  Disminueix gradualment a mesura que les aplicacions es carreguen a la RAM i reserven espai de treball.

* **Què passa amb la memòria utilitzada?**  
  Augmenta proporcionalment al volum de dades i biblioteques que necessiten els nous processos per executar-se.

* **La variació és immediata?**  
  Sí, la comanda `watch` actualitza els valors segon a segon i s'observa un salt instantani en el consum en el moment exacte en què s'inicia cada programa.

* **Què passa quan tanques les aplicacions?**  
  La memòria utilitzada baixa i la disponible torna a augmentar.

* **La memòria disponible torna exactament al valor inicial?**  
  Generalment **no torna exactament al mateix valor exactament**. Una part de la memòria roman ocupada temporalment en concepte de *buffering* i *cache* del sistema de fitxers (per si tornem a obrir el programa aviat), i alguns dimonis o processos secundaris poden haver modificat lleugerament el seu estat.

## 2. Investiguem la memòria d'un procés

### Ordres executades:
```bash
pgrep -a firefox  # o el nom del programa triat
ps -p <PID> -o pid,ppid,cmd,%mem,rss,vsz
cat /proc/<PID>/status
```

### Taula d'anàlisi de `/proc/<PID>/status`:

| Dada | Valor | Què significa? |
| :---: | :---: | :---: |
| **VmSize** | *Ex: 3254120 kB* | Mida total de l'espai d'adreçament virtual assignat al procés. |
| **VmRSS** | *Ex: 485200 kB* | **Resident Set Size:** Memòria RAM física realment ocupada i resident en aquest moment. |
| **VmData** | *Ex: 1250400 kB* | Mida del segment de dades (*heap* i dades no inicialitzades). |
| **VmStk** | *Ex: 132 kB* | Mida del segment de pila (*stack*) utilitzat per a variables locals i crides a funcions. |
| **VmExe** | *Ex: 240 kB* | Mida del codi executable del procés resident a memòria. |
| **Threads** | *Ex: 42* | Nombre total de fils d'execució (*threads*) actius associats a aquest procés. |

## 3. RSS i VSZ: Són el mateix?

### Diferència conceptual i pràctica:
* **VSZ (Virtual Size / `VmSize`):** Representa tot l'espai de memòria virtual que el procés té reservat o mapejat. Inclou memòria sol·licitada però encara no utilitzada, biblioteques compartides, memòria enviada a *swap* i fitxers mapejats a disc.
* **RSS (Resident Set Size / `VmRSS`):** Representa la quantitat real de memòria RAM física que el procés té carregada i resident en aquest moment.

### Què ens indica si VSZ és molt superior a RSS?
Indica que el programa ha reservat grans blocs d'adreces virtuals o ha mapejat múltiples biblioteques compartides i fitxers, **però no està accedint de manera activa a la majoria d'aquesta memòria**. El sistema operatiu només assigna marcs de RAM física (*pages*) per a aquelles seccions que realment es llegeixen o s'escriuen (paginació per demanda).

## 4. Investiguem els fils d'un procés

### Ordres executades:
```bash
ps -p <PID> -o pid,nlwp,cmd
ps -eLf | grep <PID>
```

### Respostes:
* **Quants fils té el procés?**  
  *(Anotar el número obtingut a la columna NLWP/Threads, p. ex., 42 fils).*

* **Quina diferència hi ha entre un procés i un fil?**  
  Un **procés** és una unitat d'execució independent que posseeix el seu propi espai d'adreçament de memòria aïllat. Un **fil** (*thread*) és una unitat d'execució més lleugera que viu *dins* d'un procés i comparteix el seu mateix espai de memòria i recursos amb altres fils del mateix procés.

* **Per què un programa pot necessitar diversos fils?**  
  Per realitzar múltiples tasques de manera concurrent sense haver de duplicar tota la memòria (p. ex., un navegador utilitza diferents fils per a la interfície d'usuari, el motor de renderitzat, les peticions de xarxa i l'àudio).

* **Tots els fils necessiten una còpia completa de la memòria del procés?**  
  **No.** Els fils comparteixen el mateix espai de memòria global (codi, variables globals, *heap*). Només necessiten la seva pròpia pila (*stack*) privada per gestionar les seves crides internes a funcions i variables locals.

## 5. Investiguem el mapa de memòria

### Ordre executada:
```bash
pmap <PID>
```

> **[INSERIR CAPTURA DE PANTALLA: Sortida de `pmap <PID>`]**

### Regions identificades al mapa de memòria:
1. **Llibreries compartides (`lib*.so`):** Fitxers del sistema carregats en memòria de només lectura/execució compartits amb altres programes.
2. **`[ heap ]`:** Zona de memòria dinàmica on el procés sol·licita espai en temps d'execució.
3. **`[ stack ]`:** Pila d'execució del fil principal.
4. **Regions anònimes (`anon`):** Blocs de RAM assignats dinàmicament sense un fitxer associat a disc.
5. **Fitxers mapejats:** Fitxers del disc oberts directament a la memòria virtual (`mmap`).

### Per què es necessiten diferents regions en lloc d'un únic espai continu?
Per **seguretat, protecció i eficiència**. Cada regió requereix diferents permisos d'accés (ex: el codi necessita permís d'execució però no d'escriptura; les dades necessiten escriptura però no execució). A més, dividir en regions permet que diferents processos comparteixin biblioteques comunes a la RAM sense duplicar-les.

## 6. Experiment: Un programa consumeix memòria

### Codi utilitzat a la terminal (Python 3):
```python
a = []
for i in range(10000000):
    a.append(i)
```

### Ordre de monitoratge paral·lel:
```bash
watch -n 1 "ps -p <PID_PYTHON> -o pid,%mem,rss,vsz,cmd"
```

### Observacions de l'experiment:
* **Evolució de RSS i VSZ:** Ambdós valors augmenten progressivament a mesura que s'afegeixen elements a la llista.
* **Constància del creixement:** El creixement sol ser a salts, ja que Python reserva blocs de memòria (*realloc*) per a la llista de forma anticipada quan s'omple la capacitat actual.
* **Eliminació de la variable (`del a`):**  
  En executar `del a`, la memòria `RSS` baixa o es marca com a alliberada per al gestor intern de Python, tot i que `VSZ` pot no reduir-se immediatament cap al sistema operatiu a causa de com el *runtime* gestiona el seu propi *heap*.

## 7. Repte final: Explica què està passant

Quan un **procés** s'inicia, el sistema operatiu li assigna un espai d'adreçament de **memòria virtual** dividit en **pàgines** de mida fixa. Aquesta memòria virtual no ocupa directament la mateixa quantitat de memòria física. 

Mitjançant la paginació per demanda, el SO només carregarà a la **memòria RAM** aquelles pàgines a les quals el procés accedeix activament. Si el programa demana més memòria de la que hi ha disponible immediatament a la RAM, el sistema entra en una situació de pressió de memòria. Per evitar que el sistema es quedi sense recursos, el SO activa la memòria de **swap** (espai d'intercanvi al disc), movent les pàgines menys utilitzades (*inactive pages*) des de la RAM cap al disc. Si el procés torna a necessitar una pàgina enviada al disc, es produeix una **fallada de pàgina (*page fault*)**, obligant el SO a portar la pàgina novament a la RAM i, si no hi ha espai, a desallotjar-ne una altra cap al *swap*.

## 8. Pregunta de reflexió

Tenim:
* RAM: 16 GB | Swap: 8 GB
* Procés: `VSZ = 12 GB`, `RSS = 2 GB`

### Preguntes:
1. **Significa això que el procés està utilitzant físicament 12 GB de RAM?**
2. **Quina informació ens proporciona el RSS?**
3. **Per què el VSZ pot ser molt superior al RSS?**
4. **La presència de swap significa necessàriament que la RAM està plena?**
5. **Quina informació addicional voldries consultar per saber millor com està gestionant el sistema la memòria?**