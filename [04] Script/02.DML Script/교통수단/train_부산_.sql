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
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '서울', 1, 1, to_date('20:36', 'hh24:mi'), 19);
insert into tbltrain values (train_seq.nextVal, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '서울', 1, 1, to_date('21:36', 'hh24:mi'), 20);
------------------------------------------------------------------------------------------------------------------------------------------------------------
update tbltrain set trainendtime = to_date('21:36', 'hh24:mi') where train_seq=20;
select * from tbltrain;
insert into tbltrain values (, '무궁화', to_date('05:45', 'hh24:mi'), '15800', '부산', '영등포', 1, 1, to_date('11:04', 'hh24:mi'), 11);
insert into tbltrain values (, '무궁화', to_date('05:45', 'hh24:mi'), '15800', '부산', '수원', 1, 1, to_date('10:42', 'hh24:mi'), 11);
insert into tbltrain values (, '무궁화', to_date('05:45', 'hh24:mi'), '15800', '부산', '평택', 1, 1, to_date('10:20', 'hh24:mi'), 11);
insert into tbltrain values (, '무궁화', to_date('05:45', 'hh24:mi'), '15800', '부산', '천안', 1, 1, to_date('10:01', 'hh24:mi'), 11);
insert into tbltrain values (, '무궁화', to_date('05:45', 'hh24:mi'), '15800', '부산', '조치원', 1, 1, to_date('09:38', 'hh24:mi'), 11);
insert into tbltrain values (, '무궁화', to_date('05:45', 'hh24:mi'), '15800', '부산', '신탄진', 1, 1, to_date('09:21', 'hh24:mi'), 11);
insert into tbltrain values (, '무궁화', to_date('05:45', 'hh24:mi'), '15800', '부산', '대전', 1, 1, to_date('09:09', 'hh24:mi'), 11);
insert into tbltrain values (, '무궁화', to_date('05:45', 'hh24:mi'), '15800', '부산', '영동', 1, 1, to_date('08:39', 'hh24:mi'), 11);
insert into tbltrain values (, '무궁화', to_date('05:45', 'hh24:mi'), '15800', '부산', '김천', 1, 1, to_date('08:11', 'hh24:mi'), 11);
insert into tbltrain values (, '무궁화', to_date('05:45', 'hh24:mi'), '15800', '부산', '구미', 1, 1, to_date('07:55', 'hh24:mi'), 11);
insert into tbltrain values (, '무궁화', to_date('05:45', 'hh24:mi'), '15800', '부산', '대구', 1, 1, to_date('07:22', 'hh24:mi'), 11);
insert into tbltrain values (, '무궁화', to_date('05:45', 'hh24:mi'), '15800', '부산', '동대구', 1, 1, to_date('07:15', 'hh24:mi'), 11);
insert into tbltrain values (, '무궁화', to_date('05:45', 'hh24:mi'), '15800', '부산', '밀양', 1, 1, to_date('06:34', 'hh24:mi'), 11);


insert into tbltrain values (, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '영등포', 1, 1, to_date('12:29', 'hh24:mi'), 12);
insert into tbltrain values (, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '안양', 1, 1, to_date('12:17', 'hh24:mi'), 12);
insert into tbltrain values (, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '수원', 1, 1, to_date('12:04', 'hh24:mi'), 12);
insert into tbltrain values (, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '평택', 1, 1, to_date('11:43', 'hh24:mi'), 12);
insert into tbltrain values (, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '천안', 1, 1, to_date('11:29', 'hh24:mi'), 12);
insert into tbltrain values (, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '조치원', 1, 1, to_date('11:07', 'hh24:mi'), 12);
insert into tbltrain values (, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '신탄진', 1, 1, to_date('10:50', 'hh24:mi'), 12);
insert into tbltrain values (, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '대전', 1, 1, to_date('10:38', 'hh24:mi'), 12);
insert into tbltrain values (, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '옥천', 1, 1, to_date('10:24', 'hh24:mi'), 12);
insert into tbltrain values (, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '영동', 1, 1, to_date('10:02', 'hh24:mi'), 12);
insert into tbltrain values (, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '김천', 1, 1, to_date('09:34', 'hh24:mi'), 12);
insert into tbltrain values (, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '구미', 1, 1, to_date('09:17', 'hh24:mi'), 12);
insert into tbltrain values (, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '대구', 1, 1, to_date('08:41', 'hh24:mi'), 12);
insert into tbltrain values (, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '동대구', 1, 1, to_date('08:35', 'hh24:mi'), 12);
insert into tbltrain values (, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '밀양', 1, 1, to_date('07:54', 'hh24:mi'), 12);
insert into tbltrain values (, '무궁화', to_date('07:02', 'hh24:mi'), '15800', '부산', '사상', 1, 1, to_date('07:13', 'hh24:mi'), 12);

