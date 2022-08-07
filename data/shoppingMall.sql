<<<<<<< HEAD
CREATE USER shop IDENTIFIED BY a123
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO shop;

DROP TABLE BOARDS PURGE;
DROP TABLE DELIVERY PURGE;
DROP TABLE ORDERS PURGE;
DROP TABLE PRODUCT PURGE;
DROP TABLE MEMBER PURGE;

CREATE TABLE MEMBER (
	USERID VARCHAR2(20),
	USERPWD VARCHAR2(20),
	USERNAME VARCHAR2(20),
	USERGENDER VARCHAR2(20),
	USERBIRTH DATE,
	USERADDR VARCHAR2(1000),
	USEREMAIL VARCHAR2(50),
	USERTEL CHAR(11),
	CONSTRAINT PK_MEMBER_USERID PRIMARY KEY (USERID));

CREATE TABLE PRODUCT (
	PRODUCTNUM NUMBER(10),
	PRODUCTNAME VARCHAR2(50),
	PRODUCTPRICE NUMBER,
	PRODUCTCATEGORY VARCHAR2(20),
	SAVEFILENAME VARCHAR2(2000),
	ORIGINALFILENAME VARCHAR2(2000),
	PRODUCTCOLOR VARCHAR2(100),
	PRODUCTSIZE VARCHAR2(100),
	CONSTRAINT PK_PRODUCT_PRODUCTNUM PRIMARY KEY (PRODUCTNUM));

CREATE TABLE ORDERS (
	ORDERNUM NUMBER,
	USERID VARCHAR2(20),
	PRODUCTNUM NUMBER(10),
	ORDERQUANTITY NUMBER(5),
    ORDERCOLOR VARCHAR2(20),
    ORDERSIZE VARCHAR2(20),
    UPDATEDDATE DATE,
	PROGRESS VARCHAR2(20),
	CONSTRAINT PK_ORDERS_ORDERNUM PRIMARY KEY (ORDERNUM),
	CONSTRAINT FK_ORDERS_USERID FOREIGN KEY (USERID) REFERENCES MEMBER(USERID),
	CONSTRAINT FK_ORDERS_PRODUCTNUM FOREIGN KEY (PRODUCTNUM) REFERENCES PRODUCT(PRODUCTNUM));

CREATE TABLE DELIVERY (
    DELIVERYNUM NUMBER,
    USERID VARCHAR2(20),
    ORDERNUM VARCHAR2(100),
    DELIVERYNAME VARCHAR2(20),
    DELIVERYTEL CHAR(11),
    DELIVERYADDR VARCHAR2(1000),
    DELIVERYEMAIL VARCHAR2(50),
    TOTALPRICE NUMBER,
    DELIVERYDATE DATE,
    ARRIVEDATE DATE,
    PROGRESS VARCHAR2(20),
	CONSTRAINT PK_DELIVERY_DELIVERYNUM PRIMARY KEY (DELIVERYNUM),
	CONSTRAINT FK_DELIVERY_USERID FOREIGN KEY (USERID) REFERENCES MEMBER(USERID));

CREATE TABLE BOARDS (
	BOARDNUM NUMBER,

	USERID VARCHAR2(20),
	PRODUCTNUM NUMBER(10),
	SUBJECT VARCHAR2(100),
	CONTENT VARCHAR2(1024),
	POSTDATE DATE,
	COMMUNITY VARCHAR2(20),
	HITCOUNT NUMBER,
	CONSTRAINT PK_BOARD_BOARDNUM PRIMARY KEY (BOARDNUM),
	CONSTRAINT FK_BOARD_USERID FOREIGN KEY (USERID) REFERENCES MEMBER(USERID),
	CONSTRAINT FK_BOARD_PRODUCTNUM FOREIGN KEY (PRODUCTNUM) REFERENCES PRODUCT(PRODUCTNUM));

