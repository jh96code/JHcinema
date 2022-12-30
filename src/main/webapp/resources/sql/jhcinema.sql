create database JHcinema;
use JHcinema;

create table if not exists customer(
	id varchar(20) primary key,
    password varchar(20) not null,
    name varchar(10) not null,
    gender varchar(2),
    birth varchar(10) not null,
    phone varchar(15) not null,
    addr varchar(200) not null,
    mail varchar(50) not null,
    recom_id varchar(20),
    regist_day date not null,
    grade varchar(10) default '브론즈',
    point int default '0'
)charset=utf8mb4;

create table if not exists admin(
	id varchar(20) primary key,
    password varchar(20) not null,
    name varchar(10) not null,
    gender varchar(2),
    birth varchar(10) not null,
    phone varchar(15) not null,
    addr varchar(200) not null,
    mail varchar(50) not null,
    recom_id varchar(20),
    regist_day date not null,
    grade varchar(10) default '실버',
    point int default '0'
)charset=utf8mb4;

create table if not exists movieShowing(
	num int auto_increment primary key,
    title varchar(65) not null unique key,
    category varchar(10) not null,
    country varchar(3) not null,
    director varchar(45) not null,
    actor varchar(65) not null,
	movieTime tinyint unsigned not null,
    openDate date not null,
    img varchar(25) not null,
    content varchar(255) not null,
    heart int unsigned default 0
)charset=utf8mb4;
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("자백", "미스테리, 범죄", "한국", "윤종석", "소지섭, 김윤진, 나나", "105", current_date(), "movie01.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("리멤버", "기타", "한국", "이일형", "이성민, 남주혁", "128", current_date(), "movie02.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("블랙 아담", "액션", "외국", "자움 콜렛 세라", "드웨인 존슨, 노아 센티네오", "125", current_date(), "movie03.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("인생은 아름다워", "로맨스, 멜로", "한국", "최국희", "류승룡, 염정아", "122",  current_date(), "movie04.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("에브리씽 에브리웨어 올 앳 원스", "액션", "외국", "다니엘 콴", "양자경, 스테파니 수", "139", current_date(), "movie05.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("짱구는 못말려 극장판", "애니메이션", "외국", "타카하시 와타루", "짱구와 친구들", "105", current_date(), "movie06.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("공조2", "액션", "한국", "이석훈", "현빈, 유해진, 윤아", "129", current_date(), "movie07.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("캐릭터", "스릴러", "외국", "나가이 아키라", "스다 마사키, 후카세", "126",  current_date(), "movie08.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("스마일", "미스테리", "외국", "파커 핀", "소시 베이컨, 제시 어셔", "115", current_date(), "movie09.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("죽어도 자이언츠", "다큐", "한국", "이동윤", "자이언츠 사람들", "108", current_date(), "movie10.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("자백2", "미스테리, 범죄", "한국", "윤종석", "소지섭, 김윤진, 나나", "105", current_date(), "movie01.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("리멤버2", "기타", "한국", "이일형", "이성민, 남주혁", "128", current_date(), "movie02.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("블랙 아담2", "액션", "외국", "자움 콜렛 세라", "드웨인 존슨, 노아 센티네오", "125", current_date(), "movie03.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("인생은 아름다워2", "로맨스, 멜로", "한국", "최국희", "류승룡, 염정아", "122",  current_date(), "movie04.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("에브리씽 에브리웨어 올 앳 원스2", "액션", "외국", "다니엘 콴", "양자경, 스테파니 수", "139", current_date(), "movie05.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("짱구는 못말려 극장판2", "애니메이션", "외국", "타카하시 와타루", "짱구와 친구들", "105", current_date(), "movie06.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("공조2-2", "액션", "한국", "이석훈", "현빈, 유해진, 윤아", "129", current_date(), "movie07.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("캐릭터2", "스릴러", "외국", "나가이 아키라", "스다 마사키, 후카세", "126",  current_date(), "movie08.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("스마일2", "미스테리", "외국", "파커 핀", "소시 베이컨, 제시 어셔", "115", current_date(), "movie09.jpg", "영화 줄거리입니다.");
insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values("죽어도 자이언츠2", "다큐", "한국", "이동윤", "자이언츠 사람들", "108", current_date(), "movie10.jpg", "영화 줄거리입니다.");

create table if not exists movieComing(
	num int auto_increment primary key,
    title varchar(65) not null unique key,
    category varchar(10) not null,
    country varchar(3) not null,
    director varchar(45) not null,
    actor varchar(65) not null,
	movieTime tinyint unsigned not null,
    openDate date not null,
    img varchar(25) not null,
    content varchar(255) not null
)charset=utf8mb4;
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("블랙 팬서 : 와칸다 포에버", "액션", "외국", "라이언 쿠글러", "레티티아 라이트, 다나이 구리라", "161", current_date()+1, "coming-movie01.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("에브리띵 윌 체인지", "SF", "외국", "마튼 페지엘", "노아 자베드라", "92", current_date()+1, "coming-movie02.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("내 친한 친구의 아침식사", "로맨스, 멜로", "외국", "두정철", "에릭 추, 이목", "119", current_date()+1, "coming-movie03.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("첫번째 아이", "기타", "한국", "허정재", "박하선, 오동민", "93", current_date()+1, "coming-movie04.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("피가로~ 피가로~ 피가로", "코미디", "외국", "벤 루윈", "다니엘 맥도널드, 휴 스키너", "105", current_date()+1, "coming-movie05.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("블랙 팬서 : 와칸다 포에버2", "액션", "외국", "라이언 쿠글러", "레티티아 라이트, 다나이 구리라", "161", current_date()+1, "coming-movie01.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("에브리띵 윌 체인지2", "SF", "외국", "마튼 페지엘", "노아 자베드라", "92", current_date()+1, "coming-movie02.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("내 친한 친구의 아침식사2", "로맨스, 멜로", "외국", "두정철", "에릭 추, 이목", "119", current_date()+1, "coming-movie03.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("첫번째 아이2", "기타", "한국", "허정재", "박하선, 오동민", "93", current_date()+1, "coming-movie04.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("피가로~ 피가로~ 피가로2", "코미디", "외국", "벤 루윈", "다니엘 맥도널드, 휴 스키너", "105", current_date()+1, "coming-movie05.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("블랙 팬서 : 와칸다 포에버3", "액션", "외국", "라이언 쿠글러", "레티티아 라이트, 다나이 구리라", "161", current_date()+1, "coming-movie01.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("에브리띵 윌 체인지3", "SF", "외국", "마튼 페지엘", "노아 자베드라", "92", current_date()+1, "coming-movie02.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("내 친한 친구의 아침식사3", "로맨스, 멜로", "외국", "두정철", "에릭 추, 이목", "119", current_date()+1, "coming-movie03.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("첫번째 아이3", "기타", "한국", "허정재", "박하선, 오동민", "93", current_date()+1, "coming-movie04.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("피가로~ 피가로~ 피가로3", "코미디", "외국", "벤 루윈", "다니엘 맥도널드, 휴 스키너", "105", current_date()+1, "coming-movie05.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("블랙 팬서 : 와칸다 포에버4", "액션", "외국", "라이언 쿠글러", "레티티아 라이트, 다나이 구리라", "161", current_date()+1, "coming-movie01.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("에브리띵 윌 체인지4", "SF", "외국", "마튼 페지엘", "노아 자베드라", "92", current_date()+1, "coming-movie02.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("내 친한 친구의 아침식사4", "로맨스, 멜로", "외국", "두정철", "에릭 추, 이목", "119", current_date()+1, "coming-movie03.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("첫번째 아이4", "기타", "한국", "허정재", "박하선, 오동민", "93", current_date()+1, "coming-movie04.jpg", "영화 줄거리입니다.");
insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values("피가로~ 피가로~ 피가로4", "코미디", "외국", "벤 루윈", "다니엘 맥도널드, 휴 스키너", "105", current_date()+1, "coming-movie05.jpg", "영화 줄거리입니다.");

create table if not exists movieShowing_reply(
	num INT PRIMARY KEY AUTO_INCREMENT,
    content varchar(200) not null,
    regist_day date,
    movie_num int not null,
    cus_id VARCHAR(20) NOT NULL,
    foreign key(movie_num) references movieShowing(num) on update cascade on delete cascade,
    foreign key(cus_id) references customer(id) on update cascade on delete cascade
)charset=utf8mb4;

create table if not exists FAQ(
	num INT PRIMARY KEY AUTO_INCREMENT,
    category varchar(10) not null,
    title varchar(65) not null,
    content varchar(255) not null
)charset=utf8mb4;
insert into FAQ(category, title, content) values("영화관 이용", "자주 묻는 질문1", "자주 묻는 답변1");
insert into FAQ(category, title, content) values("회원", "자주 묻는 질문2", "자주 묻는 답변2");
insert into FAQ(category, title, content) values("온라인", "자주 묻는 질문3", "자주 묻는 답변3");
insert into FAQ(category, title, content) values("관람권", "자주 묻는 질문4", "자주 묻는 답변4");
insert into FAQ(category, title, content) values("할인혜택", "자주 묻는 질문5", "자주 묻는 답변5");
insert into FAQ(category, title, content) values("스토어", "자주 묻는 질문6", "자주 묻는 답변6");

create table if not exists notice(
	num INT PRIMARY KEY AUTO_INCREMENT,
    title varchar(65) not null,
    content varchar(255) not null,
    hit int unsigned default 0,
    regist_day date
)charset=utf8mb4;
insert into notice(title, content, regist_day) values("공지사항1 입니다.", "공지사항 내용입니다.", current_date());
insert into notice(title, content, regist_day) values("공지사항2 입니다.", "공지사항 내용입니다.", current_date());
insert into notice(title, content, regist_day) values("공지사항3 입니다.", "공지사항 내용입니다.", current_date());
insert into notice(title, content, regist_day) values("공지사항4 입니다.", "공지사항 내용입니다.", current_date());
insert into notice(title, content, regist_day) values("공지사항5 입니다.", "공지사항 내용입니다.", current_date());
insert into notice(title, content, regist_day) values("공지사항6 입니다.", "공지사항 내용입니다.", current_date());

create table if not exists contact(
	num INT PRIMARY KEY AUTO_INCREMENT,
    category varchar(10) not null,
    title varchar(65) not null,
    content varchar(255) not null,
    reply varchar(255),
    regist_day date not null,
    reply_day date,
    cus_id varchar(20) not null,
    admin_id varchar(20),
    foreign key(cus_id) references customer(id) on update cascade on delete cascade, 
    foreign key(admin_id) references admin(id) on update cascade on delete cascade
)charset=utf8mb4;

create table if not exists screeningMovie(
    screenDate Date,
    movie varchar(65),
    cinema varchar(3),
    screenTime varchar(6),
    num int,
    foreign key(num) references movieShowing(num) on update cascade on delete cascade,
    foreign key(movie) references movieShowing(title) on update cascade on delete cascade
)charset=utf8mb4;
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "자백", "김해", "18:30", 1);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "자백", "창원", "18:30", 1);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "자백", "김해", "20:30", 1);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "자백", "창원", "20:30", 1);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "자백", "부산", "20:30", 1);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "자백", "김해", "19:30", 1);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "자백", "창원", "19:30", 1);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "리멤버", "김해", "19:30", 2);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "리멤버", "창원", "19:30", 2);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "리멤버", "김해", "19:30", 2);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "리멤버", "창원", "19:30", 2);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "블랙 아담", "김해", "19:30", 3);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "블랙 아담", "창원", "19:30", 3);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "블랙 아담", "김해", "19:30", 3);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "블랙 아담", "창원", "19:30", 3);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "인생은 아름다워", "김해", "19:30", 4);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "인생은 아름다워", "창원", "19:30", 4);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "인생은 아름다워", "김해", "19:30", 4);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "인생은 아름다워", "창원", "19:30", 4);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "에브리씽 에브리웨어 올 앳 원스", "김해", "19:30", 5);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "에브리씽 에브리웨어 올 앳 원스", "창원", "19:30", 5);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "에브리씽 에브리웨어 올 앳 원스", "김해", "19:30", 5);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "에브리씽 에브리웨어 올 앳 원스", "창원", "19:30", 5);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "짱구는 못말려 극장판", "김해", "19:30", 6);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "짱구는 못말려 극장판", "창원", "19:30", 6);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "짱구는 못말려 극장판", "김해", "19:30", 6);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "짱구는 못말려 극장판", "창원", "19:30", 6);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "공조2", "김해", "19:30", 7);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "공조2", "창원", "19:30", 7);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "공조2", "김해", "19:30", 7);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "공조2", "창원", "19:30", 7);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "캐릭터", "김해", "19:30", 8);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "캐릭터", "창원", "19:30", 8);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "캐릭터", "김해", "19:30", 8);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "캐릭터", "창원", "19:30", 8);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "스마일", "김해", "19:30", 9);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "스마일", "창원", "19:30", 9);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "스마일", "김해", "19:30", 9);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "스마일", "창원", "19:30", 9);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "죽어도 자이언츠", "김해", "19:30", 10);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date(), "죽어도 자이언츠", "창원", "19:30", 10);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "죽어도 자이언츠", "김해", "19:30", 10);
insert into screeningMovie(screenDate, movie, cinema, screenTime, num) values(current_date()+1, "죽어도 자이언츠", "창원", "19:30", 10);

create table if not exists ticketPay(
	id varchar(20),
    movie varchar(65),
    cinema varchar(3),
    screenDate Date,
    screenTime varchar(6),
    seat varchar(100),
    people int unsigned,
    price int unsigned,
    movieImg varchar(25)
)charset=utf8mb4;

create table if not exists pointDetail(
	id varchar(20) not null,
    point int,
    minusPoint int,
    addPoint int,
    memo varchar(20),
    regist_day datetime
)charset=utf8mb4;

