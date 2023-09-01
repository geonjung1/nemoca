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
 del   CHAR(1) default 'n' NOT NULL,
 del_date   DATE NULL
);
select * from member;
insert into member values ('master', '관리자', '관리자_닉', 'master@master.com', '010-1111-1111', 1234, 'profile.png', 'address', 1, 'm', sysdate, 'n', sysdate);
insert into member values ('user', '사용자', '사용자_닉', 'user@user.com', '010-2222-2222', 1234, 'profile.png', 'address', 1, 'm', sysdate, 'n', sysdate);

-- 카페
drop table cafe;
CREATE TABLE CAFE
(
 c_no   NUMBER CONSTRAINT cafe_c_no_PK PRIMARY KEY NOT NULL,
 c_type VARCHAR2(100) NOT NULL,
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

insert all into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (1,'dessert','일월십일','서울 양천구 목동 중앙남로9길 41 1층','목동 730-18','목동','070-4215-0110','4500원 ~ 13500원','10:00 ~ 23:00','janten1.jpg','janten2.jpg','janten3.jpg','janten4.jpg','janten5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (2,'dessert','디어다온','서울 마포구 연희로1길 28 101호','동교동 113-29','연남동','0507-1334-9138','5000원 ~ 6500원','11:00 ~ 20:00','dear1.jpg','dear2.jpg','dear3.jpg','dear4.jpg','dear5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (3,'dessert','고래당','서울 중랑구 면목로49길 70 1층','면목동 576-20','면목동','010-6546-0661','2500원 ~ 4000원','11:00 ~ 17:00','whale1.jpg','whale2.jpg','whale3.jpg','whale4.jpg','whale5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (4,'dessert','크랙커피','서울 성북구 보문로23길 7  1층',' 보문동5가 2','보문동','0507-1324-7794','4000원 ~ 5000원','11:00 ~ 21:00','krack1.jpg','krack2.jpg','krack3.jpg','krack4.jpg','krack5.jpg',sysdate,'n',sysdate,0,'master')
into cafe (c_no, c_type, c_name, c_addr, c_addr_new, c_loc, c_tel, c_price, c_optime, c_img1, c_img2, c_img3, c_menu1, c_menu2, c_join_date, c_del, c_del_date, c_readcount, user_id) values
    (5,'dessert','쿰배오','서울 강동구 명일로26길 12 1층','길동 83-4','성내동','0507-1406-5280','3000원 ~ 12400원','11:00 ~ 22:00','cum1.jpg','cum2.jpg','cum3.jpg','cum4.jpg','cum5.jpg',sysdate,'n',sysdate,0,'master')
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
select * from cafe_like;

-- 카페 리뷰
DROP TABLE CAFE_RE;
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
alter table board drop column likes;

-- 자유게시판 좋아요!
drop table board_like;
CREATE TABLE board_like
(
 user_id   VARCHAR2(100) constraint board_like_user_id_fk references member(user_id) NOT NULL,
 b_no   NUMBER constraint board_b_no_fk references board(b_no) NOT NULL
);
select * from board_like;

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
select * from member;

		SELECT CAFE.*
		     , NVL((
		             SELECT COUNT(1)
		               FROM CAFE_RE
		              WHERE C_NO = CAFE.C_NO
		                AND C_DEL = 'N'
		           ),0) AS c_replycount
		  FROM CAFE
		 WHERE C_NO = c_no
		 ORDER BY C_NO;
		 		 
SELECT a.*
		  FROM (
		         SELECT C.*
		              , RANK() OVER(ORDER BY C.LIKE_COUNT DESC, C.C_NAME) AS CAFE_LIKE_RANK
		           FROM (
		                  SELECT C_NO
		                       , C_NAME
		                       , C_ADDR
		                       , C_LOC
		                       , C_TEL
		                       , C_IMG1
		                       , C_IMG2
		                       , C_IMG3
		                       , C_MENU1
		                       , C_MENU2
		                       , C_MENU3
		                       , C_JOIN_DATE
		                       , C_DEL
		                       , C_DEL_DATE
		                       , C_READCOUNT
		                       , USER_ID
		                       , NVL((
		                               SELECT COUNT(1)
		                                 FROM CAFE_LIKE
		                                WHERE C_NO = CAFE.C_NO
		                             ),0) AS LIKE_COUNT
		                    FROM CAFE
		                ) C
		       ) a
		 WHERE a.CAFE_LIKE_RANK <= 10
		 ORDER BY a.LIKE_COUNT DESC, a.C_NAME;
		 
UPDATE CAFE
		   SET c_readcount = c_readcount + 1
		 WHERE C_NO = c_no;

select * from cafe where user_id = 'user';

INSERT INTO cafe_like
		(USER_ID, C_NO)
		VALUES(#{user_id}, #{c_no});