INSERT INTO MEMBER VALUES('kristal','asd','kristal','F','1993/02/14','¼­¿ï½Ã °­³²±¸ Ã»´ãµ¿ 129 PH129','kristal@naver.com','01055861420');
INSERT INTO MEMBER VALUES('yun','asd','yun','M','95/04/01','¼­¿ï °­³²±¸ Å×Çì¶õ·Î 124,4Ãþ,(¿ª»ïµ¿)','yun@naver.com','01020893971');
INSERT INTO MEMBER VALUES('hong','asd','hong','M','90/01/01','¼­¿ï½Ã °­³²±¸ Ã»´ãµ¿ 134-38','hong@naver.com','01068755530');
INSERT INTO MEMBER VALUES('chang','asd','chang','M','88/07/07','¼­¿ï½Ã °­³²±¸ °³Æ÷µ¿ 1282','chang@naver.com','01041643687');
INSERT INTO MEMBER VALUES('asd','asd','asdName','M',SYSDATE,'06234,¼­¿ï °­³²±¸ Å×Çì¶õ·Î 124,4Ãþ,(¿ª»ïµ¿)','asd@asd.asd','01012341234');
INSERT INTO MEMBER VALUES('qwe','qwe','qweName','M',SYSDATE,'11111,¼­¿ï ¿ª»ï,4Ãþ,(¿ª»ïµ¿)','qwe@qwe.qwe','01012341234');

INSERT INTO PRODUCT VALUES(1,'asd',10000,'top','57988870f76b16530cf26541774dc56b.jpg,8f5e9783383425af4f201e0fedb8ae9e.jpg',
                            '57988870f76b16530cf26541774dc56b.jpg,8f5e9783383425af4f201e0fedb8ae9e.jpg','red','L');
INSERT INTO PRODUCT VALUES(2,'qwe',20000,'top','80a486b82e7f26dfd48632d43f9ea8e7.jpg,d4acbb7373d136090149204d6305d2bf.jpg',
                            '80a486b82e7f26dfd48632d43f9ea8e7.jpg,d4acbb7373d136090149204d6305d2bf.jpg','red','M');
INSERT INTO PRODUCT VALUES(3,'zxc',30000,'top','97a083e98b97bf231eb081b614e312a9.jpg,f4abcc5266199d51e189638fa41405a2.jpg',
                            '97a083e98b97bf231eb081b614e312a9.jpg,f4abcc5266199d51e189638fa41405a2.jpg','red','L');
INSERT INTO ORDERS VALUES(1,'yun',1,2,'red','L','2022/08/01','cartList');
INSERT INTO ORDERS VALUES(2,'yun',2,3,'red','L','2022/08/02','wishList');
INSERT INTO ORDERS VALUES(3,'hong',1,1,'red','L','2022/08/03','cartList');
INSERT INTO ORDERS VALUES(4,'hong',2,2,'red','L','2022/08/04','wishList');
INSERT INTO ORDERS VALUES(5,'chang',1,3,'red','L','2022/08/05','cartList');
INSERT INTO ORDERS VALUES(6,'chang',2,4,'red','L','2022/08/06','wishList');


INSERT INTO BOARDS VALUES(1,'kristal',1,'°í°´ º¸»ó Áö¿ø Á¦µµ ½ÃÇà ¾È³»','°í°´ º¸»ó Áö¿ø Á¦µµ ½ÃÇà ¾È³»','2022/08/01','NOTICE',0);

INSERT INTO BOARDS VALUES(2,'kristal',2,'»óÀÇ ÀÏºÎ »óÇ°ÀÇ ±ÇÀå ¼ÒºñÀÚ °¡°ÝÀÌ º¯°æµÊÀ» ¾È³»µå¸³´Ï´Ù.','»óÀÇ ÀÏºÎ »óÇ°ÀÇ ±ÇÀå ¼ÒºñÀÚ °¡°ÝÀÌ º¯°æµÊÀ» ¾È³»µå¸³´Ï´Ù.','2022/08/03','NOTICE',0);

INSERT INTO BOARDS VALUES(3,'kristal',3,'ÀÎÅÍ³Ý ÀÍ½ºÇÃ·Î·¯(IE) Áö¿ø Á¾·á ¾È³»','Ä£±¸ ¹× ÂÊÁö ¼­ºñ½º Á¾·á ¾È³»','2022/09/01','NOTICE',0);

