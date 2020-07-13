select DISTINCT reserv.transreservdate as 결제일, train.traintype as 기차종류, a.trainstationname as 출발역, to_char(train.trainstart_time,'hh24:mi') as 출발시간, to_char(train.trainarrive_time,'hh24:mi') as 도착시간,train.trainprice * reserv.transreservcount as 가격
    from tbltransreserv reserv
        INNER join tbltrain train
            on reserv.train_seq = train.train_seq
                inner join tbltrainstation a
                    on train.strainstation_seq = a.trainstation_seq
                where member_seq = 117;
                
select DISTINCT reserv.transreservdate as 결제일, train.traintype as 기차종류, a.trainstationname as 출발역, to_char(train.trainstart_time,'hh24:mi') as 출발시간,
--to_char(train.trainarrive_time,'hh24:mi') as 도착시간,
train.trainprice * reserv.transreservcount as 가격
    from tbltransreserv reserv
        INNER join tbltrain train
            on reserv.train_seq = train.train_seq
                inner join tbltrainstation a
                    on train.strainstation_seq = a.trainstation_seq
                where member_seq = 117 
                    order by reserv.transreservdate;
                    
                    
select DISTINCT reserv.transreservdate as 결제일, a.busstationloca as 출발지, to_char(bus.busstarttime,'hh24:mi') as 출발시간, bus.busprice * reserv.transreservcount as 가격
    from tbltransreserv reserv
        INNER join tblbus bus
            on reserv.bus_seq = bus.bus_seq
                right outer join tblbusstation a
                    on bus.sbusstation_seq = a.busstation_seq
                where member_seq = 117 
                    order by reserv.transreservdate;                    
                                
                

select DISTINCT reserv.transreservdate as 결제일, train.traintype as 기차종류, a.trainstationname as 출발역, to_char(train.trainstart_time,'hh24:mi') as 출발시간, e.*, to_char(train.trainarrive_time,'hh24:mi') as 도착시간,train.trainprice * reserv.transreservcount as 가격
    from (select DISTINCT b.trainstationname as 도착역
    from tbltransreserv reserv2
        INNER join tbltrain train2
            on reserv2.train_seq = train2.train_seq
                inner join tbltrainstation b
                    on train2.atrainstation_seq = b.trainstation_seq
                where member_seq = 117) e,
                tbltransreserv reserv
        INNER join tbltrain train
            on reserv.train_seq = train.train_seq
                inner join tbltrainstation a
                    on train.strainstation_seq = a.trainstation_seq
                where member_seq = 117;         
                
                
select b.trainstationname as 도착역
    from tbltransreserv reserv2
        INNER join tbltrain train2
            on reserv2.train_seq = train2.train_seq
                inner join tbltrainstation b
                    on train2.strainstation_seq = b.trainstation_seq
                where member_seq = 117                
                
                
                
                
                
                
                
                
                
select DISTINCT reserv.transreservdate as 결제일, train.traintype as 기차종류, a.trainstationname as 출발역, to_char(train.trainstart_time,'hh24:mi') as 출발시간,
--to_char(train.trainarrive_time,'hh24:mi') as 도착시간,
train.trainprice * reserv.transreservcount as 가격
    from tbltransreserv reserv
        INNER join tbltrain train
            on reserv.train_seq = train.train_seq
                inner join tbltrainstation a
                    on train.strainstation_seq = a.trainstation_seq
                where member_seq = 117 
                    order by reserv.transreservdate;
                    


select DISTINCT reserv.transreservdate as 결제일, a.busstationloca as 출발지, to_char(bus.busstarttime,'hh24:mi') as 출발시간, d.* ,bus.busprice * reserv.transreservcount as 가격
    from (select b.busstationloca as 도착지
    from tbltransreserv reserv
        INNER join tblbus bus2
            on reserv.bus_seq = bus2.bus_seq
                inner join tblbusstation b
                    on bus2.abusstation_seq2 = b.busstation_seq
                where member_seq = 117 ) d,
                tbltransreserv reserv
        INNER join tblbus bus
            on reserv.bus_seq = bus.bus_seq
                right outer join tblbusstation a
                    on bus.sbusstation_seq = a.busstation_seq
                where member_seq = 117 
                    order by reserv.transreservdate;
                    
                    
select DISTINCT b.busstationloca as 도착지
    from tbltransreserv reserv
        INNER join tblbus bus2
            on reserv.bus_seq = bus2.bus_seq
                inner join tblbusstation b
                    on bus2.abusstation_seq2 = b.busstation_seq
                where member_seq = 117 
                                        
                    
select * from tblbus;                    
                                     
                                     
                                     
                                     
                                     
                                     
select DISTINCT reserv.transreservdate as 결제일, train.traintype as 기차종류, a.trainstationname as 출발역, to_char(train.trainstart_time,'hh24:mi') as 출발시간,
--to_char(train.trainarrive_time,'hh24:mi') as 도착시간,
train.trainprice * reserv.transreservcount as 가격
    from tbltransreserv reserv
        INNER join tbltrain train
            on reserv.train_seq = train.train_seq
                inner join tbltrainstation a
                    on train.strainstation_seq = a.trainstation_seq
                where member_seq = 117 
                    order by reserv.transreservdate;
                    
                    
select DISTINCT reserv.transreservdate as 결제일, a.busstationloca as 출발지, to_char(bus.busstarttime,'hh24:mi') as 출발시간, bus.busprice * reserv.transreservcount as 가격
    from tbltransreserv reserv
        INNER join tblbus bus
            on reserv.bus_seq = bus.bus_seq
                right outer join tblbusstation a
                    on bus.sbusstation_seq = a.busstation_seq
                where member_seq = 117 
                    order by reserv.transreservdate;     
                    
                    
                    