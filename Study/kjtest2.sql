create table 업종정보 ( 업종코드 int primary key, 업종 varchar(50), 비고 int );

load data local infile 'c:\\업종.txt' into table 업종정보 fields terminated by '\t' lines terminated by '\r\n';

create table 배당정보 ( ID int primary key, 종목코드 char(6), 사업연도 int, 업종 varchar(50), 업종별배당율 double, 주식배당금 int, 액면가 int, 기말주식수 int, 주당배당금 int, 배당성향 double, 총배당금액 int, 시가배당률 double );

load data local infile 'c:\\배당정보.txt' into table 배당정보 fields terminated by '\t' lines terminated by '\r\n';

create table 종목 ( 종목코드 char(6) primary key, 회사명 varchar(30) not null, 업종코드 int not null, 주요제품 varchar(20), 상장일 date not null, 결산월 int, 대표자명 char(10), 지역 char(20) );

load data local infile 'c:\\종목.txt' into table 종목 fields terminated by '\t' lines terminated by '\r\n';


LOAD DATA LOCAL INFILE 'c:/종목.csv'
INTO TABLE 종목
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

    load data local infile 'c:\\종목.txt' into table 종목 fields terminated by ',' lines terminated by '\r\n';


SELECT 업종, AVG(총배당금액) AS 평균 FROM 배당정보 GROUP BY 업종 ORDER BY 평균 DESC LIMIT 3;

select 업종, avg(배당성향), sum(총배당금액) from 배당정보 group by 업종 having avg(배당성향) >= 0.2 order by 업종 desc;

select 업종, sum(총배당금액) from 배당정보 group by 업종 order by sum(총배당금액) desc limit 1;

select 업종 from 배당정보 group by 업종 having count(업종) >= 15;

select 업종, avg(기말주식수) from 배당정보 group by 업종, 주당배당금 having 주당배당금 >= 1000 and avg(기말주식수) >= 1000000;

select 사업연도, avg(액면가), max(기말주식수), sum(총배당금액) from 배당정보 group by 사업연도 order by 사업연도 desc;

select 업종, count(*), avg(액면가), sum(주식배당금), min(주당배당금) from 배당정보 where 업종 = '고무제품 및 플라스틱제품';

select 회사명, 대표자명, 주요제품, 지역 from 종목 where 결산월 = 2;

select * from 종목 where 대표자명 like '김%' and 회사명 like '___%';

select 회사명, 상장일, 대표자명, 지역 from 종목 where mod(month(상장일), 2) = 0 and 지역 like '%북구%' or year(상장일) = 2012;

SELECT LEFT(지역, 2) AS 지역_앞2글자, COUNT(*) AS 레코드_개수
FROM 종목
GROUP BY LEFT(지역, 2)
HAVING COUNT(*) >= 30;

SELECT LEFT(지역, 2) AS 지역_앞2글자, 결산월
FROM 종목
GROUP BY LEFT(지역, 2), 결산월
ORDER BY LEFT(지역, 2) DESC, 결산월 DESC;

desc 업종정보;
desc 배당정보;
desc 종목;

select 주요제품 from 종목 where 업종코드 in(select 업종코드 from 업종정보 where 업종 = '담배');

select 회사명, 업종코드, 대표자명, 지역 from 종목 where 업종코드 in(select 업종코드 from 업종정보 where char_length(업종) = 22);

select 종목코드 from 배당정보 where 액면가 = (select max(액면가) from 배당정보);

select 종목코드 from 배당정보 where 액면가 = (select min(액면가) from 배당정보);

select 회사명 from 종목 where 종목코드 in (select 종목코드 from 배당정보 where 액면가 = 100);

select distinct 액면가, 총배당금액 from 배당정보 where 종목코드 = (select 종목코드 from 종목 where 대표자명 = '장주해');

select 회사명, 주식배당금, 배당성향, 업종코드 from 종목 join 배당정보 on 종목.종목코드 = 배당정보.종목코드 where 배당정보.업종 = '식료품';

select 회사명, 대표자명, 지역 from 종목 where 업종코드 in (select 업종코드 from 업종정보 where 비고 = 10);

select 주요제품 from 종목 where 종목코드 in (select 종목코드 from 배당정보 where 총배당금액 = (select max(총배당금액) from 배당정보));

select 회사명, 상장일, 대표자명, 지역 from 종목 where 종목코드 in (select 종목코드 from 배당정보 where 총배당금액 >= (select avg(총배당금액) from 배당정보));