DROP DATABASE IF EXISTS act001_reserva_tutories;
CREATE DATABASE act001_reserva_tutories
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE act001_reserva_tutories;

CREATE TABLE alumne (
  id_alumne INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  nom VARCHAR(80) NOT NULL,
  cognoms VARCHAR(80) NOT NULL,
  email VARCHAR(100) NOT NULL,
  CONSTRAINT pk_alumne PRIMARY KEY (id_alumne)
) ENGINE=InnoDB;

CREATE TABLE assignatura (
  codi_assignatura VARCHAR(80) NOT NULL,
  nom VARCHAR(80) NOT NULL,
  nivell VARCHAR(80) NULL,
  CONSTRAINT pk_assignatura PRIMARY KEY (codi_assignatura)
) ENGINE=InnoDB;

CREATE TABLE tutor (
  id_tutor INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  nom VARCHAR(80) NOT NULL,
  email VARCHAR(100) NOT NULL,
  modalitat_treball VARCHAR(80) NOT NULL,
  CONSTRAINT pk_tutor PRIMARY KEY (id_tutor)
) ENGINE=InnoDB;

CREATE TABLE reserva (
  id_reserva INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  data_reserva DATE NOT NULL,
  hora_inici TIME NOT NULL,
  durada_minuts INT(10) UNSIGNED NOT NULL,
  canal VARCHAR(80) NOT NULL,
  estat VARCHAR(80) NOT NULL,
  codi_assignatura VARCHAR(80) NULL,
  id_alumne INT(10) UNSIGNED NOT NULL,
  id_tutor INT(10) UNSIGNED NOT NULL,
  CONSTRAINT pk_reserva PRIMARY KEY (id_reserva)
) ENGINE=InnoDB;

/* Alter tables */
ALTER TABLE alumne
  ADD CONSTRAINT uk_alumne_email UNIQUE (email),
  ADD CONSTRAINT ck_alumne_email CHECK (email LIKE '%@%.%');

ALTER TABLE tutor
  ADD CONSTRAINT uk_tutor_email UNIQUE (email),
  ADD CONSTRAINT ck_tutor_email CHECK (email LIKE '%@%.%'),
  ADD CONSTRAINT ck_tutor_modalitat_treball CHECK (modalitat_treball IN ('presencial', 'remot'));

ALTER TABLE reserva
  ADD CONSTRAINT fk_reserva_alumne FOREIGN KEY (id_alumne) REFERENCES alumne (id_alumne)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  ADD CONSTRAINT fk_reserva_assignatura FOREIGN KEY (codi_assignatura) REFERENCES assignatura (codi_assignatura)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  ADD CONSTRAINT fk_reserva_tutor FOREIGN KEY (id_tutor) REFERENCES tutor (id_tutor)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  ADD CONSTRAINT ck_reserva_canal CHECK (canal IN ('aula', 'videoconferencia')),
  ADD CONSTRAINT ck_reserva_estat CHECK (estat IN ('pendent', 'confirmada', 'cancel·lada', 'realitzada'));

/* Comprovacions finals */
SELECT ' --> TAULES ' AS '';
SHOW TABLES;
SELECT ' --> SHOW CREATE TABLE alumne ' AS '';
SHOW CREATE TABLE alumne;
SELECT ' --> SHOW CREATE TABLE assignatura ' AS '';
SHOW CREATE TABLE assignatura;
SELECT ' --> SHOW CREATE TABLE tutor ' AS '';
SHOW CREATE TABLE tutor;
SELECT ' --> SHOW CREATE TABLE reserva ' AS '';
SHOW CREATE TABLE reserva;

SELECT ' --> INDEXS alumne ' AS '';
SHOW INDEX FROM alumne;
SELECT ' --> INDEXS assignatura ' AS '';
SHOW INDEX FROM assignatura;
SELECT ' --> INDEXS tutor ' AS '';
SHOW INDEX FROM tutor;
SELECT ' --> INDEXS reserva ' AS '';
SHOW INDEX FROM reserva;