insert into tbltrain values (, '무궁화', to_date('07:48', 'hh24:mi'), '15800', '부산', '영등포', 1, 1, to_date('13:09', 'hh24:mi'), 13);
insert into tbltrain values (, '무궁화', to_date('07:48', 'hh24:mi'), '15800', '부산', '수원', 1, 1, to_date('12:47', 'hh24:mi'), 13);
insert into tbltrain values (, '무궁화', to_date('07:48', 'hh24:mi'), '15800', '부산', '평택', 1, 1, to_date('12:26', 'hh24:mi'), 13);
insert into tbltrain values (, '무궁화', to_date('07:48', 'hh24:mi'), '15800', '부산', '천안', 1, 1, to_date('12:12', 'hh24:mi'), 13);
insert into tbltrain values (, '무궁화', to_date('07:48', 'hh24:mi'), '15800', '부산', '조치원', 1, 1, to_date('11:50', 'hh24:mi'), 13);
insert into tbltrain values (, '무궁화', to_date('07:48', 'hh24:mi'), '15800', '부산', '신탄진', 1, 1, to_date('11:33', 'hh24:mi'), 13);
insert into tbltrain values (, '무궁화', to_date('07:48', 'hh24:mi'), '15800', '부산', '대전', 1, 1, to_date('11:21', 'hh24:mi'), 13);
insert into tbltrain values (, '무궁화', to_date('07:48', 'hh24:mi'), '15800', '부산', '옥천', 1, 1, to_date('11:07', 'hh24:mi'), 13);
insert into tbltrain values (, '무궁화', to_date('07:48', 'hh24:mi'), '15800', '부산', '영동', 1, 1, to_date('10:48', 'hh24:mi'), 13);
insert into tbltrain values (, '무궁화', to_date('07:48', 'hh24:mi'), '15800', '부산', '추풍령', 1, 1, to_date('10:31', 'hh24:mi'), 13);
insert into tbltrain values (, '무궁화', to_date('07:48', 'hh24:mi'), '15800', '부산', '김천', 1, 1, to_date('10:17', 'hh24:mi'), 13);
insert into tbltrain values (, '무궁화', to_date('07:48', 'hh24:mi'), '15800', '부산', '구미', 1, 1, to_date('10:00', 'hh24:mi'), 13);
insert into tbltrain values (, '무궁화', to_date('07:48', 'hh24:mi'), '15800', '부산', '대구', 1, 1, to_date('09:27', 'hh24:mi'), 13);
insert into tbltrain values (, '무궁화', to_date('07:48', 'hh24:mi'), '15800', '부산', '동대구', 1, 1, to_date('09:21', 'hh24:mi'), 13);
insert into tbltrain values (, '무궁화', to_date('07:48', 'hh24:mi'), '15800', '부산', '밀양', 1, 1, to_date('08:37', 'hh24:mi'), 13);


