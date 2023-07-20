-- 1.使用EMP資料表中的員工編號(empno),姓名(ename)及部門編號(deptno)來建立一個EMP_VU view,並將姓名(ename)欄位名稱改成EMPLOYEE。
create view EMP_VU 
as 
select empno, ename EMPLOYEE, deptno
from emp;
-- 2.顯示EMP_VU view中的資料內容。
select *
from EMP_VU;
-- 3.使用EMP_VU view來顯示所有員工之姓名及部門編號。
select employee, deptno
from EMP_VU;
-- 4.新建一個名為DEPT20的view,包含在部門20的所有員工之員工編號，員工姓名，及部門編號。將View中的資料項目命名為EMPLOYEE_ID, EMPLOYEE, and DEPARTMENT_ID。並設定不允許使用者透過DEPT20來更改員工所屬的部門編號。
create view DEPT20
as
select empno EMPLOYEE_ID, ename EMPLOYEE, deptno DEPARTMENT_ID
from emp
where deptno=20
with check option;
-- 5.顯示DEPT20 view的欄位定義資料(結構)及其所有資料內容。
select *
from DEPT20;
DESC dept20;
-- 6.試試看利用DEPT20 view將Smith 轉調到部門30。
update DEPT20
set DEPARTMENT_ID=30
where employee='Smith';
-- 7.新建一個名為SALARY_VU的view，包含所有員工之姓名，部門名稱，薪資和薪資等級。將View中的資料項目分別命名為Employee, Department, Salary, Grade。
create view salary_vu
as 
select e.ename Employee, d.dname Department, e.sal Salary, s.grade Grade
from emp e join dept d on (e.deptno= d.deptno)
		   join salgrade s on (e.sal between s.losal and s.hisal);
-- 8.在EMP資料表中利用ename欄位建立一個non-unique index 命名為idx_emp_ename。
create index idx_emp_ename on emp(ename);