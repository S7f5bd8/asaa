--����ȣ, �ּ�, ���Ǹž��� ����ȣ���� �����µǰ� �ϴ� ���๮
select custid,(select address from customer cs where cs.custid = od.custid) "address", sum(saleprice) "total"
from orders od
group by od.custid;

--���� ��� �Ǹ� ������ ����Ͻÿ�
select cs.name, s from (select custid, avg(saleprice) s
                            from orders
                            group by custid) od, customer cs
                            where cs.custid = od.custid;

--����ȣ�� 3������ ���� �� �Ǹűݾ��� �հ踦 ����Ͻÿ�                            
select sum(saleprice) "total" from orders o
where exists (select * from customer c
                where custid <= 3 and c.custid = o.custid);
                
create view vw_orders(orderid, name, bookid, custid, bookname, saleprice, orderdate)
as select o.orderid, c.name, o.bookid, o.custid, b.bookname, o.saleprice, o.orderdate
   from orders o, customer c, book b
   where o.custid = c.custid and o.bookid = b.bookid;
   


-- ������ �並 �����Ѵ�.
create or replace view vw_customer(custid, name, address)
as select custid, name, address
from customer
where address like '%����%';

select * from customer;

select * from vw_customer;

-- �� ���� 
drop view vw_customer;

create view highorders(������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ���)
as select b.bookid, b.bookname, c.name, b.publisher, o.saleprice
    from book b, customer c, orders o
    where b.bookid=o.custid and o.custid = c.custid and o.saleprice >=20000;

select bookname, name
from highorders;

create or replace view highorders(bookid, bookname, custname, publisher)
as select o.bookid, b.bookname, c.custname, b.publisher
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid;


    
    
   
   