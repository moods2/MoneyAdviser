select * from tbltrain;

select* from tbltrans;

create sequence trans_seq;

insert into tbltrans VALUES (trans_seq.nextval, '기차');
insert into tbltrans VALUES (trans_seq.nextval, '버스');

select * from tbltrainstation;
ALTER TABLE tbltrainstation
RENAME COLUMN trainstationloca TO trainstationtel;

UPDATE [테이블] SET [열] = '변경할값' WHERE [조건]
update tbltrain set traincode = 10 where train_seq=10;

alter table tbltrain add (trainendtime DATE);
update tbltrainstation set trainstation_seq = (trainstation_seq)-1 where trainstation_seq >3; 
alter table tbltrain add (traincode NUMBER);
create sequence trainstation_seq;
insert into tbltrainstation values (trainstation_seq.nextVal, '서울', '02-5646-2654');
insert into tbltrainstation values (trainstation_seq.nextVal, '영등포', '02-1266-7564');
insert into tbltrainstation values (3, '서울', '02-5646-2654');
insert into tbltrainstation values (trainstation_seq.nextVal, '안양', '031-2342-1234');
insert into tbltrainstation values (trainstation_seq.nextVal, '수원', '031-2523-2342');
insert into tbltrainstation values (trainstation_seq.nextVal, '오산', '031-2352-2353');
insert into tbltrainstation values (trainstation_seq.nextVal, '평택', '031-2341-2343');
insert into tbltrainstation values (trainstation_seq.nextVal, '천안', '043-5674-7894');
insert into tbltrainstation values (trainstation_seq.nextVal, '조치원', '043-1246-5495');
insert into tbltrainstation values (trainstation_seq.nextVal, '신탄진', '042-5543-5562');
insert into tbltrainstation values (trainstation_seq.nextVal, '대전', '042-1135-2655');
insert into tbltrainstation values (trainstation_seq.nextVal, '옥천', '041-2254-9879');
insert into tbltrainstation values (trainstation_seq.nextVal, '영동', '041-2455-6398');
insert into tbltrainstation values (trainstation_seq.nextVal, '추풍령', '051-7784-4985');
insert into tbltrainstation values (trainstation_seq.nextVal, '김천', '051-5568-7852');
insert into tbltrainstation values (trainstation_seq.nextVal, '구미', '052-4895-6556');
insert into tbltrainstation values (trainstation_seq.nextVal, '대구', '052-4588-1586');
insert into tbltrainstation values (trainstation_seq.nextVal, '동대구', '052-5456-3225');
insert into tbltrainstation values (trainstation_seq.nextVal, '밀양', '052-8576-1554');
insert into tbltrainstation values (trainstation_seq.nextVal, '신해운대', '063-1254-4556');
insert into tbltrainstation values (trainstation_seq.nextVal, '사상', '063-4844-6598');
insert into tbltrainstation values (trainstation_seq.nextVal, '부산', '063-4685-7723');



ALTER TABLE tbltrain
RENAME COLUMN traintime TO trainstarttime;

commit;
select * from tbltrain;
select train_seq as 기차번호 , traintype as 기차종류, trainstart as 출발지,to_char(TrainstartTime,'hh24:mi') as 출발시간, trainarrive as 도착지, to_char(TrainendTime,'hh24:mi') as 도착시간 from tbltrain where trainstart = '서울' order by trainstarttime;  
select to_char(TrainstartTime,'hh24:mi') from tbltrain;
 
create sequence train_seq;
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('05:56', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('11:29', 'hh24:mi'));
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('06:38', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('12:02', 'hh24:mi'));
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('07:10', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('12:36', 'hh24:mi'));
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('13:44', 'hh24:mi'));
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('15:35', 'hh24:mi'));
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('17:08', 'hh24:mi'));
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('13:16', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('19:00', 'hh24:mi'));
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('14:26', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('19:51', 'hh24:mi'));
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('15:06', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('20:40', 'hh24:mi'));
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('23:08', 'hh24:mi'));


insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('05:45', 'hh24:mi'), '15800', '부산', '서울', 1, 1, to_date('11:13', 'hh24:mi'), 11);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '서울', 1, 1, to_date('12:38', 'hh24:mi'), 12);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('07:48', 'hh24:mi'), '15800', '부산', '서울', 1, 1, to_date('13:18', 'hh24:mi'), 13);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('09:54', 'hh24:mi'), '15800', '부산', '서울', 1, 1, to_date('15:31', 'hh24:mi'), 14);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('11:52', 'hh24:mi'), '15800', '부산', '서울', 1, 1, to_date('17:02', 'hh24:mi'), 15);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('12:45', 'hh24:mi'), '15800', '부산', '서울', 1, 1, to_date('18:10', 'hh24:mi'), 16);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('13:36', 'hh24:mi'), '15800', '부산', '서울', 1, 1, to_date('19:05', 'hh24:mi'), 17);
------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------시간 업데이트!!!!!!! 하세요 ------------------------------------------------------------------------------
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('14:05', 'hh24:mi'), '15800', '부산', '서울', 1, 1, to_date('19:36', 'hh24:mi'), 18);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '서울', 1, 1, to_date('18:02', 'hh24:mi'), 19);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '서울', 1, 1, to_date('19:02', 'hh24:mi'), 20);
------------------------------------------------------------------------------------------------------------------------------------------------------------
update 

