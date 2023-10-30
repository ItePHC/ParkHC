--복습문제
select * from emp;

--Q1. emp에서 job종류별로 직업군을 한번씩만 출력해보세요
select Distinct job 직업군 from emp;
--Q2. emp 테이블에서 사원명이 A나 S로 시작하는 사람만 출력해보세요 (사원번호 사원명)
select empno 사원번호, ename 사원명 from emp where ename like 'A%' or ename like 'S%';
--Q3. emp에서 deptmo가 10인 부서만 출력하시오(사원명 부서번호)
select ename 사원명, deptno 부서번호 from emp where deptno = 10;
--Q4. emp에서 급여(sal)가 평균보다 더 높은 사람의 사원명 급여를 출력하세요
select ename 사원명, sal 급여 from emp where sal > (select avg(sal)from emp);
--Q5. SCOTT의 급여와 동일하거나 더 많이 받는 사람의 사원명과 급여를 출력하시오
select ename 사원명, sal 급여 from emp where sal >= (select sal from emp where ename = 'SCOTT');
--Q6. emp의 hiredate가 5월인 사람의 사원명 입사일자를 출력하시오 (to_char)
select ename 사원명, hiredate 입사일자 from emp where to_char(hiredate, 'mm') = '05';

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- 테이블 생성
-- primart key는 기본기를 의미 not null + unique를 의미한다

--test 테이블
create table test(num number(5) primary key, name varchar2(20), score number(6,2), birth date);

desc test;          --구조보기
select * from test;

--test에 전체데이터 insert   (num은 생략가능)
insert into test values(1, '손석구', 67.2,'2000-10-18');
--test에 일부데이터 insert
insert into test (num, name) values (2, '강호동');

--insert 에러
-- 무결성 제약 조건(PHC.SYS_C008353)에 위배
insert into test values(4, '이영애', 68.72, '1989-11-12');

--sysdate : 현재날짜 의미
insert into test values (5, '이효리', 82.3, sysdate);


--alter
--나이를 저장할 컬럼 추가, 무조건 null로 추가
--ALTER TABLE 테이블명 ADD 추가할컬럼명 데이터타입

alter table test add age number(5);

--주소를 저장할 컬럼 추가. 초기값을 강남구로 지정 default
alter table test add addr varchar2(30) default '강남구';

--SQL오류 : SQL 오류: ORA-00947: 값의 수가 충분하지 않습니다
-- insert into test values(4, '이영애', 68.72, '1989-11-12', '대한민국 서울시 강남구 테혜란로 11-3ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ' );
-- 주소저장컬럼 30 => 50
-- ALTER TABEL 테이블명 MODIFY 컬럼명 데이터값 입력
alter table test modify addr varchar(50);

--age타입을 문자열(10)으로 변경하고 초기값을 20으로 설정하기
--기존 null은 그대로 있고 새로 insert 하는 것 부터 초기값 들어감
alter table test modify age varchar2(10) default '20';

insert into test (num, name) values (10, '강호동');

--num의 오름차순 출력
select * from test order by num;
--name의 내림차순 출력
select * from test order by name desc;

--drop
--ALTER TABLE 테이블명 DROP COLUMN 삭제할 컬럼명
--age열 삭제
alter table test drop column age; 
--addr 삭제
alter table test drop column addr; 


--컬럼명 변경
--ALTER TABLE 테이블명 RENAME COLUMN  OLD컬럼명 TO NEW컬럼명;
-- score -> jumsu
alter table test rename column score to jumsu;
-- birth -> birthday
alter table test rename column birth to birthday;


--테이블 삭제 test           // delete : 테이블 안의 내용 삭제, drop : 테이블 삭제
drop table test;

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

--시퀸스 생성
--시퀸스 기본으로 생성, 1부터 1씩 증가하는 시퀸스 생성됨

create sequence seq1;

--전체 시퀸스 확인
select * from seq;

--다음 시퀸스값을 발생 콘솔에 출력
select seq1.nextval from dual;

--현재 바마지막 발생한 시퀸스값
select seq1.currval from dual;

