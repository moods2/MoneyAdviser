select DISTINCT g.transreservdate as 결재날짜, 
c.bus_seq as 버스번호 ,d.busstationloca as 출발지, to_char(busstarttime,'hh24:mi') as 출발시간,bustime as 소요시간,  e.*,  busprice as 가격 
        from (select DISTINCT b.busstationloca as 도착지    
        from tblbus a
        inner join tblbusstation b
            on a.abusstation_seq2 = b.busstation_seq
            where a.sbusstation_seq = 1 and a.abusstation_seq2 = 11) e,
        tblbus c        
        inner join tblbusstation d
            on c.sbusstation_seq = d.busstation_seq
                inner join tbltransreserv g
                    on c.bus_seq = g.bus_seq
             where c.bus_seq = 1 order by c.bus_seq;
             
select transreservdate as 결재날짜, transreservcount as 인원  from tbltransreserv where member_seq = 2;  


select distinct  g.transreservdate as 결재날짜, traintype as 기차종류, e.* ,
to_char(trainstart_time,'hh24:mi') as 출발시간, d.trainstationname as 도착기차역 ,
to_char(trainarrive_time,'hh24:mi') as 도착시간,trainprice as 가격, trans_seq as 기차번호
from
(select  b.trainstationname as 출발기차역
from tbltrain a
inner join tbltrainstation b
on a.Strainstation_seq = b.trainstation_seq
where traintype = '무궁화' and a.Strainstation_seq = 1 and a.Atrainstation_seq = 15) e,
tbltrain c
inner join tbltrainstation d
on c.Atrainstation_seq = d.trainstation_seq
inner join tbltransreserv g
                    on c.train_seq = g.train_seq
where traintype = '무궁화' and c.Strainstation_seq = 1 and c.Atrainstation_seq = 15
order by c.trans_seq;


select * from tbltransreserv;
                
select a.transreservdate as 결재날짜, a.transreservcount as 인원수, a.member_seq, 
from tbltransreserv a,
    tblbus b,
    tblbusstation c;
select * from tblbus;
                
select busstation_seq as 터미널번호, busstationloca as 지역, busstationname as 터미널명 from tblbusstation;               

select * from tblbus;
            
select DISTINCT b.busstationloca    
        from tblbus a
        inner join tblbusstation b
            on a.abusstation_seq2 = b.busstation_seq
            where b.busstationloca = '서울';
            
            
;           
            
select * from tblmember;         

select * from tbltransreserv;

select * from tbltrain;

insert into tbltransreserv values (transreserv_seq.nextval,to_date('08-01', 'MM-DD'),3,1,(null),1);
