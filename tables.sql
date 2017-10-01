BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `Members` (
	`ID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Username`	TEXT NOT NULL,
	`Password`	TEXT NOT NULL
);
INSERT INTO `Members` VALUES (1,'Bob','Pass');
INSERT INTO `Members` VALUES (2,'Amanda','word');
CREATE TABLE IF NOT EXISTS `Books` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`isbn`	TEXT,
	`bookName`	TEXT,
	`author`	TEXT,
	`semester`	TEXT,
	`course`	TEXT,
	`section`	TEXT,
	`professor`	TEXT,
	`crn`	TEXT,
	`buyDemand`	INTEGER,
	`newQuantity`	INTEGER,
	`usedQuantity`	INTEGER,
	`rentalQuantity`	INTEGER,
	`ebookQuantity`	INTEGER,
	`newPrice`	NUMERIC,
	`usedPrice`	NUMERIC,
	`rentalPrice`	NUMERIC,
	`ebookPrice`	NUMERIC,
	`description`	TEXT,
	`isbnForCovers`	TEXT
);
COMMIT;
