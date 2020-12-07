create database Assignment2;
use Assignment2;
CREATE TABLE PUBLISHERS
(
    PNAME Varchar(30),
    EMAIL Varchar(50),
    PHONE Varchar(30)
);

CREATE TABLE  AUTHORS(
	AID Integer(10),
    ANAME Varchar(30),
    PHONE Varchar(30)
);



CREATE TABLE  TITLES(
    TITLEID  Integer(5),
    TITLE VARCHAR(30),
    PUBID Integer(3),
    TITLEPrice Integer(10),
    PUBDATE DATE
);


CREATE TABLE  TITLEAUTHORS
(
    TITLEID Integer(5) ,
    AUID Integer(5) ,
    IMPORTANCE Integer(2)
);

CREATE TABLE SUBJECTS
(
    SUBID Varchar(5),
    SNAME Varchar(20)
);

INSERT INTO PUBLISHERS VALUES ('WILLEY','WDT@VSNL.NET','91-11-23260877');
INSERT INTO PUBLISHERS VALUES ('WROX','INFO@WROX.COM',NULL);
INSERT INTO PUBLISHERS VALUES ('TATA MCGRAW-HILL','FEEDBACK@TATAMCGRAWHILL.COM','91-11-33333322');
INSERT INTO PUBLISHERS VALUES ('TECHMEDIA','BOOKS@TECHMEDIA.COM','91-11-33257660');

INSERT INTO AUTHORS VALUES (101,'HERBERT SCHILD',null);
INSERT INTO AUTHORS VALUES (102,'JAMES GOODWILL',null);
INSERT INTO AUTHORS VALUES (103,'DAVAID HUNTER',null);
INSERT INTO AUTHORS VALUES (104,'STEPHEN WALTHER',null);
INSERT INTO AUTHORS VALUES (105,'KEVIN LONEY',null);
INSERT INTO AUTHORS VALUES (106,'ED. ROMANS',null);


 INSERT INTO TITLES VALUES (1001,'ASP.NET UNLEASHED',4,650,'2002-03-12');
 INSERT INTO TITLES VALUES (1002,'ORACLE10G COMP. REF.',3,350,'2005-04-01');
 INSERT INTO TITLES VALUES (1003,'MASTERING EJB',1,750,'2005-02-03');
 INSERT INTO TITLES VALUES (1004,'JAVA COMP. REF',3,250,'2005-03-03');
 INSERT INTO TITLES VALUES (1005,'PRO. VB.NET',2,900,'2005-06-15');

INSERT INTO TITLEAUTHORS VALUES (1001,104,1);
INSERT INTO TITLEAUTHORS VALUES (1002,105,1);
INSERT INTO TITLEAUTHORS VALUES (1003,106,1);
INSERT INTO TITLEAUTHORS VALUES (1004,101,1);
INSERT INTO TITLEAUTHORS VALUES (1005,103,1);
INSERT INTO TITLEAUTHORS VALUES (1005,102,2);

INSERT INTO SUBJECTS VALUES ('ORA','ORACLE DATABASE 10g');
INSERT INTO SUBJECTS VALUES ('JAVA','JAVA LANGUAGE');
INSERT INTO SUBJECTS VALUES ('JEE','JAVA ENTEPRISE EDITION');
INSERT INTO SUBJECTS VALUES ('VB','VISUAL BASIC.NET');
INSERT INTO SUBJECTS VALUES ('ASP','ASP.NET');

--  *************************(like)***************************
-- 1.select subject name "oracle" from subjects table.
select * from subjects where SNAME like '%oracle%';

-- 2.select subject name starts whith 'j'.
select * from subjects where SNAME like "j%";

-- 3.select subject name which contains ".net" .
select * from subjects where SNAME like "%.net%";

-- 4. select author name ends whith 'er'.
select * from authors where ANAME like "%er";

-- 5. select publishers name which contains "hill".
select * from publishers where PNAME like "%hill%";

-- ******************(relational operator)***********************
-- 1. select title from title table having price less than 500.
select title from titles where TITLEPrice < 500;

