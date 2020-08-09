package main;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class BusTrainAdmin {
	private static Connection conn = null;
    private static Statement stat = null;
    private static ResultSet rs = null;
    private static DBUtil util = new DBUtil();

	public void printBusTrain() {
		Scanner scan = new Scanner(System.in);
		System.out.println("============================================================");
        System.out.println("      [교통수단 예매조회]");
        System.out.println("============================================================");
        System.out.println("1 :       [기차 예매조회]");
        System.out.println("2 :       [버스 예매조회]");
        System.out.println("============================================================");
        System.out.println("번호 : ");
        String num = scan.nextLine();
        
        switch(num) {
        //기차 예매조회
        case "1":
        	printtrainAdmin1();
        	break;
        //버스 예매조회
        case "2":
        	printbusAdmin1();
        	break;
		
        }
	}
	

	//버스 예매조회 메소드
	private void printbusAdmin1() {
		Scanner scan = new Scanner(System.in);
		System.out.println("============================================================");
		System.out.println("      [버스 예매조회]");
        System.out.println("============================================================");
        System.out.println("1.       [버스 날짜별 조회]");
        System.out.println("2.       [버스 출발지별 조회]");
        System.out.println("============================================================");
        String num = scan.nextLine();
        
        switch(num) {
        //버스 날짜별 조회
        case "1":
        	printbusdate();
        	break;
        //버스 출발지별 조회
        case "2":
        	printbusstart();
        	break;
        }
        
		
	}


	//버스 출발지별 조회
	private void printbusstart() {
		
		int cnt = 0;
		Scanner scan = new Scanner(System.in);
		System.out.println("============================================================");
		System.out.println("      [버스 출발지]");
        System.out.println("============================================================");
        
        try {
            conn = util.open();
            stat = conn.createStatement();
            
            String sql1 = "select busstationloca from tblbusstation";
            
            rs = stat.executeQuery(sql1);
            while (rs.next()) { //역번호, 역이름  도착기준
               
               String result = String.format("%s",rs.getString("busstationloca"));            

               
               System.out.println(result); 
            }
                               
            conn.close();
            stat.close();
		
        } catch(Exception e) {
		
        }
        
        System.out.println("============================================================");
		System.out.print("출발지 입력 : ");
		String name = scan.nextLine();
		
		
		  try {
              conn = util.open();
              stat = conn.createStatement();
              rs = null;

              String sql2 = String.format("select DISTINCT  reserv.transreservdate as 결제일,b.busstationloca as 출발지, to_char(bus.busstarttime,'hh24:mi') as 출발시간,a.busstationloca as 도착지,   bus.bustime as 도착시간,bus.busprice * reserv.transreservcount as 가격" + 
              		"    from tbltransreserv reserv" + 
              		"        INNER join tblbus bus" + 
              		"            on reserv.bus_seq = bus.bus_seq            " + 
              		"                inner join tblbusstation a" + 
              		"                    on bus.abusstation_seq2 = a.busstation_seq" + 
              		"                        inner join tblbusstation b" + 
              		"                            on bus.sbusstation_seq = b.busstation_seq" + 
              		"                                where b.busstationloca = '%s'" + 
              		"                                    order by reserv.transreservdate  ", name);
              
              rs = stat.executeQuery(sql2);

              
              System.out.printf("========================================================[%s 예매확인]=============================================================\r\n", name);
              System.out.println("[버스번호]\t[출발지]\t[출발시간]\t[소요시간]\t[도착지]\t[가격]");
              while (rs.next()) { //역번호, 역이름  도착기준
                 
            	  cnt++;
                  String result = String.format("%s\t%s\t%s\t%s\t%s\t%s",rs.getString("결제일"),rs.getString("출발지"),rs.getString("출발시간"),rs.getString("도착지"),rs.getString("도착시간"),rs.getString("가격"));   
            	  
                  System.out.println(result); 
            	 if(cnt == 30) {
            		 System.out.println("============================================================");
            		 System.out.print("더보기?(Y/N) : ");
            		 String answer = scan.nextLine();
            		 if(answer.equals("Y")) {
            			 cnt=0;
            		 } else {
            			 break;
            		 }
            	 }
            	  

              }
              rs.close();                     
              conn.close();
              stat.close();
		
	} catch(Exception e) {
		
	}
		
	}


	//버스 날짜별 조회
	private void printbusdate() {
		int cnt = 0;
		Scanner scan = new Scanner(System.in);
		System.out.println("============================================================");
		System.out.println("      [버스 결제날짜]");
        System.out.println("============================================================");
        System.out.print("입력(MM-DD형식) :  ");
        String date = scan.nextLine();
        
		
		
		  try {
              conn = util.open();
              stat = conn.createStatement();
              
              String sql1 = String.format("select DISTINCT  reserv.transreservdate as 결제일,b.busstationloca as 출발지, to_char(bus.busstarttime,'hh24:mi') as 출발시간,a.busstationloca as 도착지,   bus.bustime,bus.busprice * reserv.transreservcount as 가격" + 
              		"    from tbltransreserv reserv" + 
              		"        INNER join tblbus bus" + 
              		"            on reserv.bus_seq = bus.bus_seq" + 
              		"                inner join tblbusstation a" + 
              		"                    on bus.abusstation_seq2 = a.busstation_seq" + 
              		"                        inner join tblbusstation b" + 
              		"                            on bus.sbusstation_seq = b.busstation_seq" + 
              		"                                where reserv.transreservdate = '2020-%s'" + 
              		"                                    order by reserv.transreservdate  ", date);
              
              rs = stat.executeQuery(sql1);

              
              System.out.printf("========================================================[%s 예매확인]=============================================================", date);
              System.out.println("================================================================================================================================");
              System.out.println("[버스번호]\t[출발지]\t[출발시간]\t[소요시간]\t[도착지]\t[가격]");
              while (rs.next()) { //역번호, 역이름  도착기준
                 cnt++;
                 String result = String.format("%s\t%s\t%s\t%s\t%s\t%s",rs.getString("버스번호"),rs.getString("출발지"),rs.getString("출발시간"),rs.getString("소요시간"),rs.getString("도착지"),rs.getString("가격"));            

                 
                 System.out.println(result); 
                 
                 if(cnt == 30) {
            		 System.out.println("============================================================");
            		 System.out.print("더보기?(Y/N) : ");
            		 String answer = scan.nextLine();
            		 if(answer.equals("Y")) {
            			 cnt=0;
            		 } else {
            			 break;
            		 }
            	 }
              }
              rs.close();                     
              conn.close();
              stat.close();
		
	} catch(Exception e) {
		
	}
		
	}


	//기차 예매조회 메소드
	private void printtrainAdmin1() {
		
		
		Scanner scan = new Scanner(System.in);
		System.out.println("============================================================");
		System.out.println("      [기차 예매조회]");
        System.out.println("============================================================");
        System.out.println("1.       [기차 종류별 조회]");
        System.out.println("2.       [기차 날짜별 조회]");
        System.out.println("============================================================");
        String num = scan.nextLine();
        
        switch(num) {
        //기차 종류별 조회
        case "1":
        	printtraintype();
        	break;
        //기차 날짜별 조회
        case "2":
        	printraindate();
        	break;
        }
        
        
	}//printtrainAdmin


	
	//기차 날자별 조회
	private void printraindate() {
		int cnt=0;
		Scanner scan = new Scanner(System.in);
		System.out.println("============================================================");
		System.out.println("      [기차 결제날짜]");
        System.out.println("============================================================");
        System.out.print("입력(MM-DD형식) :  ");
        String date = scan.nextLine();
        
		
		
		  try {
              conn = util.open();
              stat = conn.createStatement();
              
              String sql1 = String.format("select DISTINCT reserv.transreservdate as 결제일, train.traintype as 기차종류, a.trainstationname as 출발역, to_char(train.trainstart_time,'hh24:mi') as 출발시간," + 
              		"b.trainstationname as 도착역,to_char(train.trainarrive_time,'hh24:mi') as 도착시간," + 
              		"train.trainprice * reserv.transreservcount as 가격" + 
              		"    from tbltransreserv reserv" + 
              		"        INNER join tbltrain train" + 
              		"            on reserv.train_seq = train.train_seq" + 
              		"                inner join tbltrainstation a" + 
              		"                    on train.strainstation_seq = a.trainstation_seq" + 
              		"                        inner join tbltrainstation b" + 
              		"                            on train.atrainstation_seq = b.trainstation_seq" + 
              		"                                where reserv.transreservdate = '2020-%s'" + 
              		"                                    order by reserv.transreservdate  ", date);
              
              rs = stat.executeQuery(sql1);

              
              System.out.printf("========================================================[%s 예매확인]=============================================================", date);
              System.out.println("================================================================================================================================");
              System.out.println("[결제일]\t[기차종류]\t[출발역]\t[출발시간]\t[도착역]\t[도착시간]\t[가격]");
              while (rs.next()) { //역번호, 역이름  도착기준
                 cnt++;
                 String result = String.format("%s\t%s\t%s\t%s\t%s\t%s\t%s",rs.getString("결제일"),rs.getString("기차종류"),rs.getString("출발역"),rs.getString("출발시간"),rs.getString("도착역"),rs.getString("도착시간"),rs.getString("가격"));            
             
                 
                 System.out.println(result); 
                 if(cnt == 30) {
            		 System.out.println("============================================================");
            		 System.out.print("더보기?(Y/N) : ");
            		 String answer = scan.nextLine();
            		 if(answer.equals("Y")) {
            			 cnt=0;
            		 } else {
            			 break;
            		 }
            	 }
              }
              rs.close();                     
              conn.close();
              stat.close();
		
	} catch(Exception e) {
		
	}
		
	}


	//기차 종류별 조회 메소드
	private void printtraintype() {
		
		int cnt=0;
		Scanner scan = new Scanner(System.in);
		System.out.println("============================================================");
		System.out.println("      [기차 종류]");
        System.out.println("============================================================");
        System.out.println("  무궁화  ");
        System.out.println("  KTX  ");
        System.out.println("  ITX-새마을  ");
        System.out.println("============================================================");
        String name = scan.nextLine();
        
		
		
		  try {
              conn = util.open();
              stat = conn.createStatement();
              
              String sql1 = String.format("select DISTINCT reserv.transreservdate as 결제일, train.traintype as 기차종류, a.trainstationname as 출발역, to_char(train.trainstart_time,'hh24:mi') as 출발시간," + 
              		"b.trainstationname as 도착역,to_char(train.trainarrive_time,'hh24:mi') as 도착시간," + 
              		"train.trainprice * reserv.transreservcount as 가격" + 
              		"    from tbltransreserv reserv" + 
              		"        INNER join tbltrain train" + 
              		"            on reserv.train_seq = train.train_seq" + 
              		"                inner join tbltrainstation a" + 
              		"                    on train.strainstation_seq = a.trainstation_seq" + 
              		"                        inner join tbltrainstation b" + 
              		"                            on train.atrainstation_seq = b.trainstation_seq" + 
              		"                                where train.traintype = '%s'" + 
              		"                                    order by reserv.transreservdate  ", name);
              
              rs = stat.executeQuery(sql1);

              
              System.out.printf("========================================================[%s 예매확인]=============================================================", name);
              System.out.println("================================================================================================================================");
              System.out.println("[결제일]\t[기차종류]\t[출발역]\t[출발시간]\t[도착역]\t[도착시간]\t[가격]");
              while (rs.next()) { //역번호, 역이름  도착기준
                 cnt++;
                 String result = String.format("%s\t%s\t%s\t%s\t%s\t%s\t%s",rs.getString("결제일"),rs.getString("기차종류"),rs.getString("출발역"),rs.getString("출발시간"),rs.getString("도착역"),rs.getString("도착시간"),rs.getString("가격"));            
             
                 
                 System.out.println(result); 
                 
                 if(cnt == 30) {
            		 System.out.println("============================================================");
            		 System.out.print("더보기?(Y/N) : ");
            		 String answer = scan.nextLine();
            		 if(answer.equals("Y")) {
            			 cnt=0;
            		 } else {
            			 break;
            		 }
            	 }
              }
              rs.close();                     
              conn.close();
              stat.close();
		
	} catch(Exception e) {
		
	}
	}//printtraintype

	
	
}