--seq1 삭제
drop sequence seq1;

--10부터 5씩 증가하는 시퀸스 생성 - cache값 없애기
--start with (n) : 시작값 n
create sequence seq2 start with 10 increment by 5 nocache;

--시퀸스 발생
select seq2.nextval from dual;

select seq2.currval from dual;
--시퀸스 2 삭제
drop sequence seq2;

--seq1  시작값 : 5 증가값 : 2 끝값 : 30 캐쉬 no, cycle:y
create sequence seq1 start with 5 increment by 2 maxvalue 30 nocache cycle;
--seq2  시작값 : 1 증가값 : 1 cache:n
create sequence seq2 nocache;
--seq3 시작값 : 1 증가값 : 2 cache:n
create sequence seq3 start with 1 increment by 2 nocache;

select seq1.nextval, seq2.nextval, seq3.nextval from dual;

drop sequence seq1;
drop sequence seq2;
drop sequence seq3;

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- 시퀸스 1개 생성, 테이블 생성
create sequence seq_start nocache;


create table personinfo(num number(5) primary key, name varchar2(20), job varchar2(30), gender varchar2(20),age number(5), hp varchar2(20), birthday date);

desc personinfo;

--birthday => ipsaday
alter table personinfo rename column birthday to ipsaday;
--insert
insert into personinfo values (seq_start.nextval, '박병주', '엔지니어', '남자', 26, '010-1111-2222','2023-11-26');
insert into personinfo values (seq_start.nextval, '김윤재', '엔지니어', '남자', 23, '010-1234-5678','2023-11-26');
insert into personinfo values (seq_start.nextval, '김지영', '경리', '여자', 28, '010-2222-3333','2022-12-10');
insert into personinfo values (seq_start.nextval, '김영환', '연예인', '남자', 36, '010-7777-7777','2012-01-21');
insert into personinfo values (seq_start.nextval, '이교환', '교사', '남자', 26, '010-3246-5153','2022-11-26');
insert into personinfo values (seq_start.nextval, '박지민', '군인 ', '여자', 24, '010-8652-5732','2023-01-26');
insert into personinfo values (seq_start.nextval, '김주현', '프로그래머', '여자', 32, '010-4234-2745','2016-03-18');
commit;

--최종인원확인
select count(*) from personinfo;
--조회연습
select * from personinfo order by name asc;
select * from personinfo order by age desc;
select * from personinfo order by 5 asc;        --컬럼번호도 가능

select * from personinfo order by gender, age desc;
select * from personinfo order by gender, name;

select job from personinfo;
select distinct job from personinfo;

--성이 박씨만 출력
select * from personinfo where name like '박%';

--이름 두번째 글자가 교인사람
select * from personinfo where name like '_윤%';

--핸드폰 마지막 자리가 3333인 사람
select * from personinfo where hp like '%3333';

--입사일자가 3월인사람 출력
select * from personinfo where to_char(ipsaday, 'mm') = '11';

--입사일자가 2023년인사람을 출력
select * from personinfo where to_char(ipsaday, 'yyyy') = '2022';

--나이가 20~30 사이인 사람 출력
select * from personinfo where age between 20 and 30 order by age asc; 

--직업이 연예인이거나 프로그래머인 사람
select * from personinfo where job in ('연예인', '프로그래머');

--직업이 연예인이거나 프로그래머가 아닌 사람
select * from personinfo where job not in ('연예인', '프로그래머');

--평균나이를 소수점 한자리로 구하기
select round(avg(age),1) from personinfo ;

--내용수정 (update)
--UPDATE 테이블명 SET 컬럼1='변경할데이터' WHERE 컬럼2='데이터값'
--직업 나이 수정 / 조건이 없으면 모든 데이터가 수정된다
update personinfo set job = '간호사', age = 35;
-- 잘못 수정한 데이터를 원래대로 돌려놓기
rollback;
--3번만 수정
update personinfo set job = '간호사', age = 35 where num = 2;

--김씨이면서 프로그래머인 사람의 젠더를 남자로 수정하기
update personinfo set gender = '남자' where name like '강%' and job = '프로그래머' ;