INSERT INTO BOARDS VALUES(4,'kristal',1,'Ä£±¸ ¹× ÂÊÁö ¼­ºñ½º Á¾·á ¾È³»','Ä£±¸ ¹× ÂÊÁö ¼­ºñ½º Á¾·á ¾È³»','2022/09/20','NOTICE',0);

INSERT INTO BOARDS VALUES(5,'kristal',2,'´ë¸®±¸¸Å ÀÌ¿ë ÀÚÁ¦¸¦ ´çºÎµå¸³´Ï´Ù.','´ë¸®±¸¸Å ÀÌ¿ë ÀÚÁ¦¸¦ ´çºÎµå¸³´Ï´Ù.','2022/10/11','NOTICE',0);

INSERT INTO BOARDS VALUES(6,'kristal',3,'5³âÀÌ»ó ¹Ì »ç¿ë Àû¸³±Ý ¼Ò¸ê °ü·Ã °øÁö»çÇ×ÀÔ´Ï´Ù.','5³âÀÌ»ó ¹Ì »ç¿ë Àû¸³±Ý ¼Ò¸ê °ü·Ã °øÁö»çÇ×ÀÔ´Ï´Ù.','2022/11/27','NOTICE',0);

INSERT INTO BOARDS VALUES(7,'kristal',1,'[»ç°ú¹®] ÈÄ¼Ó Á¶Ä¡¿¡ ´ëÇØ ¸»¾¸µå¸³´Ï´Ù.','[»ç°ú¹®] ÈÄ¼Ó Á¶Ä¡¿¡ ´ëÇØ ¸»¾¸µå¸³´Ï´Ù.','2022/08/01','NOTICE',0);

INSERT INTO BOARDS VALUES(8,'kristal',2,'Àå¹Ù±¸´Ï »óÇ° º¸°ü Á¤Ã¥ º¯°æ ¾È³»','Àå¹Ù±¸´Ï »óÇ° º¸°ü Á¤Ã¥ º¯°æ ¾È³»','2022/12/25','NOTICE',0);


INSERT INTO BOARDS VALUES(9,'yun',1,'»óÇ°¹®ÀÇ','»óÇ°¹®ÀÇ','2022/08/01','QnA',0);
INSERT INTO BOARDS VALUES(10,'yun',2,'È¯ºÒ¹®ÀÇ','È¯ºÒ¹®ÀÇ','2022/08/02','QnA',0);
INSERT INTO BOARDS VALUES(11,'yun',3,'°áÁ¦¹®ÀÇ','°áÁ¦¹®ÀÇ','2022/08/03','QnA',0);
INSERT INTO BOARDS VALUES(12,'hong',1,'»óÇ°¹®ÀÇ','»óÇ°¹®ÀÇ','2022/08/04','QnA',0);
INSERT INTO BOARDS VALUES(13,'hong',2,'È¯ºÒ¹®ÀÇ','È¯ºÒ¹®ÀÇ','2022/08/05','QnA',0);
INSERT INTO BOARDS VALUES(14,'hong',3,'°áÁ¦¹®ÀÇ','°áÁ¦¹®ÀÇ','2022/08/06','QnA',0);
INSERT INTO BOARDS VALUES(15,'chang',1,'»óÇ°¹®ÀÇ','»óÇ°¹®ÀÇ','2022/08/07','QnA',0);
INSERT INTO BOARDS VALUES(16,'chang',2,'°áÁ¦¹®ÀÇ','°áÁ¦¹®ÀÇ','2022/08/08','QnA',0);


