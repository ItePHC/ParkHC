--emp���̺���  ename�� ��ȸ�Ͻÿ�
select ename from emp;
--emp���̺��� job�� ��ȸ�Ͻÿ�
SELECT ename, job from emp;
--emp���̺� ��ü��ȸ
SELECT * FROM emp;
--student ���̺� ��ü��ȸ
SELECT * FROM student;

--ǥ����(�÷� �߰�)
SELECT name,'���� �ǽ���' from student;
--�÷� ��Ī allias
SELECT name "�̸�", grade as "�г�", birthday "�� ��" from student;
-- emp���� �����,����,�Ի����ڸ� ��ȸ�Ͻÿ�
SELECT ename "�����", JOB as "����", hiredate �Ի����� from emp;

-- DISTINCT : �ߺ��� ���� �����ϰ� ����ϱ�
--emp���� �������� �ߺ����� ���� ����ϼ���
select DISTINCT job ������ from emp;
select DISTINCT job "�� �� ��" from emp;
--emp���� �μ���ȣ�� �ߺ����� ����ϼ���
SELECT DISTINCT deptno �μ���ȣ from emp;

--�ռ������� : �÷��� ������ ���
select name || grade �г⺰�л��� from student;
--professor ��ȸ
select * from professor;
--�ϳ��� �÷����� ���_������ ���� ������ �Դϴ�
SELECT name || '���� ' || position || ' �Դϴ�' ���������� from professor;
--emp���� smith���� job�� clerk�Դϴ� 
select ename || '���� job��' || job || ' �Դϴ�' from emp; 
--student���� ���������� Ű�� 180cm �����Դ� 72kg�Դϴ�
select name || '���� Ű�� ' || height || 'cm, �����Դ� ' || weight || 'Kg �Դϴ�' from student;
--emp���� �� ������ slaesman�̰� ������ ***�Դϴ�
select '�������� ' || job || '�̰� ������ ' || sal || '�Դϴ�' from emp;

--���� 
-- ****�� �������� asc�� �������� ( order by **** asc )  / ���������� ��� ( order by **** desc)
--student���� �л��� �г� ������ �л����� ������������ ��ȸ�Ͻÿ�
select name �л���, grade �г�, birthday ���� from student order by grade; --asc �� ��������
select name �л���, grade �г�, birthday ���� from student order by grade desc;

--emp���� �����, ����, �޿��� �޿��� ������������� ��ȸ�ϼ���
select ename �����, job ����, sal �޿� from emp order by sal desc;
select ename �����, job ����, sal �޿� from emp order by 3 desc;   --�÷���ȣ�ε� ���İ���
--emp���� �������� �ߺ����� ����ϰ� �������� ������������ ����Ͻÿ�
select distinct job from emp order by job;


--���������
--emp���� sal�� Ư�����ʽ� 100�� ���Ͽ� ����Ͻÿ�
select ename �����, sal �⺻��, sal+100 Ư�����ʽ� from emp;

--where�� : ����

--emp���� 10���μ��� �ٹ��ϴ� ����� // �����, �޿��� �μ���ȣ�� ����ϼ���
select ename �����, sal �޿�, deptno �μ���ȣ from emp where deptno = 10;  --������ ������ ��� ' '
--emp���� �̸��� KIMNG�� ����� ����� , ������ ��ȸ�Ͻÿ�
select ename �����, job ���� from emp where ename = 'KING';
--emp���� �޿��� 3000�̻��� ����� �����, �޿��� ��ȸ�Ͻÿ�
select ename �����, sal �޿� from emp where sal >= 3000;

--student���� Ű�� 180�̻��� �л���, Ű�� ����Ͻÿ�                           //  where ������
select name �л���, height || 'cm' Ű from student where height >= 180;
--student���� Ű�� 160~180 ������ �л���� Ű ��� : between a and b (a < b)  // between ������
select name �л���, height || 'cm' Ű from student where height between 160 and 180 order by height; --�������� �߰�
--in(a,b) : a, b�� ��ȸ
-- emp���� deptno�� 20, 30�� ������� ������ �μ���ȣ�� ��ȸ
select ename �����, deptno �μ���ȣ from emp where deptno in(20,30);

--null���� ���
--emp���� comm�� null�� ����� �̸��� ���ʽ��� ����Ͻÿ�                        //null
select ename �����, comm ���ʽ� from emp where comm is null;
--emp���� comm�� null�� �ƴ� ����� �̸��� ���ʽ��� ����Ͻÿ�                   // not null           
select ename �����, comm ���ʽ� from emp where comm is not null;            --0�� ������ �̷������

--NVL : null���� 0���� �ٲٱ�
select ename �����, nvl(comm,0) ���ʽ� from emp;                            --nvl�� ����Ұ�� ����ϴ� ���̺� ������ ����������Ѵ� // nvl(���̺�, �ٲ� ��)

--Like ������
--�л����̺��� �达�� ��ȸ
select * from student where name like '��%';                                --    '%��%' : ���� �����ϴ� // '%��' : ������ ������


--�л����̺� �� ���?
select count(*) cnt from student;
--emp���� job�� salesman, maneager�� �����, �������� ����Ͻÿ� (or   in)
select ename �����, job ������ from emp where job in('SALESMAN','MANAGER');
select ename �����, job ������ from emp where job = 'SALESMAN' or job = 'MANAGER' ;      --job = ' ' �������� ���������� ��� (job = ' ')�� �������� ����Ѵ�

--emp���� rmqdurk 2000 ~ 3000�� ����� ������ �޿��� ����ϼ���(and between)������
select ename �����, job ������, sal �޿� from emp where 3000 >= sal and sal >= 2000;
select ename �����, job ������, sal �޿� from emp where sal between 2000 and 3000;

--Q. student ���̺��� 1�г� �л��� �л���,Ű�� ����Ͻÿ�(Ű�� ������)
select name �л���, height Ű from student where grade = 1 order by height;
--Q. student���� 2�г� �л��� �л��� ���� Ű �����Ը� ����Ͻÿ� �� ������ ������� ����
select name �л���, birthday ����, height Ű, weight ������ from student where grade = 2 order by birthday;
--Q. professor���� �������� �̸��� �� ������ ���� ������ ������, ����, �Ի����ڸ� ����Ͻÿ�
select name ������, position ����, hiredate �Ի����� from professor where name like '��%';
--Q. emp���� �����, �޿�, �޿�*12, ���ʽ� �޿��Ѱ踦 ���Ͻÿ�
select  ename �����, sal �޿�, nvl(comm,0) ���ʽ�, sal+nvl(comm,0) ���ʽ��޿��Ѱ� from emp; 
--Q. emp���� �Ի����ڰ� 1980/01/01 ���Ŀ� ���� ����� ������ �Ի����ڸ� ��ȸ�Ͻÿ�(�Ի����� ��)
select ename �����, hiredate �Ի����� from emp where hiredate >= '1982/01/01' order by hiredate;

--Like % , _����� �̿��ؼ� Ư�������� �ִ� ���� ���         _����� �� �ѹ��� �� ���ڸ� �Ѱ���
--emp���� ����� �ι�° ���ڰ� a�� ����� ����� ���
select ename ����� from emp where ename like '_A%';

--emp���� ������� �ι��� ���ڰ� S�� ��� �Ǵ� 3���� ���ڰ� S�� ����� ���
select ename ����� from emp where ename like '_A%' or ename like '__A%';

--��¥ ���ͷ� '' �ݵ�� ���
--emp���� ������ clerk�̰� �Ի����� 87/05/23�� ����� ����� �Ի��� ���ϱ�
select ename �����, hiredate �Ի��� from emp where job = 'CLERK' AND hiredate = '87/05/23';

--emp���� �Ŵ����̰ų� 82�� ���� �Ի����� ����� ������ �Ի��� ���
select ename �����, job ������, hiredate �Ի��� from emp where job = 'MANAGER' or hiredate >= '82/01/01';

--��������
--student���� 1�г� �л��� �̸��� Ű�� ������ ��� (Ű�� �����������, �����Դ� �����������)
select name �л���, height Ű, weight ������ from student where grade=1 order by height asc,weight desc;
--emp���� �޿� �������� �� �ٽ� �̸����� �������� _ �����ȣ ����� �޿� ��ȸ
select empno �����ȣ, ename �����, sal �޿� from emp order by sal desc, ename;

select * from student;
select * from emp;
select * from professor;
select * from gogak;

-- union : ������ (�ߺ� ����)
-- union All : ������ (�ߺ� ����)

-- intersect = ������


select name, deptno1, deptno2 from student where deptno1 = 101 UNION  
select name, deptno1, deptno2 from student where deptno2 = 201;

select name, deptno1, deptno2 from student where deptno1 = 101 intersect  
select name, deptno1, deptno2 from student where deptno2 = 201;

select name, deptno1, deptno2 from student where deptno1 = 101 and deptno2 = 201;


