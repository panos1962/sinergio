DROP DATABASE IF EXISTS `sinergio`
;

CREATE DATABASE `sinergio`
DEFAULT CHARACTER SET = 'utf8'
DEFAULT COLLATE = 'utf8_general_ci'
;

USE `sinergio`
;

-- -----------------------------------------------------------------------------

-- Ο πίνακας "promi" περιέχει τους προμηθευτές από τους οποίους προμηθευόμαστε
-- υλικά για την αποθήκη του συνεργείου μας.

CREATE TABLE `promi` (
	`id`		SMALLINT NOT NULL AUTO_INCREMENT COMMENT 'Κωδικός προμηθευτή',
	`onomasia`	VARCHAR(128) NOT NULL COMMENT 'Ονομασία προμηθευτή',
	`imerominia`	DATE NOT NULL COMMENT 'Ημερομηνία εγγραφής',
	`inactive`	DATE NULL DEFAULT NULL COMMENT 'Ημερομηνία απενεργοποίησης',

	PRIMARY KEY (
		`id`
	) USING HASH,

	UNIQUE INDEX (
		`onomasia`
	) USING BTREE
)

COMMENT 'Πίνακας προμηθευτών'
;

-- Ο πίνακας "apode" περιέχει τους αποδέκτες υλικών που εξάγουμε από την
-- αποθήκη του συνεργείου μας. Συνήθως πρόκειται για ομάδες υπαλλήλων ή
-- μεμονωμένους υπαλλήλους του συνεργείου μας, π.χ. "ΛΑΜΑΡΙΝΑΔΙΚΟ",
-- "ΕΛΑΣΤΙΚΑ", "ΠΑΝΑΓΙΩΤΗΣ", "ΜΑΡΚΟΣ" κλπ.

CREATE TABLE `apode` (
	`id`		SMALLINT NOT NULL AUTO_INCREMENT COMMENT 'Κωδικός αποδέκτη',
	`onomasia`	VARCHAR(128) NOT NULL COMMENT 'Ονομασία αποδέκτη',
	`imerominia`	DATE NOT NULL COMMENT 'Ημερομηνία εγγραφής',
	`inactive`	DATE NULL DEFAULT NULL COMMENT 'Ημερομηνία απενεργοποίησης',

	PRIMARY KEY (
		`id`
	) USING HASH,

	UNIQUE INDEX (
		`onomasia`
	) USING BTREE
)

COMMENT 'Πίνακας αποδεκτών'
;

-- Ο πίνακας υλικών περιέχει τα υλικά τα οποία διατηρούμε στην αποθήκη του
-- συνεργείου μας.

CREATE TABLE `iliko` (
	`id`		SMALLINT NOT NULL AUTO_INCREMENT COMMENT 'Κωδικός υλικού',
	`perigrafi`	VARCHAR(128) NOT NULL COMMENT 'Περιγραφή υλικού',
	`imerominia`	DATE NOT NULL COMMENT 'Ημερομηνία εγγραφής',
	`monada`	CHARACTER(64) NOT NULL COMMENT 'Μονάδα μέτρησης',
	`ipolipo`	FLOAT NOT NULL DEFAULT 0.0 COMMENT 'Υπόλοιπο/Απόθεμα',

	PRIMARY KEY (
		`id`
	) USING HASH,

	UNIQUE INDEX (
		`perigrafi`
	) USING BTREE
)

COMMENT 'Πίνακας υλικών'
;

CREATE TABLE `isagogi` (
	`id`		MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT 'Κωδικός δελτίου εισαγωγής',
	`imerominia`	DATE NOT NULL COMMENT 'Ημερομηνία δελτίου εισαγωγής',
	`promi`		SMALLINT NOT NULL COMMENT 'Κωδικός προμηθευτή',

	PRIMARY KEY (
		`id`
	) USING HASH,

	INDEX (
		`imerominia`
	) USING BTREE
)

COMMENT 'Πίνακας δελτίων εισαγωγής'
;

CREATE TABLE `initem` (
	`isagogi`	MEDIUMINT NOT NULL COMMENT 'Δελτίο εισαγωγής',
	`iliko`		SMALLINT NOT NULL COMMENT 'Υλικό',
	`posotita`	FLOAT NOT NULL COMMENT 'Ποσότητα',

	UNIQUE INDEX (
		`isagogi`,
		`iliko`
	) USING BTREE
)

COMMENT 'Πίνακας στοιχείων δελτίων εισαγωγής'
;

CREATE TABLE `exagogi` (
	`id`		MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT 'Κωδικός δελτίου εξαγωγής',
	`imerominia`	DATE NOT NULL COMMENT 'Ημερομηνία δελτίου εξαγωγής',
	`apode`		SMALLINT NOT NULL COMMENT 'Κωδικός αποδέκτη',

	PRIMARY KEY (
		`id`
	) USING HASH,

	INDEX (
		`imerominia`
	) USING BTREE
)

COMMENT 'Πίνακας δελτίων εξαγωγής'
;

CREATE TABLE `exitem` (
	`exagogi`	MEDIUMINT NOT NULL COMMENT 'Δελτίο εξαγωγής',
	`iliko`		SMALLINT NOT NULL COMMENT 'Υλικό',
	`posotita`	FLOAT NOT NULL COMMENT 'Ποσότητα',

	UNIQUE INDEX (
		`exagogi`,
		`iliko`
	) USING BTREE
)

COMMENT 'Πίνακας στοιχείων δελτίων εξαγωγής'
;

-- -----------------------------------------------------------------------------

ALTER TABLE `isagogi` ADD FOREIGN KEY (
	`promi`
) REFERENCES `promi` (
	`id`
) ON UPDATE CASCADE ON DELETE CASCADE
;

ALTER TABLE `initem` ADD FOREIGN KEY (
	`isagogi`
) REFERENCES `isagogi` (
	`id`
) ON UPDATE CASCADE ON DELETE CASCADE
;

ALTER TABLE `exagogi` ADD FOREIGN KEY (
	`apode`
) REFERENCES `apode` (
	`id`
) ON UPDATE CASCADE ON DELETE CASCADE
;

ALTER TABLE `exitem` ADD FOREIGN KEY (
	`exagogi`
) REFERENCES `exagogi` (
	`id`
) ON UPDATE CASCADE ON DELETE CASCADE
;

-- -----------------------------------------------------------------------------

DROP USER IF EXISTS 'sinergio'@'localhost'
;

CREATE USER 'sinergio'@'localhost' IDENTIFIED BY 'xxx'
;

GRANT SELECT, INSERT, UPDATE, DELETE
ON `sinergio`.* TO 'sinergio'@'localhost'
;