-- 2. select title from title table published before '3 april'.
select title from titles where PUBDATE < "2003-04-03";

-- 3. select subject name from subject having id as 'java' or 'jee'.
select SUBID  from subjects where SNAME like "%java%" or "%jee%";

-- 4. seelct author name from author table id greater than '103'.
select ANAME from AUTHORS where AID >'103';

-- 5. select all from title having titleid as 101 or price > 400.
select * from titles where TITLEID = 1001 or TITLEPrice > 400;

-- **********************(IN operator)*************************
-- 6.select all from publishers table  where publisher name is ('TECHMEDIA', 'WROX');
select * from publishers where PNAME in ('TECHMEDIA', 'WROX'); 


-- ******************(aggregate function)**********************
-- 1. select maximum price from titles table.
select max(TITLEPrice) from titles; 

-- 2. select average importance from titleauthors. 
select avg(IMPORTANCE) from TITLEAUTHORS; 

-- 3. select number of records from author table.


-- 4. select sum of prices of all books.
Select sum(TITLEPrice) abc from titles;

-- ********************(date)********************************
-- 1. select title from title table where month is 'Apr'.
select TITLE  from titles where PUBDATE like "%04%";
select * from titles;

-- 2. select year from system date.
select YEAR(CURDATE());

-- 3. select month from system date.
select MONTH(CURDATE());

-- 4. select last day of month when 'java' book published.
SELECT LAST_DAY(PUBDATE) from titles where TITLE = 'JAVA COMP. REF';

-- **********************(DML)*******************************
-- 1.create table Employee with emp_id (number),emp_name(char(50)) and insert some value.
create table emp(
emp_id integer(10),
emp_name char(10)
);

insert into emp values (1,"abc");
insert into emp values (2,"cde");
insert into emp values (3,"fgh");
insert into emp values (4,"ijk");
insert into emp values (5,"lmn");

select * from emp;

-- 1. Add one column name 'dept_id ' in table name 'Employee';
alter table emp add column dept_id varchar(2);

-- 2. Change the datatype of column 'char' from tablename 'Employee' to 'varchar2'.
alter table emp modify column emp_name varchar(20);
desc emp;

-- 3. 3. update name of employee to 'Scott'
SET SQL_SAFE_UPDATES=0;
update emp set emp_name = "Scott" where emp_id = 1;

-- 4. truncate the table.
truncate table emp;
show tables;

-- *************Table=> Emp*************************

create table emp(
emp_id int(2),
sal float(7,3)
);

insert into emp values(1,1234.567);
insert into emp values(2,1530.019);
insert into emp values(3,1652.786);
insert into emp values(4,1775.156);
insert into emp values(4,-1775.156);

-- 1. round
select round(sal,2)  from emp where emp_id >0;

-- 2. truncate 
truncate table emp;

-- 3. ceil
select ceil(sal) from emp where emp_id >0;

-- 4. floor
select floor(sal) from emp where emp_id >0;

-- 5. sign(-15)
select sign(sal) from emp where emp_id >0;

-- 6. mod
select mod(sal,2)  from emp where emp_id >0;

-- 6. sqrts
select sqrt(sal)  from emp where emp_id >0;

-- 8. power
select power(sal,2)  from emp where emp_id >0;

-- *****************************************************************
-- 1. perform all string function on string "CDAC juhu".
SELECT char_length("CDAC juhu");
SELECT REVERSE("CDAC juhu");
SELECT REPEAT("CDAC juhu",2);
SELECT ascii('C');
 SELECT 'CDAC' || ' ' || 'juhu' FROM dual;
select LCASE ("CDAC juhu");
select UCASE ("CDAC juhu");

-- 2. perform different date and time functions. 
SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();
select MONTH(CURDATE());
select YEAR(CURDATE());
SELECT DATE_FORMAT("2017-06-15", "%Y %M %D");  
SELECT DATE_FORMAT("2017-06-15", "%y %m %d");  
SELECT DATE_FORMAT("2017-06-15", "%a %b %c");  

