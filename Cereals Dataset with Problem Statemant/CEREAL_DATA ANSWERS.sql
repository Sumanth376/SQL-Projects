create DATABASE CEREALS_DB;
USE CEREALS_DB;
ALTER TABLE CEREALS_DATA ADD COLUMN PRIMARY_KEY INT primary key auto_increment ;
SELECT * FROM  CEREALS_DATA;
#1. Add index name fast on name
SELECT NAME AS INDEX_NAME FROM CEREALS_DATA;
#2. Describe the schema of table
DESCRIBE CEREALS_DATA;
#VIEWS ARE VIRTUAL TABLE 
#3. Create view name as see where users can not see type column 
#[first run appropriate query then create view]
CREATE VIEW SEE AS SELECT NAME,MFR,CALORIES,PROTEIN,SODIUM,FIBER,CARBO,
SUGARS,POTASS,VITAMINS,SHELF,WEIGHT,CUPS,RATING FROM CEREALS_DATA;
SELECT * FROM SEE;
#4. Rename the view as saw
RENAME TABLE SEE TO SAW;
SELECT * FROM SAW;
#5. Count how many are cold cereals
SELECT TYPE,COUNT(TYPE) FROM CEREALS_DATA WHERE TYPE="C" ;     
#6. Count how many cereals are kept in shelf 3
SELECT SHELF,COUNT(*) FROM CEREALS_DATA WHERE SHELF="3";
#7. Arrange the table from high to low according to ratings ;
SELECT * FROM CEREALS_DATA ORDER BY RATING DESC;
#8. Suggest some column/s which can be Primary key
-- Based on the dataset, the name column uniquely identifies each cereal brand/product and does not contain duplicates. Therefore, it is the most appropriate choice for a Primary Key.
#9. Find average of calories of hot cereal and cold cereal in one query
SELECT DISTINCT (TYPE),AVG(CALORIES) FROM CEREALS_DATA group by TYPE;
#9. Find average of calories of hot cereal and cold cereal in one query
SELECT TYPE,AVG(CALORIES) FROM CEREALS_DATA GROUP BY TYPE;     
#10. Add new column as HL_Calories where more than average calories should be categorized as HIGH and less than average calories should be categorized as LOW
ALTER TABLE CEREALS_DATA MODIFY HL_CAL VARCHAR(10) AFTER CALORIES;
#11. List only those cereals whose name begins with B
SELECT * FROM CEREALS_DATA WHERE NAME LIKE "A%";
#12. List only those cereals whose name begins with F
SELECT * FROM CEREALS_DATA WHERE NAME LIKE"F%";
#13. List only those cereals whose name ends with s
SELECT * FROM CEREALS_DATA WHERE NAME LIKE"%S";
#14. Select only those records which are HIGH in column HL_calories and mail to jeevan.raj@imarticus.com [save/name your file as <your first name_cereals_high>]
SELECT * FROM CEREALS_DATA WHERE HL_CALORIES = HIGH;
#15. Find maximum of ratings
SELECT  MAX(RATING) FROM CEREALS_DATA ;
#16. Find average ratings of those were High and Low calories
SELECT AVG(CALORIES) FROM CEREALS_DATA;
SELECT AVG(CALORIES) AS AVG_CALORIES FROM CEREALS_DATA;
UPDATE CEREALS_DATA SET HL_CALORIES = CASE WHEN CALORIES <= 106.9737 THEN 'LOW' ELSE 'HIGH' END;
#CTE(COMMON TABLE EXPRESSION)
#17. Craete two examples of Sub Queries of your choice and give explanation in the script itself with remarks by using #
-- Get cereals with the maximum rating using a subquery
SELECT name, rating
FROM cereals_data
WHERE
 rating = (
    SELECT MAX(rating) 
    FROM cereals_data
);
SELECT name, calories
FROM cereals_data
WHERE calories > (
    SELECT AVG(calories)
    FROM cereals_data
);

#18. Remove column fat
ALTER TABLE CEREALS_DATA DROP COLUMN FAT;
#19. Count records for each manufacturer [mfr]
SELECT DISTINCT(MFR),COUNT(MFR) FROM CEREALS_DATA GROUP BY MFR ;  
#20. Select name, calories and ratings only
SELECT NAME,CALORIES,RATING FROM CEREALS_DATA;
SELECT AVG(CALORIES) FROM CEREALS_DATA;
ALTER  TABLE CEREALS_DATA ADD COLUMN HL_CALO VARCHAR(10) AFTER CALORIES ;
UPDATE CEREALS_DATA SET HL_CAL = CASE when CALORIES <106.9737 THEN "LOW" ELSE "HIGH" END;

SELECT * FROM  CEREALS_DATA;