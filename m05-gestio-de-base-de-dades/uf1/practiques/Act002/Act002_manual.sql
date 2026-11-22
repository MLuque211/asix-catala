DROP DATABASE IF EXISTS act002_activitats_centre_esportiu;
CREATE DATABASE act002_activitats_centre_esportiu
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE act002_activitats_centre_esportiu;

CREATE TABLE activitat (
  codi_activitat VARCHAR(80) NOT NULL,
  nom VARCHAR(80) NOT NULL,
  categoria VARCHAR(80) NULL,
  places_maximes INT(10) UNSIGNED NOT NULL,
  CONSTRAINT pk_activitat PRIMARY KEY (codi_activitat)
) ENGINE=InnoDB;

CREATE TABLE sessio (
  id_sessio INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  data_sessio DATE NOT NULL,
  hora_inici TIME NOT NULL,
  durada_minuts INT(10) UNSIGNED NOT NULL,
  sala VARCHAR(80) NULL,
  codi_activitat VARCHAR(80) NOT NULL,
  CONSTRAINT pk_sessio PRIMARY KEY (id_sessio)
) ENGINE=InnoDB;

CREATE TABLE soci (
  id_soci INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  nom VARCHAR(80) NOT NULL,
  cognoms VARCHAR(80) NOT NULL,
  data_alta DATE NOT NULL,
  email VARCHAR(100) NOT NULL,
  CONSTRAINT pk_soci PRIMARY KEY (id_soci)
) ENGINE=InnoDB;

CREATE TABLE inscripcio (
  id_soci INT(10) UNSIGNED NOT NULL,
  id_sessio INT(10) UNSIGNED NOT NULL,
  data_inscripcio DATE NOT NULL,
  estat VARCHAR(80) NOT NULL,
  assistencia TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  CONSTRAINT pk_inscripcio PRIMARY KEY (id_soci, id_sessio)
) ENGINE=InnoDB;

/* Alter tables */
ALTER TABLE activitat
  ADD CONSTRAINT ck_activitat_places_maximes CHECK (places_maximes > 0 AND places_maximes < 31);

ALTER TABLE sessio
  ADD CONSTRAINT fk_sessio_activitat FOREIGN KEY (codi_activitat) REFERENCES activitat (codi_activitat)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  ADD CONSTRAINT ck_sessio_durada_minuts CHECK (durada_minuts BETWEEN 15 AND 55);

ALTER TABLE soci
  ADD CONSTRAINT uk_soci_email UNIQUE (email),
  ADD CONSTRAINT ck_soci_email CHECK (email LIKE '%@%.%');

ALTER TABLE inscripcio
  ADD CONSTRAINT fk_inscripcio_id_soci FOREIGN KEY (id_soci) REFERENCES soci (id_soci)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  ADD CONSTRAINT fk_inscripcio_id_sessio FOREIGN KEY (id_sessio) REFERENCES sessio (id_sessio)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  ADD CONSTRAINT ck_inscripcio_estat CHECK (estat IN ('confirmada', 'llista_espera', 'cancel·lada'));

/* Comprovacions finals */
SELECT ' --> TAULES ' AS '';
SHOW TABLES;
SELECT ' --> SHOW CREATE TABLE activitat ' AS '';
SHOW CREATE TABLE activitat;
SELECT ' --> SHOW CREATE TABLE sessio ' AS '';
SHOW CREATE TABLE sessio;
SELECT ' --> SHOW CREATE TABLE soci ' AS '';
SHOW CREATE TABLE soci;
SELECT ' --> SHOW CREATE TABLE inscripcio ' AS '';
SHOW CREATE TABLE inscripcio;

SELECT ' --> INDEXS activitat ' AS '';
SHOW INDEX FROM activitat;
SELECT ' --> INDEXS sessio ' AS '';
SHOW INDEX FROM sessio;
SELECT ' --> INDEXS soci ' AS '';
SHOW INDEX FROM soci;
SELECT ' --> INDEXS inscripcio ' AS '';
SHOW INDEX FROM inscripcio;