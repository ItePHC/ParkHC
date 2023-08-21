--emp테이블에서  ename만 조회하시오
select ename from emp;
--emp테이블에서 job만 조회하시오
SELECT ename, job from emp;
--emp테이블 전체조회
SELECT * FROM emp;
--student 테이블 전체조회
SELECT * FROM student;

--표현식(컬럼 추가)
SELECT name,'지금 실습중' from student;
--컬럼 별칭 allias
SELECT name "이름", grade as "학년", birthday "생 일" from student;
-- emp에서 사원명,직업,입사일자를 조회하시오
SELECT ename "사원명", JOB as "직업", hiredate 입사일자 from emp;

-- DISTINCT : 중복된 값을 제거하고 출력하기
--emp에서 직업군을 중복하지 말고 출력하세요
select DISTINCT job 직업군 from emp;
select DISTINCT job "직 업 군" from emp;
--emp에서 부서번호를 중복없이 출력하세요
SELECT DISTINCT deptno 부서번호 from emp;

--합성연산자 : 컬럼을 붙혀서 출력
select name || grade 학년별학생명 from student;
--professor 조회
select * from professor;
--하나의 컬럼으로 출력_조인형 님은 정교슈 입니다
SELECT name || '님은 ' || position || ' 입니다' 교수별직급 from professor;
--emp에서 smith님의 job은 clerk입니다 
select ename || '님의 job는' || job || ' 입니다' from emp; 
--student에서 서진수님의 키는 180cm 몸무게는 72kg입니다
select name || '님의 키는 ' || height || 'cm, 몸무게는 ' || weight || 'Kg 입니다' from student;
--emp에서 내 직업음 slaesman이고 연봉은 ***입니다
select '내직업은 ' || job || '이고 연봉은 ' || sal || '입니다' from emp;

--정렬 
-- ****의 오름차순 asc는 생략가능 ( order by **** asc )  / 내림차순의 경우 ( order by **** desc)
--student에서 학생명 학년 생일을 학생명의 오름차순으로 조회하시오
select name 학생명, grade 학년, birthday 생일 from student order by grade; --asc 는 생략가능
select name 학생명, grade 학년, birthday 생일 from student order by grade desc;

--emp에서 사원명, 직업, 급여를 급여가 낮은사람순으로 조회하세요
select ename 사원명, job 직업, sal 급여 from emp order by sal desc;
select ename 사원명, job 직업, sal 급여 from emp order by 3 desc;   --컬럼번호로도 정렬가능
--emp에서 직업군을 중복없이 출력하고 직업군의 오름차순으로 출력하시오
select distinct job from emp order by job;


--산술연산자
--emp에서 sal에 특별보너스 100을 더하여 출력하시오
select ename 사원명, sal 기본급, sal+100 특별보너스 from emp;

--where절 : 조건

--emp에서 10번부서의 근무하는 사람의 // 사원명, 급여와 부서번호를 출력하세요
select ename 사원명, sal 급여, deptno 부서번호 from emp where deptno = 10;  --조건이 문자일 경우 ' '
--emp에서 이름이 KIMNG인 사람의 사원명 , 직업을 조회하시오
select ename 사원명, job 직업 from emp where ename = 'KING';
--emp에서 급여가 3000이상인 사람의 사원명, 급여를 조회하시오
select ename 사원명, sal 급여 from emp where sal >= 3000;

--student에서 키가 180이상인 학생명, 키를 출력하시오                           //  where 연산자
select name 학생명, height || 'cm' 키 from student where height >= 180;
--student에서 키가 160~180 사이인 학생명과 키 출력 : between a and b (a < b)  // between 연산자
select name 학생명, height || 'cm' 키 from student where height between 160 and 180 order by height; --오름차순 추가
--in(a,b) : a, b만 조회
-- emp에서 deptno가 20, 30인 사람들의 사원명과 부서번호를 조회
select ename 사원명, deptno 부서번호 from emp where deptno in(20,30);

--null값만 출력
--emp에서 comm이 null인 사람의 이름과 보너스를 출력하시오                        //null
select ename 사원명, comm 보너스 from emp where comm is null;
--emp에서 comm이 null이 아닌 사람의 이름과 보너스를 출력하시오                   // not null           
select ename 사원명, comm 보너스 from emp where comm is not null;            --0은 연산이 이루어진다

--NVL : null값을 0으로 바꾸기
select ename 사원명, nvl(comm,0) 보너스 from emp;                            --nvl을 사용할경우 사용하는 테이블에 범위를 지정해줘야한다 // nvl(테이블, 바꿀 값)

