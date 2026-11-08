# Primer contacte amb la terminal de Linux

## 1. Objectiu
Abans de començar el projecte de gestió de processos, aprendrem a utilitzar la terminal de Linux.

En aquesta activitat aprendràs a:
* Obrir una terminal.
* Escriure i executar una comanda.
* Interpretar el resultat d'una comanda.
* Utilitzar algunes comandes senzilles.
* Identificar quan una comanda produeix un resultat o un error.

> *Nota:* En aquesta activitat no treballarem encara amb processos.

## 2. La terminal
La terminal és una aplicació que permet donar ordres a l'ordinador escrivint-les. Quan obres la terminal veuràs una línia semblant a:

```bash
alumne@ordinador:~$
```

Aquesta línia (*prompt*) indica que la terminal està preparada per rebre una ordre.

**Per executar una ordre:**
1. Escriu-la.
2. Prem `Enter`.
3. Observa el resultat.

*Exemple:*
```bash
date
```

## 3. Anem a provar-ho
Executa les ordres següents, una per una, i observa què passa.

* **Comanda 1**
  ```bash
  date
  ```
  Aquesta comanda mostra la data i l'hora actuals.

* **Comanda 2**
  ```bash
  whoami
  ```
  Aquesta comanda mostra quin usuari està utilitzant la terminal.

* **Comanda 3**
  ```bash
  hostname
  ```
  Aquesta comanda mostra el nom de l'ordinador.

* **Comanda 4**
  ```bash
  echo Hola Linux
  ```
  Aquesta comanda fa que la terminal mostri per pantalla el text que li indiquem.

  *Prova també:*
  ```bash
  echo Estic aprenent a utilitzar la terminal
  ```

* **Comanda 5**
  ```bash
  clear
  ```
  Observa què passa amb la pantalla.  
  *Important:* Aquesta comanda no elimina res. Simplement neteja la informació que es mostra a la terminal.

## 4. Què passa si ens equivoquem?
Prova d'escriure:
```bash
holamon
```
Prem `Enter`. Apareixerà un missatge d'error.

No passa res. Quan Linux mostra un error, no significa necessàriament que hàgim fet malbé res. Normalment significa que l'ordre que hem escrit no és correcta o no existeix.

Ara torna a executar:
```bash
date
```
Comprova que la terminal continua funcionant amb normalitat.

## 5. Una mica de pràctica
Ara intenta executar les ordres següents sense copiar-les directament del text anterior:
* Mostra la data i l'hora.
* Mostra quin usuari està utilitzant la terminal.
* Mostra el nom de l'ordinador.
* Mostra per pantalla el teu nom utilitzant `echo`.
* Neteja la pantalla.

## 6. Preguntes
Respon amb les teves paraules:

1. Què és una terminal?
2. Què hem de fer després d'escriure una comanda per executar-la?
3. Quina comanda utilitzaries per saber quin usuari està utilitzant la terminal?
4. Quina comanda utilitzaries per saber el nom de l'ordinador?
5. Què passa quan executes una comanda que Linux no coneix?
6. Quina diferència hi ha entre escriure una comanda i executar-la?

<details>
<summary><b>🔍 Veure respostes</b></summary>

1. **Què és una terminal?**  
   És una interfície de text (interfície de línia d'ordres o CLI) que permet interactuar amb el sistema operatiu i donar-li ordres directament escrivint comandes.

2. **Què hem de fer després d'escriure una comanda per executar-la?**  
   Premer la tecla `Enter` (o Retorn) del teclat.

3. **Quina comanda utilitzaries per saber quin usuari està utilitzant la terminal?**  
   La comanda `whoami`.

4. **Quina comanda utilitzaries per saber el nom de l'ordinador?**  
   La comanda `hostname`.

5. **Què passa quan executes una comanda que Linux no coneix?**  
   El sistema mostra un missatge d'error indicant que l'ordre no s'ha trobat (*command not found*), però no fa cap dany al sistema i la terminal continua a punt per rebre noves ordres.

6. **Quina diferència hi ha entre escriure una comanda i executar-la?**  
   Escriure una comanda només la col·loca com a text al *prompt* de la pantalla; executar-la (prement `Enter`) fa que el sistema operatiu processi la comanda, en realitzi l'acció i en torni el resultat.

</details>

## 7. Abans de començar el projecte de processos
Quan hagis acabat aquesta activitat, has de ser capaç de:
* Obrir una terminal.
* Escriure una comanda.
* Executar-la amb `Enter`.
* Llegir el resultat.
* Identificar un missatge d'error.
* Tornar a escriure una nova comanda.