create database INSURANCE_DB;
USE INSURANCE_DB;
select * from insurance;
##1. Count for each categories of region
select REGION, COUNT(REGION)AS CNT FROM INSURANCE GROUP BY REGION;
select region, count(region) cnt from insurance group by region;
#2. Find 50 records of highest ‘age’ and export data/table to desktop
SELECT *
FROM insurance
ORDER BY age DESC
LIMIT 50;
#4. Describe the schema of table
describe insurance;
#5. Create view name as ‘gender’ where users can not see ‘sex’ [Hint: first run appropriate query then create view]
SELECT age, bmi, children, charges, smoker, region
FROM insurance;
CREATE VIEW gender AS
SELECT age, bmi, children, charges, smoker, region
FROM insurance;
select * from gender;
#6. Rename the view as ‘type’
RENAME TABLE gender TO type;
select * from type;
#7. Count how many are ‘northwest’ insurance holders
select region, count(region)as count from insurance where region="northwest";
#8. Count how many insurance holders were ‘femail’
select sex, count(sex) from insurance where sex="female";
#9. Create Primary key on a suitable column
alter table insurance add constraint primary key (id);
#10. Create a new column ‘ratio’ which is age multiply by bmi
ALTER TABLE insurance ADD COLUMN ratio FLOAT;
UPDATE insurance SET ratio = age * bmi;
select * from insurance;
#11. Arrange the table from high to low according to charges
select * from insurance order by charges desc;
#12. Find MAX of ‘charges’
select * from insurance order by charges desc limit 1;
#13. Find MIN of ‘charges’
select MIN(CHARGES) FROM insurance;
#14. Find average of ‘charges’ of male and female
SELECT SEX,AVG(CHARGES) FROM INSURANCE GROUP BY SEX;
#15. Write a Query to rename column name sex to Gender
ALTER TABLE insurance RENAME COLUMN SEX TO GENDER;
#16. Add new column as HL_Charges where more than average charges should be categorized as HIGH and less than average charges should be categorized as LOW
alter table insurance add column HL_Charges varchar(10);
SET @avg_charges = (SELECT AVG(charges) FROM insurance);
update insurance set HL_Charges = case when charges > @avg_charges then "high" else "low" end;
#17. Change location/position of ‘smoker’ and bring before ‘children’
select * from insurance;
SELECT id, age, gender, bmi, smoker, children, region, charges FROM INSURANCE;
#18. Show top 20 records
SELECT * FROM INSURANCE LIMIT 20;
#19. Show bottom 20 records
select * FROM INSURANCE ORDER BY ID DESC LIMIT 20;
#20. Randomly select 20% of records and export to desktop
SELECT FLOOR(COUNT(*) * 0.2) AS limit_value FROM insurance order by id;
SELECT * FROM insurance ORDER BY id LIMIT 267;
#21. Remove column ‘ratio’
ALTER TABLE insurance DROP COLUMN RATIO;  
#22. Craete one example of Sub Queries involving ‘bmi’ and ‘sex’ and give explanation in the script itself with remarks by using #
-- selects females with BMI above female average
SELECT * FROM insurance WHERE gender = 'female' AND bmi > (SELECT AVG(bmi) FROM insurance WHERE gender = 'female');  
#23. Create a view called Female_HL_Charges that shows only those data where HL_Charges is High, Female, Smokers and with 0 children
CREATE VIEW Female_HL_Charges AS SELECT * FROM insurance WHERE HL_Charges = 'High' AND sex = 'female' AND smoker = 'yes' AND children = 0;
#24. Update children column if there is 0 children then make it as Zero Children, if 1 then one_children, if 2 then two_children, if 3 then three_children,
# if 4 then four_children if 5 then five_children else print it as More_than_five_children.
SELECT id, age, gender, bmi, smoker, 
       CASE 
           WHEN children = 0 THEN 'Zero Children'
           WHEN children = 1 THEN 'one_children'
           WHEN children = 2 THEN 'two_children'
           WHEN children = 3 THEN 'three_children'
           WHEN children = 4 THEN 'four_children'
           WHEN children = 5 THEN 'five_children'
           ELSE 'More_than_five_children'
       END AS children,
       region, charges
FROM INSURANCE;

select * from insurance;
update insurance set age_groups=null;
select max(age) as maxi from insurance;
select min(age) as mini from insurance;
select max(age) max_age,min(age),max(age)- min(age) as age_diff,round(max(age)-min(age))/3

