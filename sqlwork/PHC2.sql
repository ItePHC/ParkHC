--��������
select * from emp;

--Q1. emp���� job�������� �������� �ѹ����� ����غ�����
select Distinct job ������ from emp;
--Q2. emp ���̺��� ������� A�� S�� �����ϴ� ����� ����غ����� (�����ȣ �����)
select empno �����ȣ, ename ����� from emp where ename like 'A%' or ename like 'S%';
--Q3. emp���� deptmo�� 10�� �μ��� ����Ͻÿ�(����� �μ���ȣ)
select ename �����, deptno �μ���ȣ from emp where deptno = 10;
--Q4. emp���� �޿�(sal)�� ��պ��� �� ���� ����� ����� �޿��� ����ϼ���
select ename �����, sal �޿� from emp where sal > (select avg(sal)from emp);
--Q5. SCOTT�� �޿��� �����ϰų� �� ���� �޴� ����� ������ �޿��� ����Ͻÿ�
select ename �����, sal �޿� from emp where sal >= (select sal from emp where ename = 'SCOTT');
--Q6. emp�� hiredate�� 5���� ����� ����� �Ի����ڸ� ����Ͻÿ� (to_char)
select ename �����, hiredate �Ի����� from emp where to_char(hiredate, 'mm') = '05';

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- ���̺� ����
-- primart key�� �⺻�⸦ �ǹ� not null + unique�� �ǹ��Ѵ�

--test ���̺�
create table test(num number(5) primary key, name varchar2(20), score number(6,2), birth date);

desc test;          --��������
select * from test;

--test�� ��ü������ insert   (num�� ��������)
insert into test values(1, '�ռ���', 67.2,'2000-10-18');
--test�� �Ϻε����� insert
insert into test (num, name) values (2, '��ȣ��');

--insert ����
-- ���Ἲ ���� ����(PHC.SYS_C008353)�� ����
insert into test values(4, '�̿���', 68.72, '1989-11-12');

--sysdate : ���糯¥ �ǹ�
insert into test values (5, '��ȿ��', 82.3, sysdate);


--alter
--���̸� ������ �÷� �߰�, ������ null�� �߰�
--ALTER TABLE ���̺�� ADD �߰����÷��� ������Ÿ��

alter table test add age number(5);

--�ּҸ� ������ �÷� �߰�. �ʱⰪ�� �������� ���� default
alter table test add addr varchar2(30) default '������';

--SQL���� : SQL ����: ORA-00947: ���� ���� ������� �ʽ��ϴ�
-- insert into test values(4, '�̿���', 68.72, '1989-11-12', '���ѹα� ����� ������ �������� 11-3��������������������������������' );
-- �ּ������÷� 30 => 50
-- ALTER TABEL ���̺�� MODIFY �÷��� �����Ͱ� �Է�
alter table test modify addr varchar(50);

--ageŸ���� ���ڿ�(10)���� �����ϰ� �ʱⰪ�� 20���� �����ϱ�
--���� null�� �״�� �ְ� ���� insert �ϴ� �� ���� �ʱⰪ ��
alter table test modify age varchar2(10) default '20';

insert into test (num, name) values (10, '��ȣ��');

--num�� �������� ���
select * from test order by num;
--name�� �������� ���
select * from test order by name desc;

--drop
--ALTER TABLE ���̺�� DROP COLUMN ������ �÷���
--age�� ����
alter table test drop column age; 
--addr ����
alter table test drop column addr; 


--�÷��� ����
--ALTER TABLE ���̺�� RENAME COLUMN  OLD�÷��� TO NEW�÷���;
-- score -> jumsu
alter table test rename column score to jumsu;
-- birth -> birthday
alter table test rename column birth to birthday;


--���̺� ���� test           // delete : ���̺� ���� ���� ����, drop : ���̺� ����
drop table test;

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

--������ ����
--������ �⺻���� ����, 1���� 1�� �����ϴ� ������ ������

create sequence seq1;

--��ü ������ Ȯ��
select * from seq;

--���� ���������� �߻� �ֿܼ� ���
select seq1.nextval from dual;

--���� �ٸ����� �߻��� ��������
select seq1.currval from dual;

--seq1 ����
drop sequence seq1;

