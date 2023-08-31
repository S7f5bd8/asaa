CREATE TABLE Book (
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

CREATE TABLE Orders ( 
    orderid NUMBER(2) PRIMARY KEY,
    custid NUMBER(2) REFERENCES Custmer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);

insert into Book values(1, '�౸�� ����', '�½�����', 17000);
insert into Book values(2, '�ظ����� ������ ����', '', 78000);
insert into Book values(3, '����', '�س�', 10000);
insert into Book values(4, '���̳��� ����ħ', '���̿�', 27000);
insert into Book values(5, '����� ���ΰ� ��վ����� ����', '�ٻ꺹��', 8000);
insert into Book values(6, '���ϸ��� ���߷�', '��ũ�ν�', 62000);
insert into Book values(7, '���а���', '������', 12000);
insert into Book values(8, '���۳��', '�½�����', 46000);
insert into Book values(9, '������', '��������������', 15000);
insert into Book values(10, '�ѱ���', '����Ʈ������', 19000);

select * from Book;


-- cuustomer ���̺� ������ 5�� �߰�
insert into customer values(1, '������', '���� ��ü����', '000-5000-001');
insert into customer values(2, '�迬��', '���� ���۱� �漮��', '010-5010-3333');
insert into customer values(3, '��̶�', '���� ��걸 ������', '220-5040-5501');
insert into customer values(4, '�߽ż�', '��õ������ ������', '02-4687-7777');
insert into customer values(5, '�ڼ���', '���������� ������', '042-1344-004');

