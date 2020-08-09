-- 관리자의 숙박업체 등록, 수정, 조회, 삭제
-- 숙박업체 조회 -완료
select * from tblhotelcompany ;
-- 숙박업체 등록  -완료
create or replace procedure prochocompanyinsert
(
    photelname varchar2,        -- 숙박업체 이름
    photeltel varchar2,         -- 전화번호
    paccountnum varchar2,       --계좌번호
    pbank VARCHAR2,              -- 은행
    pcompanyresistnum VARCHAR2 --사업자등록번호
    
)
is
begin
    insert into tblhotelcompany values((select max(hotelcompany_seq)+1 from tblhotelcompany), photelname, photeltel, paccountnum, pbank, pcompanyresistnum);
end;

select max(hotelcompany_seq)+1 from tblhotelcompany;
 

-- 숙박업체 수정 -완료
create or replace procedure prochocompanyupdate
(
    pnum number,   --숙박업체 번호
    photelname varchar2,        -- 숙박업체 이름
    photeltel varchar2,         -- 전화번호
    paccountnum varchar2,       --계좌번호
    pbank VARCHAR2,             -- 은행
    pcompanyresistnum VARCHAR2  --사업자등록번호
    
    
)
is
begin
    update tblhotelcompany set hotelname = photelname where hotelcompany_seq = pnum;
    update tblhotelcompany set hoteltel = photeltel where hotelcompany_seq = pnum;
    update tblhotelcompany set accountnum = paccountnum where hotelcompany_seq = pnum;
    update tblhotelcompany set bank = pbank where hotelcompany_seq = pnum;
    update tblhotelcompany set companyresistnum = pcompanyresistnum where hotelcompany_seq = pnum;
end;

-- 숙박업체 삭제 -완료
create or replace procedure prochocompanydelete
(
    
    pnum number   --숙박업체 번호
)
is
begin
   delete from tblhotelcompany where hotelcompany_seq = pnum;
end;

desc tblhotel;

-- 숙박업체 별 월 매출 조회(정산예정 금액)
create or replace view vwsales
as
select r.roomprice as 가격, hc.hotelname as 숙박업체명, hs.issuedate as 날짜
from tblroomreserv rr 
    inner join tblhotelschedule hs 
        on rr.hotelschedule_seq = hs.hotelschedule_seq
            inner join tblroom r 
                on r.room_seq = hs.room_seq
                    inner join tblhotel h 
                        on h.hotel_seq =r.hotel_seq
                            inner join tblhotelcompany hc
                                on hc.hotelcompany_seq = h.hotelcompany_seq 
                                    where rr.checkin is not null and rr.checkout is not null and 
                                        hs.issuedate between '2020-06-01' and '2020-06-30'
                                      order by hs.issuedate, h.hotel_seq;

-- 숙박업체 별로 총액 보기
select hc.hotelname as 숙박업체명, sum(r.roomprice) as 가격
from tblroomreserv rr 
    inner join tblhotelschedule hs 
        on rr.hotelschedule_seq = hs.hotelschedule_seq
            inner join tblroom r 
                on r.room_seq = hs.room_seq
                    inner join tblhotel h 
                        on h.hotel_seq =r.hotel_seq
                            inner join tblhotelcompany hc
                                on hc.hotelcompany_seq = h.hotelcompany_seq 
                                    where rr.checkin is not null and rr.checkout is not null and hs.issuedate between '2020-06-01' and '2020-06-30'
                                     group by hc.hotelname;
                                    


-- 정산표시를 위한 정산컬럼 추가
alter table tblroomreserv add(payment varchar2(30));
select * from tblroomreserv;