--num이 8번인 사람의 직업을 교사로, 입사일을 2000-12-25로 수정
update personinfo set job = '교사', ipsaday = '2000-12-25' where num = 8;

--최종저장
commit;             


--삭제
-- DELETE FROM 테이블명;
delete from personinfo;
--5번만 삭제
delete from personinfo where num=5;

--여자중에서 나이가 25세 이상만 모두 삭제
delete from personinfo where age >= 25 and gender = '여자';

--핸드폰을 ***-****-****으로 수정
update personinfo set hp = '***-****-****';



--테이블삭제
--시퀸스 삭제
drop table personinfo;
drop sequence seq_start;



-- rollback : commit 하기 전까지 마지막으로 했던 작업을 롤백가능
rollback;

select * from personinfo;

select * from seq_start;


------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
select * from emp;
select * from dept;
select * from product;


--dept에서 30번 부서를 시에틀로 변경
update dept set loc = 'SEATTLE' where deptno = 30;

--emo테이블 comn옆에 Totsal열을 추가
alter table emp add TotalSal number(20);

--emp테이블 Totsal에 sal과 comn을 더한 가격을 수정하시오
update emp set totalsal = sal+nvl(comm,0);

--emp에서 WARD 삭제
delete from emp where ename = 'WARD';

--product테이블에서 100번을 초코파이로 수정
update product set p_name = '초코파이' where p_code = 100 ;

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--Group by
--professor에서 학과별로 교수들의 평균급여를 출력하시오

select deptno 학과, avg(pay) "평균 급여" from professor group by deptno;

--select 절에 사용된 그룹함수 이외의 컬럼이나 표현식은 반드시 group by에 사용되어야함
--profrssor에서 직급별 평균보너스를 출력하시오
select position 직급, avg(NVL(bonus, 0)) "평균 보너스" from professor group by position; 

select deptno, position, avg(pay) "평균 급여" from professor group by deptno, position;

--student에서 학년별 최고키와 최고몸무게 출력
select grade, max(height) "최고 신장", max(weight) "최고 몸무게" from student group by grade;

--교수의 직급별 총급여와 최고 보너스를 구하시오
select position, sum(pay) "총 급여", max(nvl(bonus,0)) "최고보너스" from professor group by position;

--emp에서 동일한 직업끼리의 사원 수
select job 직업 , count(job) "사원 수" from emp group by job;


--Having절 : 조건을 주고 검색할떄 쓰인다 / 사용시 반드시 group by 뒤에 사용된다
--평균급여가 400이상인 부서의 부서번호와 평균급여를 구하시오
--where절은 그룹함수의 비교조건으로 쓸수 없다
select deptno, avg(sal) from emp group by deptno having avg(sal) > 400;

--professor에서 평균급여가 300이상인 학과의 학과번호와 평균급여를 구하시오
select deptno 학과번호, avg(pay) "평균 급여" from professor group by deptno having avg(pay) >= 300;
select deptno 학과번호, avg(pay) "평균 급여" from professor where deptno not in (101) group by deptno having avg(pay) >= 300;

--emp에서 job별로 sal의 평균급여를 구하시오
select job, avg(sal) from emp group by job;

--professor에서 직급별 총 급여를 구하시오
select position, sum(pay) "총 급여" from professor group by position;

--emp에서 직업별 인원수 최대급여 최소급여를 출력하세요(job의 오름차순)
select job, count(job), max(sal) "최대급여", min(sal) "최소급여" from emp group by job order by job asc;
--입사년도 그룹별로 출력 (입사년도, 인원수 급여평균(소수점 한자리)) _ 입사년도의 오름차순
select to_char(hiredate, 'yyyy') 입사년도, count(*) 인원수, round(avg(sal), 1) 평균급여 from emp group by to_char(hiredate, 'yyyy') order by to_char(hiredate, 'yyyy');

--Rollup함수
--자동으로 소계 / 합계 구해주는 함수
--gorup by 절에 주어진 조건으로 소개값을 구해준다
select deptno 학과번호, position 직위, sum(pay) 총급여  from professor group by position, rollup(deptno);

