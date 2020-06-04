drop table dept;

create table dept
(
    dcode number(3) primary key,
    dname varchar2(12) not null
);

-- p.26 1장 select 데이터 조회
DROP TABLE emp;

CREATE TABLE emp
(
    empno NUMBER(4) PRIMARY KEY,
    -- 사원번호
    ename VARCHAR(20) NOT NULL,
    -- 사원명
    job VARCHAR(20) NOT NULL,
    -- 직함.(역할)
    mgr NUMBER(4) REFERENCES emp(empno) ON DELETE SET NULL ,
    -- 바로 위 상사, 상사가 없는 데이터 - 사장
    hiredate DATE DEFAULT SYSDATE NOT NULL,
    -- 입사일
    sal NUMBER NOT NULL,
    -- 월급
    comm NUMBER,
    -- 수당
    deptno NUMBER(4) REFERENCES dept(dcode)
                     ON DELETE SET NULL
    -- 부서번호
);

--dept 부세 데이터
insert into dept
values
    (10, '기획부');
insert into dept
values
    (20, '전산부');
insert into dept
values
    (30, '회계부');
insert into dept
values
    (40, '영업부');
commit;

--정렬없이 가져오기
select *
from dept;
-- 정렬하여 불러오기 >> 정렬은 DB에서 금기사항
select *
from dept
order by dcode;
-- pri key 인덱스로 정렬하여
select *
from dept
where dcode >0;


-- 샘플데이터 입력 P.26
INSERT INTO emp
VALUES
    (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10);
INSERT INTO emp
VALUES
    (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20);
INSERT INTO emp
VALUES
    (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20);
INSERT INTO emp
VALUES
    (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20);
INSERT INTO emp
VALUES
    (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30);
INSERT INTO emp
VALUES
    (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30);
INSERT INTO emp
VALUES
    (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30);
INSERT INTO emp
VALUES
    (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30);
INSERT INTO emp
VALUES
    (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10);
INSERT INTO emp
VALUES
    (7788, 'SCOTT', 'MANAGER', 7698, '1980-12-17', 800, NULL, 20);
INSERT INTO emp
VALUES
    (7844, 'TURNER', 'SALESMAN', 7698, '1981-08-08', 1500, 0, 20);
INSERT INTO emp
VALUES
    (7876, 'ADAMS', 'MANAGER', 7698, '1980-12-17', 800, NULL, 20);
INSERT INTO emp
VALUES
    (7900, 'JAMES', 'ANALYST', 7698, '1981-12-03', 950, NULL, 30);
INSERT INTO emp
VALUES
    (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);
COMMIT;
SELECT *
FROM emp;


select  dcode, avg(sal) avg_sal from dept, emp group by deptno;

select * from dept, 
(select avg(sal) avg_sal from emp group by deptno )
;

select * from emp, dept where dept.dcode = emp.deptno;

select deptno, avg(sal) sal 
from 
(select * from emp, dept where dept.dcode = emp.deptno)
group by deptno order by deptno asc;


select shopNo, shopName, shopCategory,
shopX, shopY, avg(reviewRank) reviewRank  
from 
(select shopNo, shopName, shopCategory, shopX, shopY, reviewRank 
from shop LEFT JOIN review on shop.shopNo = reviewShopNo ) 
where 
shopCategory = ?  group by shopNo order by shopNo;