create or replace procedure procpayment(
    pname varchar2, --숙박시설명
    pdates date,    --시작날짜
    pdatel date     --끝 날짜
)
is
begin
    update tblroomreserv set payment = '정산완료' where roomreserv_seq = 
        (select rr.roomreserv_seq from tblroomreserv rr inner join
            tblhotelschedule hs 
                on rr.hotelschedule_seq = hs.hotelschedule_seq
                    inner join tblroom r on r.room_seq = hs.room_seq 
                         inner join tblhotel h 
                            on h.hotel_seq = r.hotel_seq
                              inner join tblhotelcompany hc
                                  on hc.hotelcompany_seq = h.hotel_seq where h.hotelname=pname and hs.issuedate between pdates and pdatel);
end;

    update tblroomreserv set payment = '정산완료' where roomreserv_seq = 
        (select rr.roomreserv_seq from tblroomreserv rr inner join
            tblhotelschedule hs 
                on rr.hotelschedule_seq = hs.hotelschedule_seq
                    inner join tblroom r on r.room_seq = hs.room_seq 
                         inner join tblhotel h 
                            on h.hotel_seq = r.hotel_seq
                              inner join tblhotelcompany hc
                                  on hc.hotelcompany_seq = h.hotel_seq where h.hotelname='라마다' and hs.issuedate between '2020-06-01' and '2020-06-01');




------------------------------------------숙박업체------------------------------------

-- 아이디나 고유번호를 받아서 걔네만 접근할 수 있게 만들어야 함
-- 숙박업체의 숙박시설 등록, 수정, 삭제, 조회
-- 숙박시설 조회 //완료
select h.hotel_seq , h.hotelname, h.hotelpicture, h.hoteldescription, hcg.hotelcategory, l.localname from tblhotel h inner join tbllocal l
    on h.local_seq = l.local_seq 
        inner join tblhotelcategory hcg
            on hcg.hotelcategory_seq = h.hotelcategory_seq where hotelcompany_seq=1;



-- 숙박시설 등록 //완료
create or replace procedure prochotelinsert
(
    photelname VARCHAR2,            --숙박시설 이름   
    photelpicture VARCHAR2,         --숙박시설 이미지  
    photeldescription VARCHAR2,     --숙박시설 설명
    photelcategory_seq number,      --숙박시설 카테고리번호
    photelcompany_seq number,       --숙박시설 숙박업체 번호
    plocal_seq number               --숙박시설 지역번호
)
is
begin
     insert into tblhotel values((select max(hotel_seq)+1 from tblhotel), photelname, photelpicture, photeldescription, photelcategory_seq, photelcompany_seq, plocal_seq);
end;

-- 숙박시설 수정 //완료
create or replace procedure prochotelupdate
(
    pnum number,              --숙박시설 번호
    photelname VARCHAR2,            --숙박시설 이름   
    photelpicture VARCHAR2,         --숙박시설 이미지  
    photeldescription VARCHAR2,     --숙박시설 설명
    photelcategory_seq number,      --숙박시설 카테고리번호
    plocal_seq number               --숙박시설 지역번호
)
is
begin
    update tblhotel set hotelname = photelname where hotel_seq = pnum;
    update tblhotel set hotelpicture = photelpicture where hotel_seq = pnum;
    update tblhotel set hoteldescription = photeldescription where hotel_seq = pnum;
    update tblhotel set hotelcategory_seq = photelcategory_seq where hotel_seq = pnum;
    update tblhotel set local_seq = plocal_seq where hotel_seq = pnum;

end;


-- 숙박시설 삭제 //완료
create or replace procedure prochoteldelete
(
    pnum number   --숙박업체 번호
)
is
begin
   delete from tblhotel where hotel_seq = pnum;
end;

-- 예약/ 결제내역 조회 //완료
create or replace view vwhotelreserv
as
select rr.roomreserv_seq as 예약번호, hc.hotelname as 숙박업체명,hc.hotelcompany_seq as 숙박업체번호, hs.issuedate as 날짜 ,  r.roomprice as 가격, m.memberid as 회원아이디
from tblroomreserv rr 
    inner join tblhotelschedule hs 
        on rr.hotelschedule_seq = hs.hotelschedule_seq
            inner join tblroom r 
                on r.room_seq = hs.room_seq
                    inner join tblhotel h 
                        on h.hotel_seq =r.hotel_seq
                            inner join tblhotelcompany hc
                                on hc.hotelcompany_seq = h.hotelcompany_seq 
                                    inner join tblmember m 
                                        on m.member_seq = rr.member_seq;
                                        