--10���� 5�� �����ϴ� ������ ���� - cache�� ���ֱ�
--start with (n) : ���۰� n
create sequence seq2 start with 10 increment by 5 nocache;

--������ �߻�
select seq2.nextval from dual;

select seq2.currval from dual;
--������ 2 ����
drop sequence seq2;

--seq1  ���۰� : 5 ������ : 2 ���� : 30 ĳ�� no, cycle:y
create sequence seq1 start with 5 increment by 2 maxvalue 30 nocache cycle;
--seq2  ���۰� : 1 ������ : 1 cache:n
create sequence seq2 nocache;
--seq3 ���۰� : 1 ������ : 2 cache:n
create sequence seq3 start with 1 increment by 2 nocache;

select seq1.nextval, seq2.nextval, seq3.nextval from dual;

drop sequence seq1;
drop sequence seq2;
drop sequence seq3;

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- ������ 1�� ����, ���̺� ����
create sequence seq_start nocache;


create table personinfo(num number(5) primary key, name varchar2(20), job varchar2(30), gender varchar2(20),age number(5), hp varchar2(20), birthday date);

desc personinfo;

--birthday => ipsaday
alter table personinfo rename column birthday to ipsaday;
--insert
insert into personinfo values (seq_start.nextval, '�ں���', '�����Ͼ�', '����', 26, '010-1111-2222','2023-11-26');
insert into personinfo values (seq_start.nextval, '������', '�����Ͼ�', '����', 23, '010-1234-5678','2023-11-26');
insert into personinfo values (seq_start.nextval, '������', '�渮', '����', 28, '010-2222-3333','2022-12-10');
insert into personinfo values (seq_start.nextval, '�迵ȯ', '������', '����', 36, '010-7777-7777','2012-01-21');
insert into personinfo values (seq_start.nextval, '�̱�ȯ', '����', '����', 26, '010-3246-5153','2022-11-26');
insert into personinfo values (seq_start.nextval, '������', '���� ', '����', 24, '010-8652-5732','2023-01-26');
insert into personinfo values (seq_start.nextval, '������', '���α׷���', '����', 32, '010-4234-2745','2016-03-18');
commit;

--�����ο�Ȯ��
select count(*) from personinfo;
--��ȸ����
select * from personinfo order by name asc;
select * from personinfo order by age desc;
select * from personinfo order by 5 asc;        --�÷���ȣ�� ����

select * from personinfo order by gender, age desc;
select * from personinfo order by gender, name;

select job from personinfo;
select distinct job from personinfo;

--���� �ھ��� ���
select * from personinfo where name like '��%';

--�̸� �ι�° ���ڰ� ���λ��
select * from personinfo where name like '_��%';

--�ڵ��� ������ �ڸ��� 3333�� ���
select * from personinfo where hp like '%3333';

--�Ի����ڰ� 3���λ�� ���
select * from personinfo where to_char(ipsaday, 'mm') = '11';

--�Ի����ڰ� 2023���λ���� ���
select * from personinfo where to_char(ipsaday, 'yyyy') = '2022';

--���̰� 20~30 ������ ��� ���
select * from personinfo where age between 20 and 30 order by age asc; 

--������ �������̰ų� ���α׷����� ���
select * from personinfo where job in ('������', '���α׷���');

--������ �������̰ų� ���α׷��Ӱ� �ƴ� ���
select * from personinfo where job not in ('������', '���α׷���');

--��ճ��̸� �Ҽ��� ���ڸ��� ���ϱ�
select round(avg(age),1) from personinfo ;

--������� (update)
--UPDATE ���̺�� SET �÷�1='�����ҵ�����' WHERE �÷�2='�����Ͱ�'
--���� ���� ���� / ������ ������ ��� �����Ͱ� �����ȴ�
update personinfo set job = '��ȣ��', age = 35;
-- �߸� ������ �����͸� ������� ��������
rollback;
--3���� ����
update personinfo set job = '��ȣ��', age = 35 where num = 2;

--�达�̸鼭 ���α׷����� ����� ������ ���ڷ� �����ϱ�
update personinfo set gender = '����' where name like '��%' and job = '���α׷���' ;

--num�� 8���� ����� ������ �����, �Ի����� 2000-12-25�� ����
update personinfo set job = '����', ipsaday = '2000-12-25' where num = 8;

