create table sale (
    판매번호 int,
    판매일 date,
    제품코드 varchar(10),
    영업사원 varchar(20),
    소속지점코드 varchar(20),
    판매수량 int );

    update sale set 판매번호 = 1 where 판매번호 = 0;

    alter table sale modify 제품코드 varchar(10) after 판매번호;
    

    ALTER TABLE sale
    RENAME COLUMN 소속지점코드 TO 지점코드;

    ALTER TABLE sale
    RENAME COLUMN 지점명 TO 지점코드;

    alter table sale add 지점명 varchar(20);

    update sale set 지점명 = '광주' where substring(지점코드, 3, 1) = '9';
    update sale set 지점명 = '서울' where substring(지점코드, 3, 1) = '8';
    update sale set 지점명 = '부산' where substring(지점코드, 3, 1) = '0';

     alter table sale add 제품명 varchar(20);

     update sale set 제품명 = '운동화' where substring(제품코드, 1, 2) = 'YB';
     update sale set 제품명 = '의류' where substring(제품코드, 1, 2) = 'SB';
     update sale set 제품명 = '가방' where substring(제품코드, 1, 2) = 'BJ';

      alter table sale add 판매단가 int;
      
      update sale set 판매단가 = 5000 where 제품명 = '운동화';
      update sale set 판매단가 = 3000 where 제품명 = '의류';
      update sale set 판매단가 = 7000 where 제품명 = '가방';

      alter table sale add 판매금액 int;

      update sale set 판매금액 = 판매단가 * 판매수량;

      alter table sale add 원가 int;

      update sale set 원가 = 판매단가 * 0.75;

      alter table sale add 이익금 int;

      update sale set 이익금 = (판매단가 - 원가) * 판매수량;

      alter table sale modify 이익금 int first;

      select 

      select sum(판매금액) as 총액 from sale group by 판매금액;



create table sale (
    판매번호 int,
    판매일 date,
    제품코드 varchar(10),
    영업사원 varchar(20),
    소속지점코드 varchar(20),
    판매수량 int );

    update sale set 판매번호 = 1 where 판매번호 = 0;

    alter table sale modify 제품코드 varchar(10) after 판매번호;
    

    ALTER TABLE sale RENAME COLUMN 소속지점코드 TO 지점코드;

    ALTER TABLE sale RENAME COLUMN 지점명 TO 지점코드;

    alter table sale add 지점명 varchar(20);

    update sale set 지점명 = '광주' where substring(지점코드, 3, 1) = '9';
    update sale set 지점명 = '서울' where substring(지점코드, 3, 1) = '8';
    update sale set 지점명 = '부산' where substring(지점코드, 3, 1) = '0';

     alter table sale add 제품명 varchar(20);

     update sale set 제품명 = '운동화' where substring(제품코드, 1, 2) = 'YB';
     update sale set 제품명 = '운동화' where left(제품코드 2) = 'YB';
     update sale set 제품명 = '의류' where substring(제품코드, 1, 2) = 'SB';
     update sale set 제품명 = '가방' where substring(제품코드, 1, 2) = 'BJ';

      alter table sale add 판매단가 int;
      
      update sale set 판매단가 = 5000 where 제품명 = '운동화';
      update sale set 판매단가 = 3000 where 제품명 = '의류';
      update sale set 판매단가 = 7000 where 제품명 = '가방';

      alter table sale add 판매금액 int;

      update sale set 판매금액 = 판매단가 * 판매수량;

      alter table sale add 원가 int;

      update sale set 원가 = 판매단가 * 0.75;

      alter table sale add 이익금 int;

      update sale set 이익금 = (판매단가 - 원가) * 판매수량;

      alter table sale modify 이익금 int first;

      select sum(판매수량) as 총합, avg(판매수량) as 평균 from sale group by 판매금액;

      select sum(판매금액) as 총액 from sale group by 판매금액;
      
      select sum(판매수량) as 김씨가_판매한_수량 from sale where 영업사원 like '김%';

      select count(영업사원) as 이씨인_영업산원의_수 from sale where 영업사원 like '이%';
    
      select 영업사원, 지점코드 from sale where 제품코드 = 'YBR41' or 제품코드 = 'SBBC9' or 제품코드 = 'BJBBC9' or 제품코드 = 'BRJ5G';
       제품코드 int('YBR41', 'SBBC9', 'BJBBC9', 'BRJ5G');
       
      select * from sale where 지점코드 like '%SD';

      select * from sale where not(제품코드 like '%KD%');

      select * from sale where 판매수량 >=100 or 판매수량 >= 60; between(60 and 100)

      // <> 데이터 베이스에서는 다르느다는 표현