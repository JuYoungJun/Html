create table tCar (
    car varchar(30) not null,
    capacity int not null,
    price int not null,
    maker varchar(30) not null
);

insert into tCar (car, capacity, price, maker) values ('소나타', 2000, 2500, '현대');
insert into tCar (car, capacity, price, maker) values ('티볼리', 1600, 2300, '쌍용');
insert into tCar (car, capacity, price, maker) values ('A8', 3000, 4800, 'Audi');
insert into tCar (car, capacity, price, maker) values ('SM5', 2000, 2600, '삼성');

update tCar set maker = '쌍용' where maker = '싸용';


create table tMaker (
    maker varchar(30) not null,
    factory char(10) not null,
    domestic char(1) not null
);

insert into tMaker (maker, factory, domestic) values ('현대', '부산', 'y');
insert into tMaker (maker, factory, domestic) values ('쌍용', '청주', 'y');
insert into tMaker (maker, factory, domestic) values ('Audi', '독일', 'n');
insert into tMaker (maker, factory, domestic) values ('기아', '서울', 'y');


select * from tCar, tMaker;

select * from tCar cross join tMaker;

select tCar.car, tCar.price, tMaker.maker, tMaker.factory from tCar, tMaker where tCar.maker = tMaker.maker;

select tCar.*, tMaker.factory from tCar, tMaker where tCar.maker = tMaker.maker;

select C.car, C.price, M.maker, M.factory from tCar C inner join tmaker M on C.maker = M.maker;

select C.car, C.price, M.maker, M.factory from tCar C left outer join tMaker M on C.maker = M.maker;

select C.car, C.price, M.maker, M.factory from tCar C right outer join tMaker M on C.maker = M.maker;

SELECT C.car, C.price, M.maker, M.factory FROM tCar C LEFT OUTER JOIN tMaker M ON C.maker = M.maker UNION SELECT C.car, C.price, M.maker, M.factory FROM tCar C RIGHT OUTER JOIN tMaker M ON C.maker = M.maker;

-- union 중복제거되고 합쳐짐
-- union all 중복 없이 합쳐짐

