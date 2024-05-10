create table 사원 (
    사번 varchar(10),
    이름 varchar(20),
    부서 varchar(10),
    성별 varchar(10),
    직위 varchar(10),
    TOEIC int,
    입사일 date );

DROP TABLE 사원;
insert into 사원 values ('J001', '홍길동', '총무부', '남', '과장', 920, '2013-03-02');
insert into 사원 values ('J003', '이도현', '영업부', '남', '과장', 900, '2013-03-02');
insert into 사원 values ('J008', '한미우', '인사부', '남', '대리', 850, '2013-06-01');
insert into 사원 values ('J009', '박정진', '영업부', '남', '대리', 840, '2013-06-01');
insert into 사원 values ('J010', '윤보라', '총무부', '여', '대리', 830, '2013-06-01');
insert into 사원 values ('J011', '이형태', '인사부', '남', '대리', 820, '2014-03-02');
insert into 사원 values ('P001', '최재석', '인사부', '남', '과장', 770, '2014-03-02');
insert into 사원 values ('P002', '김한응', '영업부', '남', '과장', 760, '2014-03-02');
insert into 사원 values ('P009', '이미라', '영업부', '여', '사원', 900, '2015-09-01');
insert into 사원 values ('P010', '백준걸', '총무부', '남', '사원', 580, '2015-09-01');
insert into 사원 values ('P011', '고수정', '인사부', '여', '사원', 560, '2015-09-01');
insert into 사원 values ('P012', '유응구', '영업부', '여', '사원', 540, '2015-09-01');
insert into 사원 values ('P013', '안은미', '총무부', '여', '사원', 520, '2015-09-01');
insert into 사원 values ('P014', '이병열', '인사부', '남', '사원', 500, '2015-09-01');
insert into 사원 values ('P015', '이충희', '영업부', '남', '사원', 480, '2015-09-01');
insert into 사원 values ('I0008', '도경민', '영업부', '남', '대리', 970, '2018-03-02');
insert into 사원 values ('I0009', '황선철', '총무부', '남', '대리', 920, '2018-03-02');
insert into 사원 values ('I0010', '방극준', '인사부', '남', '대리', 910, '2018-03-02');
insert into 사원 values ('I0011', '김주희', '영업부', '여', '대리', 900, '2020-09-01');
insert into 사원 values ('I0012', '인정제', '총무부', '남', '대리', 890, '2020-09-01');

select * from 사원 where 직위 = '과장';

select * from 사원 where 부서 = '인사부' and 성별 = '여';

select * from 사원 where not(부서 = '영업부');

select * from 사원 where 부서 = '인사부' and 성별 = '남' or 700 <= TOEIC and 성별 = '여';

select * from 사원 where 직위 = '대리' and TOEIC >= 900 and 부서 = '영업부';

select * from 사원 where 이름 like '이%';

select * from 사원 where 이름 like '%미%';

select * from 사원 where 부서 = '영업부' and date_format(입사일, '%m') = 03;

select * from 사원 order by TOEIC desc;

select avg(TOEIC) from 사원;

select 부서, avg(TOEIC) from 사원 group by 부서;

select 성별, avg(TOEIC) from 사원 group by 성별;

select 직위, avg(TOEIC) from 사원 group by 직위;

select 부서, count(부서) from 사원 group by 부서;

select 성별, count(성별) from 사원 group by 성별;

select 직위, count(직위) from 사원 group by 직위;

SELECT DATE_FORMAT(입사일, '%Y'), COUNT(입사일) FROM 사원 GROUP BY DATE_FORMAT(입사일, '%Y');

select date_format(입사일, '%m'), count(입사일) from 사원 group by date_format(입사일, '%m');

select date_format(입사일, '%Y'), max(TOEIC)  from 사원 group by date_format(입사일, '%Y');

select date_format(입사일, '%m'), max(TOEIC) from 사원 group by date_format(입사일, '%m');

select 직위, 성별, avg(TOEIC) from 사원 where 직위 = '대리' group by 성별;