insert into tbltrain values (, '무궁화', to_date('09:54', 'hh24:mi'), '15800', '부산', '영등포', 1, 1, to_date('15:22', 'hh24:mi'), 14);
insert into tbltrain values (, '무궁화', to_date('09:54', 'hh24:mi'), '15800', '부산', '수원', 1, 1, to_date('14:56', 'hh24:mi'), 14);
insert into tbltrain values (, '무궁화', to_date('09:54', 'hh24:mi'), '15800', '부산', '평택', 1, 1, to_date('14:36', 'hh24:mi'), 14);
insert into tbltrain values (, '무궁화', to_date('09:54', 'hh24:mi'), '15800', '부산', '천안', 1, 1, to_date('14:22', 'hh24:mi'), 14);
insert into tbltrain values (, '무궁화', to_date('09:54', 'hh24:mi'), '15800', '부산', '조치원', 1, 1, to_date('13:59', 'hh24:mi'), 14);
insert into tbltrain values (, '무궁화', to_date('09:54', 'hh24:mi'), '15800', '부산', '신탄진', 1, 1, to_date('13:43', 'hh24:mi'), 14);
insert into tbltrain values (, '무궁화', to_date('09:54', 'hh24:mi'), '15800', '부산', '대전', 1, 1, to_date('13:31', 'hh24:mi'), 14);
insert into tbltrain values (, '무궁화', to_date('09:54', 'hh24:mi'), '15800', '부산', '영동', 1, 1, to_date('12:58', 'hh24:mi'), 14);
insert into tbltrain values (, '무궁화', to_date('09:54', 'hh24:mi'), '15800', '부산', '김천', 1, 1, to_date('12:30', 'hh24:mi'), 14);
insert into tbltrain values (, '무궁화', to_date('09:54', 'hh24:mi'), '15800', '부산', '구미', 1, 1, to_date('12:13', 'hh24:mi'), 14);
insert into tbltrain values (, '무궁화', to_date('09:54', 'hh24:mi'), '15800', '부산', '대구', 1, 1, to_date('11:40', 'hh24:mi'), 14);
insert into tbltrain values (, '무궁화', to_date('09:54', 'hh24:mi'), '15800', '부산', '동대구', 1, 1, to_date('11:33', 'hh24:mi'), 14);
insert into tbltrain values (, '무궁화', to_date('09:54', 'hh24:mi'), '15800', '부산', '밀양', 1, 1, to_date('10:51', 'hh24:mi'), 14);


insert into tbltrain values (, '무궁화', to_date('11:52', 'hh24:mi'), '15800', '부산', '영등포', 1, 1, to_date('16:53', 'hh24:mi'), 15);
insert into tbltrain values (, '무궁화', to_date('11:52', 'hh24:mi'), '15800', '부산', '수원', 1, 1, to_date('16:31', 'hh24:mi'), 15);
insert into tbltrain values (, '무궁화', to_date('11:52', 'hh24:mi'), '15800', '부산', '평택', 1, 1, to_date('16:10', 'hh24:mi'), 15);
insert into tbltrain values (, '무궁화', to_date('11:52', 'hh24:mi'), '15800', '부산', '천안', 1, 1, to_date('15:56', 'hh24:mi'), 15);
insert into tbltrain values (, '무궁화', to_date('11:52', 'hh24:mi'), '15800', '부산', '조치원', 1, 1, to_date('15:35', 'hh24:mi'), 15);
insert into tbltrain values (, '무궁화', to_date('11:52', 'hh24:mi'), '15800', '부산', '대전', 1, 1, to_date('15:10', 'hh24:mi'), 15);
insert into tbltrain values (, '무궁화', to_date('11:52', 'hh24:mi'), '15800', '부산', '옥천', 1, 1, to_date('14:56', 'hh24:mi'), 15);
insert into tbltrain values (, '무궁화', to_date('11:52', 'hh24:mi'), '15800', '부산', '영동', 1, 1, to_date('14:37', 'hh24:mi'), 15);
insert into tbltrain values (, '무궁화', to_date('11:52', 'hh24:mi'), '15800', '부산', '김천', 1, 1, to_date('14:09', 'hh24:mi'), 15);
insert into tbltrain values (, '무궁화', to_date('11:52', 'hh24:mi'), '15800', '부산', '구미', 1, 1, to_date('13:52', 'hh24:mi'), 15);
insert into tbltrain values (, '무궁화', to_date('11:52', 'hh24:mi'), '15800', '부산', '대구', 1, 1, to_date('13:19', 'hh24:mi'), 15);
insert into tbltrain values (, '무궁화', to_date('11:52', 'hh24:mi'), '15800', '부산', '동대구', 1, 1, to_date('13:13', 'hh24:mi'), 15);
insert into tbltrain values (, '무궁화', to_date('11:52', 'hh24:mi'), '15800', '부산', '밀양', 1, 1, to_date('12:32', 'hh24:mi'), 15);

