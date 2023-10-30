select f.fno 주문번호, j.name 주문자,f.foodname 음식명, f.price 가격, f.shopname 상호명, f.loc 가게위치, j.addr 주문자위치 from food f, jumun j where f.fno = j.food_fno order by name asc;
commit;
select * from food;
select * from jumun;
select gender, count(*) , to_char(avg(pay),'L999,999,999') avgpay from sawon group by gender;