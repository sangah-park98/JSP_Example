
  CREATE TABLE "TJOEUNIT"."FREEBOARD" 
   (	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"NAME" CHAR(20 BYTE) NOT NULL ENABLE, 
	"PASSWORD" CHAR(20 BYTE) NOT NULL ENABLE, 
	"SUBJECT" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(3000 BYTE) NOT NULL ENABLE, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"HIT" NUMBER(*,0) DEFAULT 0, 
	"NOTICE" CHAR(3 BYTE) DEFAULT 'NO', 
	"IP" CHAR(15 BYTE), 
	 CONSTRAINT "FREEBOARD_PK" PRIMARY KEY ("IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
  
-- 시퀀스 초기화 방법
-- 모든 데이터를 제거하고 시퀀스를 다시 만든다.
delete from freeboard;
drop sequence freeboard_idx_seq;
-- 자동으로 1씩 증가하는 시퀀스 만들기 (테이블이름_필드이름_seq)
create sequence freeboard_idx_seq;


delete from freeboardcomment;
drop sequence freeboardcomment_idx_seq;
create sequence freeboardcomment_idx_seq;

select * from freeboard order by idx desc;
select count(*) from freeboard;
select * from freeboard where notice = 'YES' order by idx desc;

insert into freeboard (idx, name, password, subject, content, notice, ip) 
values (freeboard_idx_seq.nextval, '박상아', '1111', '1등', '1등 입니다.', 'NO', '192.168.100.101');
insert into freeboard (idx, name, password, subject, content, notice, ip) 
values (freeboard_idx_seq.nextval, '남수연', '2222', '2등', '2등 입니다.', 'NO', '192.168.100.102');
insert into freeboard (idx, name, password, subject, content, notice, ip) 
values (freeboard_idx_seq.nextval, '김유진', '3333', '3등', '3등 입니다.', 'NO', '192.168.100.103');
insert into freeboard (idx, name, password, subject, content, notice, ip) 
values (freeboard_idx_seq.nextval, '이하영', '4444', '4등', '4등 입니다.', 'NO', '192.168.100.104');
insert into freeboard (idx, name, password, subject, content, notice, ip) 
values (freeboard_idx_seq.nextval, '강소은', '5555', '5등', '5등 입니다.', 'NO', '192.168.100.105');

insert into freeboard (idx, name, password, subject, content, notice, ip) 
values (freeboard_idx_seq.nextval, '강소은', '5555', '5등', '5등 입니다.', 'YES', '192.168.100.105');

commit;








