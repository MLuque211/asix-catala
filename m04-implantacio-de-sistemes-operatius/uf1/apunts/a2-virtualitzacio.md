# Virtualització de sistemes informàtics
La **virtualització** consisteix en la simulació dels recursos d'una màquina física per crear entorns virtuals independents. Mitjançant un programari especialitzat (**virtualitzador**), és possible compartir una única màquina física per executar múltiples màquines virtuals simultàniament.

## 1. Conceptes fonamentals i funcionament
Una **màquina virtual (MV)** és un programari que emula un ordinador real, permetent executar sistemes operatius i aplicacions com si es tractés d'un equip físic.

* **Capa d'abstracció:** El virtualitzador crea una interfície entre el maquinari físic i la màquina virtual, assignant recursos virtuals (CPU, RAM, xarxa).
* **Arquitectura Amfitrió / Convidat:**
  * **Sistema Amfitrió (*Host*):** És el sistema operatiu base instal·lat a la màquina física.
  * **Sistema Convidat (*Guest*):** Sistema operatiu instal·lat dins de la màquina virtual.
* **Emmagatzematge i Xarxa:** Es crea un disc virtual (un fitxer dins el disc real) on es pot particionar i instal·lar el SO convidat. El programari assigna adreces IP i crea targetes Ethernet virtuals per a la seva connexió.

## 2. Avantatges i inconvenients

### Avantatges
* **Aprofitament de recursos:** Permet executar múltiples màquines virtuals en un sol equip físic, compartint CPU, memòria, disc i xarxa.
* **Flexibilitat i portabilitat:** Les màquines virtuals són independents del maquinari real i es poden traslladar fàcilment d'un amfitrió a un altre.
* **Coexistència de SO:** Permet tenir diferents sistemes operatius funcionant alhora. La instal·lació d'un SO en una MV és idèntica a fer-ho en un equip real.

### Inconvenients
* **Penalització del rendiment:** Les aplicacions o sistemes operatius que s'executen dins d'una màquina virtual solen tenir un rendiment inferior a causa de la sobrecàrrega de la capa de virtualització.

## 3. Tipus de virtualització
Segons el grau d'equivalència amb una màquina real, trobem dos enfocaments principals:

### A. Virtualització de procés (o d'aplicació)
Només es virtualitzen determinats processos o aplicacions per oferir un entorn d'execució independent de la plataforma i del sistema operatiu base.

* La màquina virtual s'inicia en llançar el procés i es tanca quan aquest finalitza.
* Garanteix que el programa s'executi sempre igual sobre qualsevol plataforma.
* **Exemples:** Màquina Virtual de Java (JVM), entorn .NET de Microsoft, Macromedia Flash Player (SWF).

### B. Virtualització de sistema
Permet allotjar un sistema operatiu convidat complet. La màquina física es divideix en diverses màquines virtuals, cadascuna executant el seu propi SO.

* **Hipervisor / Monitor de Màquina Virtual (MMV):** És la capa de programari encarregada de gestionar i distribuir els quatre recursos principals:
  1. CPU
  2. Memòria
  3. Xarxa
  4. Emmagatzematge

## 4. Distribucions i programari
* **VirtualBox:** Programari lliure, molt lleuger, fàcil d'utilitzar i amb suport per a múltiples plataformes (incloent-hi Linux).

* **VMware:** Solució molt ràpida i robusta. Disposa de versions per a Linux i opcions gratuïtes.
* **Virtual PC:** Optimitzat per a sistemes Windows (versió 2007 gratuïta), tot i que presenta menys compatibilitat amb altres SO.
* **QEMU:** Programari lliure per a Linux que no disposa d'entorn gràfic per defecte.
* **Xen:** Desenvolupat per la Universitat de Cambridge, és un hipervisor gratuït i de codi obert.

# Configuració de Xarxes a VirtualBox
VirtualBox ofereix diferents modes de xarxa per adaptar-se a les necessitats de connectivitat de cada entorn, permetent des de l'aïllament complet fins a la integració total dins d'una xarxa local real.

## 1. Modes de Xarxa

### A. NAT (Network Address Translation)
És la configuració per defecte. VirtualBox actua com un router virtual creant una xarxa privada interna (normalment en el rang `10.0.2.x`).

* **Funcionament:** La màquina virtual pot sortir a Internet a través de la connexió del *host*, però no pot rebre connexions entrants de l'exterior.
* **Avantatges:** Fàcil, segur i de configuració immediata.
* **Inconvenients:** No es pot accedir a la MV des de la xarxa local (llevat que es configureu reexpedició de ports / *port forwarding*).
* **Ús típic:** Navegació bàsica, descàrrega d'actualitzacions i tasques de client.