--Q. gogak point �� 300000���� 500000 ����� ����Ʈ�� ����ϼ��� (����Ʈ ������)
select gname ����, point ����Ʈ from gogak where point between 300000 and 500000 order by point desc;
--Q.emp�� comm�� null�� 0���� �ٲپ ������ manager�� ����� �̸��� ���ʽ��� ����Ͻÿ�
select ename �����, nvl(comm,0) ���ʽ� from emp where job = 'MANAGER';
--Q. professor 103�� �а� �������� �̸��� �޿�, ���ʽ�, ������ ����Ͻÿ�
select name �̸�, pay �޿�, bonus ���ʽ�, pay*12+bonus ���� from professor where deptno = 103;

--SQL�׷��Լ� (count, sum, avg)
-- count(*) : null�� ���� // count(�÷�) : null�� ����
select count(*),count(hpage) from professor;

--sum(�÷���)
select count (bonus), sum(bonus) from professor;

--avg(�÷���)
select count (bonus), sum(bonus), avg(bonus) from professor;

--max, min
select max(sal), min(sal) from emp;
select max(hiredate), min(hiredate) from emp;

--�Ҽ���
--emp���� sal�� ���
select round(avg(sal),1) from emp;
select round(avg(sal),2) from emp;
select round(avg(sal),0) from emp;          --�ݿø�
select round(avg(sal),-1) from emp;         --10����
select round(avg(sal),2) from emp;          --100����

--�ֿܼ� ���
--���� ��¥�� console�� ���                //���糯¥ : sysdate
select sysdate from dual;

--���� ��¥�� �ֿܼ� ���
select sysdate+1 from dual;

--to_char : ��¥ �� ��ġ�����͸� ���ڷ� ��ȯ�ϱ� ���� �Լ�
--��¥���� �⵵�� ����
select max(hiredate), min(hiredate) from emp;
select to_char (sysdate, 'yyyy')from dual; 

select to_char (sysdate, 'month')from dual; 
select to_char (sysdate, 'mm')from dual; 

select to_char (sysdate, 'dd')from dual; 
select to_char (sysdate, 'day')from dual; 
select to_char (sysdate, 'yyyy-mm-dd-mi-ss')from dual;                              -- hh24 : �ð�, mi : ��, ss : ��

--to_char ���ڿ��� ���밡��
select to_char(24587990, '999,999,999')from dual;

--����ǥ��
select empno �����ȣ, ename �����, to_char(hiredate,'yyyy')�⵵ from emp;
--emp���� �����ȣ, �����, �޿� ���(�޿��� õ���� ���б�ȣ �߰�)
select empno �����ȣ, ename �����, to_char(sal,'L999,999')�޿� from emp;


-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

--��������
--�����ȿ� �� �ٸ� ������ ��´�(king,���� �޿��� ���� �޴� �����?) _ 2���� ����
--���������� ���� ����Ǿ� �� ����� ���������� �����ְ� �� ���� �޾� ���� ���������� ����ȴ�
--�������� �ȿ��� order by���� ���´�

select * from emp;
select * from student;

(select sal from emp where ename = 'KING');
--emp���� KING���� �޿��� ���� �޴� ����� ����� �޿��� ���غ���
select ename �����, sal �޿� from emp where sal > (select sal from emp where ename = 'JAMES');

--emp���� ��ձ޿����� ���� �޴� ����� �����ȣ, �����, �޿��� ��Ÿ���ÿ�
select empno �����ȣ, ename �����, sal �޿� from emp where sal > (select avg(sal)from emp);

--emp���� �̸��� WARD�� ����� MGR�� ���� ���� ���� ����� ��� ���
select * from emp where mgr = (select mgr from emp where ename like 'WARD');

--emp���� ��ձ޿����� ���� �޴� ��� ��
select count(*) from emp where sal > (select avg(sal) from emp);

--�������� ����
--emp���� ADAMS�� ���� �������� ���� ����� �̸� ���� ������ ���
select ename �����, sal*12 ����, job ������ from emp where job = (select job from emp where ename like 'ADAMS');
--emp���� SCOTT�� ���� ������ ��ư ����� �̸��� ���� ��� // 2��
select ename �����, sal*12 ���� from emp where sal = (select sal from emp where ename like 'SCOTT');
--student���� ��1������ ������ �л��� ������ �л����� �л��� ��1���� ��� // 4��
select name �̸�, deptno1 ��1���� from student where deptno1 = (select deptno1 from student where name like '������');
--student���� ��1������ 101�� �а��� ��ո����Ժ��� �����԰� ���� �л����� �̸��� ������ ���  // 11��
select name �̸�, weight ������ from student where weight > (select avg(weight) from student where deptno1 = 101);
--professor���� �Ի����� �迵�� �������� ���߿� �Ի��� ����� �̸��� �Ի��� �а���ȣ   //5�� 
select name �̸�, hiredate �Ի���, profno �а���ȣ from professor where hiredate > (select hiredate from professor where name like '�迵��');


