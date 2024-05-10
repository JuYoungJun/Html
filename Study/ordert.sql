create table ordert (
    순번 int,
    제품명 varchar(20),
    대리점명 varchar(10),
    주문수 int,
    주문금액 int,
    주문일자 date );

    load data local infile 'c:\\제품주문현황.txt' into table ordert
    fields terminated by '\t' lines terminated
    by '\r\n';

    update ordert set 판매번호 = 1 where 판매번호 = 0;

    alter table ordert add 주문당단가 int;

    update ordert set 주문당단가 = 주문금액 / 주문수;

    update ordert set 제품명 = replace(제품명, '쌕썍', '봉봉');

    ALTER TABLE ordert
    RENAME COLUMN 순번 TO 판매번호;

    SELECT DISTINCT 제품명 FROM ordert;

    update ordert set 대리점명 = '전남점' where 대리점명 in('순천점', '목포점');

    alter table ordert modify 판매번호 int primary key;

    alter table ordert modify 주문일자 date after 제품명;

    select sum(주문금액) as 합계주문금액 from ordert;

    select 대리점명, count(*) as 안양점_개수 from ordert where 대리점명 like '안양%' group by 대리점명;

    SELECT * FROM ordert ORDER BY 주문수 DESC;
    
    select * from ordert order by 주문일자;

    select * from ordert order by 대리점명, 주문금액 desc;

    select 제품명, sum(주문금액) as 합계 from ordert group by 제품명;

    select 제품명, avg(주문수) as 평균 from ordert group by 제품명 order by avg(주문금액) desc;

   select 대리점명, count(주문수) as 주문건수 from ordert group by 대리점명;

    select 주문일자, sum(주문금액) as 주문금액_합계, avg(주문수) as 주문수_평균 from ordert group by 주문일자;

    select * from ordert where 주문수 >= 40 order by 대리점명 desc;

    select 대리점명, 제품명, avg(주문수) as 주문수_평균 from ordert where 주문금액 >= 25000 group by 대리점명, 제품명;

    select 대리점명, sum(주문금액) from ordert  group by 대리점명 having avg(주문금액) >= 20000;