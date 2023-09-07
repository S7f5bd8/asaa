--�������(Equi Join)
-- ���� ���� ���̺��� ������ �� Ư�� �÷��� ���� ���� ��鸸 �˻��� �� ���
-- ���� ���� �ֹ��� ���� �����͸� ��� ����Ͻÿ�

select * from customer, orders
where customer.custid = orders.custid;

-- ���� ���� �ֹ��� ���� �����͸� ��� ����ȣ ������������ ���
select * from customer, orders
where customer.custid = orders.custid
order by customer.custid desc;

-- ���� �̸�, �ֹ��� ���� �ǸŰ����� �˻�
select name, saleprice from customer c, orders o
where c.custid = o.custid;

-- ������ �ֹ��� ��� ������ ���Ǹž� ���ϰ� �� �̸� ������ ����
select name, sum(saleprice) from customer, orders
where customer.custid = orders.custid
group by name
order by name;

-- ���� �������� ���� ���� �����Ͽ� ���̸��� �ֹ��� ������ �ǰ����� ���
select name, saleprice
from customer c left outer join orders o
on c.custid= o.custid;

select bookname from book
where price=(select max(price) from book);

select bookname from book
where price=(select min(price) from book);

select distinct custid from orders;

select name from customer
where custid in(select distinct custid from orders
                where bookid in(select bookid from book
                                where publisher='���������Ͽ콺'));
                                
select name
from customer c, orders o, book b
where o.bookid = b.bookid and c.custid = o.custid and b.publisher = '���������Ͽ콺';





                                
