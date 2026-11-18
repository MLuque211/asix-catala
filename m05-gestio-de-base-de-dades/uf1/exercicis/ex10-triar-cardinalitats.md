## Exercici 10. Triar cardinalitats
A partir dels enunciats següents, indica la cardinalitat mínima i màxima de cada entitat participant i el tipus de relació que s'estableix:
1. Cada comanda és feta per un únic client. Un client pot no haver fet cap comanda o en pot haver fet moltes.
2. Cada vehicle té una sola matrícula vigent. Una matrícula només identifica un vehicle.
3. Un llibre pot ser escrit per diversos autors i un autor pot escriure diversos llibres.
4. Un treballador pot tenir un supervisor, però la direcció general no té supervisor.

<details>
<summary><b>🔍 Veure respostes</b></summary>

1. CLIENT - COMANDA: Relació de tipus 1:N (Un a Molts).
  - CLIENT $\rightarrow$ COMANDA: $(0,N)$ (Un client pot tenir 0 comandes registrades o moltes).
  - COMANDA $\rightarrow$ CLIENT: $(1,1)$ (Tota comanda pertany obligatòriament a 1 sol client).
2. VEHICLE - MATRÍCULA: Relació de tipus 1:1 (Un a Un).
  - VEHICLE $\rightarrow$ MATRÍCULA: $(1,1)$ (Tot vehicle té assignada exactament 1 matrícula).
  - MATRÍCULA $\rightarrow$ VEHICLE: $(1,1)$ (Cada matrícula identifica exactament 1 vehicle).
    >Nota: Si calgués guardar l'històric de matrícules antigues d'un vehicle, la cardinalitat canviaria a 1:N.
3. LLIBRE - AUTOR: Relació de tipus M:N (Molts a Molts).
  - LLIBRE $\rightarrow$ AUTOR: $(1,N)$ (Un llibre ha de ser escrit com a mínim per 1 autor i en pot tenir varis).
  - AUTOR $\rightarrow$ LLIBRE: $(0,N)$ (Un autor pot no tenir cap llibre publicat encara o haver-ne escrit molts).
4. TREBALLADOR - SUPERVISOR (Relació recursiva/autoreferenciada):
  - Rol Subordinat: $(0,1)$ (Un treballador pot no tenir cap supervisor—com el director general—o tenir-ne com a màxim 1).
  - Rol Supervisor: $(0,N)$ (Un treballador pot no supervisar ningú o bé supervisar molts empleats).

</details>