update tbltrain set train_seq = (train_seq)-10 where train_seq >11; 


insert into tbltrain values (21, 'KTX', to_date('05:15', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('07:51', 'hh24:mi'), 21);

insert into tbltrain values (22, 'KTX', to_date('05:15', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('07:51', 'hh24:mi'), 22);
insert into tbltrain values (23, 'KTX', to_date('06:00', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('08:37', 'hh24:mi'), 23);
insert into tbltrain values (24, 'KTX', to_date('07:00', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('09:40', 'hh24:mi'), 24);
insert into tbltrain values (25, 'KTX', to_date('08:00', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('10:43', 'hh24:mi'), 25);
insert into tbltrain values (26, 'KTX', to_date('09:45', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('12:49', 'hh24:mi'), 26);
insert into tbltrain values (27, 'KTX', to_date('10:17', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('13:34', 'hh24:mi'), 27);
insert into tbltrain values (28, 'KTX', to_date('12:00', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('14:42', 'hh24:mi'), 28);
insert into tbltrain values (29, 'KTX', to_date('13:05', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('16:13', 'hh24:mi'), 29);
insert into tbltrain values (30, 'KTX', to_date('14:00', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('16:27', 'hh24:mi'), 30);



insert into tbltrain values (31, 'KTX', to_date('05:15', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('07:51', 'hh24:mi'), 31);
insert into tbltrain values (32, 'KTX', to_date('05:15', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('07:51', 'hh24:mi'), 32);
insert into tbltrain values (33, 'KTX', to_date('06:00', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('08:37', 'hh24:mi'), 33);
insert into tbltrain values (34, 'KTX', to_date('07:00', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('09:40', 'hh24:mi'), 34);
insert into tbltrain values (35, 'KTX', to_date('08:00', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('10:43', 'hh24:mi'), 35);
insert into tbltrain values (36, 'KTX', to_date('09:45', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('12:49', 'hh24:mi'), 36);
insert into tbltrain values (37, 'KTX', to_date('10:17', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('13:34', 'hh24:mi'), 37);
insert into tbltrain values (38, 'KTX', to_date('12:00', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('14:42', 'hh24:mi'), 38);
insert into tbltrain values (39, 'KTX', to_date('13:05', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('16:13', 'hh24:mi'), 39);
insert into tbltrain values (40, 'KTX', to_date('14:00', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('16:27', 'hh24:mi'), 40);





commit;


insert into tbltrain values (41, 'ITX-새마을', to_date('06:16', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('10:58', 'hh24:mi'), 41);
insert into tbltrain values (42, 'ITX-새마을', to_date('09:16', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('13:56', 'hh24:mi'), 42);
insert into tbltrain values (43, 'ITX-새마을', to_date('11:05', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('15:47', 'hh24:mi'), 43);
insert into tbltrain values (44, 'ITX-새마을', to_date('11:45', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('16:33', 'hh24:mi'), 44);
insert into tbltrain values (45, 'ITX-새마을', to_date('14:03', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('18:46', 'hh24:mi'), 45);
insert into tbltrain values (46, 'ITX-새마을', to_date('15:55', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('20:26', 'hh24:mi'), 46);
insert into tbltrain values (47, 'ITX-새마을', to_date('20:25', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('00:59', 'hh24:mi'), 47);


insert into tbltrain values (48, 'ITX-새마을', to_date('06:16', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('10:58', 'hh24:mi'), 48);
insert into tbltrain values (49, 'ITX-새마을', to_date('09:16', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('13:56', 'hh24:mi'), 49);
insert into tbltrain values (50, 'ITX-새마을', to_date('11:05', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('15:47', 'hh24:mi'), 50);
insert into tbltrain values (51, 'ITX-새마을', to_date('11:45', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('16:33', 'hh24:mi'), 51);
insert into tbltrain values (52, 'ITX-새마을', to_date('14:03', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('18:46', 'hh24:mi'), 52);
insert into tbltrain values (53, 'ITX-새마을', to_date('15:55', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('20:26', 'hh24:mi'), 53);
insert into tbltrain values (54, 'ITX-새마을', to_date('20:25', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('00:59', 'hh24:mi'), 54);