INSERT INTO BOARDS VALUES(17,'yun',1,'Á¤¸» ÀÌ»µ¿ä','Á¤¸» ÀÌ»µ¿ä','2022/08/01','REVIEW',0);
INSERT INTO BOARDS VALUES(18,'yun',2,'´ë¹Ú','´ë¹Ú','2022/08/02','REVIEW',0);
INSERT INTO BOARDS VALUES(19,'yun',3,'ÀÇ»ó ÀÎÁõ','ÀÎÁõÇÕ´Ï´Ù','2022/08/03','REVIEW',0);
INSERT INTO BOARDS VALUES(20,'hong',1,'¶Ç »ç°í½Í¾î¿ä','»çÀÌÁî Àû´çÈ÷ Àß ¸Â´Â°Å °°¾Æ¿ä','2022/08/04','REVIEW',0);
INSERT INTO BOARDS VALUES(21,'hong',2,'¶Ç ÀÌ¿ëÇÒ°Ô¿ä','°¨»çÇÕ´Ï´Ù','2022/08/05','REVIEW',0);
INSERT INTO BOARDS VALUES(22,'hong',3,'ÀÎÁõ¼¦','Á¤¸» ÀÌ»µ¿ä','2022/08/06','REVIEW',0);
INSERT INTO BOARDS VALUES(23,'chang',1,'Á¤¸» ¸ÚÁ®¿ä','¶Ç»ç°í½Í¾î¿ä','2022/08/07','REVIEW',0);
INSERT INTO BOARDS VALUES(24,'chang',2,'Âø¼¦','¶Ç»ì°Ô¿ä','2022/08/08','REVIEW',0);                            

INSERT INTO ORDERS VALUES(1,'asd',1,5,'red','L',SYSDATE,'cartList');
INSERT INTO ORDERS VALUES(2,'asd',1,5,'red','L',SYSDATE,'cartList');
INSERT INTO ORDERS VALUES(3,'asd',3,5,'red','L',SYSDATE,'cartList');
INSERT INTO ORDERS VALUES(4,'asd',2,3,'red','L',SYSDATE,'cartList');
INSERT INTO ORDERS VALUES(5,'asd',3,7,'red','L',SYSDATE,'cartList');

=======
CREATE USER shop IDENTIFIED BY a123
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO shop;

DROP TABLE BOARDS PURGE;
DROP TABLE DELIVERY PURGE;
DROP TABLE ORDERS PURGE;
DROP TABLE PRODUCT PURGE;
DROP TABLE MEMBER PURGE;

CREATE TABLE MEMBER (
	USERID VARCHAR2(20),
	USERPWD VARCHAR2(20),
	USERNAME VARCHAR2(20),
	USERGENDER VARCHAR2(20),
	USERBIRTH DATE,
	USERADDR VARCHAR2(1000),
	USEREMAIL VARCHAR2(50),
	USERTEL CHAR(11),
	CONSTRAINT PK_MEMBER_USERID PRIMARY KEY (USERID));

CREATE TABLE PRODUCT (
	PRODUCTNUM NUMBER(10),
	PRODUCTNAME VARCHAR2(50),
	PRODUCTPRICE NUMBER,
	PRODUCTCATEGORY VARCHAR2(20),
	SAVEFILENAME VARCHAR2(2000),
	ORIGINALFILENAME VARCHAR2(2000),
	PRODUCTCOLOR VARCHAR2(100),
	PRODUCTSIZE VARCHAR2(100),
	CONSTRAINT PK_PRODUCT_PRODUCTNUM PRIMARY KEY (PRODUCTNUM));

CREATE TABLE ORDERS (
	ORDERNUM NUMBER,
	USERID VARCHAR2(20),
	PRODUCTNUM NUMBER(10),
	ORDERQUANTITY NUMBER(5),
    ORDERCOLOR VARCHAR2(20),
    ORDERSIZE VARCHAR2(20),
    UPDATEDDATE DATE,
	PROGRESS VARCHAR2(20),
	CONSTRAINT PK_ORDERS_ORDERNUM PRIMARY KEY (ORDERNUM),
	CONSTRAINT FK_ORDERS_USERID FOREIGN KEY (USERID) REFERENCES MEMBER(USERID),
	CONSTRAINT FK_ORDERS_PRODUCTNUM FOREIGN KEY (PRODUCTNUM) REFERENCES PRODUCT(PRODUCTNUM));

