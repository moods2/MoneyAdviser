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
select * from tbltrain order by train_seq;
select train_seq as 기차번호 , traintype as 기차종류, trainstart as 출발지,to_char(TrainstartTime,'hh24:mi') as 출발시간, trainarrive as 도착지, to_char(TrainendTime,'hh24:mi') as 도착시간 from tbltrain where trainstart = '서울' and traintype='무궁화' order by trainstarttime;  
select to_char(TrainstartTime,'hh24:mi') from tbltrain;
 
delete from tbltrain where traincode<40;
 commit;
create sequence train_seq;
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('05:56', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('11:29', 'hh24:mi'),1);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('06:38', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('12:02', 'hh24:mi'),2);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('07:10', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('12:36', 'hh24:mi'),3);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('13:44', 'hh24:mi'),4);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('15:35', 'hh24:mi'),5);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('17:08', 'hh24:mi'),6);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('13:16', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('19:00', 'hh24:mi'),7);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('14:26', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('19:51', 'hh24:mi'),8);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('15:06', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('20:40', 'hh24:mi'),9);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '15800', '서울', '부산', 1, 1, to_date('23:08', 'hh24:mi'),10);


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
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '서울', 1, 1, to_date('20:36', 'hh24:mi'), 19);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '서울', 1, 1, to_date('21:36', 'hh24:mi'), 20);
------------------------------------------------------------------------------------------------------------------------------------------------------------
update 

update tbltrain set train_seq = (train_seq)-10 where train_seq >11; 
delete from tbltrain;

