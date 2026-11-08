# Etapes d'Implantació d'un Sistema Informàtic

## Esquema General de les Etapes
1. **Definició de requeriments**
2. **Anàlisi del sistema informàtic**
3. **Disseny del sistema informàtic**
4. **Implantació i posada en marxa**

## 1. Definició de Requeriments
* Etapa crítica per a aconseguir amb èxit l'objectiu final.
* Determinar quin problema tenim / quins requisits marca el client.
* Comunicació fluida i constant amb el client.
* Tenir en compte la tipologia d'empresa i les condicions inicials (petita empresa, multinacional, etc.).

## 2. Anàlisi del Sistema Informàtic (Anàlisi de Requisits)
* Elaborar la llista de condicions que el sistema ha de complir.
* Determinar quins dispositius farem servir (*hardware* / *software*).
* Definir com es relacionen aquests dispositius (com els interconnectarem).
* Disseny lògic de la xarxa: cable, fibra, Wi-Fi.

## 3. Disseny del Sistema Informàtic
S'ha de determinar:

* Els components de màquina i programari.
* Els components de xarxa (routers, switches, tipus de cable, connectors, etc.) $\rightarrow$ **disseny físic de la xarxa**.
* Programari base (Linux, Windows).
* Programari de treball.
* Proveïdors i tercers.
* Calendari d'implantació.
* Pressupost.

## 4. Implementació i Posada en Marxa del Sistema Informàtic
* Realitzar la compra del material.
* Realitzar la instal·lació del maquinari i programari.
* Posada en marxa de la xarxa.
* Prova integral del sistema (proves d'estrès).
* Formació dels usuaris.
* Entrega del producte final i documentació.

## Documentació
La documentació del projecte ha d'incloure:

1. **Objectiu del projecte**
2. **Anàlisi de la situació actual**
3. **Propostes tècniques:**
   * Mapa lògic i físic de la xarxa.
   * Maquinari i programari, amb atenció especial als Sistemes Operatius.
4. **Pressupost i recursos:** usuaris, manteniment, empreses externes, etc.

## Manteniment
* **Manteniment correctiu:** Corregir defectes en el programari.
* **Manteniment perfectiu:** Introduir millores en el programari.
* **Manteniment preventiu:** Millorar el rendiment del programari.
* **Manteniment adaptatiu:** Adaptar el maquinari i el programari a un canvi de l'entorn.

# Mapa físic vs. Mapa lògic d'una xarxa

En l'àmbit de la implantació i administració de sistemes informàtics, la documentació de la xarxa es divideix en dues visions complementàries: el **mapa físic** i el **mapa lògic**.

## 1. Mapa físic de xarxa

El **mapa físic** mostra la ubicació real i la disposició tangible de tots els elements que componen la infraestructura de xarxa. Respon a la pregunta: **"On estan les coses i com estan connectades físicament?"**

### Característiques principals:
* **Ubicació espacial:** Representa plànols d'oficines, sales de servidors (CPD), armaris de cablejat (*racks*) i la distribució per plantes o habitacions.
* **Maquinari físic:** Identifica la posició exacta de routers, switches, patch panels, punts d'accés Wi-Fi, servidors i ordinadors de treball.
* **Cablejat i connexions:** Detalla el recorregut dels cables (Ethernet Cat 6/6A, fibra òptica), els tipus de connectors (RJ-45, LC-LC) i els camins de cablejat (canaletes, fals sostre).

### Exemple d'ús:
Útil per a tècnics d'instal·lació, personal de manteniment o per planificar obres i canvis de llocs de treball.

## 2. Mapa lògic de xarxa

El **mapa lògic** mostra com flueixen les dades i com s'organitzen els dispositius a nivell de programari i protocols, independentment de la seva ubicació física. Respon a la pregunta: **"Com es comuniquen les dades entre si?"**

### Característiques principals:
* **Adreçament IP:** Detalla les direccions IP de cada equip, les màscares de xarxa (`/24`, `/16`) i la IP del gateway (porta d'enllaç).
* **Segmentació (VLANs):** Mostra la divisió virtual de la xarxa per departaments o serveis (ex: VLAN 10 Compravendes, VLAN 40 TI).
* **Topologia de xarxa:** Descriu l'estructura conceptual de la comunicació (estrella, arbre, malla, Spine-Leaf).
* **Protocols i Seguretat:** Identifica zones de seguretat, regles de firewall, taules d'enrutament, servidors DHCP/DNS i rutes de tràfic.

### Exemple d'ús:
Útil per a administradors de xarxa i experts en seguretat per a configurar equips, gestionar permisos, aïllar incidències o aplicar polítiques de tràfic.

## Resum comparatiu

| Aspecte | Mapa Físic | Mapa Lògic |
| :---: | :---: | :---: |
| **Enfocament** | Ubicació i elements tangibles. | Tràfic de dades i configuració. |
| **Components claus** | Cables, armaris *rack*, ports, llocs de treball. | Adreces IP, VLANs, màscares, rutes. |
| **Representació** | Plànols d'edificis, esquemes de cablatge. | Diagrames de flux, topologies (p. ex. Packet Tracer). |
| **Utilitat principal** | Instal·lació, reparació física i manteniment. | Administració, seguretat i diagnòstic de xarxa. |

> **Nota:** Ambdós mapes són imprescindibles en qualsevol projecte d'implantació informàtica per garantir un manteniment eficient i una resolució d'incidències ràpida.


## Projecte nº6
Realitza el [Projecte nº 6](../practiques/a4-projecte6.md).