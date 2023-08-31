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

INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구 아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 6000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 12000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 9000);
INSERT INTO Book VALUES(6, '역도 단계별 기술', '굿스포츠', 15000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 30000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 11000);
INSERT INTO Book VALUES(10, 'O1ympic Champions', 'Pearson', 7000);

INSERT INTO Customer VALUES (1, '박지성', '영국 맨체스터', '000-5000-0001');
INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO Customer VALUES (4, '추신수', '추신수', '000-8000-0001');
INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전', '000-9000-0001');


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
       where bookname like '축구의 역사';
       
select name, phone from customer
                where name='김연아';
                
select * from customer
                where name='김연아';
-- book 테이블에서 도서명과 가격 검색
select bookname, price from book;

-- book 테이블에서 가격과 도서명 검색
select price, bookname from book;

-- book 테이블에서 도서번호, 도서명, 출판사, 가격 검색
select * from book;

-- book 테이블에서 모든 출판사를 검색
select publisher from book;

-- book 테이블에서 모든 출판사를 검색(중복되는 출판사 제거)
select distinct publisher from book;

-- book 테이블에서 가격이 20000원 미만인 도서 검색
select * from book
        where price < 20000;
        
-- book 테이블에서 가격이 10000원 이상 16000원 이하인 도서 검색
select * from book
        where price BETWEEN 10000 AND 16000;
        
-- book 테이블에서 가격이 10000원 이상 16000원 이하인 도서 검색
-- 단, between and 사용 X
select * from book
        where price >= 10000 AND price <= 16000;

-- book 테이블에서 출판사가 굿스포츠, 대한미디어, 나무수인 도서 검색
-- 단 in 연산자 사용
select * from book
        where publisher in('굿스포츠', '대한미디어', '나무수');
        
-- book 테이블에서 출판사가 굿스포츠, 대한미디어, 나무수인 도서 검색
-- 단 in 연산자 사용 X (비교연산자와 or연산자 사용)
select * from book
        where publisher = '굿스포츠' or publisher = '대한미디어' or publisher = '나무수';
        
-- book 테이블에서 출판사가 굿스포츠, 대한미디어가 아닌 도서 검색
select * from book
        where publisher NOT IN('굿스포츠','대한미디어');

-- book 테이블에서 출판사가 굿스포츠, 대한미디어가 아닌 도서 검색
-- NOT IN 사용 X
select * from book
        where publisher <>'굿스포츠' and publisher <>'대한미디어';
        
-- book 테이블에서 도서명이 축구의 역사를 검색 
select * from book
        where bookname = '축구의 역사';

select * from book
        where bookname LIKE '축구의 역사';

-- book 테이블에서 도서명이 축구라는 문자열이 포함된 행 검색
select * from book
        where bookname LIKE '%축구%';

-- book 테이블에서 도서명이 과학이라는 문자열이 포함된 행 검색
select * from book
        where bookname LIKE '%과학%';
        
-- book 테이블에서 도서명이 과학이라는 문자열로 끝나는 행 검색
select * from book
        where bookname LIKE '%과학';

-- book 테이블에서 도서명에 '의'자 앞에 임의의 3글자가 포함된 문자열을 갖는 행 검색
select * from book
        where bookname LIKE '___의%';
