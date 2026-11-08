# Conceptes inicials i d'arquitectura
- **Eines i Entorn:** Ús de **Markdown** com a editor de text tècnic.
- **[Model de von Neumann](./a1-bloc1-Von-Neumann.pdf)**: Arquitectura bàsica d'un ordinador composta per tres blocs principals:
    - **CPU** (Central Processing Unit).
    - **Memòria** principal.
    - **Dispositius d'Entrades i Sortides (E/S)**.
- **[Sistema Informàtic](https://ca.wikipedia.org/wiki/Sistema_inform%C3%A0tic)** :Conjunt d'elements que integren l'entorn informàtic. Es pot dividir estructuralment en dues parts:
    - **Hardware (maquinaria):** La part física tangible.
    - **Software (programació):** La part lògica, on destaca el **Sistema Operatiu (SO)** com el programari principal que gestiona els recursos de la màquina.

# Sistemes de numeració i codificació
Els sistemes més utilitzats en informàtica són el **binari** i l'**hexadecimal**, a causa de la seva relació directa amb l'electrònica digital ([exemple de canvi de bases](./a1-bloc1-canvis-Base.pdf)).
- **Binari (Base 2):** Dígits $0$ i $1$.
- **Octal (Base 8):** Dígits del $0$ al $7$.
- **Decimal (Base 10):** Dígits del $0$ al $9$.
- **Hexadecimal (Base 16):** Dígits del $0$ al $9$ i lletres de la **A** a la **F** (on $A=10, B=11, C=12, D=13, E=14, F=15$).

--

Equivalències clau (taula Hexadecimal - Binari - Decimal)
| **Hexadecimal (H)** | **Binari (B)** | **Decimal (D)** |
| :-------------------: | :--------------: | :---------------: |
| 0                   | 0000           | 0               |
| 1                   | 0001           | 1               |
| 2                   | 0010           | 2               |
| 3                   | 0011           | 3               |
| 4                   | 0100           | 4               |
| 5                   | 0101           | 5               |
| 6                   | 0110           | 6               |
| 7                   | 0111           | 7               |
| 8                   | 1000           | 8               |
| 9                   | 1001           | 9               |
| A                   | 1010           | 10              |
| B                   | 1011           | 11              |
| C                   | 1100           | 12              |
| D                   | 1101           | 13              |
| E                   | 1110           | 14              |
| F                   | 1111           | 15              |

## Mètodes de conversió i ampliació

### Taula de Potències de 2
Per evitar errors (passar de binari a decimal), s'ha de tenir sempre present la seqüència de potències de 2 de dreta a esquerra:

| Posició | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **Binari** | **1** | **1** | **0** | **1** | **0** | **1** | **1** | **0** |
| **Potència** | $2^7$ | $2^6$ | $2^5$ | $2^4$ | $2^3$ | $2^2$ | $2^1$ | $2^0$ |
| **Valor** | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |

$11010110_{2}= 214_{10}$

### A. De Decimal a Binari
S'ha d'agafar la potencia de 2 més gran que càpiga al nombre seleccionat. Per a cada potència, si hi cap, hi posem un _1 bit_ i restem el seu valor; si no, hi posem un _0 bits_ i passem al següent ([vídeo explicatiu](https://www.youtube.com/watch?v=qWxiXU02ZQM)).
- _Exemple_ $54_{10}$: 

| Potència | Càlcul                    | Resultat (bit) |
| :------: | :-----------------------: | :------------: |
| 128      | 54 < 128? Sí              | 0              |
| 64       | 54 < 64? Sí               | 0              |
| 32       | 54 ≥ 32? Sí; 54 − 32 = 22 | 1              |
| 16       | 22 ≥ 16? Sí; 22 − 16 = 6  | 1              |
| 8        | 6 ≥ 8? No                 | 0              |
| 4        | 6 ≥ 4? Sí; 6 − 4 = 2      | 1              |
| 2        | 2 ≥ 2? Sí; 2 − 2 = 0      | 1              |
| 1        | 0 ≥ 1? No                 | 0              |
|          | **Resultat:** `00110110`  |                |

En aquest apartat trobaràs l'[exercici 1](../exercicis/ex1-decimal-a-binari.md) per practicar.

### A. De Binari a Decimal
S'ha de multiplicar cada bit per la potència de 2 corresponent a la seva posició (començant per la dreta) i es sumen tots els resultats ([vídeo explicatiu](https://www.youtube.com/watch?v=UUqtjb8WEUs)).
- _Exemple_ $10110110$: 

| Càlcul          | Resultat (bit)      |
| :--------------:| :-----------------: |
| 1*128           | 128                 |
| 0*64            | 0                   |
| 1*32            | 32                  |
| 1*16            | 16                  |
| 0*8             | 0                   |
| 1*4             | 4                   |
| 1*2             | 2                   |
| 0*1             | 0                   |
| 128+32+16+4+2 = | **Resultat:** $182$ |

En aquest apartat trobaràs l'[exercici 2](../exercicis/ex2-binari-a-decimal.md) per practicar.

### B. De Decimal a Hexadecimal
Per passar un nombre decimal a hexadecimal de manera directa, s'aplica el mètode de les divisions successives (que també es pot fer en binari), **dividint entre 16** ([vídeo explicatiu](https://www.youtube.com/watch?v=QJW6qnfhC70)).
- $16$
- $32$
- $48$
- $64$
- $80$
- $96$
- $112$
- $128$
- $144$
- $160$

- _Exemple ($7956_{10}$):_
	- $7956 / 16 = 497$ (Residu $4$)
	- $497 / 16 = 31$ (Residu $1$)
	- $31 / 16 = 1$ (Residu $15$, que en hexadecimal és la lletra **F**)
	- $1 / 16 = 0$ (Residu $1$)
	- El resultat de baix a dalt és **$\text{1F14}_{16}$**.

En aquest apartat trobaràs l'[exercici 3](../exercicis/ex3-decimal-a-hexadecimal.md) per practicar.

### B. De Hexadecimal a Decimal
Per passar de hexadecimal a decimal, es multiplica cada digit per la potència de 16 corresponent a la seva posició (començant per la dreta) i es sumen tots els resultats ([vídeo explicatiu](https://www.youtube.com/watch?v=pg-HEGBpCQk)).
- _Exemple:_  $2A3F_{16}$:
	- $2 \cdot 16^3 = 2 \cdot 4096 = 8192$
	- $A \cdot 16^2 = 10 \cdot 256 = 2560$
	- $3 \cdot 16^1 = 3 \cdot 16 = 48$
	- $F \cdot 16^0 = 15 \cdot 1 = 15$
	Ara sumem:
	8192+2560+48+15=10815
	Per tant:
	$2A3F_{16}$ = $10815_{10}$

En aquest apartat trobaràs l'[exercici 4](../exercicis/ex4-hexadecimal-a-decimal.md) per practicar.

### C. De Binari a Hexadecimal
En lloc de passar a decimal i tornar a convertir, s'agrupa el binari de **4 en 4 bits** de dreta a esquerra i es tradueix directament amb la taula ([vídeo explicatiu](https://www.youtube.com/watch?v=tSLKOKGQq0Y)).
- _Exemple:_ $110011001_2 \rightarrow (1)_2 \mid (1001)_2 \mid (1001)_2 \rightarrow 199_{16}$.

En aquest apartat trobaràs l'[exercici 5](../exercicis/ex5-binari-a-hexadecimal.md) per practicar.

### C. De Hexadecimal a Binari
Per passar de **hexadecimal a binari**, convertim **cada dígit hexadecimal en 4 bits** ([vídeo explicatiu](https://www.youtube.com/watch?v=D_YC6DSPpQEY)).
 - _Exemple:_  $2A3F_{16}$
Recordem:
- $2 = 0010$
- $A = 1010$
- $3 = 0011$
- $F = 1111$
Per tant, ajuntem tots els grups: $2A3F_{16}$ = $0010101000111111_{2}$

En aquest apartat trobaràs l'[exercici 6](../exercicis/ex6-hexadecimal-a-binari.md) per practicar.

## Operaciones lògiques

Operacions i portes lògiques, i també l'Àlgebra de Boole, en aquest [document](./a1-bloc1-portes-logiques.pdf). El resum seria:

| **A** | **B** | **A OR B** | **A AND B** | **A XOR B** | **NOT B** | **A NOR B** | **A NAND B** |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 0 | 0 | 0 | 0 | 0 | 1 | 1 | 1 |
| 0 | 1 | 1 | 0 | 1 | 0 | 0 | 1 |
| 1 | 0 | 1 | 0 | 1 | 1 | 0 | 1 |
| 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 |

OR (1 si almenys un dels bits és 1)

AND (1 només si tots dos bits són 1)

XOR (1 només si tots dos bits són diferents)

NOT (Inverteix cada bit)

NAND (Invers de l'operació AND)

NOR (Invers de l'operació OR)

En aquest apartat trobaràs l'[exercici 7](../exercicis/ex7-portes-logiques.md) per practicar.

# Unitats de mesura d'informació i conversió

Per a més [informació](https://es.wikipedia.org/wiki/Categor%C3%ADa:Unidades_de_informaci%C3%B3n). Aquí un resum del què ens interessa:
- **Bit ($1 \text{ bit}$):** Unitat mínima d'informació (valors $0$ o $1$).
- **Byte ($1 \text{ byte} = 8 \text{ bits}$):** Unitat bàsica d'emmagatzematge.
- **Paraula ($1 \text{ paraula} = 2 \text{ bytes} = 16 \text{ bits}$):** Conjunt de bits que la CPU processa d'una sola passada.

## Taula d'unitats

Segons el sistema decimal (potències de base 10), la relació entre les diferents unitats és la següent:

* **1 bit (b)** = $1 \text{ bits}$
* **1 Byte (B)** = $8 \text{ bits}$
* **1 Kilobyte (KB)** = $10^3 \text{ Bytes} = 1.000 \text{ Bytes}$
* **1 Megabyte (MB)** = $10^6 \text{ Bytes} = 1.000.000 \text{ Bytes}$
* **1 Gigabyte (GB)** = $10^9 \text{ Bytes}$
* **1 Terabyte (TB)** = $10^{12} \text{ Bytes}$
* **1 Petabyte (PB)** = $10^{15} \text{ Bytes}$
* **1 Exabyte (EB)** = $10^{18} \text{ Bytes}$
* **1 Zettabyte (ZB)** = $10^{21} \text{ Bytes}$
* **1 Yottabyte (YB)** = $10^{24} \text{ Bytes}$

>**Dades reals:** En el sistema decimal fem servir potències de $1000$ ($10^3$), però en arquitectura d'ordinadors s'utilitza la base binària, on $1 \text{ KB real} = 2^{10} = 1024 \text{ Bytes}$. Per simplificar els càlculs manuals s'acostuma a aproximar per $1000$, però quan es busca precisió es fa servir el $1024$.

## Conversions

Per passar d'una unitat a una altra utilitzem el factor de conversió corresponent:

1. **De Bits a Bytes (o viceversa):**
   * Per passar de **bits a Bytes** $\rightarrow$ **Dividim entre 8** ($\div 8$).
   * Per passar de **Bytes a bits** $\rightarrow$ **Multipliquem per 8** ($\times 8$).

2. **Entre escales de Bytes (KB, MB, GB...):**
   * Per passar d'una unitat **més gran a una més petita** $\rightarrow$ **Multipliquem per $10^3$ ($1.000$)** per cada salt d'escala.
   * Per passar d'una unitat **més petita a una més gran** $\rightarrow$ **Dividim entre $10^3$ ($1.000$)** per cada salt d'escala.


### Exemples

1) Quant són **450 KB** expressat en **B**?

* **Explicació:** Com que passem de **KB** a **b**, multipliquem per $10^3$ ($1.000$).
* **Operació:**
  $$450 \text{ KB} = 450 \cdot 10^3 \text{ Bytes} = \mathbf{450.000 \text{ Bytes}}$$

2) Quant són **25 GB** expressats en **B**?

* **Explicació:** De **GB** a **B** hi ha 3 salts d'escala ($\text{GB} \rightarrow \text{MB} \rightarrow \text{KB} \rightarrow \text{B}$), per tant multipliquem per $10^9$.
* **Operació:**
  $$25 \text{ GB} = 25 \cdot 10^9 \text{ Bytes} = \mathbf{25.000.000.000 \text{ Bytes}}$$

3) Quant són **16 GB** a **b**?

* **Explicació:** Primer passem de **GB a Bytes**, multipliquem per $10^9$. Després passem de **B** a **b**, multipliquem per $8$.

* **Operació:**
  $$16 \text{ GB} = 16 \cdot 10^9 \text{ Bytes}$$
  $$16 \cdot 10^9 \text{ Bytes} \cdot 8 = \mathbf{128 \cdot 10^9 \text{ bits}} = \mathbf{128.000.000.000 \text{ bits}}$$

4) Quants **GB** són **320.000.000.000 b**?

* **Explicació:** Convertim de **b** a **B**, dividint entre $8$. Després convertim de **B** a **GB**: Dividim entre $10^9$.

* **Operació:**
  $$\text{Passar a Bytes:} \quad \frac{320 \cdot 10^9 \text{ bits}}{8} = 40 \cdot 10^9 \text{ Bytes}$$
  $$\text{Passar a GB:} \quad \frac{40 \cdot 10^9 \text{ Bytes}}{10^9} = \mathbf{40 \text{ GB}}$$

  En aquest apartat trobaràs l'[exercici 8](../exercicis/ex8-unitats-emmagatzematge.md) per practicar.
  
En aquest apartat trobaràs l'[exercici 9](../exercicis/ex9-velocitats-transferencia.md) per ampliar la pràctica.

En aquest apartat trobaràs l'[exercici 10](../exercicis/ex10-complementar.md) per complementar.