--��������
commit;             


--����
-- DELETE FROM ���̺��;
delete from personinfo;
--5���� ����
delete from personinfo where num=5;

--�����߿��� ���̰� 25�� �̻� ��� ����
delete from personinfo where age >= 25 and gender = '����';

--�ڵ����� ***-****-****���� ����
update personinfo set hp = '***-****-****';



--���̺����
--������ ����
drop table personinfo;
drop sequence seq_start;



-- rollback : commit �ϱ� ������ ���������� �ߴ� �۾��� �ѹ鰡��
rollback;

select * from personinfo;

select * from seq_start;


------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
select * from emp;
select * from dept;
select * from product;


--dept���� 30�� �μ��� �ÿ�Ʋ�� ����
update dept set loc = 'SEATTLE' where deptno = 30;

--emo���̺� comn���� Totsal���� �߰�
alter table emp add TotalSal number(20);

--emp���̺� Totsal�� sal�� comn�� ���� ������ �����Ͻÿ�
update emp set totalsal = sal+nvl(comm,0);

--emp���� WARD ����
delete from emp where ename = 'WARD';

--product���̺��� 100���� �������̷� ����
update product set p_name = '��������' where p_code = 100 ;

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--Group by
--professor���� �а����� �������� ��ձ޿��� ����Ͻÿ�

select deptno �а�, avg(pay) "��� �޿�" from professor group by deptno;

--select ���� ���� �׷��Լ� �̿��� �÷��̳� ǥ������ �ݵ�� group by�� ���Ǿ����
--profrssor���� ���޺� ��պ��ʽ��� ����Ͻÿ�
select position ����, avg(NVL(bonus, 0)) "��� ���ʽ�" from professor group by position; 

select deptno, position, avg(pay) "��� �޿�" from professor group by deptno, position;

--student���� �г⺰ �ְ�Ű�� �ְ������ ���
select grade, max(height) "�ְ� ����", max(weight) "�ְ� ������" from student group by grade;

--������ ���޺� �ѱ޿��� �ְ� ���ʽ��� ���Ͻÿ�
select position, sum(pay) "�� �޿�", max(nvl(bonus,0)) "�ְ��ʽ�" from professor group by position;

--emp���� ������ ���������� ��� ��
select job ���� , count(job) "��� ��" from emp group by job;


--Having�� : ������ �ְ� �˻��ҋ� ���δ� / ���� �ݵ�� group by �ڿ� ���ȴ�
--��ձ޿��� 400�̻��� �μ��� �μ���ȣ�� ��ձ޿��� ���Ͻÿ�
--where���� �׷��Լ��� ���������� ���� ����
select deptno, avg(sal) from emp group by deptno having avg(sal) > 400;

--professor���� ��ձ޿��� 300�̻��� �а��� �а���ȣ�� ��ձ޿��� ���Ͻÿ�
select deptno �а���ȣ, avg(pay) "��� �޿�" from professor group by deptno having avg(pay) >= 300;
select deptno �а���ȣ, avg(pay) "��� �޿�" from professor where deptno not in (101) group by deptno having avg(pay) >= 300;

--emp���� job���� sal�� ��ձ޿��� ���Ͻÿ�
select job, avg(sal) from emp group by job;

--professor���� ���޺� �� �޿��� ���Ͻÿ�
select position, sum(pay) "�� �޿�" from professor group by position;

--emp���� ������ �ο��� �ִ�޿� �ּұ޿��� ����ϼ���(job�� ��������)
select job, count(job), max(sal) "�ִ�޿�", min(sal) "�ּұ޿�" from emp group by job order by job asc;
--�Ի�⵵ �׷캰�� ��� (�Ի�⵵, �ο��� �޿����(�Ҽ��� ���ڸ�)) _ �Ի�⵵�� ��������
select to_char(hiredate, 'yyyy') �Ի�⵵, count(*) �ο���, round(avg(sal), 1) ��ձ޿� from emp group by to_char(hiredate, 'yyyy') order by to_char(hiredate, 'yyyy');

--Rollup�Լ�
--�ڵ����� �Ұ� / �հ� �����ִ� �Լ�
--gorup by ���� �־��� �������� �Ұ����� �����ش�
select deptno �а���ȣ, position ����, sum(pay) �ѱ޿�  from professor group by position, rollup(deptno);

