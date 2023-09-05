-- 회원
drop table member cascade constraints;
select * from member;
CREATE TABLE member
(
 user_id   VARCHAR2(100) constraint member_user_id_PK PRIMARY KEY NOT NULL,
 name   VARCHAR2(100) NOT NULL,
 nickname   VARCHAR2(100) NOT NULL,
 email   VARCHAR2(100) NOT NULL,
 tel   VARCHAR2(100) NOT NULL,
 pass   VARCHAR2(100) NOT NULL,
 user_img   VARCHAR2(200) NULL,
 addr   VARCHAR2(100) NOT NULL,
 age   NUMBER NOT NULL,
 gender   CHAR(2) NOT NULL,
 join_date   DATE NOT NULL,
 del   CHAR(1) default 'n' NOT NULL
);
select * from member;
insert into member values ('master', '관리자', '관리자_닉', 'master@master.com', '010-1111-1111', 1234, 'profile.png', 'address', 1, 'M', sysdate, 'n');
insert into member values ('user', '사용자', '사용자_닉', 'user@user.com', '010-2222-2222', 1234, 'profile.png', 'address', 1, 'M', sysdate, 'n');
insert into member values ('k1', '사용자2', '사용자2_닉', 'k1@k1.com', '010-3333-3333', 1234, 'profile.png', 'address', 1, 'M', sysdate, 'n');

-- 카페
drop table cafe;
CREATE TABLE CAFE 
(
 c_no   NUMBER CONSTRAINT cafe_c_no_PK PRIMARY KEY NOT NULL,
 c_type   VARCHAR2(20) NOT NULL,
 c_name   VARCHAR2(100) NOT NULL,
 c_addr   VARCHAR2(100) NOT NULL,
 c_addr_new   VARCHAR2(100) NOT NULL,
 c_loc   VARCHAR2(100) NOT NULL,
 c_tel   VARCHAR(100) NOT NULL,
 c_price   VARCHAR2(100) NOT NULL,
 c_optime   VARCHAR2(100) NOT NULL,
 c_img1   VARCHAR2(200) NOT NULL,
 c_img2   VARCHAR2(200),
 c_img3   VARCHAR2(200),
 c_menu1   VARCHAR2(200) NOT NULL,
 c_menu2   VARCHAR2(200),
 c_menu3   VARCHAR2(200),
 c_join_date   DATE NOT NULL,
 c_del   CHAR(1) default 'n' NOT NULL,
 c_del_date   DATE NOT NULL,
 c_readcount NUMBER NOT NULL,
 user_id   VARCHAR2(100) constraint cafe_user_id_fk references member(user_id) NOT NULL
);

