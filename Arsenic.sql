DROP SCHEMA accidents;
CREATE SCHEMA accidents;

USE accidents;

/* -------------------------------- */
/* Create Tables */
CREATE TABLE accident(
	accident_index VARCHAR(2000),
    accident_severity double
);

/* -------------------------------- */
/* Load Data */
LOAD DATA LOCAL INFILE 'C:\\Annual-tabulation_Arsenic in particulate matter_2011 - Annual-tabulation_Arsenic in particulate matter_2011.csv'
INTO TABLE accident
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@col1, @dummy, @dummy, @dummy, @dummy, @col2)
SET accident_index=@col1, accident_severity=@col2;