insert into tbltrain values (, '무궁화', to_date('12:45', 'hh24:mi'), '15800', '부산', '영등포', 1, 1, to_date('18:01', 'hh24:mi'), 16);
insert into tbltrain values (, '무궁화', to_date('12:45', 'hh24:mi'), '15800', '부산', '수원', 1, 1, to_date('17:39', 'hh24:mi'), 16);
insert into tbltrain values (, '무궁화', to_date('12:45', 'hh24:mi'), '15800', '부산', '평택', 1, 1, to_date('17:18', 'hh24:mi'), 16);
insert into tbltrain values (, '무궁화', to_date('12:45', 'hh24:mi'), '15800', '부산', '천안', 1, 1, to_date('17:04', 'hh24:mi'), 16);
insert into tbltrain values (, '무궁화', to_date('12:45', 'hh24:mi'), '15800', '부산', '조치원', 1, 1, to_date('16:43', 'hh24:mi'), 16);
insert into tbltrain values (, '무궁화', to_date('12:45', 'hh24:mi'), '15800', '부산', '대전', 1, 1, to_date('16:18', 'hh24:mi'), 16);
insert into tbltrain values (, '무궁화', to_date('12:45', 'hh24:mi'), '15800', '부산', '옥천', 1, 1, to_date('16:04', 'hh24:mi'), 16);
insert into tbltrain values (, '무궁화', to_date('12:45', 'hh24:mi'), '15800', '부산', '영동', 1, 1, to_date('15:45', 'hh24:mi'), 16);
insert into tbltrain values (, '무궁화', to_date('12:45', 'hh24:mi'), '15800', '부산', '추풍령', 1, 1, to_date('15:29', 'hh24:mi'), 16);
insert into tbltrain values (, '무궁화', to_date('12:45', 'hh24:mi'), '15800', '부산', '김천', 1, 1, to_date('15:14', 'hh24:mi'), 16);
insert into tbltrain values (, '무궁화', to_date('12:45', 'hh24:mi'), '15800', '부산', '구미', 1, 1, to_date('14:58', 'hh24:mi'), 16);
insert into tbltrain values (, '무궁화', to_date('12:45', 'hh24:mi'), '15800', '부산', '대구', 1, 1, to_date('14:22', 'hh24:mi'), 16);
insert into tbltrain values (, '무궁화', to_date('12:45', 'hh24:mi'), '15800', '부산', '동대구', 1, 1, to_date('14:15', 'hh24:mi'), 16);
insert into tbltrain values (, '무궁화', to_date('12:45', 'hh24:mi'), '15800', '부산', '밀양', 1, 1, to_date('13:31', 'hh24:mi'), 16);