### B. Adaptador pont (*Bridged Adapter*)
La màquina virtual es connecta directament a la interfície de xarxa física de l'amfitrió, comportant-se com un dispositiu físic addicional dins de la mateixa xarxa LAN.

* **Funcionament:** El router real de la xarxa assigna una adreça IP pròpia a la MV.
* **Avantatges:** Totalment visible des de la xarxa física (permet *ping*, SSH, compartir carpetes, etc.). Per a més informació sobre compartir carpetes i arxius: [compartir en VirtualBox](https://geekland.eu/compartir-carpetas-y-archivos-en-virtualbox/)
* **Inconvenients:** Pot requerir permisos especials en xarxes corporatives i està més exposada a amenaces de seguretat.
* **Ús típic:** Desplegament de servidors (web, fitxers, etc.) accessibles per altres equips de la xarxa.

### C. Xarxa NAT (*NAT Network*)
És una variant del mode NAT dissenyada per interconnectar múltiples màquines virtuals entre si.

* **Funcionament:** Crea una xarxa privada compartida (per exemple, `10.0.2.0/24`) on totes les MV connectades poden comunicar-se entre elles i, alhora, tenir accés a Internet.
* **Avantatges:** Interconnexió interna entre MV amb accés exterior i mantenint l'aïllament respecte a la LAN real.
* **Inconvenients:** No és accessible des de la xarxa física sense *port forwarding*.
* **Ús típic:** Laboratoris amb entorns client-servidor o clústers que requereixen Internet.

### D. Xarxa interna (*Internal Network*)
Crea un entorn de xarxa 100% privat i aïllat dins de VirtualBox.

* **Funcionament:** El trànsit està restringit exclusivament a les màquines virtuals que comparteixin el mateix nom de xarxa interna.
* **Avantatges:** Aïllament total i control absolut del trànsit.
* **Inconvenients:** Sense accés a Internet ni comunicació amb la màquina amfitriona.
* **Ús típic:** Proves de seguretat (*pentesting*), simulació de xarxes corporatives privades i proves de programari maliciós.

### E. Només amfitrió (*Host-Only Adapter*)
Estableix una xarxa privada exclusiva entre la màquina amfitriona i les màquines virtuals.

* **Funcionament:** VirtualBox crea una interfície de xarxa virtual a l'amfitrió (com `vboxnet0`) que connecta directament amb la subxarxa de la MV.
* **Avantatges:** Permet la comunicació bidireccional directa entre el *host* i la MV sense exposar-les a la xarxa real.
* **Inconvenients:** Sense accés a Internet (llevat que s'afegeixi un segon adaptador en mode NAT).
* **Ús típic:** Entorns de desenvolupament local on es necessita accedir a la MV via SSH o web des del propi PC.

## 2. Taula comparativa de modes de xarxa

| Mode | Accés a Internet | Comunicació amb Host | Comunicació entre VMs | Visible a la LAN real | 
| :---: | :---: | :---: | :---: | :---: | 
| **NAT** | Sí | Limitat (*port forwarding*) | No | No | 
| **Xarxa NAT** | Sí | Limitat (*port forwarding*) | Sí | No | 
| **Adaptador Puente** | Sí | Sí | Sí | Sí | 
| **Xarxa Interna** | No | No | Sí | No | 
| **Només Amfitrió** | No | Sí | Sí | No | 

# Configuració d'arrencada dual (*Dual Boot*) en màquina virtual
L'**arrencada dual** permet instal·lar dos o més sistemes operatius en el mateix disc virtual i triar quin d'ells s'executarà durant l'arrencada de la màquina virtual. Aquesta tècnica és ideal per provar la interacció i convivència de múltiples sistemes (com Windows i Linux) en un entorn completament aïllat.

## Pas a pas del procés d'instal·lació
* **Pas 1: Creació i preparació de la màquina virtual base**
  * Es crea una nova màquina virtual a VirtualBox i s'hi instal·la el primer sistema operatiu, en aquest cas **Windows 11** (per exemple, `w11NEW`).
  * Es comprova que el sistema s'executi correctament abans de procedir amb la instal·lació del segon sistema.

* **Pas 2: Assignació del segon mitjà d'instal·lació (ISO)**
  * Amb la màquina virtual apagada, s'accedeix a la secció de configuració d'**Emmagatzematge** (*Storage*).
  * Es prioritza o s'afegeix un segon disc òptic virtual amb la imatge ISO del segon sistema operatiu (ex: `ubuntu-18.04.6-desktop-amd64.iso`).

* **Pas 3: Instal·lació del segon sistema operatiu (Ubuntu 18)**

  * S'inicia la màquina virtual des de la imatge ISO d'Ubuntu.
  * Es procedeix a la instal·lació d'Ubuntu al costat del sistema operatiu existent, la qual cosa reconfigura l'esquema de particions del disc virtual.

* **Pas 4: Gestor d'arrencada GNU GRUB**

    Per a més informació: [GRUB documentation](https://www.gnu.org/software/grub/grub-documentation.html)

  * Durant la instal·lació d'Ubuntu, s'instal·la el gestor d'arrencada **GNU GRUB** en el sector d'arrencada del disc virtual.
  * En reiniciar la màquina virtual, apareix automàticament el menú del GRUB que permet a l'usuari seleccionar quin sistema vol iniciar:
    * **Ubuntu:** Opció per defecte per iniciar el sistema Linux.
    * **Windows Boot Manager:** Opció per arrencar el sistema Windows 11.

## Gestor d'arrencada: GRUB 2
El **GRUB** (*GRand Unified Bootloader*) és el primer programa que es carrega quan s'arrenca l'ordinador. Permet seleccionar quin sistema operatiu o kernel iniciar quan n'hi ha diversos instal·lats.

> **MOLT IMPORTANT:** Qualsevol modificació en els fitxers de configuració del GRUB requereix executar la comanda següent per aplicar els canvis al fitxer generat `/boot/grub/grub.cfg`:
> ```bash
> sudo update-grub2
> ```

### Fitxers principals de configuració
* `/etc/default/grub`: Fitxer principal per ajustar opcions generals (temps d'espera, entrada per defecte, etc.).
* `/etc/grub.d/`: Directori amb els scripts i configuracions específiques:
  * `10_linux`: S'encarrega de detectar el nucli Linux principal.
  * `05_debian_theme`: Configuració de colors i temes visuals.
  * `30_os-prober`: S'encarrega de detectar altres sistemes operatius (Windows, altres distribucions Linux, macOS).
  * `40_custom`: Permet afegir entrades personalitzades manualment.
* `/boot/grub/grub.cfg`: Fitxer final llegit durant l'arrencada (**No s'ha d'editar directament**).

### Configuracions freqüents a `/etc/default/grub`

1. **Fer visible el menú d'arrencada:**
   Si només hi ha un sistema operatiu, el menú se sol amagar. Per mostrar-lo, cal comentar la línia següent afegint una `#`:
   ```bash
   #GRUB_HIDDEN_TIMEOUT=0
   ```

2. **Canviar el temps d'espera (Timeout):**
   ```bash
   GRUB_TIMEOUT=10   # Espera 10 segons abans d'arrencar per defecte
   ```

3. **Canviar el sistema operatiu per defecte:**
   ```bash
   GRUB_DEFAULT=0     # 0 és la primera entrada, 1 la segona, etc.
   GRUB_DEFAULT=saved # Carrega l'últim sistema operatiu seleccionat
   ```

4. **Desactivar el mode de recuperació (*Recovery Mode*):**
   ```bash
   GRUB_DISABLE_LINUX_RECOVERY="true"
   ```

### Personalització visual del GRUB

#### 1. Canviar el nom d'Ubuntu al menú
Dins del fitxer `/etc/grub.d/10_linux`:
* Pots afegir text personalitzat directament o utilitzar variables per afegir informació de la versió:
  ```bash
  codename=$(lsb_release -cs)
  linux_entry "${OS} ${codename}"
  ```

#### 2. Canviar la imatge de fons
1. La imatge ha d'estar en format `.png` i amb resolució adequada (p. ex., 640x480 o 1024x768).
2. Nomenar la imatge com `moreblue-orbit-grub.png` i copiar-la a `/boot/grub/`.
3. Atorgar permisos i actualitzar:
   ```bash
   sudo chmod 777 /boot/grub/moreblue-orbit-grub.png
   sudo update-grub2
   ```

#### 3. Canviar els colors del text
Al fitxer `/etc/grub.d/05_debian_theme`, editar les línies corresponents al fons:
```bash
set color_normal=black/black       # text_normal / fons
set color_highlight=magenta/black   # text_seleccionat / fons_seleccionat
```
*Colors disponibles:* `red`, `green`, `blue`, `yellow`, `cyan`, `magenta`, `white`, `black`.

### Gestió d'entrades i sistemes operatius

#### Afegir manualment un sistema operatiu (Ex: Windows)
Al fitxer `/etc/grub.d/40_custom`, afegir el bloc de configuració indicant el disc i partició correctats:
```bash
menuentry "Windows 7 (en hd0,1)" {
    insmod ntfs
    set root='(hd0,1)'
    chainloader +1
}
```
*Nomenclatura de discs a GRUB:*
* `(hd0,1)` = Primera partició primària del primer disc dur (`sda1`).
* `(hd0,2)` = Segona partició primària del primer disc (`sda2`).
* `(hd1,1)` = Primera partició primària del segon disc (`sdb1`).
* `(hd0,5)` = Segona partició lògica del primer disc (`sda5`).

#### Amagar entrades duplicades o no desitjades
* **Memtest86+:** Treure el permís d'execució al script corresponent:
  ```bash
  sudo chmod -x /etc/grub.d/20_memtest86+
  sudo update-grub2
  ```
* **Entrades automàtiques de Windows:** Comentar la secció corresponent a Windows dins de `/etc/grub.d/30_os-prober`.

# Instal·lació de VirtualBox Guest Additions en Windows
Les **Guest Additions** són un conjunt d'eines i controladors (*drivers*) especials que s'instal·len dins del sistema operatiu convidat per optimitzar-ne el rendiment i millorar la interacció amb el sistema amfitrió. Es poden descarregar en aquest [enllaç](https://download.virtualbox.org/virtualbox) de la pàgina oficial. L'última versió actual és la **7.2.22/**

## Principals avantatges
* **Resolució de pantalla adaptable:** Permet un ajust automàtic de la mida de la pantalla i habilita l'ús del mode a pantalla completa.
* **Integració del ratolí:** Proporciona un moviment del punter molt més fluid i transparent entre el sistema amfitrió i la màquina virtual.
* **Portapapers compartit:** Permet copiar i enganxar text o fitxers directament entre l'amfitrió i el convidat (cal activar la funció a la configuració).
* **Carpetes compartides:** Facilita l'accés directe des del sistema convidat a directoris o carpetes de l'ordinador amfitrió.

## Procediment d'instal·lació en windows
1. **Inserir la imatge:** Amb la màquina virtual Windows en funcionament, cal anar al menú superior de VirtualBox, seleccionar **Dispositius** (*Devices*) i fer clic a **«Insereix la imatge de CD de les Guest Additions»** (*Insert Guest Additions CD image*).
2. **Executar l'instal·lador:** Obrir l'Explorador de fitxers de Windows, anar a **Aquest equip**, obrir la unitat de CD virtual carregada i executar el fitxer `VBoxWindowsAdditions.exe` (si és necessari, amb clic dret i *Executa com a administrador*).
3. **Completar l'assistent:** Seguir els passos de l'assistent d'instal·lació premi **Següent** (*Next*), mantenir les opcions per defecte i fer clic a **Instal·lar** (*Install*). Si Windows sol·licita autorització per a instal·lar controladors de dispositiu, cal acceptar-la.
4. **Finalitzar i reiniciar:** Un cop completat el procés, fer clic a **Finalitzar** (*Finish*) i reiniciar la màquina virtual per aplicar els canvis.

> **Nota:** Si la unitat de CD virtual no apareix automàticament a l'explorador de fitxers, cal tornar al menú **Dispositius** i reintentar l'opció d'inserir la imatge.

# Instal·lació de VirtualBox Guest Additions en Ubuntu (Ubuntu 20.04 LTS)
Les **Guest Additions** per a Ubuntu es fa seguint els següents passos d'aquest [enllaç](https://linuxconfig.org/virtualbox-install-guest-additions-on-ubuntu-20-04-lts-focal-fossa).

La manera més fàcil d'instal·lar les VirtualBox Guest Additions a Ubuntu 20.04 LTS Focal Fossa és instal·lant els següents paquets des del repositori estàndard d'Ubuntu:
1. `sudo add-apt-repository multiverse`
2. `sudo apt install virtualbox-guest-dkms virtualbox-guest-x11`
3. Tot fet. Reinicia la teva màquina virtual
4. `sudo reboot`
5. Confirma les VirtualBox Guest Additions
6. `lsmod | grep vbox`

---
## Projecte nº4
Per posar en pràctica tots els conceptes d'aquest bloc, realitza el [Projecte nº 4](../practiques/a2-projecte4.md).
---
