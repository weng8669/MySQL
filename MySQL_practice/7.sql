-- 1.將下列的資料新增至MY_EMP 資料表中,不要列舉欄位。
insert into my_emp
values (1, 'Patel', 'Ralph','rpatel', 795);
-- 2.使用列舉欄位方式,將下列的資料新增至MY_EMP資料表中。
insert into my_emp (ID, LAST_NAME, FIRST_NAME, USERID, SALARY)
values (2, 'Dancs', 'Betty', 'bdancs',860);
-- 3.將下列的資料新增至MY_EMP資料表中。
insert into my_emp
values (3, 'Biri','Ben', 'bbiri', 1100),
	   (4, 'Newman','Chad', 'cnewan', 750);
-- 4.將員工編號為3的名字(last name)更改為Drexler。
SET SQL_SAFE_UPDATES=0;
update my_emp
set LAST_NAME ='Drexler'
where id=3;
-- 5.將薪資低於900元的所有員工薪資調整為1000元。
SET SQL_SAFE_UPDATES=0;
update my_emp
set SALARY =1000
where SALARY<900;
-- 6.刪除Betty Dancs的資料。
SET SQL_SAFE_UPDATES=0;
delete from my_emp
where FIRST_NAME='Betty';
-- 7. 啟動一個資料庫交易 將所有員工的薪資調升10% 設定一個交易儲存點 刪除所有MY_EMP資料表中的資料 確認資料已被你刪光了 放棄刪除資料的動作 確認交易
Set autocommit=0;
Start transaction;
Update my_emp
Set salary = salary*1.1;
savepoint a;
delete from my_emp;
Rollback to a;
commit;