select * from tbltrain order by train_seq;

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
insert into tbltrain values (train_seq.nextVal, 'KTX', to_date('14:00', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('16:27', 'hh24:mi'), 40);





commit;
rollback;


insert into tbltrain values (train_seq.nextVal, 'ITX-새마을', to_date('06:16', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('10:58', 'hh24:mi'), 41);
insert into tbltrain values (train_seq.nextVal, 'ITX-새마을', to_date('09:16', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('13:56', 'hh24:mi'), 42);
insert into tbltrain values (train_seq.nextVal, 'ITX-새마을', to_date('11:05', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('15:47', 'hh24:mi'), 43);
insert into tbltrain values (train_seq.nextVal, 'ITX-새마을', to_date('11:45', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('16:33', 'hh24:mi'), 44);
insert into tbltrain values (train_seq.nextVal, 'ITX-새마을', to_date('14:03', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('18:46', 'hh24:mi'), 45);
insert into tbltrain values (train_seq.nextVal, 'ITX-새마을', to_date('15:55', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('20:26', 'hh24:mi'), 46);
insert into tbltrain values (train_seq.nextVal, 'ITX-새마을', to_date('20:25', 'hh24:mi'), '49800', '서울', '부산', 1, 1, to_date('00:59', 'hh24:mi'), 47);


insert into tbltrain values (train_seq.nextVal, 'ITX-새마을', to_date('06:16', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('10:58', 'hh24:mi'), 48);
insert into tbltrain values (train_seq.nextVal, 'ITX-새마을', to_date('09:16', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('13:56', 'hh24:mi'), 49);
insert into tbltrain values (train_seq.nextVal, 'ITX-새마을', to_date('11:05', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('15:47', 'hh24:mi'), 50);
insert into tbltrain values (train_seq.nextVal, 'ITX-새마을', to_date('11:45', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('16:33', 'hh24:mi'), 51);
insert into tbltrain values (train_seq.nextVal, 'ITX-새마을', to_date('14:03', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('18:46', 'hh24:mi'), 52);
insert into tbltrain values (train_seq.nextVal, 'ITX-새마을', to_date('15:55', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('20:26', 'hh24:mi'), 53);
insert into tbltrain values (train_seq.nextVal, 'ITX-새마을', to_date('20:25', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('00:59', 'hh24:mi'), 54);


select * from tbltrain;

select train_seq as 기차번호 , traintype as 기차종류, trainstart as 출발지,to_char(TrainstartTime,'hh24:mi') as 출발시간,
trainarrive as 도착지, to_char(TrainendTime,'hh24:mi') as 도착시간, traincode
from tbltrain 
where traintype='ITX-새마을' and trainstart='서울'
order by trainstarttime;  

commit;
----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------0706 DML-------------------------서울에서 출발 && 무궁화호 DML---------------------

insert into tbltrain values(55, '무궁화', to_date('05:56', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('06:08', 'hh24:mi'), 1);
insert into tbltrain values(56, '무궁화', to_date('05:56', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('06:31', 'hh24:mi'), 1);
insert into tbltrain values(57, '무궁화', to_date('05:56', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('06:51', 'hh24:mi'), 1);
insert into tbltrain values(58, '무궁화', to_date('05:56', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('07:05', 'hh24:mi'), 1);
insert into tbltrain values(59, '무궁화', to_date('05:56', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('07:28', 'hh24:mi'), 1);
insert into tbltrain values(60, '무궁화', to_date('05:56', 'hh24:mi'), '8800', '서울', '신탄진', 1, 1, to_date('07:53', 'hh24:mi'), 1);
insert into tbltrain values(61, '무궁화', to_date('05:56', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('08:05', 'hh24:mi'), 1);
insert into tbltrain values(62, '무궁화', to_date('05:56', 'hh24:mi'), '9800', '서울', '옥천', 1, 1, to_date('08:17', 'hh24:mi'), 1);
insert into tbltrain values(63, '무궁화', to_date('05:56', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('08:37', 'hh24:mi'), 1);
insert into tbltrain values(64, '무궁화', to_date('05:56', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('09:05', 'hh24:mi'), 1);
insert into tbltrain values(65, '무궁화', to_date('05:56', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('09:22', 'hh24:mi'), 1);
insert into tbltrain values(66, '무궁화', to_date('05:56', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('09:56', 'hh24:mi'), 1);
insert into tbltrain values(67, '무궁화', to_date('05:56', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('10:02', 'hh24:mi'), 1);
insert into tbltrain values(68, '무궁화', to_date('05:56', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('10:44', 'hh24:mi'), 1);


insert into tbltrain values(69, '무궁화', to_date('06:38', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('06:48', 'hh24:mi'), 2);
insert into tbltrain values(70, '무궁화', to_date('06:38', 'hh24:mi'), '5800', '서울', '안양', 1, 1, to_date('06:59', 'hh24:mi'), 2);
insert into tbltrain values(71, '무궁화', to_date('06:38', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('07:13', 'hh24:mi'), 2);
insert into tbltrain values(72, '무궁화', to_date('06:38', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('07:33', 'hh24:mi'), 2);
insert into tbltrain values(73, '무궁화', to_date('06:38', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('07:47', 'hh24:mi'), 2);
insert into tbltrain values(74, '무궁화', to_date('06:38', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('08:10', 'hh24:mi'), 2);
insert into tbltrain values(75, '무궁화', to_date('06:38', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('08:38', 'hh24:mi'), 2);
insert into tbltrain values(76, '무궁화', to_date('06:38', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('09:07', 'hh24:mi'), 2);
insert into tbltrain values(77, '무궁화', to_date('06:38', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('09:35', 'hh24:mi'), 2);
insert into tbltrain values(78, '무궁화', to_date('06:38', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('09:52', 'hh24:mi'), 2);
insert into tbltrain values(79, '무궁화', to_date('06:38', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('10:25', 'hh24:mi'), 2);
insert into tbltrain values(80, '무궁화', to_date('06:38', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('10:31', 'hh24:mi'), 2);
insert into tbltrain values(81, '무궁화', to_date('06:38', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('11:20', 'hh24:mi'), 2);






insert into tbltrain values(82, '무궁화', to_date('07:10', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('07:22', 'hh24:mi'), 3);
insert into tbltrain values(83, '무궁화', to_date('07:10', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('07:44', 'hh24:mi'), 3);
insert into tbltrain values(84, '무궁화', to_date('07:10', 'hh24:mi'), '6800', '서울', '오산', 1, 1, to_date('07:55', 'hh24:mi'), 3);
insert into tbltrain values(85, '무궁화', to_date('07:10', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('08:07', 'hh24:mi'), 3);
insert into tbltrain values(86, '무궁화', to_date('07:10', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('08:21', 'hh24:mi'), 3);
insert into tbltrain values(87, '무궁화', to_date('07:10', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('08:44', 'hh24:mi'), 3);
insert into tbltrain values(88, '무궁화', to_date('07:10', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('09:16', 'hh24:mi'), 3);
insert into tbltrain values(89, '무궁화', to_date('07:10', 'hh24:mi'), '9800', '서울', '옥천', 1, 1, to_date('09:28', 'hh24:mi'), 3);
insert into tbltrain values(90, '무궁화', to_date('07:10', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('09:48', 'hh24:mi'), 3);
insert into tbltrain values(91, '무궁화', to_date('07:10', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('10:16', 'hh24:mi'), 3);
insert into tbltrain values(92, '무궁화', to_date('07:10', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('10:33', 'hh24:mi'), 3);
insert into tbltrain values(93, '무궁화', to_date('07:10', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('11:06', 'hh24:mi'), 3);
insert into tbltrain values(94, '무궁화', to_date('07:10', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('11:12', 'hh24:mi'), 3);
insert into tbltrain values(95, '무궁화', to_date('07:10', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('11:53', 'hh24:mi'), 3);




insert into tbltrain values(96, '무궁화', to_date('08:10', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('08:20', 'hh24:mi'), 4);
insert into tbltrain values(97, '무궁화', to_date('08:10', 'hh24:mi'), '5800', '서울', '안양', 1, 1, to_date('08:31', 'hh24:mi'), 4);
insert into tbltrain values(98, '무궁화', to_date('08:10', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('08:45', 'hh24:mi'), 4);
insert into tbltrain values(99, '무궁화', to_date('08:10', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('09:05', 'hh24:mi'), 4);
insert into tbltrain values(100, '무궁화', to_date('08:10', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('09:19', 'hh24:mi'), 4);
insert into tbltrain values(101, '무궁화', to_date('08:10', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('09:42', 'hh24:mi'), 4);
insert into tbltrain values(102, '무궁화', to_date('08:10', 'hh24:mi'), '8800', '서울', '신탄진', 1, 1, to_date('09:59', 'hh24:mi'), 4);
insert into tbltrain values(103, '무궁화', to_date('08:10', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('10:13', 'hh24:mi'), 4);
insert into tbltrain values(104, '무궁화', to_date('08:10', 'hh24:mi'), '9800', '서울', '옥천', 1, 1, to_date('10:25', 'hh24:mi'), 4);
insert into tbltrain values(105, '무궁화', to_date('08:10', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('10:45', 'hh24:mi'), 4);
insert into tbltrain values(106, '무궁화', to_date('08:10', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('11:16', 'hh24:mi'), 4);
insert into tbltrain values(107, '무궁화', to_date('08:10', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('11:33', 'hh24:mi'), 4);
insert into tbltrain values(108, '무궁화', to_date('08:10', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('12:06', 'hh24:mi'), 4);
insert into tbltrain values(109, '무궁화', to_date('08:10', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('12:12', 'hh24:mi'), 4);
insert into tbltrain values(110, '무궁화', to_date('08:10', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('12:58', 'hh24:mi'), 4);



insert into tbltrain values(111, '무궁화', to_date('09:56', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('10:08', 'hh24:mi'), 5);
insert into tbltrain values(112, '무궁화', to_date('09:56', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('10:32', 'hh24:mi'), 5);
insert into tbltrain values(113, '무궁화', to_date('09:56', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('10:52', 'hh24:mi'), 5);
insert into tbltrain values(114, '무궁화', to_date('09:56', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('11:07', 'hh24:mi'), 5);
insert into tbltrain values(115, '무궁화', to_date('09:56', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('11:36', 'hh24:mi'),5);
insert into tbltrain values(116, '무궁화', to_date('09:56', 'hh24:mi'), '8800', '서울', '신탄진', 1, 1, to_date('11:53', 'hh24:mi'), 5);
insert into tbltrain values(117, '무궁화', to_date('09:56', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('12:07', 'hh24:mi'), 5);
insert into tbltrain values(118, '무궁화', to_date('09:56', 'hh24:mi'), '9800', '서울', '옥천', 1, 1, to_date('12:19', 'hh24:mi'), 5);
insert into tbltrain values(119, '무궁화', to_date('09:56', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('12:42', 'hh24:mi'), 5);
insert into tbltrain values(120, '무궁화', to_date('09:56', 'hh24:mi'), '9800', '서울', '추풍령', 1, 1, to_date('12:58', 'hh24:mi'), 5);
insert into tbltrain values(121, '무궁화', to_date('09:56', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('13:13', 'hh24:mi'), 5);
insert into tbltrain values(122, '무궁화', to_date('09:56', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('13:30', 'hh24:mi'), 5);
insert into tbltrain values(123, '무궁화', to_date('09:56', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('14:04', 'hh24:mi'), 5);
insert into tbltrain values(124, '무궁화', to_date('09:56', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('14:10', 'hh24:mi'), 5);
insert into tbltrain values(125, '무궁화', to_date('09:56', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('14:56', 'hh24:mi'), 5);


delete from tbltrain where train_seq=300;
select * from tbltrain order by train_seq;
commit;
alter sequence train_seq increment by -245;
rollback;
drop sequence train_seq;
select train_seq.nextVal from dual;

create sequence train_seq;

alter sequence "train_seq" restart with ;
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('11:25', 'hh24:mi'), 6);

insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('11:49', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('12:10', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('12:25', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('12:54', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('13:21', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '9800', '서울', '옥천', 1, 1, to_date('13:34', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('13:55', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '9800', '서울', '추풍령', 1, 1, to_date('14:20', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('14:35', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('14:52', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('15:27', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('15:33', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('16:18', 'hh24:mi'), 6);






insert into tbltrain values(139, '무궁화', to_date('13:16', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('13:28', 'hh24:mi'), 7);
insert into tbltrain values(140, '무궁화', to_date('13:16', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('13:51', 'hh24:mi'), 7);
insert into tbltrain values(141, '무궁화', to_date('13:16', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('14:11', 'hh24:mi'), 7);
insert into tbltrain values(142, '무궁화', to_date('13:16', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('14:25', 'hh24:mi'), 7);
insert into tbltrain values(143, '무궁화', to_date('13:16', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('14:47', 'hh24:mi'), 7);
insert into tbltrain values(144, '무궁화', to_date('13:16', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('15:14', 'hh24:mi'), 7);
insert into tbltrain values(145, '무궁화', to_date('13:16', 'hh24:mi'), '9800', '서울', '옥천', 1, 1, to_date('15:26', 'hh24:mi'), 7);
insert into tbltrain values(146, '무궁화', to_date('13:16', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('15:49', 'hh24:mi'), 7);
insert into tbltrain values(147, '무궁화', to_date('13:16', 'hh24:mi'), '9800', '서울', '추풍령', 1, 1, to_date('16:08', 'hh24:mi'), 7);
insert into tbltrain values(148, '무궁화', to_date('13:16', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('16:23', 'hh24:mi'), 7);
insert into tbltrain values(149, '무궁화', to_date('13:16', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('16:40', 'hh24:mi'), 7);
insert into tbltrain values(150, '무궁화', to_date('13:16', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('17:16', 'hh24:mi'), 7);
insert into tbltrain values(151, '무궁화', to_date('13:16', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('17:22', 'hh24:mi'), 7);
insert into tbltrain values(152, '무궁화', to_date('13:16', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('18:11', 'hh24:mi'), 7);






insert into tbltrain values(153, '무궁화', to_date('14:26', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('14:38', 'hh24:mi'), 8);
insert into tbltrain values(154, '무궁화', to_date('14:26', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('15:01', 'hh24:mi'), 8);
insert into tbltrain values(155, '무궁화', to_date('14:26', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('15:21', 'hh24:mi'), 8);
insert into tbltrain values(156, '무궁화', to_date('14:26', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('15:36', 'hh24:mi'), 8);
insert into tbltrain values(157, '무궁화', to_date('14:26', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('15:59', 'hh24:mi'), 8);
insert into tbltrain values(158, '무궁화', to_date('14:26', 'hh24:mi'), '8800', '서울', '신탄진', 1, 1, to_date('16:16', 'hh24:mi'), 8);
insert into tbltrain values(159, '무궁화', to_date('14:26', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('16:29', 'hh24:mi'), 8);
insert into tbltrain values(160, '무궁화', to_date('14:26', 'hh24:mi'), '9800', '서울', '옥천', 1, 1, to_date('16:41', 'hh24:mi'), 8);
insert into tbltrain values(161, '무궁화', to_date('14:26', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('17:01', 'hh24:mi'), 8);
insert into tbltrain values(162, '무궁화', to_date('14:26', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('17:29', 'hh24:mi'), 8);
insert into tbltrain values(163, '무궁화', to_date('14:26', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('17:46', 'hh24:mi'), 8);
insert into tbltrain values(164, '무궁화', to_date('14:26', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('18:20', 'hh24:mi'), 8);
insert into tbltrain values(165, '무궁화', to_date('14:26', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('18:26', 'hh24:mi'), 8);
insert into tbltrain values(166, '무궁화', to_date('14:26', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('19:06', 'hh24:mi'), 8);




insert into tbltrain values(167, '무궁화', to_date('15:06', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('15:18', 'hh24:mi'), 9);
insert into tbltrain values(168, '무궁화', to_date('15:06', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('15:41', 'hh24:mi'), 9);
insert into tbltrain values(169, '무궁화', to_date('15:06', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('16:02', 'hh24:mi'), 9);
insert into tbltrain values(170, '무궁화', to_date('15:06', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('16:16', 'hh24:mi'), 9);
insert into tbltrain values(171, '무궁화', to_date('15:06', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('16:42', 'hh24:mi'), 9);
insert into tbltrain values(172, '무궁화', to_date('15:06', 'hh24:mi'), '8800', '서울', '신탄진', 1, 1, to_date('17:00', 'hh24:mi'), 9);
insert into tbltrain values(173, '무궁화', to_date('15:06', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('17:13', 'hh24:mi'), 9);
insert into tbltrain values(174, '무궁화', to_date('15:06', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('17:42', 'hh24:mi'), 9);
insert into tbltrain values(175, '무궁화', to_date('15:06', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('18:10', 'hh24:mi'), 9);
insert into tbltrain values(176, '무궁화', to_date('15:06', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('18:27', 'hh24:mi'), 9);
insert into tbltrain values(177, '무궁화', to_date('15:06', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('19:01', 'hh24:mi'), 9);
insert into tbltrain values(178, '무궁화', to_date('15:06', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('19:07', 'hh24:mi'), 9);
insert into tbltrain values(179, '무궁화', to_date('15:06', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('19:55', 'hh24:mi'), 9);




insert into tbltrain values(180, '무궁화', to_date('17:40', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('17:52', 'hh24:mi'), 10);
insert into tbltrain values(181, '무궁화', to_date('17:40', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('18:15', 'hh24:mi'), 10);
insert into tbltrain values(182, '무궁화', to_date('17:40', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('18:35', 'hh24:mi'), 10);
insert into tbltrain values(183, '무궁화', to_date('17:40', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('18:49', 'hh24:mi'), 10);
insert into tbltrain values(184, '무궁화', to_date('17:40', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('19:11', 'hh24:mi'), 10);
insert into tbltrain values(185, '무궁화', to_date('17:40', 'hh24:mi'), '8800', '서울', '신탄진', 1, 1, to_date('19:30', 'hh24:mi'), 10);
insert into tbltrain values(186, '무궁화', to_date('17:40', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('19:43', 'hh24:mi'), 10);
insert into tbltrain values(187, '무궁화', to_date('17:40', 'hh24:mi'), '9800', '서울', '옥천', 1, 1, to_date('19:55', 'hh24:mi'), 10);
insert into tbltrain values(188, '무궁화', to_date('17:40', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('20:15', 'hh24:mi'), 10);
insert into tbltrain values(189, '무궁화', to_date('17:40', 'hh24:mi'), '9800', '서울', '추풍령', 1, 1, to_date('20:31', 'hh24:mi'), 10);
insert into tbltrain values(190, '무궁화', to_date('17:40', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('20:46', 'hh24:mi'), 10);
insert into tbltrain values(191, '무궁화', to_date('17:40', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('21:03', 'hh24:mi'), 10);
insert into tbltrain values(192, '무궁화', to_date('17:40', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('21:37', 'hh24:mi'), 10);
insert into tbltrain values(193, '무궁화', to_date('17:40', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('21:43', 'hh24:mi'), 10);
insert into tbltrain values(194, '무궁화', to_date('17:40', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('22:23', 'hh24:mi'), 10);





-------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------대전에서 부산방향으로 출발, 무궁화호 DML---------------------------
insert into tbltrain values(195, '무궁화', to_date('08:05', 'hh24:mi'), '5800', '대전', '옥천', 1, 1, to_date('08:17', 'hh24:mi'), 1);
insert into tbltrain values(196, '무궁화', to_date('08:05', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('08:37', 'hh24:mi'), 1);
insert into tbltrain values(197, '무궁화', to_date('08:05', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('09:05', 'hh24:mi'), 1);
insert into tbltrain values(198, '무궁화', to_date('08:05', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('09:22', 'hh24:mi'), 1);
insert into tbltrain values(199, '무궁화', to_date('08:05', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('09:56', 'hh24:mi'), 1);
insert into tbltrain values(200, '무궁화', to_date('08:05', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('10:02', 'hh24:mi'), 1);
insert into tbltrain values(201, '무궁화', to_date('08:05', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('10:44', 'hh24:mi'), 1);
insert into tbltrain values(202, '무궁화', to_date('08:05', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('11:29', 'hh24:mi'), 1);



insert into tbltrain values(203, '무궁화', to_date('08:38', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('09:07', 'hh24:mi'), 2);
insert into tbltrain values(204, '무궁화', to_date('08:38', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('09:35', 'hh24:mi'), 2);
insert into tbltrain values(205, '무궁화', to_date('08:38', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('09:52', 'hh24:mi'), 2);
insert into tbltrain values(206, '무궁화', to_date('08:38', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('10:25', 'hh24:mi'), 2);
insert into tbltrain values(207, '무궁화', to_date('08:38', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('10:31', 'hh24:mi'), 2);
insert into tbltrain values(208, '무궁화', to_date('08:38', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('11:20', 'hh24:mi'), 2);
insert into tbltrain values(209, '무궁화', to_date('08:38', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('12:02', 'hh24:mi'), 2);


insert into tbltrain values(210, '무궁화', to_date('09:16', 'hh24:mi'), '5800', '대전', '옥천', 1, 1, to_date('09:28', 'hh24:mi'), 3);
insert into tbltrain values(211, '무궁화', to_date('09:16', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('09:48', 'hh24:mi'), 3);
insert into tbltrain values(212, '무궁화', to_date('09:16', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('10:16', 'hh24:mi'), 3);
insert into tbltrain values(213, '무궁화', to_date('09:16', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('10:33', 'hh24:mi'), 3);
insert into tbltrain values(214, '무궁화', to_date('09:16', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('11:06', 'hh24:mi'), 3);
insert into tbltrain values(215, '무궁화', to_date('09:16', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('11:12', 'hh24:mi'), 3);
insert into tbltrain values(216, '무궁화', to_date('09:16', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('11:53', 'hh24:mi'), 3);
insert into tbltrain values(217, '무궁화', to_date('09:16', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('12:36', 'hh24:mi'), 3);




insert into tbltrain values(218, '무궁화', to_date('10:13', 'hh24:mi'), '5800', '대전', '옥천', 1, 1, to_date('10:25', 'hh24:mi'), 4);
insert into tbltrain values(219, '무궁화', to_date('10:13', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('10:45', 'hh24:mi'), 4);
insert into tbltrain values(220, '무궁화', to_date('10:13', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('11:16', 'hh24:mi'), 4);
insert into tbltrain values(221, '무궁화', to_date('10:13', 'hh24:mi'), '6800', '대전', '구미', 1, 1, to_date('11:33', 'hh24:mi'), 4);
insert into tbltrain values(222, '무궁화', to_date('10:13', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('12:06', 'hh24:mi'), 4);
insert into tbltrain values(223, '무궁화', to_date('10:13', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('12:12', 'hh24:mi'), 4);
insert into tbltrain values(224, '무궁화', to_date('10:13', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('12:58', 'hh24:mi'), 4);
insert into tbltrain values(225, '무궁화', to_date('10:13', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('13:44', 'hh24:mi'), 4);




insert into tbltrain values(226, '무궁화', to_date('12:07', 'hh24:mi'), '5800', '대전', '옥천', 1, 1, to_date('12:19', 'hh24:mi'), 5);
insert into tbltrain values(227, '무궁화', to_date('12:07', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('12:42', 'hh24:mi'), 5);
insert into tbltrain values(228, '무궁화', to_date('12:07', 'hh24:mi'), '6800', '대전', '추풍령', 1, 1, to_date('12:58', 'hh24:mi'), 5);
insert into tbltrain values(229, '무궁화', to_date('12:07', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('13:13', 'hh24:mi'), 5);
insert into tbltrain values(230, '무궁화', to_date('12:07', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('13:30', 'hh24:mi'), 5);
insert into tbltrain values(231, '무궁화', to_date('12:07', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('14:04', 'hh24:mi'), 5);
insert into tbltrain values(232, '무궁화', to_date('12:07', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('14:10', 'hh24:mi'), 5);
insert into tbltrain values(233, '무궁화', to_date('12:07', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('14:56', 'hh24:mi'), 5);
insert into tbltrain values(234, '무궁화', to_date('12:07', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('15:35', 'hh24:mi'), 5);




insert into tbltrain values(235, '무궁화', to_date('13:21', 'hh24:mi'), '5800', '대전', '옥천', 1, 1, to_date('13:34', 'hh24:mi'), 6);
insert into tbltrain values(236, '무궁화', to_date('13:21', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('13:55', 'hh24:mi'), 6);
insert into tbltrain values(237, '무궁화', to_date('13:21', 'hh24:mi'), '6800', '대전', '추풍령', 1, 1, to_date('14:20', 'hh24:mi'), 6);
insert into tbltrain values(238, '무궁화', to_date('13:21', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('14:35', 'hh24:mi'), 6);
insert into tbltrain values(239, '무궁화', to_date('13:21', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('14:52', 'hh24:mi'), 6);
insert into tbltrain values(240, '무궁화', to_date('13:21', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('15:27', 'hh24:mi'), 6);
insert into tbltrain values(241, '무궁화', to_date('13:21', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('15:33', 'hh24:mi'), 6);
insert into tbltrain values(242, '무궁화', to_date('13:21', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('16:18', 'hh24:mi'), 6);
insert into tbltrain values(243, '무궁화', to_date('13:21', 'hh24:mi'), '8800', '대전', '부산', 1, 1, to_date('17:08', 'hh24:mi'), 6);





insert into tbltrain values(244, '무궁화', to_date('15:14', 'hh24:mi'), '5800', '대전', '옥천', 1, 1, to_date('15:26', 'hh24:mi'), 7);
insert into tbltrain values(245, '무궁화', to_date('15:14', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('15:49', 'hh24:mi'), 7);
insert into tbltrain values(246, '무궁화', to_date('15:14', 'hh24:mi'), '6800', '대전', '추풍령', 1, 1, to_date('16:08', 'hh24:mi'), 7);
insert into tbltrain values(247, '무궁화', to_date('15:14', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('16:23', 'hh24:mi'), 7);
insert into tbltrain values(248, '무궁화', to_date('15:14', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('16:40', 'hh24:mi'), 7);
insert into tbltrain values(249, '무궁화', to_date('15:14', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('17:16', 'hh24:mi'), 7);
insert into tbltrain values(250, '무궁화', to_date('15:14', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('17:22', 'hh24:mi'), 7);
insert into tbltrain values(251, '무궁화', to_date('15:14', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('18:11', 'hh24:mi'), 7);
insert into tbltrain values(252, '무궁화', to_date('15:14', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('19:00', 'hh24:mi'), 7);




insert into tbltrain values(253, '무궁화', to_date('16:29', 'hh24:mi'), '5800', '대전', '옥천', 1, 1, to_date('16:41', 'hh24:mi'), 8);
insert into tbltrain values(254, '무궁화', to_date('16:29', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('17:01', 'hh24:mi'), 8);
insert into tbltrain values(255, '무궁화', to_date('16:29', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('17:29', 'hh24:mi'), 8);
insert into tbltrain values(256, '무궁화', to_date('16:29', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('17:46', 'hh24:mi'), 8);
insert into tbltrain values(257, '무궁화', to_date('16:29', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('18:20', 'hh24:mi'), 8);
insert into tbltrain values(258, '무궁화', to_date('16:29', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('18:26', 'hh24:mi'), 8);
insert into tbltrain values(259, '무궁화', to_date('16:29', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('19:06', 'hh24:mi'), 8);
insert into tbltrain values(260, '무궁화', to_date('16:29', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('19:51', 'hh24:mi'), 8);





insert into tbltrain values(261, '무궁화', to_date('17:13', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('17:42', 'hh24:mi'), 9);
insert into tbltrain values(262, '무궁화', to_date('17:13', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('18:10', 'hh24:mi'), 9);
insert into tbltrain values(263, '무궁화', to_date('17:13', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('18:27', 'hh24:mi'), 9);
insert into tbltrain values(264, '무궁화', to_date('17:13', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('19:01', 'hh24:mi'), 9);
insert into tbltrain values(265, '무궁화', to_date('17:13', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('19:07', 'hh24:mi'), 9);
insert into tbltrain values(266, '무궁화', to_date('17:13', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('19:55', 'hh24:mi'), 9);
insert into tbltrain values(267, '무궁화', to_date('17:13', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('20:40', 'hh24:mi'), 9);





insert into tbltrain values(268, '무궁화', to_date('19:43', 'hh24:mi'), '5800', '대전', '옥천', 1, 1, to_date('19:55', 'hh24:mi'), 10);
insert into tbltrain values(269, '무궁화', to_date('19:43', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('20:15', 'hh24:mi'), 10);
insert into tbltrain values(270, '무궁화', to_date('19:43', 'hh24:mi'), '6800', '대전', '추풍령', 1, 1, to_date('20:31', 'hh24:mi'), 10);
insert into tbltrain values(271, '무궁화', to_date('19:43', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('20:46', 'hh24:mi'), 10);
insert into tbltrain values(272, '무궁화', to_date('19:43', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('21:03', 'hh24:mi'), 10);
insert into tbltrain values(273, '무궁화', to_date('19:43', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('21:37', 'hh24:mi'), 10);
insert into tbltrain values(274, '무궁화', to_date('19:43', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('21:43', 'hh24:mi'), 10);
insert into tbltrain values(275, '무궁화', to_date('19:43', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('22:23', 'hh24:mi'), 10);
insert into tbltrain values(276, '무궁화', to_date('19:43', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('23:08', 'hh24:mi'), 10);



-------------------------------------------------------------------------------------------------------------------------------------------
------------------------대구에서 부산방향으로 출발, 무궁화호 DML-------------------------------------



insert into tbltrain values(277, '무궁화', to_date('09:56', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('10:02', 'hh24:mi'), 1);
insert into tbltrain values(278, '무궁화', to_date('09:56', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('10:44', 'hh24:mi'), 1);
insert into tbltrain values(279, '무궁화', to_date('09:56', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('11:29', 'hh24:mi'), 1);




insert into tbltrain values(280, '무궁화', to_date('10:25', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('10:31', 'hh24:mi'), 2);
insert into tbltrain values(281, '무궁화', to_date('10:25', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('11:20', 'hh24:mi'), 2);
insert into tbltrain values(282, '무궁화', to_date('10:25', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('12:02', 'hh24:mi'), 2);



insert into tbltrain values(283, '무궁화', to_date('11:06', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('11:12', 'hh24:mi'), 3);
insert into tbltrain values(284, '무궁화', to_date('11:06', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('11:53', 'hh24:mi'), 3);
insert into tbltrain values(285, '무궁화', to_date('11:06', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('12:36', 'hh24:mi'), 3);



insert into tbltrain values(286, '무궁화', to_date('12:06', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('12:12', 'hh24:mi'), 4);
insert into tbltrain values(287, '무궁화', to_date('12:06', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('12:58', 'hh24:mi'), 4);
insert into tbltrain values(288, '무궁화', to_date('12:06', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('13:44', 'hh24:mi'), 4);



insert into tbltrain values(289, '무궁화', to_date('14:04', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('14:10', 'hh24:mi'), 5);
insert into tbltrain values(290, '무궁화', to_date('14:04', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('14:56', 'hh24:mi'), 5);
insert into tbltrain values(291, '무궁화', to_date('14:04', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('15:35', 'hh24:mi'), 5);



insert into tbltrain values(292, '무궁화', to_date('15:27', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('15:33', 'hh24:mi'), 6);
insert into tbltrain values(293, '무궁화', to_date('15:27', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('16:18', 'hh24:mi'), 6);
insert into tbltrain values(294, '무궁화', to_date('15:27', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('17:08', 'hh24:mi'), 6);



insert into tbltrain values(295, '무궁화', to_date('17:16', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('17:22', 'hh24:mi'), 7);
insert into tbltrain values(296, '무궁화', to_date('17:16', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('18:11', 'hh24:mi'), 7);
insert into tbltrain values(297, '무궁화', to_date('17:16', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('19:00', 'hh24:mi'), 7);



insert into tbltrain values(298, '무궁화', to_date('18:20', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('18:26', 'hh24:mi'), 8);
insert into tbltrain values(299, '무궁화', to_date('18:20', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('19:06', 'hh24:mi'), 8);
insert into tbltrain values(300, '무궁화', to_date('18:20', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('19:51', 'hh24:mi'), 8);



insert into tbltrain values(301, '무궁화', to_date('19:01', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('19:07', 'hh24:mi'), 9);
insert into tbltrain values(302, '무궁화', to_date('19:01', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('19:55', 'hh24:mi'), 9);
insert into tbltrain values(303, '무궁화', to_date('19:01', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('20:40', 'hh24:mi'), 9);



insert into tbltrain values(304, '무궁화', to_date('21:37', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('21:43', 'hh24:mi'), 10);
insert into tbltrain values(305, '무궁화', to_date('21:37', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('22:23', 'hh24:mi'), 10);
insert into tbltrain values(306, '무궁화', to_date('21:37', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('23:08', 'hh24:mi'), 10);




drop sequence train_seq;

create sequence train_seq;
rollback;

select train_seq from dual;
select * from tbltrain order by train_seq;
commit;

select train_seq.nextVal from dual;
alter sequence train_seq increment by 1;

insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('05:56', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('06:08', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('05:56', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('06:31', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('05:56', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('06:51', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('05:56', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('07:05', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('05:56', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('07:28', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('05:56', 'hh24:mi'), '8800', '서울', '신탄진', 1, 1, to_date('07:53', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('05:56', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('08:05', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('05:56', 'hh24:mi'), '9800', '서울', '옥천', 1, 1, to_date('08:17', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('05:56', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('08:37', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('05:56', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('09:05', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('05:56', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('09:22', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('05:56', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('09:56', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('05:56', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('10:02', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('05:56', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('10:44', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('06:38', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('06:48', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('06:38', 'hh24:mi'), '5800', '서울', '안양', 1, 1, to_date('06:59', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('06:38', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('07:13', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('06:38', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('07:33', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('06:38', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('07:47', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('06:38', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('08:10', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('06:38', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('08:38', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('06:38', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('09:07', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('06:38', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('09:35', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('06:38', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('09:52', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('06:38', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('10:25', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('06:38', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('10:31', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('06:38', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('11:20', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('07:10', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('07:22', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('07:10', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('07:44', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('07:10', 'hh24:mi'), '6800', '서울', '오산', 1, 1, to_date('07:55', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('07:10', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('08:07', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('07:10', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('08:21', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('07:10', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('08:44', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('07:10', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('09:16', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('07:10', 'hh24:mi'), '9800', '서울', '옥천', 1, 1, to_date('09:28', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('07:10', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('09:48', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('07:10', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('10:16', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('07:10', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('10:33', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('07:10', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('11:06', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('07:10', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('11:12', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('07:10', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('11:53', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('08:20', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '5800', '서울', '안양', 1, 1, to_date('08:31', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('08:45', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('09:05', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('09:19', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('09:42', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '8800', '서울', '신탄진', 1, 1, to_date('09:59', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('10:13', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '9800', '서울', '옥천', 1, 1, to_date('10:25', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('10:45', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('11:16', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('11:33', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('12:06', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('12:12', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:10', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('12:58', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('10:08', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('10:32', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('10:52', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('11:07', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('11:36', 'hh24:mi'),5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '8800', '서울', '신탄진', 1, 1, to_date('11:53', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('12:07', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '9800', '서울', '옥천', 1, 1, to_date('12:19', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('12:42', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '9800', '서울', '추풍령', 1, 1, to_date('12:58', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('13:13', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('13:30', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('14:04', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('14:10', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('14:56', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('11:25', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('11:49', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('12:10', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('12:25', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('12:54', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('13:21', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '9800', '서울', '옥천', 1, 1, to_date('13:34', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('13:55', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '9800', '서울', '추풍령', 1, 1, to_date('14:20', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('14:35', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('14:52', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('15:27', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('15:33', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:15', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('16:18', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:16', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('13:28', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:16', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('13:51', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:16', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('14:11', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:16', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('14:25', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:16', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('14:47', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:16', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('15:14', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:16', 'hh24:mi'), '9800', '서울', '옥천', 1, 1, to_date('15:26', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:16', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('15:49', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:16', 'hh24:mi'), '9800', '서울', '추풍령', 1, 1, to_date('16:08', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:16', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('16:23', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:16', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('16:40', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:16', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('17:16', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:16', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('17:22', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:16', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('18:11', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:26', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('14:38', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:26', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('15:01', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:26', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('15:21', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:26', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('15:36', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:26', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('15:59', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:26', 'hh24:mi'), '8800', '서울', '신탄진', 1, 1, to_date('16:16', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:26', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('16:29', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:26', 'hh24:mi'), '9800', '서울', '옥천', 1, 1, to_date('16:41', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:26', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('17:01', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:26', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('17:29', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:26', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('17:46', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:26', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('18:20', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:26', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('18:26', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:26', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('19:06', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:06', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('15:18', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:06', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('15:41', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:06', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('16:02', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:06', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('16:16', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:06', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('16:42', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:06', 'hh24:mi'), '8800', '서울', '신탄진', 1, 1, to_date('17:00', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:06', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('17:13', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:06', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('17:42', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:06', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('18:10', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:06', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('18:27', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:06', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('19:01', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:06', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('19:07', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:06', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('19:55', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '5800', '서울', '영등포', 1, 1, to_date('17:52', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '6800', '서울', '수원', 1, 1, to_date('18:15', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '7800', '서울', '평택', 1, 1, to_date('18:35', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '7800', '서울', '천안', 1, 1, to_date('18:49', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '7800', '서울', '조치원', 1, 1, to_date('19:11', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '8800', '서울', '신탄진', 1, 1, to_date('19:30', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '9800', '서울', '대전', 1, 1, to_date('19:43', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '9800', '서울', '옥천', 1, 1, to_date('19:55', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '9800', '서울', '영동', 1, 1, to_date('20:15', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '9800', '서울', '추풍령', 1, 1, to_date('20:31', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '10800', '서울', '김천', 1, 1, to_date('20:46', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '11800', '서울', '구미', 1, 1, to_date('21:03', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '13800', '서울', '대구', 1, 1, to_date('21:37', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '13800', '서울', '동대구', 1, 1, to_date('21:43', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:40', 'hh24:mi'), '13800', '서울', '밀양', 1, 1, to_date('22:23', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:05', 'hh24:mi'), '5800', '대전', '옥천', 1, 1, to_date('08:17', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:05', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('08:37', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:05', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('09:05', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:05', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('09:22', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:05', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('09:56', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:05', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('10:02', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:05', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('10:44', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:05', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('11:29', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:38', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('09:07', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:38', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('09:35', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:38', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('09:52', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:38', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('10:25', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:38', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('10:31', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:38', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('11:20', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('08:38', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('12:02', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:16', 'hh24:mi'), '5800', '대전', '옥천', 1, 1, to_date('09:28', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:16', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('09:48', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:16', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('10:16', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:16', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('10:33', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:16', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('11:06', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:16', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('11:12', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:16', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('11:53', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:16', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('12:36', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('10:13', 'hh24:mi'), '5800', '대전', '옥천', 1, 1, to_date('10:25', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('10:13', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('10:45', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('10:13', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('11:16', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('10:13', 'hh24:mi'), '6800', '대전', '구미', 1, 1, to_date('11:33', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('10:13', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('12:06', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('10:13', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('12:12', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('10:13', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('12:58', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('10:13', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('13:44', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('12:07', 'hh24:mi'), '5800', '대전', '옥천', 1, 1, to_date('12:19', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('12:07', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('12:42', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('12:07', 'hh24:mi'), '6800', '대전', '추풍령', 1, 1, to_date('12:58', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('12:07', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('13:13', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('12:07', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('13:30', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('12:07', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('14:04', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('12:07', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('14:10', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('12:07', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('14:56', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('12:07', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('15:35', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:21', 'hh24:mi'), '5800', '대전', '옥천', 1, 1, to_date('13:34', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:21', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('13:55', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:21', 'hh24:mi'), '6800', '대전', '추풍령', 1, 1, to_date('14:20', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:21', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('14:35', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:21', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('14:52', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:21', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('15:27', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:21', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('15:33', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:21', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('16:18', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('13:21', 'hh24:mi'), '8800', '대전', '부산', 1, 1, to_date('17:08', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:14', 'hh24:mi'), '5800', '대전', '옥천', 1, 1, to_date('15:26', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:14', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('15:49', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:14', 'hh24:mi'), '6800', '대전', '추풍령', 1, 1, to_date('16:08', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:14', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('16:23', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:14', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('16:40', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:14', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('17:16', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:14', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('17:22', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:14', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('18:11', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:14', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('19:00', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('16:29', 'hh24:mi'), '5800', '대전', '옥천', 1, 1, to_date('16:41', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('16:29', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('17:01', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('16:29', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('17:29', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('16:29', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('17:46', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('16:29', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('18:20', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('16:29', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('18:26', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('16:29', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('19:06', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('16:29', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('19:51', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:13', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('17:42', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:13', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('18:10', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:13', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('18:27', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:13', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('19:01', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:13', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('19:07', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:13', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('19:55', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:13', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('20:40', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('19:43', 'hh24:mi'), '5800', '대전', '옥천', 1, 1, to_date('19:55', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('19:43', 'hh24:mi'), '5800', '대전', '영동', 1, 1, to_date('20:15', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('19:43', 'hh24:mi'), '6800', '대전', '추풍령', 1, 1, to_date('20:31', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('19:43', 'hh24:mi'), '6800', '대전', '김천', 1, 1, to_date('20:46', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('19:43', 'hh24:mi'), '7800', '대전', '구미', 1, 1, to_date('21:03', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('19:43', 'hh24:mi'), '8800', '대전', '대구', 1, 1, to_date('21:37', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('19:43', 'hh24:mi'), '8800', '대전', '동대구', 1, 1, to_date('21:43', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('19:43', 'hh24:mi'), '8800', '대전', '밀양', 1, 1, to_date('22:23', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('19:43', 'hh24:mi'), '9800', '대전', '부산', 1, 1, to_date('23:08', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('10:02', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('10:44', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('09:56', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('11:29', 'hh24:mi'), 1);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('10:25', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('10:31', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('10:25', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('11:20', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('10:25', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('12:02', 'hh24:mi'), 2);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:06', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('11:12', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:06', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('11:53', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('11:06', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('12:36', 'hh24:mi'), 3);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('12:06', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('12:12', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('12:06', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('12:58', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('12:06', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('13:44', 'hh24:mi'), 4);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:04', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('14:10', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:04', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('14:56', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('14:04', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('15:35', 'hh24:mi'), 5);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:27', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('15:33', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:27', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('16:18', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('15:27', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('17:08', 'hh24:mi'), 6);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:16', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('17:22', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:16', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('18:11', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('17:16', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('19:00', 'hh24:mi'), 7);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('18:20', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('18:26', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('18:20', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('19:06', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('18:20', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('19:51', 'hh24:mi'), 8);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('19:01', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('19:07', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('19:01', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('19:55', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('19:01', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('20:40', 'hh24:mi'), 9);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('21:37', 'hh24:mi'), '3800', '대구', '동대구', 1, 1, to_date('21:43', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('21:37', 'hh24:mi'), '4800', '대구', '밀양', 1, 1, to_date('22:23', 'hh24:mi'), 10);
insert into tbltrain values(train_seq.nextVal, '무궁화', to_date('21:37', 'hh24:mi'), '6800', '대구', '부산', 1, 1, to_date('23:08', 'hh24:mi'), 10);

rollback;

commit;

select * from tbltrain;



-------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------ITX-새마을 서울에서 출발하는 방향--------------------------------
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('06:16', 'hh24:mi'), '3800', '서울', '영등포', 1, 1, to_date('06:25', 'hh24:mi'), 41);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('06:16', 'hh24:mi'), '3800', '서울', '수원', 1, 1, to_date('06:47', 'hh24:mi'), 41);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('06:16', 'hh24:mi'), '4800', '서울', '천안', 1, 1, to_date('07:16', 'hh24:mi'), 41);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('06:16', 'hh24:mi'), '5800', '서울', '대전', 1, 1, to_date('07:58', 'hh24:mi'), 41);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('06:16', 'hh24:mi'), '5800', '서울', '영동', 1, 1, to_date('08:26', 'hh24:mi'), 41);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('06:16', 'hh24:mi'), '5800', '서울', '김천', 1, 1, to_date('08:52', 'hh24:mi'), 41);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('06:16', 'hh24:mi'), '6800', '서울', '구미', 1, 1, to_date('09:08', 'hh24:mi'), 41);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('06:16', 'hh24:mi'), '6800', '서울', '대구', 1, 1, to_date('09:37', 'hh24:mi'), 41);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('06:16', 'hh24:mi'), '6800', '서울', '동대구', 1, 1, to_date('09:43', 'hh24:mi'), 41);


insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('09:16', 'hh24:mi'), '3800', '서울', '영등포', 1, 1, to_date('09:25', 'hh24:mi'), 42);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('09:16', 'hh24:mi'), '3800', '서울', '수원', 1, 1, to_date('09:47', 'hh24:mi'), 42);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('09:16', 'hh24:mi'), '4800', '서울', '천안', 1, 1, to_date('10:16', 'hh24:mi'), 42);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('09:16', 'hh24:mi'), '4800', '서울', '조치원', 1, 1, to_date('10:37', 'hh24:mi'), 42);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('09:16', 'hh24:mi'), '5800', '서울', '대전', 1, 1, to_date('11:02', 'hh24:mi'), 42);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('09:16', 'hh24:mi'), '5800', '서울', '영동', 1, 1, to_date('11:30', 'hh24:mi'), 42);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('09:16', 'hh24:mi'), '5800', '서울', '김천', 1, 1, to_date('11:56', 'hh24:mi'), 42);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('09:16', 'hh24:mi'), '6800', '서울', '구미', 1, 1, to_date('12:12', 'hh24:mi'), 42);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('09:16', 'hh24:mi'), '6800', '서울', '대구', 1, 1, to_date('12:41', 'hh24:mi'), 42);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('09:16', 'hh24:mi'), '6800', '서울', '동대구', 1, 1, to_date('12:47', 'hh24:mi'), 42);




insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:05', 'hh24:mi'), '3800', '서울', '영등포', 1, 1, to_date('11:14', 'hh24:mi'), 43);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:05', 'hh24:mi'), '3800', '서울', '수원', 1, 1, to_date('11:36', 'hh24:mi'), 43);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:05', 'hh24:mi'), '3800', '서울', '평택', 1, 1, to_date('11:55', 'hh24:mi'), 43);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:05', 'hh24:mi'), '4800', '서울', '천안', 1, 1, to_date('12:08', 'hh24:mi'), 43);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:05', 'hh24:mi'), '5800', '서울', '대전', 1, 1, to_date('12:50', 'hh24:mi'), 43);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:05', 'hh24:mi'), '5800', '서울', '김천', 1, 1, to_date('13:42', 'hh24:mi'), 43);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:05', 'hh24:mi'), '6800', '서울', '구미', 1, 1, to_date('13:58', 'hh24:mi'), 43);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:05', 'hh24:mi'), '6800', '서울', '대구', 1, 1, to_date('14:27', 'hh24:mi'), 43);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:05', 'hh24:mi'), '6800', '서울', '동대구', 1, 1, to_date('14:33', 'hh24:mi'), 43);


insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:45', 'hh24:mi'), '3800', '서울', '영등포', 1, 1, to_date('11:54', 'hh24:mi'), 44);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:45', 'hh24:mi'), '3800', '서울', '수원', 1, 1, to_date('12:16', 'hh24:mi'), 44);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:45', 'hh24:mi'), '3800', '서울', '평택', 1, 1, to_date('12:35', 'hh24:mi'), 44);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:45', 'hh24:mi'), '4800', '서울', '천안', 1, 1, to_date('12:48', 'hh24:mi'), 44);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:45', 'hh24:mi'), '4800', '서울', '조치원', 1, 1, to_date('13:09', 'hh24:mi'), 44);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:45', 'hh24:mi'), '5800', '서울', '대전', 1, 1, to_date('13:33', 'hh24:mi'), 44);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:45', 'hh24:mi'), '5800', '서울', '영동', 1, 1, to_date('14:01', 'hh24:mi'), 44);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:45', 'hh24:mi'), '5800', '서울', '김천', 1, 1, to_date('14:27', 'hh24:mi'), 44);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:45', 'hh24:mi'), '6800', '서울', '구미', 1, 1, to_date('14:43', 'hh24:mi'), 44);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:45', 'hh24:mi'), '6800', '서울', '대구', 1, 1, to_date('15:15', 'hh24:mi'), 44);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('11:45', 'hh24:mi'), '6800', '서울', '동대구', 1, 1, to_date('15:21', 'hh24:mi'), 44);





insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('14:03', 'hh24:mi'), '3800', '서울', '영등포', 1, 1, to_date('14:12', 'hh24:mi'), 45);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('14:03', 'hh24:mi'), '3800', '서울', '수원', 1, 1, to_date('14:34', 'hh24:mi'), 45);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('14:03', 'hh24:mi'), '3800', '서울', '평택', 1, 1, to_date('14:53', 'hh24:mi'), 45);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('14:03', 'hh24:mi'), '4800', '서울', '천안', 1, 1, to_date('15:07', 'hh24:mi'), 45);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('14:03', 'hh24:mi'), '5800', '서울', '대전', 1, 1, to_date('15:49', 'hh24:mi'), 45);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('14:03', 'hh24:mi'), '5800', '서울', '영동', 1, 1, to_date('16:17', 'hh24:mi'), 45);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('14:03', 'hh24:mi'), '5800', '서울', '김천', 1, 1, to_date('16:43', 'hh24:mi'), 45);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('14:03', 'hh24:mi'), '6800', '서울', '구미', 1, 1, to_date('16:59', 'hh24:mi'), 45);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('14:03', 'hh24:mi'), '6800', '서울', '대구', 1, 1, to_date('17:28', 'hh24:mi'), 45);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('14:03', 'hh24:mi'), '6800', '서울', '동대구', 1, 1, to_date('17:34', 'hh24:mi'), 45);


insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('15:55', 'hh24:mi'), '3800', '서울', '영등포', 1, 1, to_date('16:04', 'hh24:mi'), 46);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('15:55', 'hh24:mi'), '3800', '서울', '수원', 1, 1, to_date('16:26', 'hh24:mi'), 46);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('15:55', 'hh24:mi'), '4800', '서울', '천안', 1, 1, to_date('16:55', 'hh24:mi'), 46);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('15:55', 'hh24:mi'), '5800', '서울', '대전', 1, 1, to_date('17:37', 'hh24:mi'), 46);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('15:55', 'hh24:mi'), '5800', '서울', '김천', 1, 1, to_date('18:29', 'hh24:mi'), 46);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('15:55', 'hh24:mi'), '6800', '서울', '구미', 1, 1, to_date('18:45', 'hh24:mi'), 46);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('15:55', 'hh24:mi'), '6800', '서울', '대구', 1, 1, to_date('19:14', 'hh24:mi'), 46);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('15:55', 'hh24:mi'), '6800', '서울', '동대구', 1, 1, to_date('19:20', 'hh24:mi'), 46);



insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('20:25', 'hh24:mi'), '3800', '서울', '영등포', 1, 1, to_date('20:34', 'hh24:mi'), 47);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('20:25', 'hh24:mi'), '3800', '서울', '수원', 1, 1, to_date('20:56', 'hh24:mi'), 47);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('20:25', 'hh24:mi'), '4800', '서울', '천안', 1, 1, to_date('21:25', 'hh24:mi'), 47);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('20:25', 'hh24:mi'), '5800', '서울', '대전', 1, 1, to_date('22:07', 'hh24:mi'), 47);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('20:25', 'hh24:mi'), '5800', '서울', '김천', 1, 1, to_date('22:59', 'hh24:mi'), 47);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('20:25', 'hh24:mi'), '6800', '서울', '구미', 1, 1, to_date('23:15', 'hh24:mi'), 47);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('20:25', 'hh24:mi'), '6800', '서울', '대구', 1, 1, to_date('23:44', 'hh24:mi'), 47);
insert into tbltrain values(train_seq.nextVal, 'ITX-새마을', to_date('20:25', 'hh24:mi'), '6800', '서울', '동대구', 1, 1, to_date('23:50', 'hh24:mi'), 47);





