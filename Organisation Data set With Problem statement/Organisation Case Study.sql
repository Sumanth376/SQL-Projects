CREATE DATABASE FIRM_DB;
USE FIRM_DB;
#1
SELECT FIRST_NAME AS WORKER_NAME FROM WORKER ;
#2
SELECT UPPER(FIRST_NAME) AS UPPER_NAME FROM WORKER;
#3
SELECT DISTINCT(DEPARTMENT) AS DIFFERENT_DEPARTMENT  FROM WORKER;
#4
select SUBSTR(FIRST_NAME,1,3) AS SHORT_NAME FROM WORKER;
#5
SELECT POSITION("A" IN FIRST_NAME) AS POSITION_RANGE  FROM WORKER WHERE FIRST_NAME = "Amitabh" ;
#6
SELECT FIRST_NAME ,Rtrim(FIRST_NAME) AS TRIM_NAME FROM WORKER;
#7
SELECT DEPARTMENT ,ltrim(DEPARTMENT) AS DEPARTMENT_TRIM FROM WORKER;
#8
SELECT DISTINCT DEPARTMENT AS DIFF_DEPARTMENT,length(DEPARTMENT) AS DEPARTMENT_LENGTH FROM WORKER;
#9Write An SQL Query To Print The FIRST_NAME From Worker Table After Replacing ‘a’ With ‘K’. (for replacing char is case-sensitive)
SELECT FIRST_NAME,replace(LOWER(first_name), 'a', 'k') as rep_name from worker;
#10 Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table Into A Single Column COMPLETE_NAME. A Space Char Should Separate Them.
select concat(first_name ," ", last_name) as full_name from worker;
#11 Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending.
select first_name from worker order by first_name  asc ;
#12 Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending And DEPARTMENT Descending.
select * from worker order by first_name asc, department desc ;
#13 Write An SQL Query To Print Details For Workers With The First Name As “Vipul” And “Satish” From Worker Table.
select * from worker where first_name in ("vipul","satish");
#14 Write An SQL Query To Print Details Of Workers Excluding First Names, “Vipul” And “Satish” From Worker Table.
select * from worker where first_name not in ("vipul","satish");
#15. Write An SQL Query To Print Details Of Workers With DEPARTMENT Name As “Admin”.
select * from worker where department="admin";
# 16 Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Contains ‘A’.
select * from worker where first_name like "%a%";
#17 Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘A’.
select * from worker where first_name like "%a";
#18 Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘H’ And Contains Six Alphabets.
select * from worker where first_name like "_____h";
#19 Write An SQL Query To Print Details Of The Workers Whose SALARY Lies Between 100000 And 500000.
select * from  worker where salary between 100000 and 500000;
# 20 Write An SQL Query To Print Details Of The Workers Who Have Joined In Feb’2014.
select * from worker where year(joining_date)=2014 and  month(joining_date)=2;
#Q-21. Write An SQL Query To Fetch The Count Of Employees Working In The Department ‘Admin’.
select department,count(department) as no_of_emp from worker where department="admin";
#Q-22. Write An SQL Query To Fetch Worker Names With Salaries >= 50000 And <= 100000.
select * from worker where salary between 50000 and 100000;
#Q-23. Write An SQL Query To Fetch The No. Of Workers For Each Department In The Descending Order.
select department ,count(department) as no_employees from worker group by department order by no_employees desc;
#Q-24. Write An SQL Query To Print Details Of The Workers Who Are Also Managers.
select * from worker;
select * from title;
select * from 
worker as w 
inner join title as t
on w.worker_id = t.worker_ref_id 
where worker_title="manager";
#Q-25. Write An SQL Query To Fetch Duplicate Records Having Matching Data In Some Fields Of A Table.
select worker_title , affected_from ,count(*) as ref from title group by worker_title,affected_from having ref>1;
#Q-26. Write An SQL Query To Show Only Odd Rows From A Table.
select * from worker where mod(worker_id,2)!=0;
#Q-27. Write An SQL Query To Show Only Even Rows From A Table.
select * from worker where mod(worker_id,2)=0;
#Q-28. Write An SQL Query To Clone A New Table From Another Table.
create table work_clone as select * from  worker;
select * from  work_clone;
#Q-29. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
select * from worker where worker_id in (select worker_ref_id from bonus);
#write a sql querry to print the name of the employee and no of times he received the bonu
select first_name , count(*) as total,sum(salary) total_salary from worker w
 inner join bonus b on w.worker_id=b.worker_ref_id group by first_name;
 select * from worker where worker_id not in(select worker_ref_id from bonus);