CREATE TABLE DELIVERY (
    DELIVERYNUM NUMBER,
    USERID VARCHAR2(20),
    ORDERNUM VARCHAR2(100),
    DELIVERYNAME VARCHAR2(20),
    DELIVERYTEL CHAR(11),
    DELIVERYADDR VARCHAR2(1000),
    DELIVERYEMAIL VARCHAR2(50),
    TOTALPRICE NUMBER,
    DELIVERYDATE DATE,
    ARRIVEDATE DATE,
    PROGRESS VARCHAR2(20),
	CONSTRAINT PK_DELIVERY_DELIVERYNUM PRIMARY KEY (DELIVERYNUM),
	CONSTRAINT FK_DELIVERY_USERID FOREIGN KEY (USERID) REFERENCES MEMBER(USERID));

CREATE TABLE BOARDS (
	BOARDNUM NUMBER,

	USERID VARCHAR2(20),
	PRODUCTNUM NUMBER(10),
	SUBJECT VARCHAR2(100),
	CONTENT VARCHAR2(1024),
	POSTDATE DATE,
	COMMUNITY VARCHAR2(20),
	HITCOUNT NUMBER,
	CONSTRAINT PK_BOARD_BOARDNUM PRIMARY KEY (BOARDNUM),
	CONSTRAINT FK_BOARD_USERID FOREIGN KEY (USERID) REFERENCES MEMBER(USERID),
	CONSTRAINT FK_BOARD_PRODUCTNUM FOREIGN KEY (PRODUCTNUM) REFERENCES PRODUCT(PRODUCTNUM));

INSERT INTO MEMBER VALUES('kristal','asd','kristal','F','1993/02/14','ì„œìš¸ì‹œ ê°•ë‚¨êµ¬ ì²­ë‹´ë™ 129 PH129','kristal@naver.com','01055861420');
INSERT INTO MEMBER VALUES('yun','asd','yun','M','95/04/01','ì„œìš¸ ê°•ë‚¨êµ¬ í…Œí—¤ëž€ë¡œ 124,4ì¸µ,(ì—­ì‚¼ë™)','yun@naver.com','01020893971');
INSERT INTO MEMBER VALUES('hong','asd','hong','M','90/01/01','ì„œìš¸ì‹œ ê°•ë‚¨êµ¬ ì²­ë‹´ë™ 134-38','hong@naver.com','01068755530');
INSERT INTO MEMBER VALUES('chang','asd','chang','M','88/07/07','ì„œìš¸ì‹œ ê°•ë‚¨êµ¬ ê°œí¬ë™ 1282','chang@naver.com','01041643687');
INSERT INTO MEMBER VALUES('asd','asd','asdName','M',SYSDATE,'06234,ì„œìš¸ ê°•ë‚¨êµ¬ í…Œí—¤ëž€ë¡œ 124,4ì¸µ,(ì—­ì‚¼ë™)','asd@asd.asd','01012341234');
INSERT INTO MEMBER VALUES('qwe','qwe','qweName','M',SYSDATE,'11111,ì„œìš¸ ì—­ì‚¼,4ì¸µ,(ì—­ì‚¼ë™)','qwe@qwe.qwe','01012341234');

INSERT INTO PRODUCT VALUES(1,'asd',10000,'top','57988870f76b16530cf26541774dc56b.jpg,8f5e9783383425af4f201e0fedb8ae9e.jpg',
                            '57988870f76b16530cf26541774dc56b.jpg,8f5e9783383425af4f201e0fedb8ae9e.jpg','red','L');
INSERT INTO PRODUCT VALUES(2,'qwe',20000,'top','80a486b82e7f26dfd48632d43f9ea8e7.jpg,d4acbb7373d136090149204d6305d2bf.jpg',
                            '80a486b82e7f26dfd48632d43f9ea8e7.jpg,d4acbb7373d136090149204d6305d2bf.jpg','red','M');
INSERT INTO PRODUCT VALUES(3,'zxc',30000,'top','97a083e98b97bf231eb081b614e312a9.jpg,f4abcc5266199d51e189638fa41405a2.jpg',
                            '97a083e98b97bf231eb081b614e312a9.jpg,f4abcc5266199d51e189638fa41405a2.jpg','red','L');
