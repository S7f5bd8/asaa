SELECT * FROM book;
--book ���̺��� �����̶�� ���ڿ��� �����ϰ� ���� ������ 15000�� �̻��� ������ �� �˻� 
select * from book
    where bookname like '%����%' and price >= 15000;
    
-- book ���̺��� ���ǻ簡 �½����� �Ǵ� �������� ���� �˻�
select * from book
        where publisher = '�½�����' or publisher='������';
        
-- book ���̺��� ���ǻ簡 �½����� �Ǵ� �������� ���� �˻�(in ������ ���)
select * from book
        where publisher in('�½�����','������');
        
-- book ���̺��� ����������� �˻�
select * from book order by bookname;

-- book ���̺��� ������ȣ������ �˻�
select * from book order by bookid;

-- book ���̺��� ���ݼ����� �˻� �ϰ� ���� �����̸� �̸� �� �˻�
select * from book order by price, bookname;

-- book ���̺��� ������ ������������ �˻��ϰ� ���� �����̸� ���ǻ�� ������������ �˻�
select * from book order by price desc, publisher asc;

-- orders ���̺��� ���� �ֹ��� ������ �� �Ǹž� ���ϱ�(���� �Լ� ���)
select sum(saleprice) from orders;

-- orders ���̺��� ����ȣ�� 1�� ���� �ֹ��� ������ ���Ǹž�
select sum(saleprice) as ���Ǹűݾ�
        from orders where custid = 1;
        
-- orders ���̺��� �Ǹž��� �հ�, ���, �ּҰ�, �ִ밪�� ���Ͻÿ�
select sum(saleprice) as ���Ǹűݾ�, 
        avg(saleprice) as �Ǹž����,
        min(saleprice) as ��������,
        max(saleprice) as �ִ밡��
from orders;

-- orders ���̺��� �Ǹ��� ������ ����
select count(*) from orders;

-- orders ���̺��� ���������� 13000�� �̻��� ������ ����
select count(*) from orders where saleprice >= 13000;

-- orders ���̺��� ����ȣ�� 1 �Ǵ� 3�� ���� �ֹ� ����
select count (*) from orders where custid in(1, 3);

--orders ���̺��� ���� �ֹ��� ������ ������ ���հ�
-- �׷�ȭ(�κ���): group by
select count(*) �ֹ�����, sum(saleprice) �ֹ��Ѿ� from orders
group by custid;

-- orders ���̺��� �Ǹ� ������ 8000�� �̻��� ������ ������ ���� �ֹ� ������ �� ����
select custid, count(*) as �������� from orders
where saleprice >= 8000
group by custid;
having count(*) >= 2
order by custid;

--1
select bookname from book where bookid = 1;

--2
select * from book where price >= 20000;

--3
select sum(saleprice) from orders where custid = 1;]]

--4
select count(saleprice) from orders where custid = 1;

--1
select count(*) from book;

--2
select count(distinct publisher) from book;

--3
select name, address from customer;

--4
select orderid from orders where orderdate between '20.07.04' and '20.07.07';

--5
select orderid from orders where orderdate not between '20.07.04' and '20.07.07';

--6
select name, address from customer where name like '��%';

--7
select name, address from customer where name like '��%��';