select deptno �а���ȣ, position ����, sum(pay) �ѱ޿�  from professor group by deptno, rollup(position);

--count
select position, count(*), sum(pay) from professor group by rollup(position);


--cube�Լ�
--rollupó�� �� �Ұ��� ��ü�Ѱ���� �����ش�
select deptno, position, count(*), sum(pay) from professor group by cube(deptno, position);

select * from emp;


--�Ѻ���
--Q1. emp���� ��տ����� 2000�̻��� �μ��� �μ���ȣ�� ��ձ޿��� ���Ͻÿ�
select deptno, avg(sal*12) "��տ���" from emp group by deptno having avg(sal*12) >= 2000;
--Q2. emp���� deptno�� �ο�����?
select deptno, count(deptno) from emp group by deptno;
--Q3. emp���� job�� �ο����� ���Ͻÿ� (�� �ο��� 2�� �̻��� ���� ���� ��)
select job, count(job) from emp group by job having count(job) >= 2;
--Q4. emp���� job�� �޿��հ踦 ���ϴµ� (president�� �����Ұ�) �޿��հ谡 5000�̻��̿��� �ϰ� �����ͺ��� ����Ұ�
select job ����, sum(sal) "�޿� �հ�" from emp where job not in ('PRESIDENT') group by job having sum(sal) >= 5000 order by sum(sal) desc; 

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--��������
--���̺����
create table sawon(num number(5) CONSTRAINT sawon_pk_num primary key, name varchar2(20), gender varchar(10), buseo varchar2(20), CONSTRAINT sawon_ck_buseo check(buseo in('ȫ����', '�λ��', '������')), pay number(10) default 2000000);


--������ ����
create sequence seq_sawon nocache;

--������ 10������ insert
--üũ ��������(PHC.SAWON_CK_BUSEO)�� ����Ǿ����ϴ�
-- insert into sawon values (seq_sawon.nextval, '�̿���', '����', '���Ӱ��ߺ�',3500000);
insert into sawon values (seq_sawon.nextval, '�̿���', '����', 'ȫ����',3500000);
insert into sawon values (seq_sawon.nextval, '������', '����', '�λ��',3000000);
insert into sawon values (seq_sawon.nextval, '��â��', '����', '������',2950000);
insert into sawon values (seq_sawon.nextval, '�̿���', '����', '������',3250000);
insert into sawon values (seq_sawon.nextval, '������', '����', '�λ��',4000000);
insert into sawon values (seq_sawon.nextval, '������', '����', '�λ��',4200000);
insert into sawon values (seq_sawon.nextval, '�ѵ���', '����', 'ȫ����',3700000);
insert into sawon values (seq_sawon.nextval, '�̱⿵', '����', '������',3800000);
insert into sawon values (seq_sawon.nextval, '�ڿ���', '����', 'ȫ����',3400000);
insert into sawon values (seq_sawon.nextval, '������', '����', '�λ��',3500000);
commit;


--�μ��� �ο����� �ְ�޿�, �����޿� ��ȸ
select buseo �μ���, max(pay) �ְ�޿�, min(pay) �����޿� from sawon group by buseo;

--���� ���������� �ְ�޿�, �����޿��� ȭ����� ���̰� 3�ڸ� �ĸ��� ������ �ϱ�
select buseo �μ���, max(to_char(pay,'L999,999,999')) "�ְ�޿�", min(to_char(pay, 'L999,999,999')) �����޿� from sawon group by buseo;

--���� �ο����� ��� �޿��� ����Ͻÿ� (�ο��� �ڿ� �� �̶�� ������ ����ϱ�)
select gender, count(gender) || '��' �����ο���, avg(pay) "��� �޿�"  from sawon group by gender;

-- �μ��� �ο����� ��ձ޿��� ���е� �ο��� 4�� �̻��� ��쿡�� ��µǵ��� �Ұ�
select buseo, count(*) �ο���, avg(pay) ��ձ޿� from sawon group by buseo having count(*) >= 4;

delete sawon;

rollback;

select * from sawon;

select to_char (sysdate, 'yyyy-mm-dd-hh24-mi-ss')from dual;
select to_char(24587990, '999,999,999')from dual;
select round(avg(sal),-1) from emp; 