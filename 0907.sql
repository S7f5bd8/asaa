--등등조인(Equi Join)
-- 여러 개의 테이블을 연결할 때 특정 컬럼의 값이 같은 행들만 검색할 때 사용
-- 고객과 고객의 주문에 관한 데이터를 모두 출력하시오

select * from customer, orders
where customer.custid = orders.custid;

-- 고객과 고객의 주문에 관한 데이터를 모두 고객번호 내림차순으로 출력
select * from customer, orders
where customer.custid = orders.custid
order by customer.custid desc;

-- 고객의 이름, 주문한 도서 판매가격을 검색
select name, saleprice from customer c, orders o
where c.custid = o.custid;

-- 고객별로 주문한 모든 도서의 총판매액 구하고 고객 이름 순으로 정렬
select name, sum(saleprice) from customer, orders
where customer.custid = orders.custid
group by name
order by name;

-- 돗를 구매하지 않은 고객도 포함하여 고객이름과 주문한 도서의 판가가격 출력
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
                                where publisher='웅진지식하우스'));
                                
select name
from customer c, orders o, book b
where o.bookid = b.bookid and c.custid = o.custid and b.publisher = '웅진지식하우스';





                                
