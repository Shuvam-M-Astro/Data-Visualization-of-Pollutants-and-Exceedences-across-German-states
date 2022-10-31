DROP SCHEMA vals;
CREATE SCHEMA vals;

USE vals;

/* -------------------------------- */
/* Create Tables */
CREATE TABLE val(
	STATE VARCHAR(2000),
    January double,
    February double,
    March double,
    April double,
    May double,
    June double,
    July double,
    August double,
    September double,
    October double,
    November double,
    December double
);


/* -------------------------------- */
/* Load Data */
LOAD DATA LOCAL INFILE 'C://Exceedances_Nitrogen dioxide_2022.csv'
INTO TABLE val
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@col1, @dummy, @dummy, @dummy, @dummy,@dummy, @jan,@feb,@mar,@apr,@may,@jun,@jul,@aug,@sep,@oct,@nov,@dece)
SET STATE=@col1, 
January=@jan,
February=@feb,
March=@mar,
April=@apr,
May=@may,
June=@jun,
July=@jul,
August=@aug,
September=@sep,
October=@oct,
November=@nov,
December=@dece;

/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */


SELECT STATE 'Mean_STATE',
AVG(January) 'January' ,
AVG(February) 'February' ,
AVG(March) 'March' ,
AVG(April) 'April' ,
AVG(May) 'May' ,
AVG(June) 'June' ,
AVG(July) 'July' ,
AVG(August) 'August' ,
AVG(September) 'September' ,
AVG(October) 'October' ,
AVG(November) 'November' ,
AVG(December) 'December' 
FROM val
GROUP BY STATE;



