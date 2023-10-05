--고객번호, 주소, 총판매액이 고객번호별로 묶어서출력되게 하는 수행문
select custid,(select address from customer cs where cs.custid = od.custid) "address", sum(saleprice) "total"
from orders od
group by od.custid;

--고객별 평균 판매 가격을 출력하시오
select cs.name, s from (select custid, avg(saleprice) s
                            from orders
                            group by custid) od, customer cs
                            where cs.custid = od.custid;

--고객번호가 3이하인 고객의 총 판매금액의 합계를 출력하시오                            
select sum(saleprice) "total" from orders o
where exists (select * from customer c
                where custid <= 3 and c.custid = o.custid);
                
create view vw_orders(orderid, name, bookid, custid, bookname, saleprice, orderdate)
as select o.orderid, c.name, o.bookid, o.custid, b.bookname, o.saleprice, o.orderdate
   from orders o, customer c, book b
   where o.custid = c.custid and o.bookid = b.bookid;
   


-- 기존의 뷰를 수정한다.
create or replace view vw_customer(custid, name, address)
as select custid, name, address
from customer
where address like '%영국%';

select * from customer;

select * from vw_customer;

-- 뷰 삭제 
drop view vw_customer;

create view highorders(도서번호, 도서이름, 고객이름, 출판사, 판매가격)
as select b.bookid, b.bookname, c.name, b.publisher, o.saleprice
    from book b, customer c, orders o
    where b.bookid=o.custid and o.custid = c.custid and o.saleprice >=20000;

select bookname, name
from highorders;

create or replace view highorders(bookid, bookname, custname, publisher)
as select o.bookid, b.bookname, c.custname, b.publisher
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid;


    
    
   
   