insert into tbltrain values (, '무궁화', to_date('13:36', 'hh24:mi'), '15800', '부산', '영등포', 1, 1, to_date('18:56', 'hh24:mi'), 17);
insert into tbltrain values (, '무궁화', to_date('13:36', 'hh24:mi'), '15800', '부산', '안양', 1, 1, to_date('18:41', 'hh24:mi'), 17);
insert into tbltrain values (, '무궁화', to_date('13:36', 'hh24:mi'), '15800', '부산', '수원', 1, 1, to_date('18:28', 'hh24:mi'), 17);
insert into tbltrain values (, '무궁화', to_date('13:36', 'hh24:mi'), '15800', '부산', '평택', 1, 1, to_date('18:07', 'hh24:mi'), 17);
insert into tbltrain values (, '무궁화', to_date('13:36', 'hh24:mi'), '15800', '부산', '천안', 1, 1, to_date('17:53', 'hh24:mi'), 17);
insert into tbltrain values (, '무궁화', to_date('13:36', 'hh24:mi'), '15800', '부산', '조치원', 1, 1, to_date('17:31', 'hh24:mi'), 17);
insert into tbltrain values (, '무궁화', to_date('13:36', 'hh24:mi'), '15800', '부산', '신탄진', 1, 1, to_date('17:15', 'hh24:mi'), 17);
insert into tbltrain values (, '무궁화', to_date('13:36', 'hh24:mi'), '15800', '부산', '대전', 1, 1, to_date('17:03', 'hh24:mi'), 17);
insert into tbltrain values (, '무궁화', to_date('13:36', 'hh24:mi'), '15800', '부산', '옥천', 1, 1, to_date('16:49', 'hh24:mi'), 17);
insert into tbltrain values (, '무궁화', to_date('13:36', 'hh24:mi'), '15800', '부산', '영동', 1, 1, to_date('16:30', 'hh24:mi'), 17);
insert into tbltrain values (, '무궁화', to_date('13:36', 'hh24:mi'), '15800', '부산', '김천', 1, 1, to_date('15:59', 'hh24:mi'), 17);
insert into tbltrain values (, '무궁화', to_date('13:36', 'hh24:mi'), '15800', '부산', '구미', 1, 1, to_date('15:42', 'hh24:mi'), 17);
insert into tbltrain values (, '무궁화', to_date('13:36', 'hh24:mi'), '15800', '부산', '대구', 1, 1, to_date('15:09', 'hh24:mi'), 17);
insert into tbltrain values (, '무궁화', to_date('13:36', 'hh24:mi'), '15800', '부산', '동대구', 1, 1, to_date('15:03', 'hh24:mi'), 17);
insert into tbltrain values (, '무궁화', to_date('13:36', 'hh24:mi'), '15800', '부산', '밀양', 1, 1, to_date('14:22', 'hh24:mi'), 17);


insert into tbltrain values (, '무궁화', to_date('14:05', 'hh24:mi'), '15800', '부산', '영등포', 1, 1, to_date('19:26', 'hh24:mi'), 18);
insert into tbltrain values (, '무궁화', to_date('14:05', 'hh24:mi'), '15800', '부산', '안양', 1, 1, to_date('19:11', 'hh24:mi'), 18);
insert into tbltrain values (, '무궁화', to_date('14:05', 'hh24:mi'), '15800', '부산', '수원', 1, 1, to_date('18:58', 'hh24:mi'), 18);
insert into tbltrain values (, '무궁화', to_date('14:05', 'hh24:mi'), '15800', '부산', '평택', 1, 1, to_date('18:37', 'hh24:mi'), 18);
insert into tbltrain values (, '무궁화', to_date('14:05', 'hh24:mi'), '15800', '부산', '천안', 1, 1, to_date('18:23', 'hh24:mi'), 18);
insert into tbltrain values (, '무궁화', to_date('14:05', 'hh24:mi'), '15800', '부산', '조치원', 1, 1, to_date('18:01', 'hh24:mi'), 18);
insert into tbltrain values (, '무궁화', to_date('14:05', 'hh24:mi'), '15800', '부산', '신탄진', 1, 1, to_date('17:45', 'hh24:mi'), 18);
insert into tbltrain values (, '무궁화', to_date('14:05', 'hh24:mi'), '15800', '부산', '대전', 1, 1, to_date('17:33', 'hh24:mi'), 18);
insert into tbltrain values (, '무궁화', to_date('14:05', 'hh24:mi'), '15800', '부산', '옥천', 1, 1, to_date('17:19', 'hh24:mi'), 18);
insert into tbltrain values (, '무궁화', to_date('14:05', 'hh24:mi'), '15800', '부산', '영동', 1, 1, to_date('17:00', 'hh24:mi'), 18);
insert into tbltrain values (, '무궁화', to_date('14:05', 'hh24:mi'), '15800', '부산', '김천', 1, 1, to_date('16:29', 'hh24:mi'), 18);
insert into tbltrain values (, '무궁화', to_date('14:05', 'hh24:mi'), '15800', '부산', '구미', 1, 1, to_date('16:12', 'hh24:mi'), 18);
insert into tbltrain values (, '무궁화', to_date('14:05', 'hh24:mi'), '15800', '부산', '대구', 1, 1, to_date('15:39', 'hh24:mi'), 18);
insert into tbltrain values (, '무궁화', to_date('14:05', 'hh24:mi'), '15800', '부산', '동대구', 1, 1, to_date('15:33', 'hh24:mi'), 18);
insert into tbltrain values (, '무궁화', to_date('14:05', 'hh24:mi'), '15800', '부산', '밀양', 1, 1, to_date('14:52', 'hh24:mi'), 18);