select deptno 학과번호, position 직위, sum(pay) 총급여  from professor group by deptno, rollup(position);

--count
select position, count(*), sum(pay) from professor group by rollup(position);


--cube함수
--rollup처럼 각 소계의 전체총계까지 구해준다
select deptno, position, count(*), sum(pay) from professor group by cube(deptno, position);

select * from emp;


--총복습
--Q1. emp에서 평균연봉이 2000이상인 부서의 부서번호와 평균급여를 구하시오
select deptno, avg(sal*12) "평균연봉" from emp group by deptno having avg(sal*12) >= 2000;
--Q2. emp에서 deptno별 인원수는?
select deptno, count(deptno) from emp group by deptno;
--Q3. emp에서 job별 인원수를 구하시오 (단 인원이 2명 이상인 곳만 구할 것)
select job, count(job) from emp group by job having count(job) >= 2;
--Q4. emp에서 job별 급여합계를 구하는데 (president는 제외할것) 급여합계가 5000이상이여야 하고 높은것부터 출력할것
select job 직업, sum(sal) "급여 합계" from emp where job not in ('PRESIDENT') group by job having sum(sal) >= 5000 order by sum(sal) desc; 

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--제약조건
--테이블생성
create table sawon(num number(5) CONSTRAINT sawon_pk_num primary key, name varchar2(20), gender varchar(10), buseo varchar2(20), CONSTRAINT sawon_ck_buseo check(buseo in('홍보부', '인사부', '교육부')), pay number(10) default 2000000);


--시퀀스 생성
create sequence seq_sawon nocache;

--데이터 10개정도 insert
--체크 제약조건(PHC.SAWON_CK_BUSEO)이 위배되었습니다
-- insert into sawon values (seq_sawon.nextval, '이영미', '여자', '게임개발부',3500000);
insert into sawon values (seq_sawon.nextval, '이영미', '여자', '홍보부',3500000);
insert into sawon values (seq_sawon.nextval, '김지혁', '남자', '인사부',3000000);
insert into sawon values (seq_sawon.nextval, '박창섭', '남자', '교육부',2950000);
insert into sawon values (seq_sawon.nextval, '이영훈', '남자', '교육부',3250000);
insert into sawon values (seq_sawon.nextval, '이지민', '여자', '인사부',4000000);
insert into sawon values (seq_sawon.nextval, '김정빈', '여자', '인사부',4200000);
insert into sawon values (seq_sawon.nextval, '한동숙', '남자', '홍보부',3700000);
insert into sawon values (seq_sawon.nextval, '이기영', '남자', '교육부',3800000);
insert into sawon values (seq_sawon.nextval, '박영지', '여자', '홍보부',3400000);
insert into sawon values (seq_sawon.nextval, '김형빈', '남자', '인사부',3500000);
commit;


--부서별 인원수와 최고급여, 최저급여 조회
select buseo 부서명, max(pay) 최고급여, min(pay) 최저급여 from sawon group by buseo;

--위의 쿼리문에서 최고급여, 최저급여에 화폐단위 붙이고 3자리 컴마도 나오게 하기
select buseo 부서명, max(to_char(pay,'L999,999,999')) "최고급여", min(to_char(pay, 'L999,999,999')) 최저급여 from sawon group by buseo;

--성별 인원수와 평균 급여를 출력하시오 (인원수 뒤에 명 이라고 나오게 출력하기)
select gender, count(gender) || '명' 성별인원수, avg(pay) "평균 급여"  from sawon group by gender;

-- 부서별 인원수와 평균급여를 구학되 인원이 4명 이상인 경우에만 출력되도록 할것
select buseo, count(*) 인원수, avg(pay) 평균급여 from sawon group by buseo having count(*) >= 4;

delete sawon;

rollback;

select * from sawon;

select to_char (sysdate, 'yyyy-mm-dd-hh24-mi-ss')from dual;
select to_char(24587990, '999,999,999')from dual;
select round(avg(sal),-1) from emp; 