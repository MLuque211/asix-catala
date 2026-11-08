# Projecte 4: Virtualització

## Objectius
L'objectiu principal d'aquesta pràctica és estudiar tot allò que està relacionat amb la virtualització de sistemes operatius mitjançant el desenvolupament d'una sèrie de tasques.

## Competències professionals, personals i socials
* Administrar sistemes operatius de servidor, instal·lant i configurant el programari, en condicions de qualitat per assegurar el funcionament del sistema.
* Optimitzar el rendiment del sistema configurant els dispositius maquinari d'acord amb els requisits de funcionament.

## Requeriments
* VirtualBox
* ISO de Windows 10
* ISO d'Ubuntu Desktop 18

## Enunciat

### Apartat A. Preparació de l'entorn

#### Instal·lació de VirtualBox
* Suposem que ja teniu instal·lat VirtualBox, sinó instal·la'l.
* Instal·leu la Extension Pack de VirtualBox que us donarà suports extres.
* Configura, si no ho tens, la carpeta per defecte de les teves màquines virtuals perquè apunti a la partició "Dades" que vam crear el dia de la instal·lació. Crea una carpeta que s'anomeni `Virtual MachinesM1` i desa aquí totes les màquines que farem servir a Implantació de Sistemes Operatius.

#### Coneixement de VirtualBox
* Hauries de fer una ullada al tutorial de VirtualBox que tens al campus virtual per a tenir clar totes les opcions disponibles.

#### Adquirir una llicència de Windows 10 o superior
Pots baixar una ISO de Windows 10 a:  
[https://www.microsoft.com/es-es/software-download/windows10ISO](https://www.microsoft.com/es-es/software-download/windows10ISO)

#### Adquirir una llicència d'Ubuntu Desktop 18 o superior
Pots baixar una ISO des del web oficial d'UBUNTU.

### Apartat B. Teoria de virtualització
Has de realitzar aquest apartat mentres s'instal·len les màquines virtuals, ja que triga una mica el procés d'instal·lació.

Contesta a les següents preguntes teòriques:
1. Què és virtualitzar un sistema?
2. Quins són els beneficis de la virtualització?
3. Quins són els inconvenients de la virtualització?
4. Quin programari existeix per virtualitzar?

### Apartat C. Instal·lació d'un sistema operatiu propietari
Documenta amb captures de pantalla i les explicacions necessàries tot el procés que vas a seguir per a realitzar la instal·lació:

* Exposa a una taula els requeriments mínims i recomanats de maquinari que té el Sistema Operatiu.
* Quanta memòria RAM i capacitat de disc dur podem utilitzar al nostre sistema per obtenir un rendiment òptim? Configura les opcions del VirtualBox per optimitzar el rendiment d'aquesta màquina virtual.
* Utilitza les opcions per defecte durant la instal·lació.
* Un cop acabada la instal·lació, instal·la les Guest Additions.
* Deshabilitarem l'actualització de WINDOWS 10 mitjançant el Servei de Windows Update deshabilitant el servei de Windows.
* Quant ja ho tinguis tot, exporta la màquina virtual i posa-li com a nom `W10Base`, així tindrem una màquina enllestida per poder fer altres pràctiques.

### Apartat D. Instal·lació d'un sistema operatiu lliure
Documenta amb captures de pantalla i les explicacions necessàries tot el procés que vas a seguir per a realitzar la instal·lació:

* Exposa a una taula els requeriments mínims i recomanats de maquinari que té el Sistema Operatiu.
* Quanta memòria RAM i capacitat de disc dur podem utilitzar al nostre sistema per obtenir un rendiment òptim? Configura les opcions del VirtualBox per optimitzar el rendiment d'aquesta màquina virtual.
* Utilitza les opcions per defecte durant la instal·lació.
* Un cop acabada la instal·lació, instal·la les Guest Additions.
* Quant ja ho tinguis tot, exporta la màquina virtual i posa-li com a nom `UbuntuDesk18Base`, així tindrem una màquina enllestida per poder fer altres pràctiques.

### Apartat E. Arrencada DUAL
Documenta amb captures de pantalla i les explicacions necessàries tot el procés que vas a seguir:

1. Crea una nova màquina virtual Windows 10.
2. Instal·leu ara Ubuntu 18 sobre aquesta màquina.
3. Amb els dos sistemes instal·lats, fes que aparegui el menú del Grub per poder seleccionar de quin disc volen arrencar la màquina.