--Like 연산자
--학생테이블에서 김씨만 조회
select * from student where name like '김%';                                --    '%김%' : 김을 포함하는 // '%김' : 김으로 끝나는


--학생테이블 총 몇명?
select count(*) cnt from student;
--emp에서 job이 salesman, maneager인 사원명, 직업군만 출력하시오 (or   in)
select ename 사원명, job 직업군 from emp where job in('SALESMAN','MANAGER');
select ename 사원명, job 직업군 from emp where job = 'SALESMAN' or job = 'MANAGER' ;      --job = ' ' 형식으로 다중조건일 경우 (job = ' ')를 다중으로 사용한다

--emp에서 rmqdurk 2000 ~ 3000인 사원명 직업군 급여를 출력하세요(and between)연산자
select ename 사원명, job 직업군, sal 급여 from emp where 3000 >= sal and sal >= 2000;
select ename 사원명, job 직업군, sal 급여 from emp where sal between 2000 and 3000;

--Q. student 테이블에서 1학년 학생의 학생명,키를 출력하시오(키가 작은순)
select name 학생명, height 키 from student where grade = 1 order by height;
--Q. student에서 2학년 학생의 학생명 생일 키 몸무게를 출력하시오 단 생일이 빠른사람 순서
select name 학생명, birthday 생일, height 키, weight 몸무게 from student where grade = 2 order by birthday;
--Q. professor에서 교수들의 이름중 조 씨성을 가진 교수의 교수명, 직위, 입사일자를 출력하시오
select name 교수명, position 직위, hiredate 입사일자 from professor where name like '조%';
--Q. emp에서 사원명, 급여, 급여*12, 보너스 급여총계를 구하시오
select  ename 사원명, sal 급여, nvl(comm,0) 보너스, sal+nvl(comm,0) 보너스급여총계 from emp; 
--Q. emp에서 입사일자가 1980/01/01 이후에 들어온 사람의 사원명과 입사일자를 조회하시오(입사일자 순)
select ename 사원명, hiredate 입사일자 from emp where hiredate >= '1982/01/01' order by hiredate;

--Like % , _언더바 이용해서 특정순번에 있는 글을 출력         _언더바 는 한번당 한 글자를 넘겨줌
--emp에서 사원명 두번째 글자가 a인 사람의 사원명 출력
select ename 사원명 from emp where ename like '_A%';

--emp에서 사원명이 두번쨰 글자가 S인 사람 또는 3번쨰 글자가 S인 사원명 출력
select ename 사원명 from emp where ename like '_A%' or ename like '__A%';

--날짜 리터럴 '' 반드시 사용
--emp에서 직급이 clerk이고 입사일이 87/05/23인 사람의 사원명 입사일 구하기
select ename 사원명, hiredate 입사일 from emp where job = 'CLERK' AND hiredate = '87/05/23';

--emp에서 매니저이거나 82년 이후 입사자의 사원명 직업군 입사일 출력
select ename 사원명, job 직업군, hiredate 입사일 from emp where job = 'MANAGER' or hiredate >= '82/01/01';

--다중정렬
--student에서 1학년 학생의 이름과 키와 몸무게 출력 (키는 작은사람부터, 몸무게는 많은사람부터)
select name 학생명, height 키, weight 몸무게 from student where grade=1 order by height asc,weight desc;
--emp에서 급여 내림차순 후 다시 이름으로 오름차순 _ 사원번호 사원명 급여 조회
select empno 사원번호, ename 사원명, sal 급여 from emp order by sal desc, ename;

select * from student;
select * from emp;
select * from professor;
select * from gogak;

-- union : 합집합 (중복 제외)
-- union All : 합집합 (중복 포함)

-- intersect = 교집합


select name, deptno1, deptno2 from student where deptno1 = 101 UNION  
select name, deptno1, deptno2 from student where deptno2 = 201;

select name, deptno1, deptno2 from student where deptno1 = 101 intersect  
select name, deptno1, deptno2 from student where deptno2 = 201;

select name, deptno1, deptno2 from student where deptno1 = 101 and deptno2 = 201;


--Q. gogak point 가 300000에사 500000 고객명과 포인트를 출력하세요 (포인트 많은순)
select gname 고객명, point 포인트 from gogak where point between 300000 and 500000 order by point desc;
--Q.emp의 comm의 null을 0으로 바꾸어서 직업이 manager인 사람의 이름과 보너스를 출력하시오
select ename 사원명, nvl(comm,0) 보너스 from emp where job = 'MANAGER';
--Q. professor 103번 학과 교수들의 이름과 급여, 보너스, 연봉을 출력하시오
select name 이름, pay 급여, bonus 보너스, pay*12+bonus 연봉 from professor where deptno = 103;

