drop table board;
CREATE TABLE board
(
 b_no   NUMBER constraint board_b_no_PK PRIMARY KEY NOT NULL,
 b_writer   VARCHAR2(20) NOT NULL,
 b_subject   VARCHAR2(50) NOT NULL,
 b_img1   VARCHAR2(200) NOT NULL,
 b_img2   VARCHAR2(200),
 b_img3   VARCHAR2(200),
 b_content   VARCHAR2(500) NOT NULL,
 b_pass   VARCHAR2(100) NOT NULL,
 b_reg_date   DATE NOT NULL,
 b_del   CHAR(1) default 'n' NOT NULL,
 b_readcount   NUMBER NOT NULL,
 user_id   VARCHAR2(100) constraint board_User_ID_fk references member(user_id) NOT NULL
);
select * from board;

