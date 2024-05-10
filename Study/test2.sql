create table Board(
    num int not null auto_increment primary key, 
    id varchar(45),
    writer varchar(45),
    title varchar(45),
    content varchar(100)
);

insert into Board (id, writer, title, content) values
('test', '김철수', '첫 번째 게시물', '안녕하세요. 여기는 첫 번째 게시물입니다.'),
('test2', '이영희', '두 번째 게시물', '오늘은 날씨가 정말 좋네요!'),
('test3', '박민수', '세 번째 게시물', '한국 음식 중에서 제일 좋아하는 음식은 무엇인가요?');
