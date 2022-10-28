USE `sinergio`
;

LOAD DATA LOCAL INFILE '../local/sampleData/promi.tsv'
INTO TABLE `promi`
COLUMNS TERMINATED BY '\t' (
	`id`,
	`onomasia`,
	`imerominia`
)
;

LOAD DATA LOCAL INFILE '../local/sampleData/apode.tsv'
INTO TABLE `apode`
COLUMNS TERMINATED BY '\t' (
	`id`,
	`onomasia`,
	`imerominia`
)
;

LOAD DATA LOCAL INFILE '../local/sampleData/iliko.tsv'
INTO TABLE `iliko`
COLUMNS TERMINATED BY '\t' (
	`id`,
	`perigrafi`,
	`monada`,
	`imerominia`
)
;

LOAD DATA LOCAL INFILE '../local/sampleData/isagogi.tsv'
INTO TABLE `isagogi`
COLUMNS TERMINATED BY '\t' (
	`id`,
	`imerominia`,
	`promi`
)
;

LOAD DATA LOCAL INFILE '../local/sampleData/initem.tsv'
INTO TABLE `initem`
COLUMNS TERMINATED BY '\t' (
	`isagogi`,
	`iliko`,
	`posotita`
)
;

LOAD DATA LOCAL INFILE '../local/sampleData/exagogi.tsv'
INTO TABLE `exagogi`
COLUMNS TERMINATED BY '\t' (
	`id`,
	`imerominia`,
	`apode`
)
;

LOAD DATA LOCAL INFILE '../local/sampleData/exitem.tsv'
INTO TABLE `exitem`
COLUMNS TERMINATED BY '\t' (
	`exagogi`,
	`iliko`,
	`posotita`
)
;
