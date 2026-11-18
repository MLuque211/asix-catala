## Exercici 13. Transformar un ER a relacional
Transforma el model següent:
- Un `CLIENT` fa moltes `COMANDA`.
- Una `COMANDA` inclou un o més `PRODUCTE`.
- De cada línia cal saber `quantitat` i `preu_aplicat`.
- Un producte pot estar en moltes línies de comanda.
- Un client té un o més telèfons de contacte.
Inclou PK, FK, `NOT NULL` i les accions referencials que consideris adequades
```SQL
**CLIENT**(`id_client`, `nom`, `email`)
**TELEFON_CLIENT**(`id_client`, `telefon`, `tipus`)
**COMANDA**(`id_comanda`, `data_comanda`, `id_client`)
**PRODUCTE**(`id_producte`, `nom`, `preu_actual`)
**LINIA_COMANDA**(`id_comanda`, `num_linia`, `id_producte`, `quantitat`, `preu_aplicat`)

**PK CLIENT:** `id_client`
**PK TELEFON_CLIENT:** (`id_client`, `telefon`)
**PK COMANDA:** `id_comanda`
**PK PRODUCTE:** `id_producte`
**PK LINIA_COMANDA:** (`id_comanda`, `num_linia`)

**FK TELEFON_CLIENT:** `id_client` $\rightarrow$ `CLIENT(id_client)`
**FK COMANDA:** `id_client` $\rightarrow$ `CLIENT(id_client)`
**FK LINIA_COMANDA:** `id_comanda` $\rightarrow$ `COMANDA(id_comanda)`
**FK LINIA_COMANDA:** `id_producte` $\rightarrow$ `PRODUCTE(id_producte)`
```
> **Nota de disseny:** L'atribut `preu_aplicat` s’ha de desar a **LINIA_COMANDA** perquè representa el preu real aplicat en el moment de la venda, el qual pot diferir del preu actual del producte (`preu_actual`).