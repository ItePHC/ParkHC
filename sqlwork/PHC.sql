select f.fno �ֹ���ȣ, j.name �ֹ���,f.foodname ���ĸ�, f.price ����, f.shopname ��ȣ��, f.loc ������ġ, j.addr �ֹ�����ġ from food f, jumun j where f.fno = j.food_fno order by name asc;
commit;
select * from food;
select * from jumun;
select gender, count(*) , to_char(avg(pay),'L999,999,999') avgpay from sawon group by gender;