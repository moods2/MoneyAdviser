select * from tbltrain;

select* from tbltrans;

create sequence trans_seq;

insert into tbltrans VALUES (trans_seq.nextval, '기차');
insert into tbltrans VALUES (trans_seq.nextval, '버스');

select * from tbltrainstation;
ALTER TABLE tbltrainstation
RENAME COLUMN trainstationloca TO trainstationtel;

UPDATE [테이블] SET [열] = '변경할값' WHERE [조건]

alter table tbltrain add (trainendtime DATE);
update tbltrainstation set trainstation_seq = (trainstation_seq)-1 where trainstation_seq >3; 

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
select train_seq as 기차번호 , traintype as 기차종류, trainstart as 출발지,to_char(TrainstartTime,'hh24:mi') as 출발시간, trainarrive as 도착지, to_char(TrainendTime,'hh24:mi') as 도착시간 from tbltrain; 
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

