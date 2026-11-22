## Exercici 12. Restriccions implementables i no implementable
Classifica les regles següents:
1. La data de devolució ha de ser posterior o igual a la data de préstec.
2. No hi pot haver dos alumnes amb el mateix número d’expedient.
3. Cada matrícula ha de referenciar un alumne existent.
4. Un alumne no pot reservar més de dues aules en la mateixa franja horària.
5. Només el responsable de departament pot aprovar una compra superior a 1.000 euros.
Indica per a cada una si la implementaries amb `PRIMARY KEY`, `UNIQUE`, `FOREIGN KEY`, `CHECK`, trigger, aplicació, permisos o una combinació.

<details>
<summary><b>🔍 Veure respostes</b></summary>

1) Implementable directament (CHECK): Es valida a nivell de fila amb una restricció de tipus CHECK (data_devolucio >= data_prestec).

2) Implementable directament (PRIMARY KEY o UNIQUE): Si el número d'expedient és l'identificador principal de l'alumne, es defineix com a PRIMARY KEY. Si s'usa un altre ID com a clau primària, es defineix com a restricció UNIQUE.

3) Implementable directament (FOREIGN KEY): Es garanteix la integritat referencial definint una clau forana (FOREIGN KEY (id_alumne) REFERENCES alumne(id_alumne)).

4) Mecanisme avançat (Trigger o Lògica d'aplicació): Com que requereix consultar i comptar registres d'altres files de la taula en una franja horària concreta, no es pot resoldre amb un CHECK simple. Cal implementar un BEFORE INSERT trigger o bé validar-ho en el codi de l'aplicació.

5) Mecanisme avançat (Permisos de BD, Triggers o Lògica d'aplicació): Requereix la combinació de validació de rols/usuaris i un llindar numèric. Es pot gestionar mitjançant la gestió de rols i permisos (GRANT) a la BD, un trigger de comprovació de rol abans de l'actualització/inserció, o directament en la lògica de negoci de l'aplicació.

</details>