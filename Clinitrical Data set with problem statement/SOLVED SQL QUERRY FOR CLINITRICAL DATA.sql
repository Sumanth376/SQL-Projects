CREATE database CLINICTRIAL_DB;
USE CLINICTRIAL_DB;
#1. Add index name fast on Name
SELECT NAME AS FIRST FROM CLINICTRIAL;
#2. Describe the schema of table
DESCRIBE CLINICTRIAL;
# 3. Find average of Age
SELECT AVG(AGE) AS AVERAGE_AGE FROM CLINICTRIAL;
#4. Find minimum of Age
SELECT MIN(AGE) AS MIN_AGE FROM CLINICTRIAL;
#5. Find maximum of Age
SELECT MAX(AGE) AS MAX_AGE FROM CLINICTRIAL;
#6. Find average age of those were pregnant and not pregnant
SELECT PREGNANT,AVG(AGE) AVG_AGE FROM CLINICTRIAL group by PREGNANT ;
#7. Find average blood pressure of those had drug reaction and did not had drug reaction
SELECT AVG(BP),DRUG_REACTION FROM CLINICTRIAL GROUP BY DRUG_REACTION;
#8. Add new column name as ‘Age_group’ and those having age between 16 & 21 should be categorized as Low, 
#more than 21 and less than 35 should be categorized as Middle and above 35 should be categorized as High.
alter table clinictrial add column age_group varchar(10);
update clinictrial  set age_group = case WHEN Age >=16 AND age <= 21 THEN 'Low' WHEN Age > 21 AND Age < 35 THEN 'Middle' WHEN Age >= 35 THEN 'High'
ELSE 'Unknown' END;
#9. Change ‘Age’ of Reetika to 32
UPDATE CLINICTRIAL SET AGE=32 WHERE NAME="REETIKA";
#10. Change name of Reena as Shara’
UPDATE CLINICTRIAL SET NAME="SHARA" WHERE NAME="REENA";
#11. Remove Chlstrl column
alter TABLE CLINICTRIAL DROP COLUMN CHLSTRL;
#12. Select only Name, Age and BP
SELECT NAME, AGE,BP FROM CLINICTRIAL;
#13. Select ladies whose first name starts with ‘E’
SELECT * FROM CLINICTRIAL WHERE NAME LIKE "E%";
#14. Select ladies whose Age_group were Low
SELECT * 
FROM clinictrial
WHERE Gender = 'Female' AND Age_group = 'Low';
#15. Select ladies whose Age_group were High
SELECT * FROM clinictrial WHERE Gender = 'Female' AND Name LIKE 'E%';
#16. Select ladies whose name starts with ‘A’ and those were pregnant
SELECT * FROM CLINICTRIAL WHERE NAME LIKE "A%" AND PREGNANT ="YES";
#17. Identify ladies whose BP was more than 120
SELECT * FROM CLINICTRIAL WHERE BP>120;
#18. Identify ladies whose BP was between 100 and 120
SELECT * FROM CLINICTRIAL WHERE BP between 100 AND 120;
#19. Identify ladies who had low anxiety aged less than 30
SELECT NAME, ANXTY_LH, AGE FROM CLINICTRIAL WHERE ANXTY_LH="NO" AND AGE<=30 ;
#20. Select ladies whose name ends with ‘i’
SELECT * FROM CLINICTRIAL WHERE NAME LIKE "%I";
#21. Select ladies whose name ends with ‘a’
SELECT * FROM CLINICTRIAL WHERE NAME LIKE "%A";
#22. Select ladies whose name starts with ‘K’
SELECT * FROM CLINICTRIAL WHERE NAME LIKE "K%";
#23. Select ladies whose name have ‘a’ anywhere
SELECT * FROM CLINICTRIAL WHERE NAME LIKE "%A%";
#24. Order ladies in ascending way based on ‘BP’
SELECT * FROM CLINICTRIAL order by BP ASC;
#25. Order ladies in descending way based on ‘Age’
SELECT * FROM CLINICTRIAL ORDER BY AGE DESC; 

SELECT * FROM CLINICTRIAL;