--SQL그룹함수 (count, sum, avg)
-- count(*) : null값 포함 // count(컬럼) : null값 제외
select count(*),count(hpage) from professor;

--sum(컬럼명)
select count (bonus), sum(bonus) from professor;

--avg(컬럼명)
select count (bonus), sum(bonus), avg(bonus) from professor;

--max, min
select max(sal), min(sal) from emp;
select max(hiredate), min(hiredate) from emp;

--소수점
--emp에서 sal의 평균
select round(avg(sal),1) from emp;
select round(avg(sal),2) from emp;
select round(avg(sal),0) from emp;          --반올림
select round(avg(sal),-1) from emp;         --10단위
select round(avg(sal),2) from emp;          --100단위

--콘솔에 출력
--현재 날짜를 console에 출력                //현재날짜 : sysdate
select sysdate from dual;

--내일 날짜를 콘솔에 출력
select sysdate+1 from dual;

--to_char : 날짜 및 수치데이터를 문자로 면환하기 위한 함수
--날짜에서 년도만 추출
select max(hiredate), min(hiredate) from emp;
select to_char (sysdate, 'yyyy')from dual; 

select to_char (sysdate, 'month')from dual; 
select to_char (sysdate, 'mm')from dual; 

select to_char (sysdate, 'dd')from dual; 
select to_char (sysdate, 'day')from dual; 
select to_char (sysdate, 'yyyy-mm-dd-mi-ss')from dual;                              -- hh24 : 시간, mi : 분, ss : 초

--to_char 숫자에도 적용가능
select to_char(24587990, '999,999,999')from dual;

--연도표시
select empno 사원번호, ename 사원명, to_char(hiredate,'yyyy')년도 from emp;
--emp에서 사원번호, 사원명, 급여 출력(급여는 천단위 구분기호 추가)
select empno 사원번호, ename 사원명, to_char(sal,'L999,999')급여 from emp;


-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

--서브쿼리
--쿼리안에 또 다른 쿼리를 담는다(king,보다 급여를 많이 받는 사람은?) _ 2가지 질문
--서브쿼리가 먼저 수행되어 그 결과를 메인쿼리에 전해주고 그 값을 받아 최종 메인쿼리가 실행된다
--서브쿼리 안에는 order by절이 못온다

select * from emp;
select * from student;

(select sal from emp where ename = 'KING');
--emp에서 KING보다 급여를 많이 받는 사람의 사원명 급여를 구해보자
select ename 사원명, sal 급여 from emp where sal > (select sal from emp where ename = 'JAMES');

--emp에서 평균급여보다 많이 받는 사람의 사원번호, 사원명, 급여를 나타내시오
select empno 사원번호, ename 사원명, sal 급여 from emp where sal > (select avg(sal)from emp);

--emp에서 이름이 WARD인 사람의 MGR과 같은 값을 가진 사람의 목록 출력
select * from emp where mgr = (select mgr from emp where ename like 'WARD');

--emp에서 평균급여보다 많이 받는 사람 수
select count(*) from emp where sal > (select avg(sal) from emp);

--서브쿼리 문제
--emp에서 ADAMS와 같은 직업군을 가진 사람의 이름 연봉 직업군 출력
select ename 사원명, sal*12 연봉, job 직업군 from emp where job = (select job from emp where ename like 'ADAMS');
--emp에서 SCOTT과 같은 연봉을 받튼 사람의 이름과 연봉 출력 // 2명
select ename 사원명, sal*12 연봉 from emp where sal = (select sal from emp where ename like 'SCOTT');
--student에서 제1전공이 일지매 학생과 동일한 학생들의 학생명 제1전공 출력 // 4명
select name 이름, deptno1 제1전공 from student where deptno1 = (select deptno1 from student where name like '일지매');
--student에서 제1전공이 101인 학과의 평균몸무게보다 몸무게가 많은 학생들의 이름과 몸무게 출력  // 11명
select name 이름, weight 몸무게 from student where weight > (select avg(weight) from student where deptno1 = 101);
--professor에서 입사일이 김영조 교수보다 나중에 입사한 사람의 이름과 입사일 학과번호   //5명 
select name 이름, hiredate 입사일, profno 학과번호 from professor where hiredate > (select hiredate from professor where name like '김영조');