select year(입사일), avg(TOEIC) from 사원 where year(입사일), between 2014 and 2018 group by year(입사일);

select 직위, 성별, count(직위) as 직위_별_인원수, count(성별) as 성별_별_인원수 from 사원 group by 직위, 성별;

select 직위, avg(TOEIC) as 남자직원의_직위별_토익_평균 from 사원 where 성별 = '남' group by 직위;

select date_format(입사일, '%m'), avg(TOEIC) from 사원 where 성별 = '여' group by date_format(입사일, '%m');

select 부서, 성별, max(TOEIC), min(TOEIC), avg(TOEIC) from 사원 group by 부서, 성별;

select 부서, avg(TOEIC) as 토익점수_평균 from 사원 group by 부서 having count(부서) >= 7;

select 직위, avg(TOEIC) from 사원 group by 직위 having avg(TOEIC) >= 700;

select 부서, 성별, count(*) from 사원 group by 부서, 성별 order by 부서 desc;

select 부서, 성별, count(*) from 사원 group by 부서, 성별 having count(부서) >= 4 order by 부서 desc;

------------------------------4번-------------------------------
create table 직위 (
    직위 varchar(10),
    기본급 int,
    보너스비율 float,
    지급수당 int );

   insert into 직위 values ('부사장', 3000000, 0.5, 500000);
   insert into 직위 values ('이사', 2600000, 0.5, 400000);
   insert into 직위 values ('부장', 2300000, 0.4, 300000);
   insert into 직위 values ('차장', 2000000, 0.4, 200000);
   insert into 직위 values ('과장', 1800000, 0.3, 150000);
   insert into 직위 values ('대리', 1500000, 0.3, 100000);
   insert into 직위 values ('주임', 1200000, 0.3, 0);
   insert into 직위 values ('사원', 1000000, 0.3, 0);

    --테이블복사--
   create table 사원급여 select * from 사원;

   alter table 사원급여 drop 성별;
   alter table 사원급여 drop 부서;
   alter table 사원급여 drop TOEIC;
   alter table 사원급여 drop 입사일;

   alter table 사원급여 add 기본급 int;

   update 사원급여 set 기본급 = ( select 기본급 from 직위 j where 사원급여.직위 = j.직위 );
   
   alter table 사원급여 add 보너스급액 int after 직위;

  update 사원급여 set 보너스금액 = 기본급 * ( select 보너스비율 from 직위 j where 사원급여.직위 = j.직위);

  update 사원급여 set 보너스금액 = 기본급 * j.보너스비율 from 사원급여 s join 직위 j on s.직위 = j.직위;

  alter table 사원급여 rename column 보너스급액 to 보너스금액;

  alter table 사원급여 add 공제금액 int;

  update 사원급여 set 공제금액 = 기본급 * 0.15;

  alter table 사원급여 add 실수령액 int;
   
   update 사원급여 set 실수령액 = 기본급 + 보너스금액 - 공제금액;

   update 사원급여 set 공제금액 = 기본급 * 0.1 where 직위 = '사원';

   alter table 사원급여 add 부서 char(10) after 이름;

   update 사원급여 set 부서 = '총무부' where left(사번, 1) = 'p';
   update 사원급여 set 부서 = '인사부' where left(사번, 1) = 'I';
   update 사원급여 set 부서 = '영업부' where left(사번, 1) = 'J';

   update 사원급여  set 공제금액 = 0 where 직위 = '사원';

   update 사원급여 set 실수령액 = 기본급 + 보너스금액 - 공제금액;

   update 사원급여 set 기본급 = 기본급 * 1.1 where 부서 = '영업부' and 직위 = '과장';

   update 사원급여 set 보너스금액 = 기본급 * (select 보너스비율 from 직위 j where 사원급여.직위 = j.직위);

   update 사원급여 set 공제금액 = 기본급 * 0.15;

   update 사원급여 set 실수령액 = 기본급 + 보너스금액 - 공제금액;