-- 256p 연습문제
-- abs 절댓값 계산
select abs(-15) from Dual;
-- ceil 반올림하는 함수
select ceil(15.7) from Dual;
-- cos 코사인 계산
select cos(3.14159) from Dual;
-- floor 내림 계산
select floor(15.7) from Dual;
-- log 로그 계산
select log(10,100) from Dual;
-- mod 나머지 계산
select mod(11,4) from Dual;
-- power 제곱 계산
select power(3,2) from dual;
-- round 반올림 계산
select round(15.7) from dual;
-- sign 숫자 부호 확인
select sign(-15) from dual;
-- trunc 소수점 버림
select trunc(15.7) from dual;
-- chr(67) ASCII 문자 반환
select chr(67) from dual;
-- concat 문자열 연결
select concat('HAPPY','Birthday') from dual;
-- lower 문자열 소문자 변환
select lower('Birthday') from dual;
-- lpad 왼쪽 패딩 추가
select lpad('Page 1', 15, '*.') from dual;
-- ltrim 왼쪽 문자 제거
select ltrim('Page 1','ae') from dual;
-- replace 문자열 대체
select replace('JACK', 'J', 'BL') from dual;
-- rpad 오른쪽 패딩 추가
select rpad('Page 1', 15, '*.') from dual;
-- rtrim 오른쪽 문자 제거
select rtrim('Page 1', 'ae') from dual;
-- substr 문자열 일부 추출
select substr('ABCDEFG',3,4) from dual;
-- trim 왼쪽 0 제거
select trim(LEADING 0 FROM '00AA00') from dual;
-- upper 대문자로 변환
select upper('Birthday') from dual;
-- ascii 문자의 ASCII코드 확인
select ascii('A') from dual;
-- instr 문자열 내 위치 찾기
select instr('CORPORATE FLOOR','OR',3,2) from dual;
-- length 문자열 길이 확인
select length('Birthday') from dual;
-- add_months 월 추가
select add_months(TO_DATE('14/05/21', 'yy/mm/dd'),1) from dual;
-- last_day 현재 월의 마지막 날짜 확인
select last_day(sysdate) from dual;
-- next_day 다음 주 특정 요일 확인
select next_day(sysdate, 'Thu') from dual;
-- round 현재 날짜 및 시간 반올림
select round(sysdate) from dual;
-- sysdate 현재 시스템 날짜 및 시간 확인
select sysdate from dual;
-- to_char 날짜를 문자열로 변환
select to_char(sysdate) from dual;
-- to_char 숫자를 문자열로 변환
select to_char(123) from dual;
-- to_date 문자열을 날짜로 변환
select to_date('12 05 2014', 'DD MM YYYY') from dual;
-- to_number 문자열을 숫자로 변환
select to_number('12.3') from dual;
-- decode 조건에 따른 값 반환
select decode(1,1,'aa','bb') from dual;
-- nullif 두 값 비교 후 널 반환
select nullif(123,345) from dual;
-- nvl 널처리
select nvl(null, 123) from dual;

-- 고객의 이름과 전화번호를 출력하시오. (단, 전화번호가 없는 고객은 연락처없음으로 출력하시오.)
select name 이름, phone 전화번호 from customer;
select name 이름, nvl(phone, '연락처없음') 전화번호 from customer;

-- 고객 목록에서 순번, 고객번호, 이름, 전화번호를 앞의 두 명만 출력하시오.
select rownum 순번,custid, name, phone from customer;
select rownum 순번,custid, name, phone from customer
where rownum <= 2;

-- mybook 테이블 생성
create table mybook(
    bookid number not null primary key,
    price number
);
-- 데이터 행 삽입
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

