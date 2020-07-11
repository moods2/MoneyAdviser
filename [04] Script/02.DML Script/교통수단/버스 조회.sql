select DISTINCT bus_seq 
    as 버스번호 ,d.busstationloca as 출발지, to_char(busstarttime,'hh24:mi') as 출발시간,bustime as 소요시간,  e.*,  busprice as 가격 
        from (select DISTINCT b.busstationloca as 도착지    
        from tblbus a
        inner join tblbusstation b
            on a.abusstation_seq2 = b.busstation_seq
            where a.sbusstation_seq = 1 and a.abusstation_seq2 = 11) e,
        tblbus c
        inner join tblbusstation d
            on c.sbusstation_seq = d.busstation_seq
             where c.sbusstation_seq = 1 and c.abusstation_seq2 = 11
                order by c.bus_seq;
                
select busstation_seq as 터미널번호, busstationloca as 지역, busstationname as 터미널명 from tblbusstation;               

select * from tblbus;
            
select DISTINCT b.busstationloca    
        from tblbus a
        inner join tblbusstation b
            on a.abusstation_seq2 = b.busstation_seq
            where b.busstationloca = '서울';
            
            
;           
            
            