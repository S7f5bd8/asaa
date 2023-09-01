SELECT * FROM book;
--book 테이블에서 과학이라는 문자열을 포함하고 도서 가격이 15000언 이상인 데이터 행 검색 
select * from book
    where bookname like '%과학%' and price >= 15000;
    
-- book 테이블에서 출판사가 굿스포츠 또는 나무수인 도서 검색
select * from book
        where publisher = '굿스포츠' or publisher='나무수';
        
-- book 테이블에서 출판사가 굿스포츠 또는 나무수인 도서 검색(in 연산자 사용)
select * from book
        where publisher in('굿스포츠','나무수');
        
-- book 테이블에서 도서명순으로 검색
select * from book order by bookname;

-- book 테이블에서 도서번호순으로 검색
select * from book order by bookid;

-- book 테이블에서 가격순으로 검색 하고 같은 가격이면 이름 순 검색
select * from book order by price, bookname;

-- book 테이블에서 가격을 내림차순으로 검색하고 같은 가격이면 출판사는 오름차순으로 검색
select * from book order by price desc, publisher asc;

-- orders 테이블에서 고객이 주문한 도서의 총 판매액 구하기(집계 함수 사용)
select sum(saleprice) from orders;

-- orders 테이블에서 고객번호가 1인 고객이 주문한 도서의 총판매액
select sum(saleprice) as 총판매금액
        from orders where custid = 1;
        
-- orders 테이블에서 판매액의 합계, 평균, 최소값, 최대값을 구하시오
select sum(saleprice) as 총판매금액, 
        avg(saleprice) as 판매액평균,
        min(saleprice) as 최저가격,
        max(saleprice) as 최대가격
from orders;

-- orders 테이블에서 판매한 도서의 개수
select count(*) from orders;

-- orders 테이블에서 도서가격이 13000원 이상인 도서의 개수
select count(*) from orders where saleprice >= 13000;

-- orders 테이블에서 고객번호가 1 또는 3인 고객의 주문 개수
select count (*) from orders where custid in(1, 3);

--orders 테이블에서 고객별 주문한 도서의 개수와 총합계
-- 그룹화(부분합): group by
select count(*) 주문수량, sum(saleprice) 주문총액 from orders
group by custid;

-- orders 테이블에서 판매 가격이 8000원 이상인 도서를 구매한 고객별 주문 도서의 총 수량
select custid, count(*) as 도서수량 from orders
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
select name, address from customer where name like '김%';

--7
select name, address from customer where name like '김%아';







