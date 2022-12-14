DROP SCHEMA vals;
CREATE SCHEMA vals;

USE vals;

/* -------------------------------- */
/* Create Tables */
CREATE TABLE val(
	STATE VARCHAR(2000),
    mean_2011 double,
    mean_2012 double,
    mean_2013 double,
    mean_2014 double,
    mean_2015 double
);

CREATE TABLE avgSTATE(
	STATE VARCHAR(2000),
    mean_2011 double,
    mean_2012 double,
    mean_2013 double,
    mean_2014 double,
    mean_2015 double
);
/* -------------------------------- */
/* Load Data */
LOAD DATA LOCAL INFILE 'C://Benzene//Annual-tabulation_Benzene_2020.csv'
INTO TABLE val
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@col1, @dummy, @dummy, @dummy, @dummy, @col2)
SET STATE=@col1, mean_2011=@col2;

/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

/*Average by states*/

SELECT STATE 'Mean_STATE',
AVG(mean_2011) 'Mean' 
FROM val
AS avg_mean_2011
GROUP BY STATE;

/*Join the averages by states*/