select * from vwhotelreserv where 숙박업체번호 = 1 and 날짜 between '2020-06-02' and '2020-06-03' order by 날짜 desc;                                       
                                        
                               
select * from tblroom;

-- 객실 조회, 등록, 수정, 삭제
-- 객실 조회 (객실 정보 -> 가격, N인실, 방이름, 숙박시설 이름) // 완료
select r.room_seq as "객실번호", r.roomname as "객실명", r.roomprice as "가격", r.roompersoncount as "수용인원"  from tblroom r 
    inner join tblhotel h 
        on r.hotel_seq = h.hotel_seq 
            inner join tblhotelcompany hc 
                on hc.hotelcompany_seq = h.hotelcompany_seq where hc.hotelcompany_seq =1 order by room_seq;

-- 객실 등록 //완료
create or replace procedure procroominsert
(
    pnum number,                            -- 숙박시설 번호
    proomprice number,                      -- 방 가격
    proompersoncount number,                 -- 방인원수
    proomname varchar2                              -- 방 이름
)
is
begin
     insert into tblroom values((select max(room_seq)+1 from tblroom), (select hotel_seq from tblhotel where hotelcompany_seq = pnum), proomprice, proompersoncount, proomname);
end;

select * from tblroom order by room_seq desc;


commit;
-- 객실 수정 //완료
create or replace procedure procroomupdate
(
    pnum number,                            -- 방 번호
    proomprice number,                      -- 방 가격
    proompersoncount number,                 -- 방인원수
    proomname varchar2                               -- 방이름
       
)
is
begin
    update tblroom set roomprice = proomprice where room_seq = pnum;
    update tblroom set roompersoncount = proompersoncount where room_seq = pnum;
    update tblroom set roomname = proomname where room_seq = pnum;
   
end;

-- 객실 삭제 //완료
create or replace procedure procroomdelete
(
    pnum number                         -- 방번호
)
is
begin
    delete from tblroom where room_seq = pnum;

end;



--체크인, 체크아웃 데이터 보는 뷰 // 완료
create or replace view vwcheckinout
as
select rr.roomreserv_seq as 예약번호, hc.hotelname as 숙박업체명,hc.hotelcompany_seq as 숙박업체번호, hs.issuedate as 날짜 ,  r.roomprice as 가격, m.memberid as 회원아이디, rr.checkin as 체크인시각, rr.checkout as 체크아웃시각
from tblroomreserv rr 
    inner join tblhotelschedule hs 
        on rr.hotelschedule_seq = hs.hotelschedule_seq
            inner join tblroom r 
                on r.room_seq = hs.room_seq
                    inner join tblhotel h 
                        on h.hotel_seq =r.hotel_seq
                            inner join tblhotelcompany hc
                                on hc.hotelcompany_seq = h.hotelcompany_seq 
                                    inner join tblmember m 
                                        on m.member_seq = rr.member_seq;

-- 체크인 //완료
create or replace procedure proccheckin
(
    pnum number, -- 방예약번호
    pcheckin date -- 체크인 시간
)
is
begin 
    update tblroomreserv set checkin = to_date(pcheckin ,'hh24:mi') where roomreserv_seq = pnum;
end;

select * from tblroomreserv;


    update tblroomreserv set checkin = to_date(pcheckin ,'hh24:mi') where roomreserv_seq = pnum;




--체크아웃 //완료
create or replace procedure proccheckout
(
    pnum number, -- 방예약번호
    pcheckout date -- 체크인 시간
)
is
begin 
    update tblroomreserv set checkout = to_char(pcheckout ,'hh24:mi') where roomreserv_seq = pnum;
