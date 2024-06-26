CREATE DATABASE SALESDB;
SELECT DATABASE();
USE SALESDB;

-- INPORTING FILE TO SQL BY TABLE DATA IMPORT WIZARD

SELECT * FROM SALESDATA;

-- OPENEING A PARTICULAR COLUMNS WE NEED

SELECT ID,REGION FROM SALESDATA;
SELECT QTY,REGION,UNITPRICE FROM SALESDATA;
SELECT REGION FROM SALESDATA;

-- SELECTING COMMON DATA FROM SAME REGION TABLE

SELECT DISTINCT REGION FROM SALESDATA;

-- SELECTING THE DISTINCT CITIES FROM DATA

SELECT DISTINCT CITY FROM SALESDATA;

-- SELECTING PARTICULAR ROW IN ENTIRE TABLE

SELECT * FROM SALESDATA
WHERE CITY = "BOSTON";

-- QUERY TO GET ID, CITY , QNTY FOR REGION EAST

SELECT ID,CITY,QTY FROM SALESDATA
WHERE REGION = "EAST";

-- APPLYING ASSINGMNET OPERATORS FOR SATESDATA >,<,>=,<=,<>/!

SELECT * FROM SALESDATA
WHERE QTY>100;
SELECT REGION,CITY,QTY FROM SALESDATA
WHERE UNITPRICE < 2;

-- APPLYING LOGICAL OPERATORS FOR SALESDATA AND,OR,NOT

SELECT * FROM SALESDATA
WHERE CITY <> "BOSTON";  

SELECT * FROM SALESDATA
WHERE REGION ="EAST" AND CITY = "BOSTON";  -- (USED AND OPERATOR)

SELECT * FROM SALESDATA
WHERE REGION = "EAST" AND QTY > "100";

SELECT * FROM SALESDATA
WHERE CITY = "BOSTON" OR CITY = "NEW YORK";  -- (USED OR OPERATOR)

SELECT * FROM SALESDATA
WHERE REGION = "EAST" OR QTY > "100";

SELECT * FROM SALESDATA
WHERE NOT QTY < "100";     -- (USED NOT OPERATOR)

SELECT * FROM SALESDATA
WHERE NOT CITY = "NEW YORK";

-- APPLYING THE CONDITION OF ISNULL AND ISNOT NULL

SELECT * FROM SALESDATA
WHERE ID IS NULL;

SELECT * FROM SALESDATA
WHERE ID IS NOT NULL;

-- SHOWING ONLY NEEDED QUANTITY LIST IN SALESDATA

SELECT * FROM SALESDATA
WHERE QTY = 100 OR QTY = 87 OR QTY = 58 OR QTY = 82 OR QTY = 38;

-- USING IN OPERATOR 

SELECT * FROM SALESDATA
WHERE QTY IN (100,87,58,82,38);

-- QUERY TO GET DATA WHERE QTY = 100 - 150

SELECT * FROM SALESDATA
WHERE QTY BETWEEN 100 AND 150;

-- QUERY TO GET  ENTIRE DATA FOR ONLY 2022 JAN

SELECT * FROM SALESDATA
WHERE DATE BETWEEN "2022-01-01" AND "2022-01-31" ;

-- QUERY TO GET DATA BY DESCING ORDER 

SELECT * FROM SALESDATA
ORDER BY CITY DESC;

-- QUERY TO GET QTY < 100 AND SORT TO DATA DESC TO ASC

SELECT * FROM SALESDATA
WHERE QTY <100 ORDER BY QTY DESC;

-- APPLYING THE LIMIT IN SALESDATA FOR SHOWING HIGHEST VALUE IN TABLE

SELECT * FROM SALESDATA
ORDER BY QTY DESC
LIMIT 1;

-- APPLYING THE LIMIT IN SALESDATA FOR SHOWING LOWEST VALUE IN TABLE

SELECT * FROM SALESDATA
ORDER BY QTY ASC
LIMIT 1;


-- QUERY TO GET A DATA OF LOWEST VALUES OF UNITPRICE

SELECT * FROM SALESDATA
ORDER BY UNITPRICE ASC 
LIMIT 1;

-- QUERY TO GET SECOND HIGHEST VALUE OF QTY 

SELECT * FROM SALESDATA
ORDER BY QTY DESC
LIMIT 3,1;

-- FILTER THE DATA CITY ENDING WITH S 

SELECT * FROM SALESDATA
WHERE CITY LIKE "%S";

-- FILTER THE DATA CITY STARTING WITH B

SELECT * FROM SALESDATA
WHERE CITY LIKE "B%";

-- QUERY TO GET STARTS WITH N AND END WITH K

SELECT * FROM SALESDATA
WHERE CITY LIKE "N%K";

-- QUERY TO GET ALL THE DATA FROM CITY CONTAING LETTER O

SELECT * FROM SALESDATA
WHERE CITY LIKE "%O%";