-- cafe 테이블 데이터 dessert 생성
insert all into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (1,'dessert','일월십일','서울 양천구 목동 중앙남로9길 41 1층','목동 730-18','양천구','070-4215-0110','4500원 ~ 13500원','10:00 ~ 23:00','janten1.jpg','janten2.jpg','janten3.jpg','janten4.jpg','janten5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (2,'dessert','디어다온','서울 마포구 연희로1길 28 101호','동교동 113-29','마포구','0507-1334-9138','5000원 ~ 6500원','11:00 ~ 20:00','dear1.jpg','dear2.jpg','dear3.jpg','dear4.jpg','dear5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (3,'dessert','고래당','서울 중랑구 면목로49길 70 1층','면목동 576-20','중랑구','010-6546-0661','2500원 ~ 4000원','11:00 ~ 17:00','whale1.jpg','whale2.jpg','whale3.jpg','whale4.jpg','whale5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (4,'dessert','크랙커피','서울 성북구 보문로23길 7  1층',' 보문동5가 2','성북구','0507-1324-7794','4000원 ~ 5000원','11:00 ~ 21:00','krack1.jpg','krack2.jpg','krack3.jpg','krack4.jpg','krack5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (5,'dessert','쿰배오','서울 강동구 명일로26길 12 1층','길동 83-4','강동구','0507-1406-5280','3000원 ~ 12400원','11:00 ~ 22:00','cum1.jpg','cum2.jpg','cum3.jpg','cum4.jpg','cum5.jpg',sysdate,'n',sysdate,0,'master')
select * from dual;



-- cafe 테이블 데이터 hip 생성
insert all into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (6,'hip','라드','서울 마포구 잔다리로3길 23','서교동 395-112','마포구','02-6081-2150','6000원 ~ 8000원','12:00 ~ 00:30','lad1.jpg','lad2.jpg','lad3.jpg','lad4.jpg','lad5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (7,'hip','상향선','서울 용산구 청파로85길 33 1층','서계동 33-89','용산구','02-707-1688','4000원 ~ 8000원','11:00 ~ 24:00','award1.jpg','award2.jpg','award3.jpg','award4.jpg','award5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (8,'hip','을지빈','서울 중구 을지로14길 21 2층','을지로3가 296-6','중구','0507-1313-8818','5000원 ~ 8000원','12:00 ~ 22:00','eulji1.jpg','eulji2.jpg','eulji3.jpg','eulji4.jpg','eulji5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (9,'hip','컴오프','서울 성동구 서울숲4길 17 1층','성수동1가 668-27','성동구','02-3514-8169','5000원 ~ 6000원','11:00 ~ 22:00','come1.jpg','come2.jpg','come3.jpg','come4.jpg','come5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values    
    (10,'hip','토키','서울 영등포구 선유로 58 지하1층','문래동3가 77-44','영등포구','0507-1343-9557','4000원 ~ 15000원','12:00 ~ 20:00','rabbit1.jpg','rabbit2.jpg','rabbit3.jpg','rabbit4.jpg','rabbit5.jpg',sysdate,'n',sysdate,0,'master')
select * from dual;



-- cafe 테이블 데이터 isek 생성
insert all into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (11,'isek','땡스네이쳐','서울 마포구 홍익로 10 서교푸르지오상가지하121호','서교동 486','마포구','02-332-7470','3900원 ~ 7400원','12:00 ~ 21:00','thank1.jpg','thank2.jpg','thank3.jpg','thank4.jpg','thank5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values    
    (12,'isek','할아버지공장','서울 성동구 성수이로7가길 9','성수동2가 309-133','성동구','0507-1317-2301','5000원 ~ 23000원','11:00 ~ 22:00','habae1.jpg','habae2.jpg','habae3.jpg','habae4.jpg','habae5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values    
    (13,'isek','버드아뜰리에','서울 영등포구 도신로 114 2층','신길동 296-26','영등포구','02-6082-9513','8000원 ~ 10000원','12:00 ~ 19:00','bird1.jpg','bird2.jpg','bird3.jpg','bird4.jpg','bird5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values    
    (14,'isek','루이스의사물들','서울 중구 청계천로 172-1 3층','주교동 148-1','중구','02-2274-4854','6000원 ~ 7000원','12:00 ~ 20:00','louis1.jpg','louis2.jpg','louis3.jpg','louis4.jpg','louis5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values    
    (15,'isek','코칭심리카','서울 마포구 어울마당로 118 6층','서교동 345-2','마포구','070-8154-0089','18000 ~ 150,000','12:30 ~ 21:00','symli1.jpg','symli2.jpg','symli3.jpg','symli4.jpg','symli5.jpg',sysdate,'n',sysdate,0,'master')
select * from dual;



-- cafe 테이블 데이터 pet 생성
insert all into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (16,'pet','헤이더그린','서울 강서구 대장로 58','오쇠동 115-11','강서구','0507-1333-6512','7000원 ~ 8000원','11:00 ~ 20:30','green1.jpg','green2.jpg','green3.jpg','green4.jpg','green5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values   
    (17,'pet','펌킨펫하우스','서울 성동구 상원1길 22 1층','성수동1가 656-1748','성동구','02-994-4000','아메리카노 + 강아지입장료 8000원','08:00 ~ 20:00','perm1.jpg','perm2.jpg','perm3.jpg','perm4.jpg','perm5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values   
    (18,'pet','고양이놀이터','서울 중구 명동8길 37-14 3층','충무로2가 66-4','중구','02-3789-2207','성인 : 13000원 아동 및 청소년: 10000원','12:00 ~ 23:00','cat1.jpg','cat2.jpg','cat3.jpg','cat4.jpg','cat5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values   
    (19,'pet','웁시데이지','서울 강동구 아리수로61길 105','고덕동 산 93-9','강동구','02-3426-1928','8000원 ~ 10000원','11:00 ~ 19:00','oupsi1.jpg','oupsi2.jpg','oupsi3.jpg','oupsi4.jpg','oupsi5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values   
    (20,'pet','뭉스벨리','서울 강동구 천호대로 1045 2 3층','천호동 452','강동구','0507-1344-8412','8000원 ~ 20000원','09:00 ~ 20:00','hotel1.jpg','hotel2.jpg','hotel3.jpg','hotel4.jpg','hotel5.jpg',sysdate,'n',sysdate,0,'master')
select * from dual;



-- cafe 테이블 데이터 vegan 생성
insert all into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (21,'vegan','비건마마','서울 관악구 봉천로 457-1 1층','봉천동 871-74','관악구','0507-1496-2218','4000원 ~ 8000원','11:00 ~ 23:00','mama.jpg','mama2.jpg','mama3.jpg','mama4.jpg','mama5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values   
    (22,'vegan','비건비거닝','서울 강남구 선릉로85길 6 호텔뉴브 1층','역삼동 708-35','강남구','02-740-5060','4000원 ~ 10000원','08:00 ~ 19:00','vegan.jpg','vegan2.jpg','vegan3.jpg','vegan4.jpg','vegan5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values   
    (23,'vegan','비건이지','서울 영등포구 가마산로 61길 5-1 1층','신길동 325-57','영등포구','0507-1359-5812','5000원 ~ 10000원','11:00 ~ 20:00','easy.jpg','easy2.jpg','easy3.jpg','easy4.jpg','easy5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values   
    (24,'vegan','살롱드비건','서울 영등포구 양평로 22길 31 1층','양평동5가 120-2','영등포구','02-2634-8880','3000원 ~ 7000원','08:00 ~ 21:00','salong.jpg','salong2.jpg','salong3.jpg','salong4.jpg','salong5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values   
    (25,'vegan','오베흐트','서울 중구 퇴계로10길 34','회현동1가 73-1','중구','02-6084-6404','3000원 ~ 40000원','08:00 ~ 20:00','obe.jpg','obe2.jpg','obe3.jpg','obe4.jpg','obe5.jpg',sysdate,'n',sysdate,0,'master')
select * from dual;



-- cafe 테이블 데이터 lp 생성
insert all into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (26,'lp','모자이크','서울 중구 다산로31길 64 1층','신당동 304-611','중구','070-4223-5550','3500원 ~ 10000원','13:00 ~ 20:00','m1.jpg','m2.jpg','m3.jpg','m4.jpg','m5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (27,'lp','오오비','서울 용산구 한강대로 268-1 2층','남영동 84-7','용산구','0507-1316-2718','8000원 ~ 15000원','12:00 ~ 22:00','o1.jpg','o2.jpg','o3.jpg','o4.jpg','o5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (28,'lp','울프소셜클럽','서울 용산구 한남대로 158 1층','한남동 795-2','용산구','02-790-5978','4000원 ~ 8000원','12:00 ~ 19:00','u1.jpg','u2.jpg','u3.jpg','u4.jpg','u5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (29,'lp','턴다운서비스','서울 마포구 동교로50길 7 반지층','연남동 224-12','마포구','0507-1341-8605','4000원 ~ 8000원','12:00 ~ 19:00','t1.jpg','t2.jpg','t3.jpg','t4.jpg','t5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (30,'lp','TMH','서울 성동구 연무장7가길 8','성수동2가 315-47','성동구','02-1341-6849','4000원 ~ 8000원','11:00 ~ 20:00','tm1.jpg','tm2.jpg','tm3.jpg','tm4.jpg','tm5.jpg',sysdate,'n',sysdate,0,'master')
select * from dual;

delete from cafe;

select * from cafe;


-- 카페 좋아요!
drop table cafe_like;
CREATE TABLE cafe_like
(
 user_id   VARCHAR2(100) constraint cafe_like_user_id_fk references member(user_id) NOT NULL,
 c_no   NUMBER constraint cafe_like_c_no_fk references cafe(c_no) NOT NULL
);
ALTER TABLE SCOTT.CAFE_LIKE ADD(CONSTRAINT CAFE_LIKE_PK PRIMARY KEY (USER_ID, C_NO));
select * from cafe_like;


-- 카페 리뷰
drop table cafe_re;
CREATE TABLE CAFE_RE
(
 cr_no   NUMBER constraint cafe_re_r_no_PK PRIMARY KEY NOT NULL,
 cr_content   VARCHAR2(500) NOT NULL,
 cr_grade   NUMBER NOT NULL,
 cr_reg_date   DATE NOT NULL,
 cr_del   CHAR(1) default 'n' NOT NULL,
 cr_del_date   DATE NOT NULL,
 user_id   VARCHAR2(100) constraint cafe_re_user_id_fk references member(user_id) NOT NULL,
 c_no NUMBER constraint cafe_re_c_no_fk references cafe(c_no) NOT NULL
);
select * from cafe_re;

-- 자유게시판
drop table board;
CREATE TABLE board
(
 b_no   NUMBER constraint board_b_no_PK PRIMARY KEY NOT NULL,
 b_subject   VARCHAR2(50) NOT NULL,
 b_img1   VARCHAR2(200) NOT NULL,
 b_content   VARCHAR2(500) NOT NULL,
 b_reg_date   DATE NOT NULL,
 b_del   CHAR(1) default 'n' NOT NULL,
 b_readcount   NUMBER NOT NULL,
 user_id   VARCHAR2(100) constraint board_User_ID_fk references member(user_id) NOT NULL
);
insert into board values (1, '혼자가기 좋은 카페 추천해드려요~2', '/nemoca/images/cafe1.jpg', '혼자가기 좋은 카페 추천해드려요~내용이에요', sysdate, 'n', 3, 'user');
insert into board values 
(2, '혼자가기 좋은 카페 추천해드려요~2', '/nemoca/images/cafe2.jpg', '혼자가기 좋은 카페 추천해드려요~내용이에요2', sysdate, 'n', 3, 'user');
insert into board values 
(3, '혼자가기 좋은 카페 추천해드려요~3', '/nemoca/images/cafe3.jpg', '혼자가기 좋은 카페 추천해드려요~내용이에요3', sysdate, 'n', 3, 'user');
insert into board values 
(4, '혼자가기 좋은 카페 추천해드려요~4', '/nemoca/images/cafe4.jpg', '혼자가기 좋은 카페 추천해드려요~내용이에요4', sysdate, 'n', 3, 'user');
insert into board values 
(5, '혼자가기 좋은 카페 추천해드려요~5', '/nemoca/images/cafe5.jpg', '혼자가기 좋은 카페 추천해드려요~내용이에요5', sysdate, 'n', 3, 'user');
insert into board values 
(6, '혼자가기 좋은 카페 추천해드려요~6', '/nemoca/images/cafe6.jpg', '혼자가기 좋은 카페 추천해드려요~내용이에6요', sysdate, 'n', 3, 'user');
insert into board values 
(7, '혼자가기 좋은 카페 추천해드려요~7', '/nemoca/images/cafe7.jpg', '혼자가기 좋은 카페 추천해드려요~내용이에요7', sysdate, 'n', 3, 'user');
insert into board values 
(8, '혼자가기 좋은 카페 추천해드려요~8', '/nemoca/images/cafe8.jpg', '혼자가기 좋은 카페 추천해드려요~내용이에요8', sysdate, 'n', 3, 'user');
insert into board values 
(9, '혼자가기 좋은 카페 추천해드려요~9', '/nemoca/images/cafe9.jpg', '혼자가기 좋은 카페 추천해드려요~내용이에요9', sysdate, 'n', 3, 'user');
insert into board values 
(10, '혼자가기 좋은 카페 추천해드려요~10', '/nemoca/images/cafe10.jpg', '혼자가기 좋은 카페 추천해드려요~내용이에요10', sysdate, 'n', 3, 'user');
insert into board values 
(11, '혼자가기 좋은 카페 추천해드려요~11', '/nemoca/images/cafe11.jpg', '혼자가기 좋은 카페 추천해드려요~내용이에요11', sysdate, 'n', 3, 'user');
select * from board;
alter table board add likes NUMBER default 0;

-- 자유게시판 좋아요!
drop table board_like;
CREATE TABLE board_like
(
 user_id   VARCHAR2(100) constraint board_like_user_id_fk references member(user_id) NOT NULL,
 b_no   NUMBER constraint board_b_no_fk references board(b_no) NOT NULL
);
select * from board_like;
insert into board_like values ('user', 2);

-- 자유게시판 댓글
drop table board_re;
CREATE TABLE board_re
(
 br_re_no NUMBER constraint board_re_board_re_no_PK PRIMARY KEY NOT NULL,
 user_id   VARCHAR2(100) constraint board_re_user_id_fk references member(user_id) NOT NULL,
 b_no   NUMBER constraint board_re_b_no_fk references board(b_no) NOT NULL,
 br_content   VARCHAR2(300) NOT NULL,
 br_ref   NUMBER NOT NULL,
 br_ref_level   NUMBER NOT NULL,
 br_ref_step   NUMBER NOT NULL,
 br_reg_date   DATE NOT NULL,
 br_del   CHAR(1) default 'n' NOT NULL
);
select * from board_re;
alter table board_re rename column board_re_no to br_re_no;
insert into board_re values(1, 'user', 1, '댓글 1이야', 1, 1, 2, sysdate, 'n');
insert into board_re values(2, 'user', 1, '댓글 1이야', 1, 1, 2, sysdate, 'n');
insert into board_re values(3, 'user', 1, '댓글 1이야', 1, 1, 2, sysdate, 'n');
insert into board_re values(4, 'user', 1, '댓글 1이야', 1, 1, 2, sysdate, 'n');