end;







-- 객실별 예약 현황 조회//완료
-- 선택할 방 이름으로 검색

select to_char(hs.issuedate,'yyyy-mm-dd') as 날짜, r.roomname ,hs.hotelschedulestate as 예약현황 from tblhotelschedule hs
    inner join tblroom r
        on hs.room_seq = r.room_seq
            inner join tblhotel h
                on r.hotel_seq = h.hotel_seq 
                    inner join tblhotelcompany hc
                        on hc.hotelcompany_seq = h.hotelcompany_seq
                            where hc.hotelcompany_seq = 22 and r.roomname='스위트' and hs.issuedate between '2020-08-01' and '2020-08-10' order by hs.issuedate;
                            
select * from tblhotelschedule;


-- 정산 내역
-- 숙박업체 별 월 매출 조회(정산예정 금액)

select hc.hotelname as 숙박업체명,  sum(r.roomprice) as "매출 총액"
from tblroomreserv rr 
    inner join tblhotelschedule hs 
        on rr.hotelschedule_seq = hs.hotelschedule_seq
            inner join tblroom r 
                on r.room_seq = hs.room_seq
                    inner join tblhotel h 
                        on h.hotel_seq =r.hotel_seq
                            inner join tblhotelcompany hc
                                on hc.hotelcompany_seq = h.hotelcompany_seq  
                                    where hc.hotelcompany_seq =2 and rr.checkin is not null and rr.checkout is not null
                                      and hs.issuedate between '2020-06-01' and '2020-06-30'
                                            group by hc.hotelname;

-- 총액을 보는 뷰

select 숙박업체명 as 숙박업체명, sum(가격) as "매출총액" from vwsales group by 숙박업체명;

-- 숙박업체 별 월 매출 조회(정산예정 금액)
create or replace view vwsales
as
select r.roomprice as 가격, hc.hotelname as 숙박업체명, hs.issuedate as 날짜
from tblroomreserv rr 
    inner join tblhotelschedule hs 
        on rr.hotelschedule_seq = hs.hotelschedule_seq
            inner join tblroom r 
                on r.room_seq = hs.room_seq
                    inner join tblhotel h 
                        on h.hotel_seq =r.hotel_seq
                            inner join tblhotelcompany hc
                                on hc.hotelcompany_seq = h.hotelcompany_seq 
                                    where rr.checkin is not null and rr.checkout is not null and 
                                        hs.issuedate between '2020-06-01' and '2020-06-30'
                                      order by hs.issuedate, h.hotel_seq;

-- 숙박업체 별로 총액 보기
select hc.hotelname as 숙박업체명, sum(r.roomprice) as 가격
from tblroomreserv rr 
    inner join tblhotelschedule hs 
        on rr.hotelschedule_seq = hs.hotelschedule_seq
            inner join tblroom r 
                on r.room_seq = hs.room_seq
                    inner join tblhotel h 
                        on h.hotel_seq =r.hotel_seq
                            inner join tblhotelcompany hc
                                on hc.hotelcompany_seq = h.hotelcompany_seq 
                                    where rr.checkin is not null and rr.checkout is not null and hs.issuedate between '2020-06-01' and '2020-06-30'
                                     group by hc.hotelname;


-- 통계
-- 월별 예약 수 
select count(rr.roomreserv_seq) from tblroomreserv rr 
    inner join tblhotelschedule hs 
        on rr.hotelschedule_seq = hs.hotelschedule_seq
            inner join tblroom r 
                on r.room_seq = hs.room_seq
                    inner join tblhotel h 
                        on h.hotel_seq =r.hotel_seq
                            inner join tblhotelcompany hc
                                on hc.hotelcompany_seq = h.hotelcompany_seq 
                                    where hc.hotelcompany_seq = 1 and hs.issuedate between '2020-08-01' and '2020-08-31';
 