--257p 연습문제
-- 1 mybook 테이블 목록 전체 조회
select * from mybook;
-- 2 mybook 테이블 목록 전체 조회인데 가격이 null값인 것은 0원 처리
select bookid, nvl(price, 0) from mybook;
-- 3  mybook 테이블 목록 중 가격이 null 값인 것만 조회
select * from mybook
where price is null;
-- 4 mybook 테이블 목록 중 price 열이 빈 문자열인 행 선택
select * from mybook
where price='';
-- 5 mybook 테이블에서 bookid랑 가격+100해서 조회
select bookid, price+100
from mybook;
-- 6 mybook 테이블에서 bookid가 4이상인 것들 가격의 총합, 평균, 갯수 조회
select sum(price),avg(price), count(*)
from mybook
where bookid >= 4;
-- 7 mybook 테이블에서 책의 개수와 가격의 수 조회
select count(*), count(price)
from mybook;
-- 8 mybook 테이블에서 가격의 총합과 평균 조회
select sum(price), avg(price)
from mybook;

--258p 연습문제
-- 1  "book" 테이블의 모든 데이터를 반환
select * from book;
-- 2 "book" 테이블에서 처음 5개의 행만 선택
select * from book
where rownum <= 5;
-- 3  "book" 테이블에서 처음 5개의 행을 선택하고 "price" 열을 기준으로 오름차순으로 정렬
select * from book
where rownum <= 5
order by price;
-- 4  "book" 테이블의 모든 행을 "price" 열을 기준으로 정렬한 다음, 그 결과에서 처음 5개의 행만 선택
select * from (select*from book order by price)b
where rownum <= 5;
-- 5 3이랑 같음
select * from (select*from book where rownum <= 5)b
order by price;
-- 6  "book" 테이블에서 처음 5개의 행을 선택하고, 그 결과를 "price" 열을 기준으로 오름차순으로 정렬
select *
from (select * from book where rownum <=5 order by price)b;

-- 평균 판매금액 이하의 주문에 대해 주문번호와 금액을 출력하시오
select orderid 주문번호, saleprice 판매금액 from orders
where saleprice <= (select avg(saleprice) from orders);

-- 각 고객의 평균판매금액보다 큰 금액의 주문 내역에 대해서만 주문번호, 고객번호, 판매금액을 출력하시오
select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders;

select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders mo
where saleprice > (select avg(saleprice) from orders so where mo.custid = so.custid);

-- 서울에 거주하는 고객에게 판매한 도서의 총판매금액을 출력하시오.
select sum(saleprice) 총판매금액 from orders;
-- 서울에 거주하는 사람의 고객번호
select custid from customer
where address like '%서울%';

select sum(saleprice) 총판매금액 from orders
where custid in (select custid from customer
                    where address like '%서울%');
-- 서울에 거주하지 않는 고객에게 판매한 도서의 총판매금액을 출력하시오.
select sum(saleprice) 총판매금액 from orders
where custid not in (select custid from customer
                    where address like '%서울%');

-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 출력하시오
select orderid 주문번호, saleprice 판매금액 from orders;

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice > all(select saleprice from orders where custid = 3);

-- 서울에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오 (단, exists 연산자를 사용하시오.)
select sum(saleprice) 총판매액 from orders mo
where exists(
    select * from customer c
    where address like '%서울%' and mo.custid = c.custid
);

-- 고객별 판매금액의 합계를 출력하시오. (고객번호, 판매합계)
select custid 고객번호, sum(saleprice) 판매합계 from orders
group by custid;

-- 고객별 판매금액의 합계를 출력하시오. (고객명, 판매합계)
select (select name from customer c
        where c.custid = o.custid) 고객명, sum(saleprice) 판매합계 
from orders o
group by o.custid;

-- 주문목록에 책이름을 저장할 수 있는 컬럼을 추가하시오.
alter table orders add bookname varchar2(40);
update orders o set bookname = (select bookname from book b where b.bookid = o.bookid);

-- 고객번호가 2 이하인 고객번호와 이름을 출력하시오.
select custid 고객번호, name 이름 from customer
where custid <= 2;

-- 고객번호가 2 이하인 고객의 판매금액을 출력하시오. (고객이름과 고객별 판매액 출력)
select name 고객이름, sum(saleprice) 판매총액
from (select custid, name from customer
where custid <= 2) c, orders o
where c.custid =o.custid
group by name;

-- 고객별 주문의 총 판매 금액 및 고객 주소 조회
select custid, (select address from customer cs where cs.custid = od.custid) "address", sum(saleprice) "total"
from orders od
group by od.custid;