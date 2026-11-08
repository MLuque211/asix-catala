## Exercici 11: Diferents aspectes i tipus de sistemes operatius

1. Diferència entre monotasca i multitasca
2. Diferència entre monousuari i multiusuari
3. Sistemes multiprocessador o monoprocessador
4. Un sistema multiusuari pot ser monotasca? I un sistema multitasca, pot ser multiusuari? Raoneu
5. Què significa que un SO sigui de 32 o 64 bits, és a dir, tingui arquitectura de 32 o 64 bits ?. (diferències entre aquestes arquitectures)
6. En SO que és una INTERRUPCIÓ ? Per què són importants les interrupcions en 	informàtica? Explica com funciona.

<details>
<summary><b>🔍 Veure respostes</b></summary>

1. Monotasca vs. Multitasca: Un sistema operatiu monotasca només pot executar un únic procés o programa a la vegada; per iniciar una nova tasca, cal finalitzar la que s'està executant. En canvi, un sistema multitasca pot gestionar i executar múltiples processos de manera concurrent o simultània, repartint el temps de processador entre ells.
2. Monousuari vs. Multiusuari: Un sistema monousuari està dissenyat per atendre un únic usuari a la vegada. Un sistema multiusuari permet que diversos usuaris basin i utilitzin els recursos del mateix sistema operatiu simultàniament, mantenint la privacitat, la seguretat i la separació entre els seus entorns i processos.
3. Monoprocessador vs. Multiprocessador: Un sistema monoprocessador disposa d'un sol nucli/CPU principal per executar totes les instruccions. Un sistema multiprocessador disposa de dos o més nuclis o CPUs físiques, la qual cosa permet executar diferents instruccions i processos en paral·lel de forma real.
4. Resolució teòrica de combinacions:
    - Un sistema multiusuari pot ser monotasca? En la teoria és possible (per exemple, un sistema central on cada usuari només pot executar un sol treball per l'ordre d'arribada), però a la pràctica no té sentit, ja que per atendre la petició de més d'un usuari alhora, el sistema requereix obligatòriament la multitasca per poder alternar entre els seus processos.
    - Un sistema multitasca pot ser multiusuari? Sí, de fet és l'estàndard actual en la majoria de sistemes operatius de servidors i d'escriptori (com ara Linux o Windows Server), on múltiples usuaris poden tenir sessions obertes i executar moltes tasques en segon pla al mateix temps.   
5. Arquitectura de 32 bits vs. 64 bits: Fa referència a la mida dels registres interns del processador i a l'ample del bus de dades/adreces.
    - Capacitat de memòria RAM: Una arquitectura de 32 bits pot adreçar com a màxim $2^{32}$ adreces de memòria (uns 4 GB de RAM). Una de 64 bits pot adreçar teòricament fins a $2^{64}$ adreces (més de 16 exabytes de RAM).
    - Rendiment: Els processadors i SOs de 64 bits poden processar blocs de dades el doble de grans en un sol cicle de rellotge i gestionar aplicacions més complexes de forma més eficient.
6. Interrupcions en els Sistemes Operatius:
    - Què és? Una interrupció és un senyal enviat al processador (des del maquinari o per programari) que altera l'ordre d'execució normal del programa actual per atendre un esdeveniment prioritari o urgent.
    - Per què són importants? Permeten l'eficiència del sistema i l'atenció immediata de dispositius d'E/S (teclat, disc, xarxa) sense que la CPU hagi d'estar consultant contínuament si hi ha noves dades (polling), optimitzant així el consum de recursos.
    - Com funciona?
        - Un dispositiu o un procés genera un senyal d'interrupció. 
        - La CPU pausa temporalment l'execució del procés actual i desa el seu estat (canvi de context).
        - El sistema operatiu executa la rutina de servei d'interrupció (ISR) corresponent per gestionar l'esdeveniment.
        - Un cop finalitzada la rutina, es restaura l'estat del procés original i es repren la seva execució en el punt exacte on havia estat pausat.   

</details>