insert into tbltrain values (, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '영등포', 1, 1, to_date('20:26', 'hh24:mi'), 19);
insert into tbltrain values (, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '안양', 1, 1, to_date('20:11', 'hh24:mi'), 19);
insert into tbltrain values (, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '수원', 1, 1, to_date('19:58', 'hh24:mi'), 19);
insert into tbltrain values (, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '평택', 1, 1, to_date('19:37', 'hh24:mi'), 19);
insert into tbltrain values (, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '천안', 1, 1, to_date('19:23', 'hh24:mi'), 19);
insert into tbltrain values (, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '조치원', 1, 1, to_date('19:01', 'hh24:mi'), 19);
insert into tbltrain values (, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '신탄진', 1, 1, to_date('19:45', 'hh24:mi'), 19);
insert into tbltrain values (, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '대전', 1, 1, to_date('18:33', 'hh24:mi'), 19);
insert into tbltrain values (, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '옥천', 1, 1, to_date('18:19', 'hh24:mi'), 19);
insert into tbltrain values (, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '영동', 1, 1, to_date('18:00', 'hh24:mi'), 19);
insert into tbltrain values (, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '김천', 1, 1, to_date('17:29', 'hh24:mi'), 19);
insert into tbltrain values (, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '구미', 1, 1, to_date('17:12', 'hh24:mi'), 19);
insert into tbltrain values (, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '대구', 1, 1, to_date('16:39', 'hh24:mi'), 19);
insert into tbltrain values (, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '동대구', 1, 1, to_date('16:33', 'hh24:mi'), 19);
insert into tbltrain values (, '무궁화', to_date('15:05', 'hh24:mi'), '15800', '부산', '밀양', 1, 1, to_date('15:52', 'hh24:mi'), 19);

insert into tbltrain values (, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '영등포', 1, 1, to_date('21:26', 'hh24:mi'), 20);
insert into tbltrain values (, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '안양', 1, 1, to_date('21:11', 'hh24:mi'), 20);
insert into tbltrain values (, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '수원', 1, 1, to_date('20:58', 'hh24:mi'), 20);
insert into tbltrain values (, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '평택', 1, 1, to_date('20:37', 'hh24:mi'), 20);
insert into tbltrain values (, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '천안', 1, 1, to_date('20:23', 'hh24:mi'), 20);
insert into tbltrain values (, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '조치원', 1, 1, to_date('20:01', 'hh24:mi'), 20);
insert into tbltrain values (, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '신탄진', 1, 1, to_date('20:45', 'hh24:mi'), 20);
insert into tbltrain values (, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '대전', 1, 1, to_date('19:33', 'hh24:mi'), 20);
insert into tbltrain values (, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '옥천', 1, 1, to_date('19:19', 'hh24:mi'), 20);
insert into tbltrain values (, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '영동', 1, 1, to_date('19:00', 'hh24:mi'), 20);
insert into tbltrain values (, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '김천', 1, 1, to_date('18:29', 'hh24:mi'), 20);
insert into tbltrain values (, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '구미', 1, 1, to_date('18:12', 'hh24:mi'), 20);
insert into tbltrain values (, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '대구', 1, 1, to_date('17:39', 'hh24:mi'), 20);
insert into tbltrain values (, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '동대구', 1, 1, to_date('17:33', 'hh24:mi'), 20);
insert into tbltrain values (, '무궁화', to_date('16:05', 'hh24:mi'), '15800', '부산', '밀양', 1, 1, to_date('16:52', 'hh24:mi'), 20);