-- QUERY TO GET ALL THE DATA WHICH CONTAINS ONLY N

SELECT * FROM SALESDATA
WHERE CITY LIKE "%N%";

-- QUERY TO GET ALL THE DATA WHICH CONTAINS N AT THE THIRD PLACE OF CITY

SELECT * FROM SALESDATA
WHERE CITY LIKE "__N%";

-- QUERY TO GET ALL THE DATA WHERE IN THE CITY LAST SECOND CHARACTER SHULD BE R

SELECT * FROM SALESDATA
WHERE CITY LIKE "%R_";

-- QUERY TO GET STARTING THE CHARCATER SEVENTH B AND LENGHTH OF THE CHARACTER SHULD BE 7 IN THE CITY

SELECT * FROM SALESDATA
WHERE CITY LIKE "B______%";

-- QUERY TO GET TOTAL QTY IN UR ENTIRE DATA

SELECT SUM(QTY) AS TOTAL_QTY  FROM SALESDATA;

-- QUERY TO GET ID DATE AND REGION WHERE DATE FIELD SHULD BE ORDER DATE

SELECT ID,DATE AS ORDER_DATE,REGION FROM SALESDATA;

-- QUERY TO GET SUM OF TOTAL QTY ONLY FOR BOSTON CITY

SELECT SUM(QTY) AS TOTALQTY_BOSTON FROM SALESDATA
WHERE CITY = "BOSTON";

-- QUERY TO GET SUM OF QUANTITY FOR REGION EAST CITY LOS ANGELS

SELECT SUM(QTY) FROM SALESDATA
WHERE CITY = "LOS ANGELES" AND REGION = "WEST";

-- QUERY TO GET TOTAL COUNT FROM SALESDATA

SELECT COUNT(*) FROM SALESDATA;

-- QUERY TO GET NUMBER OF RECORDS PRESENT ONLY FOR BOSTOM

SELECT COUNT(*) FROM SALESDATA
WHERE CITY ="BOSTON";

-- QUERY TO GET NUMBER OF RECORDS PRESENT FOR REGION EAST AND CITY BOSTON

SELECT COUNT(*) FROM SALESDATA
WHERE CITY = "BOSTON" AND REGION ="EAST";

-- QUERY TO GET MINIMUM VALUE BETWEEN CITY OF BOSTON AND NEWYORK

SELECT COUNT(*) FROM SALESDATA
WHERE CITY = "BOSTON" OR CITY = "NEW YORK";

-- QUERY TON GET MAX QTY PRESNT IN NEWYORK CITY

SELECT MAX(QTY) FROM SALESDATA
WHERE CITY = "NEW YORK";

-- QUERY TO GET AVERAGE QTY FOR REGION WEST

SELECT AVG(QTY) FROM SALESDATA
WHERE REGION = "WEST";

-- QUERY TO GET QTY TO GET SUM OF QTY FOR REGION WISE

SELECT REGION , SUM(QTY) FROM SALESDATA
GROUP BY REGION ;

-- QUERY TO CHANGE COLUMN NAME FROM SUM TO TOTAL

SELECT REGION , SUM(QTY) AS TOTAL_QTY FROM SALESDATA
GROUP BY REGION ;

-- QUERY TO GET COUNT OF CITY

SELECT CITY , COUNT(CITY)  FROM SALESDATA
GROUP BY CITY;

-- QUERY TO GET MAX QTY PRESENT IN CITY WISE EXCPET BOSTON CITY

SELECT CITY , MAX(QTY) FROM SALESDATA  
WHERE CITY !="BOSTON"
GROUP BY CITY;

-- QUERY TO GET SUM OF QTY IN CITY WISE AND SORT SUM OF QTY  FROM ASC TO DESC

SELECT CITY , SUM(QTY) FROM SALESDATA
WHERE CITY <> "NEW YORK"
GROUP BY CITY
ORDER BY SUM(QTY);

-- QUERY TO GET SUM OF QTY CITY WISE WHERE THE QTY GREATER THAN 100

SELECT CITY, SUM(QTY) FROM SALESDATA
WHERE QTY>100
GROUP BY CITY;

-- QUERY TO GET SUM OF QTY IN CITY WISE WHERE UR SUM OF QTY SHULD BE GREATER THAN 4000

SELECT CITY , SUM(QTY) FROM SALESDATA
GROUP BY CITY
HAVING SUM(QTY)>4000;

-- QUERY TO GET SUM OF QTY WITH CITY WISE WHERE THE  QTY SHULD BE GREATER THAN 150 AND SUM OF QTY IS GREATER THAN 1500 AND SORT DESC TO TO ASC

SELECT CITY, SUM(QTY) FROM SALESDATA
WHERE QTY>150
GROUP BY CITY
HAVING SUM(QTY)>600
ORDER BY  SUM(QTY)DESC 






