INSERT INTO ORDERS VALUES(1,'yun',1,2,'red','L','2022/08/01','cartList');
INSERT INTO ORDERS VALUES(2,'yun',2,3,'red','L','2022/08/02','wishList');
INSERT INTO ORDERS VALUES(3,'hong',1,1,'red','L','2022/08/03','cartList');
INSERT INTO ORDERS VALUES(4,'hong',2,2,'red','L','2022/08/04','wishList');
INSERT INTO ORDERS VALUES(5,'chang',1,3,'red','L','2022/08/05','cartList');
INSERT INTO ORDERS VALUES(6,'chang',2,4,'red','L','2022/08/06','wishList');


INSERT INTO BOARDS VALUES(1,'kristal',1,'ê³ ê° ë³´ìƒ ì§€ì› ì œë„ ì‹œí–‰ ì•ˆë‚´','ê³ ê° ë³´ìƒ ì§€ì› ì œë„ ì‹œí–‰ ì•ˆë‚´','2022/08/01','NOTICE',0);

INSERT INTO BOARDS VALUES(2,'kristal',2,'ìƒì˜ ì¼ë¶€ ìƒí’ˆì˜ ê¶Œìž¥ ì†Œë¹„ìž ê°€ê²©ì´ ë³€ê²½ë¨ì„ ì•ˆë‚´ë“œë¦½ë‹ˆë‹¤.','ìƒì˜ ì¼ë¶€ ìƒí’ˆì˜ ê¶Œìž¥ ì†Œë¹„ìž ê°€ê²©ì´ ë³€ê²½ë¨ì„ ì•ˆë‚´ë“œë¦½ë‹ˆë‹¤.','2022/08/03','NOTICE',0);

INSERT INTO BOARDS VALUES(3,'kristal',3,'ì¸í„°ë„· ìµìŠ¤í”Œë¡œëŸ¬(IE) ì§€ì› ì¢…ë£Œ ì•ˆë‚´','ì¹œêµ¬ ë° ìª½ì§€ ì„œë¹„ìŠ¤ ì¢…ë£Œ ì•ˆë‚´','2022/09/01','NOTICE',0);

INSERT INTO BOARDS VALUES(4,'kristal',1,'ì¹œêµ¬ ë° ìª½ì§€ ì„œë¹„ìŠ¤ ì¢…ë£Œ ì•ˆë‚´','ì¹œêµ¬ ë° ìª½ì§€ ì„œë¹„ìŠ¤ ì¢…ë£Œ ì•ˆë‚´','2022/09/20','NOTICE',0);

INSERT INTO BOARDS VALUES(5,'kristal',2,'ëŒ€ë¦¬êµ¬ë§¤ ì´ìš© ìžì œë¥¼ ë‹¹ë¶€ë“œë¦½ë‹ˆë‹¤.','ëŒ€ë¦¬êµ¬ë§¤ ì´ìš© ìžì œë¥¼ ë‹¹ë¶€ë“œë¦½ë‹ˆë‹¤.','2022/10/11','NOTICE',0);

INSERT INTO BOARDS VALUES(6,'kristal',3,'5ë…„ì´ìƒ ë¯¸ ì‚¬ìš© ì ë¦½ê¸ˆ ì†Œë©¸ ê´€ë ¨ ê³µì§€ì‚¬í•­ìž…ë‹ˆë‹¤.','5ë…„ì´ìƒ ë¯¸ ì‚¬ìš© ì ë¦½ê¸ˆ ì†Œë©¸ ê´€ë ¨ ê³µì§€ì‚¬í•­ìž…ë‹ˆë‹¤.','2022/11/27','NOTICE',0);

INSERT INTO BOARDS VALUES(7,'kristal',1,'[ì‚¬ê³¼ë¬¸] í›„ì† ì¡°ì¹˜ì— ëŒ€í•´ ë§ì”€ë“œë¦½ë‹ˆë‹¤.','[ì‚¬ê³¼ë¬¸] í›„ì† ì¡°ì¹˜ì— ëŒ€í•´ ë§ì”€ë“œë¦½ë‹ˆë‹¤.','2022/08/01','NOTICE',0);

INSERT INTO BOARDS VALUES(8,'kristal',2,'ìž¥ë°”êµ¬ë‹ˆ ìƒí’ˆ ë³´ê´€ ì •ì±… ë³€ê²½ ì•ˆë‚´','ìž¥ë°”êµ¬ë‹ˆ ìƒí’ˆ ë³´ê´€ ì •ì±… ë³€ê²½ ì•ˆë‚´','2022/12/25','NOTICE',0);