#Q-30. Write An SQL Query To Show Records From One Table That Another Table Does Not Have.
 select * from worker where worker_id not in(select worker_ref_id from bonus);
 #Q-31. Write An SQL Query To Show The Current Date And Time.
 select now();
 #Q-32. Write An SQL Query To Show The Top N (Say 10) Records Of A Table.
 select * from worker   limit 5  ;
 select * from worker limit 3,2;
 #Q-33. Write An SQL Query To Determine The Nth (Say N=5) Highest Salary From A Table.
 select * from ( select first_name ,salary,
 row_number() over (order by salary desc)  as rn,
 rank() over (order by salary desc) as rnk,
 dense_rank() over (order by salary desc)drnk from worker)as t where drnk=5;
 #Q-34. Write An SQL Query To Determine The 5th Highest Salary Without Using TOP Or Limit Method.
select * from(select first_name,salary,row_number() over (order by salary asc)rn,
rank() over (order by salary asc)rnk,dense_rank() over(order by salary asc)
 drnk from worker) as t where drnk=5;
 #Q-35. Write An SQL Query To Fetch The List Of Employees With The Same Salary.
 select salary,count(*) as d from worker group by salary having d>1;
#Q-36. Write An SQL Query To Show The Second Highest Salary From A Table.
select* from (select first_name, salary, row_number() over (order by salary asc)rk,
rank() over(order by salary asc)rnk,
rank() over (order by salary asc)drnk from worker )as t where drnk = 2;
#Q-37. Write An SQL Query To Show One Row Twice In Results From A Table.
select * from  worker union all select * from worker order by worker_id asc;
#Q-38. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
select * from worker_id as w inner join work_clone as wc on w.worker_id = wc.worker_id;
#Q-39. Write An SQL Query To Fetch The First 50% Records From A Table.
select * from worker where worker_id<=(select count(*)/2 from worker);
#Q-40. Write An SQL Query To Fetch The Departments That Have Less Than Five People In It.
select department,count(*) as number_of_workers from worker group by department having count(*) <3;
#Q-41. Write An SQL Query To Show All Departments Along With The Number Of People In There.
select department,count(*) as c from  worker group by department;
#Q-42. Write An SQL Query To Show The Last Record From A Table.
select * from worker order by worker_id desc limit 1;
#Q-43. Write An SQL Query To Fetch The First Row Of A Table.
select * from worker order by worker_id asc limit 1;
#Q-44. Write An SQL Query To Fetch The Last Five Records From A Table.
select * from worker order by worker_id desc limit 5;
#Q-45. Write An SQL Query To Print The Name Of Employees Having The Highest Salary In Each Department.
select distinct salary from worker group by salary limit 1;
select concat(first_name," ",last_name) as name_,deapartment,max(salary) from worker group by department;         DOUBT;
SELECT concat(first_name," ",last_name) as full_name,department from worker where salary in(select max(salary) from worker group by department);
#Q-46. Write An SQL Query To Fetch Three Max Salaries From A Table.
select distinct(salary) from worker group by salary  order by salary desc limit 3; 
#Q-47. Write An SQL Query To Fetch Three Min Salaries From A Table.
select distinct(salary) from worker group by salary order by salary asc limit 3;
#Q-48. Write An SQL Query To Fetch Nth Max Salaries From A Table.say n=4
select distinct(salary) from worker order by  salary desc limit 3,1;
#Q-49. Write An SQL Query To Fetch Departments Along With The Total Salaries Paid
select department,sum(salary) as total_salary from worker group by department;
#Q-50. Write An SQL Query To Fetch The Names Of Workers Who Earn The Highest Salary.
select concat(first_name," ",last_name)as full_name, max(salary) as salary from worker group by full_name order by salary desc limit 2 ;
select first_name,salary from worker where salary in (select max(salary) from worker);


