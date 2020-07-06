insert into tbltrain values (31, 'KTX', to_date('05:15', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('07:51', 'hh24:mi'), 31);
insert into tbltrain values (32, 'KTX', to_date('05:45', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('08:21', 'hh24:mi'), 32);
insert into tbltrain values (33, 'KTX', to_date('06:00', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('08:37', 'hh24:mi'), 33);
insert into tbltrain values (34, 'KTX', to_date('07:00', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('09:40', 'hh24:mi'), 34);
insert into tbltrain values (35, 'KTX', to_date('08:00', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('10:43', 'hh24:mi'), 35);
insert into tbltrain values (36, 'KTX', to_date('09:45', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('12:49', 'hh24:mi'), 36);
insert into tbltrain values (37, 'KTX', to_date('10:17', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('13:34', 'hh24:mi'), 37);
insert into tbltrain values (38, 'KTX', to_date('12:00', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('14:42', 'hh24:mi'), 38);
insert into tbltrain values (39, 'KTX', to_date('13:05', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('16:13', 'hh24:mi'), 39);
insert into tbltrain values (40, 'KTX', to_date('14:00', 'hh24:mi'), '49800', '부산', '서울', 1, 1, to_date('16:27', 'hh24:mi'), 40);

select * from tbltrain;

insert into tbltrain values (, 'KTX', to_date('07:41', 'hh24:mi'), '49800', '광명', '서울', 1, 1, to_date('07:51', 'hh24:mi'), 31);
insert into tbltrain values (, 'KTX', to_date('07:17', 'hh24:mi'), '49800', '천안', '서울', 1, 1, to_date('07:51', 'hh24:mi'), 31);
insert into tbltrain values (, 'KTX', to_date('06:52', 'hh24:mi'), '49800', '대전', '서울', 1, 1, to_date('07:51', 'hh24:mi'), 31);
insert into tbltrain values (, 'KTX', to_date('06:05', 'hh24:mi'), '49800', '대구', '서울', 1, 1, to_date('07:51', 'hh24:mi'), 31);
insert into tbltrain values (, 'KTX', to_date('05:38', 'hh24:mi'), '49800', '울산', '서울', 1, 1, to_date('07:51', 'hh24:mi'), 31);

update tbltrain set trainstarttime = to_date('05:45', 'hh24:mi') where train_seq=32;
update tbltrain set trainendtime = to_date('08:21', 'hh24:mi') where train_seq=32;

insert into tbltrain values (, 'KTX', to_date('08:11', 'hh24:mi'), '49800', '광명', '서울', 1, 1, to_date('08:21', 'hh24:mi'), 32);
insert into tbltrain values (, 'KTX', to_date('07:47', 'hh24:mi'), '49800', '천안', '서울', 1, 1, to_date('08:21', 'hh24:mi'), 32);
insert into tbltrain values (, 'KTX', to_date('07:22', 'hh24:mi'), '49800', '대전', '서울', 1, 1, to_date('08:21', 'hh24:mi'), 32);
insert into tbltrain values (, 'KTX', to_date('06:35', 'hh24:mi'), '49800', '대구', '서울', 1, 1, to_date('08:21', 'hh24:mi'), 32);
insert into tbltrain values (, 'KTX', to_date('06:08', 'hh24:mi'), '49800', '울산', '서울', 1, 1, to_date('08:21', 'hh24:mi'), 32);


insert into tbltrain values (, 'KTX', to_date('08:27', 'hh24:mi'), '49800', '광명', '서울', 1, 1, to_date('08:37', 'hh24:mi'), 33);
insert into tbltrain values (, 'KTX', to_date('08:03', 'hh24:mi'), '49800', '천안', '서울', 1, 1, to_date('08:37', 'hh24:mi'), 33);
insert into tbltrain values (, 'KTX', to_date('07:38', 'hh24:mi'), '49800', '대전', '서울', 1, 1, to_date('08:37', 'hh24:mi'), 33);
insert into tbltrain values (, 'KTX', to_date('06:51', 'hh24:mi'), '49800', '대구', '서울', 1, 1, to_date('08:37', 'hh24:mi'), 33);
insert into tbltrain values (, 'KTX', to_date('06:24', 'hh24:mi'), '49800', '울산', '서울', 1, 1, to_date('08:37', 'hh24:mi'), 33);

insert into tbltrain values (, 'KTX', to_date('09:30', 'hh24:mi'), '49800', '광명', '서울', 1, 1, to_date('09:40', 'hh24:mi'), 34);
insert into tbltrain values (, 'KTX', to_date('09:06', 'hh24:mi'), '49800', '천안', '서울', 1, 1, to_date('09:40', 'hh24:mi'), 34);
insert into tbltrain values (, 'KTX', to_date('08:41', 'hh24:mi'), '49800', '대전', '서울', 1, 1, to_date('09:40', 'hh24:mi'), 34);
insert into tbltrain values (, 'KTX', to_date('07:54', 'hh24:mi'), '49800', '대구', '서울', 1, 1, to_date('09:40', 'hh24:mi'), 34);
insert into tbltrain values (, 'KTX', to_date('07:27', 'hh24:mi'), '49800', '울산', '서울', 1, 1, to_date('09:40', 'hh24:mi'), 34);

insert into tbltrain values (, 'KTX', to_date('10:33', 'hh24:mi'), '49800', '광명', '서울', 1, 1, to_date('10:43', 'hh24:mi'), 35);
insert into tbltrain values (, 'KTX', to_date('10:09', 'hh24:mi'), '49800', '천안', '서울', 1, 1, to_date('10:43', 'hh24:mi'), 35);
insert into tbltrain values (, 'KTX', to_date('09:44', 'hh24:mi'), '49800', '대전', '서울', 1, 1, to_date('10:43', 'hh24:mi'), 35);
insert into tbltrain values (, 'KTX', to_date('08:57', 'hh24:mi'), '49800', '대구', '서울', 1, 1, to_date('10:43', 'hh24:mi'), 35);
insert into tbltrain values (, 'KTX', to_date('08:30', 'hh24:mi'), '49800', '울산', '서울', 1, 1, to_date('10:43', 'hh24:mi'), 35);

insert into tbltrain values (, 'KTX', to_date('12:39', 'hh24:mi'), '49800', '광명', '서울', 1, 1, to_date('12:49', 'hh24:mi'), 36);
insert into tbltrain values (, 'KTX', to_date('12:15', 'hh24:mi'), '49800', '천안', '서울', 1, 1, to_date('12:49', 'hh24:mi'), 36);
insert into tbltrain values (, 'KTX', to_date('11:50', 'hh24:mi'), '49800', '대전', '서울', 1, 1, to_date('12:49', 'hh24:mi'), 36);
insert into tbltrain values (, 'KTX', to_date('11:03', 'hh24:mi'), '49800', '대구', '서울', 1, 1, to_date('12:49', 'hh24:mi'), 36);
insert into tbltrain values (, 'KTX', to_date('10:36', 'hh24:mi'), '49800', '울산', '서울', 1, 1, to_date('12:49', 'hh24:mi'), 36);

insert into tbltrain values (, 'KTX', to_date('13:24', 'hh24:mi'), '49800', '광명', '서울', 1, 1, to_date('13:34', 'hh24:mi'), 37);
insert into tbltrain values (, 'KTX', to_date('13:00', 'hh24:mi'), '49800', '천안', '서울', 1, 1, to_date('13:34', 'hh24:mi'), 37);
insert into tbltrain values (, 'KTX', to_date('12:35', 'hh24:mi'), '49800', '대전', '서울', 1, 1, to_date('13:34', 'hh24:mi'), 37);
insert into tbltrain values (, 'KTX', to_date('11:48', 'hh24:mi'), '49800', '대구', '서울', 1, 1, to_date('13:34', 'hh24:mi'), 37);
insert into tbltrain values (, 'KTX', to_date('11:21', 'hh24:mi'), '49800', '울산', '서울', 1, 1, to_date('13:34', 'hh24:mi'), 37);

insert into tbltrain values (, 'KTX', to_date('14:32', 'hh24:mi'), '49800', '광명', '서울', 1, 1, to_date('14:42', 'hh24:mi'), 38);
insert into tbltrain values (, 'KTX', to_date('14:08', 'hh24:mi'), '49800', '천안', '서울', 1, 1, to_date('14:42', 'hh24:mi'), 38);
insert into tbltrain values (, 'KTX', to_date('13:43', 'hh24:mi'), '49800', '대전', '서울', 1, 1, to_date('14:42', 'hh24:mi'), 38);
insert into tbltrain values (, 'KTX', to_date('12:56', 'hh24:mi'), '49800', '대구', '서울', 1, 1, to_date('14:42', 'hh24:mi'), 38);
insert into tbltrain values (, 'KTX', to_date('12:29', 'hh24:mi'), '49800', '울산', '서울', 1, 1, to_date('14:42', 'hh24:mi'), 38);

insert into tbltrain values (, 'KTX', to_date('16:03', 'hh24:mi'), '49800', '광명', '서울', 1, 1, to_date('16:13', 'hh24:mi'), 39);
insert into tbltrain values (, 'KTX', to_date('15:39', 'hh24:mi'), '49800', '천안', '서울', 1, 1, to_date('16:13', 'hh24:mi'), 39);
insert into tbltrain values (, 'KTX', to_date('15:14', 'hh24:mi'), '49800', '대전', '서울', 1, 1, to_date('16:13', 'hh24:mi'), 39);
insert into tbltrain values (, 'KTX', to_date('14:27', 'hh24:mi'), '49800', '대구', '서울', 1, 1, to_date('16:13', 'hh24:mi'), 39);
insert into tbltrain values (, 'KTX', to_date('14:00', 'hh24:mi'), '49800', '울산', '서울', 1, 1, to_date('16:13', 'hh24:mi'), 39);

insert into tbltrain values (, 'KTX', to_date('16:17', 'hh24:mi'), '49800', '광명', '서울', 1, 1, to_date('16:27', 'hh24:mi'), 40);
insert into tbltrain values (, 'KTX', to_date('15:53', 'hh24:mi'), '49800', '천안', '서울', 1, 1, to_date('16:27', 'hh24:mi'), 40);
insert into tbltrain values (, 'KTX', to_date('15:28', 'hh24:mi'), '49800', '대전', '서울', 1, 1, to_date('16:27', 'hh24:mi'), 40);
insert into tbltrain values (, 'KTX', to_date('14:41', 'hh24:mi'), '49800', '대구', '서울', 1, 1, to_date('16:27', 'hh24:mi'), 40);
insert into tbltrain values (, 'KTX', to_date('14:14', 'hh24:mi'), '49800', '울산', '서울', 1, 1, to_date('16:27', 'hh24:mi'), 40);