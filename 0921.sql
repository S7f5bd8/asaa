--�������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸��� ���

--�������� ������ ������ ���ǻ� �̸� ���� ���
SELECT publisher from customer cs, orders os, book bs
where cs.custid=os.custid and os.bookid=bs.bookid
and name like '������';

SELECT name from
customer cs, orders os, book bs
where cs.custid=os.custid and os.bookid=bs.bookid
and name not like '������'
and publisher in(
    SELECT publisher from customer cs, orders os, book bs
    where cs.custid=os.custid and os.bookid=bs.bookid
    and name like '������'
);

select name from customer c
where (select count(distinct publisher)from customer c, orders o, book b
where c.custid=o.custid and o.bookid=b.bookid
and name like cm.name)>=2;

select bookname from book bm
where ( select count(b.bookid) from book b, orders o
        where b.bookid=o.bookid and b.bookid=bm.bookid)
        >= (select count(*) from customer)*0.3;
        
insert into book values(11, '������ ����', '���ѹ̵��', 10000);

delete from book
where publisher = '���̿�';

select * from book
where publisher like '�س�';

-- ���ǻ� '���ѹ̵��' '�������ǻ�' �� �̸��� �ٲٽÿ�
update book
set publisher='�������ǻ�'
where publisher='���ѹ̵��';

select abs(-33), abs(33) from dual;

select round(5.657, 1) from dual;

-- ���� ��� �ֹ� �ݾ��� �� �� ������ �ݿø� �� ���ϱ�
select custid "����ȣ", round(avg(saleorice), -2) "��ձݾ�" from orders
group by custid;

-- abs: ���� ���ϴ� �Լ�  
-- 78�� -78�� ������ ���Ͻÿ�
select abs(-78), abs(+78)
from Dual;
-- 4.875�� �Ҽ� ù° �ڸ����� �ݿø��� ���� ���Ͻÿ�
select round(4.875, 1)
from Dual;
-- ���� ��� �ֹ� �ݾ��� �� �� ������ �ݿø��� ���� ���Ͻÿ�
select custid "����ȣ", round(sum(saleprice)/count(*), -2) "��� �ݾ�"
from orders
group by customer;

select bookid, replace(bookname, '����', '����') bookname, publisher, price from book;
select * from book;

select bookname "������", length(bookname) "���ڼ�", length(bookname) "����Ʈ��" from book
where publisher like '�س�';

select substr(name, 1, 1) "����", count(*) "�ο���" from customer
group by substr(name, 1, 1);

select orderid �ֹ���ȣ,to_char(orderdate, 'yyyy-mm-dd') �ֹ���, name ����, bookname ������
from orders, book, customer
where orderdate = to_date('20230828','yyyymmdd');

--2023�� 8�� 28�Ͽ� �ֹ� ���� �ֹ���ȣ, �ֹ���, ����, �����D�� ��� ����Ͻÿ�
--�� �ֹ����� yyyy �� mm�� mm�ϰ� ���� format�� ��Ÿ���ߵ�
select orderid �ֹ���ȣ,to_char(orderdate, 'yyyy"��"mm"��"dd"��"') �ֹ���, name ����, bookname ������
from orders, book, customer
where orderdate = to_date('20230828','yyyymmdd') 
and orders.bookid = book.bookid 
and orders.custid = customer.custid;





































