--박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름을 출력

--박지성이 구매한 도서의 출판사 이름 먼저 출력
SELECT publisher from customer cs, orders os, book bs
where cs.custid=os.custid and os.bookid=bs.bookid
and name like '박지성';

SELECT name from
customer cs, orders os, book bs
where cs.custid=os.custid and os.bookid=bs.bookid
and name not like '박지성'
and publisher in(
    SELECT publisher from customer cs, orders os, book bs
    where cs.custid=os.custid and os.bookid=bs.bookid
    and name like '박지성'
);

select name from customer c
where (select count(distinct publisher)from customer c, orders o, book b
where c.custid=o.custid and o.bookid=b.bookid
and name like cm.name)>=2;

select bookname from book bm
where ( select count(b.bookid) from book b, orders o
        where b.bookid=o.bookid and b.bookid=bm.bookid)
        >= (select count(*) from customer)*0.3;
        
insert into book values(11, '스포츠 세계', '대한미디어', 10000);

delete from book
where publisher = '데이원';

select * from book
where publisher like '해냄';

-- 출판사 '대한미디어' '대한출판사' 로 이름을 바꾸시오
update book
set publisher='대한출판사'
where publisher='대한미디어';

select abs(-33), abs(33) from dual;

select round(5.657, 1) from dual;

-- 고객별 평균 주문 금액을 백 원 단위로 반올림 값 구하기
select custid "고객번호", round(avg(saleorice), -2) "평균금액" from orders
group by custid;

-- abs: 절댓값 구하는 함수  
-- 78과 -78의 절댓값을 구하시오
select abs(-78), abs(+78)
from Dual;
-- 4.875를 소수 첫째 자리까지 반올림한 값을 구하시오
select round(4.875, 1)
from Dual;
-- 고객별 평균 주문 금액을 배 원 단위로 반올림한 값을 구하시오
select custid "고객번호", round(sum(saleprice)/count(*), -2) "평균 금액"
from orders
group by customer;

select bookid, replace(bookname, '과학', '수학') bookname, publisher, price from book;
select * from book;

select bookname "도서명", length(bookname) "글자수", length(bookname) "바이트수" from book
where publisher like '해냄';

select substr(name, 1, 1) "성씨", count(*) "인원수" from customer
group by substr(name, 1, 1);

select orderid 주문번호,to_char(orderdate, 'yyyy-mm-dd') 주문일, name 고객명, bookname 도서명
from orders, book, customer
where orderdate = to_date('20230828','yyyymmdd');

--2023년 8월 28일에 주문 받은 주문번호, 주문일, 고객명, 도서묭를 모두 출력하시오
--단 주문일은 yyyy 년 mm월 mm일과 같은 format로 나타내야됨
select orderid 주문번호,to_char(orderdate, 'yyyy"년"mm"월"dd"일"') 주문일, name 고객명, bookname 도서명
from orders, book, customer
where orderdate = to_date('20230828','yyyymmdd') 
and orders.bookid = book.bookid 
and orders.custid = customer.custid;





































