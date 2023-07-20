-- 1.利用下列資料來新建DEPARTMENT資料表。
create table DEPARTMENT
(id int not null,
name varchar (24) not null
);
-- 2.利用DEPT資料表中的資料,將資料新增至DEPARTMENT資料表中(只新增相對的資料欄)。
insert into DEPARTMENT (id, name)
	select deptno, dname
    from dept;
-- 3.利用下列資料來新建EMPLOYEE資料表。
create table EMPLOYEE
(id int not null,
last_name varchar(24) not null,
first_varchar varchar(24),
dept_id int
);
-- 4.將EMPLOYEE資料表中last_name欄位的資料型態更改為varchar(40)。
alter table EMPLOYEE
	modify last_name varchar(40);
-- 5.使用EMP資料表的結構中之EMPNO, ENAME,andDEPTNO之定義來新建EMPLOYEE2資料表並將欄位名稱設定為ID, LAST_NAME, and DEPT_ID。
create table EMPLOYEE2
 as select EMPNO 'ID', ENAME 'LAST_NAME', DEPTNO 'DEPT_ID'
 from emp;
-- 6.刪除整個EMPLOYEE資料表。
drop table EMPLOYEE;
-- 7.將EMPLOYEE2資料表改名為EMPLOYEE。
alter table EMPLOYEE2
rename to EMPLOYEE;
-- 8.將EMPLOYEE資料表中的LAST_NAME欄位刪除。
alter table EMPLOYEE
drop column LAST_NAME;
-- 9.修改EMPLOYEE資料表,新增一個欄位SALARY 資料型態為INT。
alter table EMPLOYEE
add SALARY INT;
-- 10.修改EMPLOYEE資料表,使用ID欄位新增一個Primary key的限制條件(constraint),並為他命名。
alter table EMPLOYEE
	add constraint pk_employee_id Primary key(id);
-- 11.在EMPLOYEE資料表新增一個外來鍵(foreign key)以確保員工不會被分派到一個不存在的部門。
alter table EMPLOYEE
	add constraint fk_employee_deptid foreign key(dept_id) REFERENCES emp(deptno);