INSERT INTO BOARDS VALUES(9,'yun',1,'ìƒí’ˆë¬¸ì˜','ìƒí’ˆë¬¸ì˜','2022/08/01','QnA',0);
INSERT INTO BOARDS VALUES(10,'yun',2,'í™˜ë¶ˆë¬¸ì˜','í™˜ë¶ˆë¬¸ì˜','2022/08/02','QnA',0);
INSERT INTO BOARDS VALUES(11,'yun',3,'ê²°ì œë¬¸ì˜','ê²°ì œë¬¸ì˜','2022/08/03','QnA',0);
INSERT INTO BOARDS VALUES(12,'hong',1,'ìƒí’ˆë¬¸ì˜','ìƒí’ˆë¬¸ì˜','2022/08/04','QnA',0);
INSERT INTO BOARDS VALUES(13,'hong',2,'í™˜ë¶ˆë¬¸ì˜','í™˜ë¶ˆë¬¸ì˜','2022/08/05','QnA',0);
INSERT INTO BOARDS VALUES(14,'hong',3,'ê²°ì œë¬¸ì˜','ê²°ì œë¬¸ì˜','2022/08/06','QnA',0);
INSERT INTO BOARDS VALUES(15,'chang',1,'ìƒí’ˆë¬¸ì˜','ìƒí’ˆë¬¸ì˜','2022/08/07','QnA',0);
INSERT INTO BOARDS VALUES(16,'chang',2,'ê²°ì œë¬¸ì˜','ê²°ì œë¬¸ì˜','2022/08/08','QnA',0);


INSERT INTO BOARDS VALUES(17,'yun',1,'ì •ë§ ì´ë»ìš”','ì •ë§ ì´ë»ìš”','2022/08/01','REVIEW',0);
INSERT INTO BOARDS VALUES(18,'yun',2,'ëŒ€ë°•','ëŒ€ë°•','2022/08/02','REVIEW',0);
INSERT INTO BOARDS VALUES(19,'yun',3,'ì˜ìƒ ì¸ì¦','ì¸ì¦í•©ë‹ˆë‹¤','2022/08/03','REVIEW',0);
INSERT INTO BOARDS VALUES(20,'hong',1,'ë˜ ì‚¬ê³ ì‹¶ì–´ìš”','ì‚¬ì´ì¦ˆ ì ë‹¹ížˆ ìž˜ ë§žëŠ”ê±° ê°™ì•„ìš”','2022/08/04','REVIEW',0);
INSERT INTO BOARDS VALUES(21,'hong',2,'ë˜ ì´ìš©í• ê²Œìš”','ê°ì‚¬í•©ë‹ˆë‹¤','2022/08/05','REVIEW',0);
INSERT INTO BOARDS VALUES(22,'hong',3,'ì¸ì¦ìƒ·','ì •ë§ ì´ë»ìš”','2022/08/06','REVIEW',0);
INSERT INTO BOARDS VALUES(23,'chang',1,'ì •ë§ ë©‹ì ¸ìš”','ë˜ì‚¬ê³ ì‹¶ì–´ìš”','2022/08/07','REVIEW',0);
INSERT INTO BOARDS VALUES(24,'chang',2,'ì°©ìƒ·','ë˜ì‚´ê²Œìš”','2022/08/08','REVIEW',0);                            

INSERT INTO ORDERS VALUES(1,'asd',1,5,'red','L',SYSDATE,'cartList');
INSERT INTO ORDERS VALUES(2,'asd',1,5,'red','L',SYSDATE,'cartList');
INSERT INTO ORDERS VALUES(3,'asd',3,5,'red','L',SYSDATE,'cartList');
INSERT INTO ORDERS VALUES(4,'asd',2,3,'red','L',SYSDATE,'cartList');
INSERT INTO ORDERS VALUES(5,'asd',3,7,'red','L',SYSDATE,'cartList');

>>>>>>> branch 'HongSu' of https://github.com/s-oo/SubProject.git
commit;