CREATE TABLE Book(
    bookid NUMBER(2) PRIMARY KEY,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

CREATE TABLE Customer (
    custid NUMBER(2) PRIMARY KEY,
    name VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(20)
);

CREATE TABLE Orders(
    orderid NUMBER(2) PRIMARY KEY,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
    );

INSERT INTO Book VALUES(1, '�౸�� ����', '�½�����', 7000);
INSERT INTO Book VALUES(2, '�౸ �ƴ� ����', '������', 13000);
INSERT INTO Book VALUES(3, '�౸�� ����', '���ѹ̵��', 6000);
INSERT INTO Book VALUES(4, '���� ���̺�', '���ѹ̵��', 12000);
INSERT INTO Book VALUES(5, '�ǰ� ����', '�½�����', 9000);
INSERT INTO Book VALUES(6, '���� �ܰ躰 ���', '�½�����', 15000);
INSERT INTO Book VALUES(7, '�߱��� �߾�', '�̻�̵��', 20000);
INSERT INTO Book VALUES(8, '�߱��� ��Ź��', '�̻�̵��', 30000);
INSERT INTO Book VALUES(9, '�ø��� �̾߱�', '�Ｚ��', 11000);
INSERT INTO Book VALUES(10, 'O1ympic Champions', 'Pearson', 7000);

INSERT INTO Customer VALUES (1, '������', '���� ��ü����', '000-5000-0001');
INSERT INTO Customer VALUES (2, '�迬��', '���ѹα� ����', '000-6000-0001');
INSERT INTO Customer VALUES (3, '��̶�', '���ѹα� ������', '000-7000-0001');
INSERT INTO Customer VALUES (4, '�߽ż�', '�߽ż�', '000-8000-0001');
INSERT INTO Customer VALUES (5, '�ڼ���', '���ѹα� ����', '000-9000-0001');


insert into orders VALUES (1, 1, 1, 6000, TO_DATE('2023-07-01','yyyy-mm-dd'));
insert into orders VALUES (2, 1, 1, 21000, TO_DATE('2023-07-03','yyyy-mm-dd'));
insert into orders VALUES (3, 2, 1, 7000, TO_DATE('2023-07-03','yyyy-mm-dd'));
insert into orders VALUES (4, 3, 1, 8000, TO_DATE('2023-07-04','yyyy-mm-dd'));
insert into orders VALUES (5, 4, 1, 12000, TO_DATE('2023-07-05','yyyy-mm-dd'));
insert into orders VALUES (6, 1, 1, 9000, TO_DATE('2023-07-07','yyyy-mm-dd'));
insert into orders VALUES (7, 4, 1, 10000, TO_DATE('2023-07-07','yyyy-mm-dd'));
insert into orders VALUES (8, 3, 1, 13000, TO_DATE('2023-07-07','yyyy-mm-dd'));
insert into orders VALUES (9, 2, 1, 20000, TO_DATE('2023-07-09','yyyy-mm-dd'));
insert into orders VALUES (10,3, 1, 19000, TO_DATE('2023-07-10','yyyy-mm-dd'));

CREATE  TABLE Imported_Book ( 
    bookid NUMBER,
    bookname VARCHAR(40),
    publisher VARCHAR(40),
    price NUMBER(8)
);

INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Pearson', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);

select publisher, price FROM book
       where bookname like '�౸�� ����';
       
select name, phone from customer
                where name='�迬��';
                
select * from customer
                where name='�迬��';
-- book ���̺��� ������� ���� �˻�
select bookname, price from book;

-- book ���̺��� ���ݰ� ������ �˻�
select price, bookname from book;

-- book ���̺��� ������ȣ, ������, ���ǻ�, ���� �˻�
select * from book;

-- book ���̺��� ��� ���ǻ縦 �˻�
select publisher from book;

-- book ���̺��� ��� ���ǻ縦 �˻�(�ߺ��Ǵ� ���ǻ� ����)
select distinct publisher from book;

-- book ���̺��� ������ 20000�� �̸��� ���� �˻�
select * from book
        where price < 20000;
        
-- book ���̺��� ������ 10000�� �̻� 16000�� ������ ���� �˻�
select * from book
        where price BETWEEN 10000 AND 16000;
        
-- book ���̺��� ������ 10000�� �̻� 16000�� ������ ���� �˻�
-- ��, between and ��� X
select * from book
        where price >= 10000 AND price <= 16000;

-- book ���̺��� ���ǻ簡 �½�����, ���ѹ̵��, �������� ���� �˻�
-- �� in ������ ���
select * from book
        where publisher in('�½�����', '���ѹ̵��', '������');
        
-- book ���̺��� ���ǻ簡 �½�����, ���ѹ̵��, �������� ���� �˻�
-- �� in ������ ��� X (�񱳿����ڿ� or������ ���)
select * from book
        where publisher = '�½�����' or publisher = '���ѹ̵��' or publisher = '������';
        
-- book ���̺��� ���ǻ簡 �½�����, ���ѹ̵� �ƴ� ���� �˻�
select * from book
        where publisher NOT IN('�½�����','���ѹ̵��');

-- book ���̺��� ���ǻ簡 �½�����, ���ѹ̵� �ƴ� ���� �˻�
-- NOT IN ��� X
select * from book
        where publisher <>'�½�����' and publisher <>'���ѹ̵��';
        
-- book ���̺��� �������� �౸�� ���縦 �˻� 
select * from book
        where bookname = '�౸�� ����';

select * from book
        where bookname LIKE '�౸�� ����';

-- book ���̺��� �������� �౸��� ���ڿ��� ���Ե� �� �˻�
select * from book
        where bookname LIKE '%�౸%';

-- book ���̺��� �������� �����̶�� ���ڿ��� ���Ե� �� �˻�
select * from book
        where bookname LIKE '%����%';
        
-- book ���̺��� �������� �����̶�� ���ڿ��� ������ �� �˻�
select * from book
        where bookname LIKE '%����';

-- book ���̺��� ������ '��'�� �տ� ������ 3���ڰ� ���Ե� ���ڿ��� ���� �� �˻�
select * from book
        where bookname LIKE '___��%';
