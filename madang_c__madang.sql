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

insert into Book values(1, '축구의 역사', '굿스포츠', 17000);
insert into Book values(2, '해리포터 죽음의 성물', '', 78000);
insert into Book values(3, '나무', '해냄', 10000);
insert into Book values(4, '세이노의 가르침', '데이원', 27000);
insert into Book values(5, '이토록 공부가 재밌어지는 순간', '다산복스', 8000);
insert into Book values(6, '도둑맞은 집중력', '아크로스', 62000);
insert into Book values(7, '과학공부', '돌베게', 12000);
insert into Book values(8, '슈퍼노멀', '굿스포츠', 46000);
insert into Book values(9, '역행자', '웅진지식하유수', 15000);
insert into Book values(10, '한국사', '프린트페이지', 19000);

select * from Book;


-- cuustomer 테이블에 고객정보 5명 추가
insert into customer values(1, '박지성', '영국 맨체스터', '000-5000-001');
insert into customer values(2, '김연아', '서울 동작구 흑석동', '010-5010-3333');
insert into customer values(3, '장미란', '서울 용산구 보광동', '220-5040-5501');
insert into customer values(4, '추신수', '인천광역시 연수구', '02-4687-7777');
insert into customer values(5, '박세리', '대전광역시 유성구', '042-1344-004');