-- 업체정보 수정 //완료
create or replace procedure prochocompanyupdate
(
    pnum number,   --숙박업체 번호
    photelname varchar2,        -- 숙박업체 이름
    photeltel varchar2,         -- 전화번호
    paccountnum varchar2,       --계좌번호
    pbank VARCHAR2,             -- 은행
    pcompanyresistnum VARCHAR2  --사업자등록번호
    
    
)
is
begin
    update tblhotelcompany set hotelname = photelname where hotelcompany_seq = pnum;
    update tblhotelcompany set hoteltel = photeltel where hotelcompany_seq = pnum;
    update tblhotelcompany set accountnum = paccountnum where hotelcompany_seq = pnum;
    update tblhotelcompany set bank = pbank where hotelcompany_seq = pnum;
    update tblhotelcompany set companyresistnum = pcompanyresistnum where hotelcompany_seq = pnum;
end;

-------------------------------------------------------소비자---------------------------------------------------
--호텔조회하기 - 로컬
select * from tblhotel where local_seq = 1;

--호텔조회하기 - 로컬 + 카테고리
select * from tblhotel where local_seq = 1 and hotelcategory_seq =1;
--호텔 선택하여 정보보기
select * from tblhotel where local_seq = 1 and hotel_seq =1;

--호텔 리뷰 보기
select h.hotelname as 숙박시설명, hr.hotelreviewcontent as 후기, hr.hotelreviewgrade as 평점, m.memberid  from tblhotelreview hr 
    inner join tblroomreserv rr 
        on hr.roomreserv_seq = rr.roomreserv_seq
            inner join tblhotelschedule hs
                on rr.hotelschedule_seq = hs.hotelschedule_seq
                    inner join tblroom r 
                        on r.room_seq = hs.room_seq
                            inner join tblhotel h
                                on h.hotel_seq = r.hotel_seq
                                    inner join tblmember m 
                                        on rr.member_seq = m.member_seq;


select * from tblroomreserv;


--호텔 예약하기
-- 날짜 선택 -> 그 호텔의 예약가능한 방만 보여줌 
select r.roomname as 방이름, hs.issuedate as 날짜, hs.hotelschedulestate as 예약가능여부, r.roompersoncount as 수용인원, r.roomprice as 가격, hs.hotelschedule_seq as "예약가능 방번호" from tblhotelschedule hs
    inner join tblroom r 
        on hs.room_seq = r.room_seq
            inner join tblhotel h
                on r.hotel_seq = h.hotel_seq where h.hotel_seq=1 and hs.issuedate='2020-08-01' and  hs.hotelschedulestate ='가능';

-- 날짜별 방예약번호 선택하여 예약하기
create or replace procedure prochotelreserv
(
    photelschedule_seq number, -- 날짜별 방예약 번호
    ppeoplenum number,   -- 인원
    pmemberid varchar2      --예약회원 아이디

)

is
begin
    insert into tblroomreserv VALUES((select max(roomreserv_seq)+1 from tblroomreserv),'','',photelschedule_seq,ppeoplenum,pmemberid);
end;



--호텔 예약조회하기(예약번호, 호텔이름, 날짜, 방이름, 방가격, 인원)
select rr.roomreserv_seq as 예약번호, h.hotelname as 숙박시설명, hs.issuedate as 날짜, r.roomname as 방이름, r.roomprice as 방가격, rr.peoplenum as 인원 from tblroomreserv rr
    inner join tblhotelschedule hs 
        on hs.hotelschedule_seq = rr.hotelschedule_seq
            inner join tblroom r 
                on hs.room_seq = r.room_seq
                    inner join tblhotel h
                        on r.hotel_seq = h.hotel_seq 
                            inner join tblmember m 
                                on rr.member_seq = m.member_seq where m.member_seq= 3;


--호텔 예약취소하기
create or replace procedure prochotelcancle
(
    pnum number --호텔예약번호
)
is
begin
    delete from tblroomreserv where roomreserv_seq =pnum;
end;


commit;
