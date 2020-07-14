package main;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class BusTrain {
   
   
      
      private static Connection conn = null;
      private static Statement stat = null;
      private static ResultSet rs = null;
      private static ResultSet rs2 = null;
      private static DBUtil util = new DBUtil();
      private static Scanner scan = new Scanner(System.in);
      
      public void printBusTrain() {
         
         boolean loop = true;
         
         
         while (loop) { // 
            System.out.println("============================================================");
            System.out.println("      [교통수단 예매]");
            System.out.println("============================================================");
            System.out.println("1 :       [기차 예매]");
            System.out.println("2 :       [버스 예매]");
            System.out.println("3 :       [예매 확인]");
            
            Connection conn = null;
            Statement stat = null;
            ResultSet rs = null;
            
            System.out.println("---------------------------------------------------------");
            System.out.print("입력 : ");
            String sel = scan.nextLine();
            
            if (sel.equals("1")) {               
               System.out.print("날짜(MM-DD형식) : ");
               String date= scan.nextLine();
            try {
               conn = util.open();
               stat = conn.createStatement();
               
               String sql = "select trainstation_seq as 역번호, trainstationname as 역이름 from tbltrainstation order by trainstation_seq";
               
               rs = stat.executeQuery(sql);
               System.out.println("================================================================================================================================");
               while (rs.next()) { //역번호, 역이름  출발기준
                  
                  String result = String.format("%s\t%s",rs.getString("역번호"),rs.getString("역이름"));            


                  
                  System.out.println(result);
                  
               }
               System.out.println("================================================================================================================================");
               
               System.out.print("출발 기차역 : ");
               String starttrain = scan.nextLine();
               
               System.out.println();
               System.out.println();
               conn.close();
               stat.close();
               
               
                  try {
                     conn = util.open();
                     stat = conn.createStatement();
                     rs = null;
                     
                     String sql2 = "select trainstation_seq as 역번호, trainstationname as 역이름 from tbltrainstation order by trainstation_seq";
                                       
                     rs = stat.executeQuery(sql2);
                     System.out.println("================================================================================================================================");
//                     System.out.println("[과정번호]\t\t\t\t[과정명]\t\t\t\t[과정기간]\t\t[교사명]\t[강의실]");
                     while (rs.next()) { //역번호, 역이름  도착기준
                        
                        String result = String.format("%s\t%s",rs.getString("역번호"),rs.getString("역이름"));            


                        
                        System.out.println(result);                     
                        
                     }
                     System.out.println("========================================================================================================================");
                     System.out.print("도착 기차역번호 : ");
                     String arrivetrain = scan.nextLine();
                     
                     System.out.println("무궁화");
                     System.out.println("KTX");
                     System.out.println("ITX-새마을");
                     System.out.print("기차 종류 : ");
                     String traintype = scan.nextLine();
                     
                     
                     System.out.println();
                     System.out.println();
//                     rs.close();                     
                     conn.close();
                     stat.close();                     
                     
                     
                     try {
                        conn = util.open();
                        stat = conn.createStatement();
                        rs = null;
                        
                        String sql3 = String.format("select distinct traintype as 기차종류, e.* ," + 
                              "to_char(trainstart_time,'hh24:mi') as 출발시간, d.trainstationname as 도착기차역 ," + 
                              "    to_char(trainarrive_time,'hh24:mi') as 도착시간,trainprice as 가격, c.train_seq as 기차번호" + 
                              "        from" + 
                              "        (select  b.trainstationname as 출발기차역 " + 
                              "        from tbltrain a" + 
                              "            inner join tbltrainstation b" + 
                              "                on a.Strainstation_seq = b.trainstation_seq" + 
                              "                     where traintype = '%s' and a.Strainstation_seq = %s and a.Atrainstation_seq = %S) e," + 
                              "                     tbltrain c" + 
                              "            inner join tbltrainstation d" + 
                              "                on c.Atrainstation_seq = d.trainstation_seq" + 
                              "                     where traintype = '%S' and c.Strainstation_seq = %S and c.Atrainstation_seq = %S" + 
                              "                     order by c.train_seq", traintype, starttrain,arrivetrain,traintype,starttrain,arrivetrain);


                                          
                        rs = stat.executeQuery(sql3);
                        System.out.println("================================================================================================================================");
                        System.out.println("[기차번호]\t[기차종류]\t[출발기차역]\t[출발시간]\t[도착기차역]\t[도착시간]\t[가격]");
                        while (rs.next()) { //역번호, 역이름  도착기준
                           
                           String result = String.format("%s\t%s\t%s\t%s\t%s\t%s\t%s", rs.getString("기차번호"),rs.getString("기차종류"),rs.getString("출발기차역"),rs.getString("출발시간"),rs.getString("도착기차역"),rs.getString("도착시간"),rs.getString("가격"));            

                           
                           
                           System.out.println(result);            
                     }
                        System.out.println("========================================================================================================================");
                        System.out.println("1. 예매하기");
                        System.out.println("2. 뒤로가기");
                        System.out.println("========================================================================================================================");
                        System.out.print("번호 입력 : ");
                        String num = scan.nextLine();
                        switch (num) {

                        case "1":
                           System.out.print("기차번호 : ");
                           String trainreserv = scan.nextLine();
                           System.out.print("인원 : ");
                           String count = scan.nextLine();
                           try {
                              conn = util.open();
                              stat = conn.createStatement();
                              rs = null;
                              
                              
                              String sql13 =  String.format("select trainprice from tbltrain where train_seq = %s",trainreserv);
                              rs = stat.executeQuery(sql13);
                              if ( rs.next()) {
                                 String result = String.format("%s", rs.getString("trainprice"));
//                                 String result = String.format("%s", "trainprice");
                                 System.out.println(Integer.parseInt(result) * Integer.parseInt(count));   
                              }
                              
                              System.out.println("결제를 진행하시겠습니까?");
                              System.out.println("결제를 진행합니다!!!");
                              System.out.print("비밀번호를 입력해주세요 :");
                              String credit = scan.nextLine();
                              
                              try {
                                 conn = util.open();
                                 stat = conn.createStatement();
                                 rs = null;
                                 
                                 
                                 String sql14 =  String.format("select member_seq from tblmember where memberpw = '%s'",credit);
                                 rs = stat.executeQuery(sql14);
                                 if ( rs.next()) {
                                    String result = String.format("%s", rs.getString("member_seq"));                                 
                                    String sql9 = String.format("insert into tbltransreserv values (transreserv_seq.nextval,to_date('%s', 'MM-DD'),%s,%s,null,%s)", date, count,trainreserv, result );
                                    stat.executeUpdate(sql9);
                                 }
                              } catch (Exception e) {
                                 // TODO: handle exception
                              }
                              
                              
                              
                           } catch (Exception e) {
                              e.printStackTrace();
                              // TODO: handle exception
                           }
                           
                           
                           
                           
                           
                           rs.close();                     
                           conn.close();
                           stat.close();
                           
                        
                           
                        case "0":
                           //로그아웃
                           rs.close();   
                           conn.close();
                           stat.close();
                           
                           loop = false;
                           }
                        
                     }
                        catch (Exception e) {
                        // TODO: handle exception
                     }
                     
                     
//                     loop = false;
                     
                     System.out.println();
                     System.out.println("예매 완료!");
                     System.out.print("계속하시려면 엔터를 눌러주세요");   
                     System.out.println();
                     
                  } catch (Exception e) {
                     e.printStackTrace();
                     // TODO: handle exception
                  }
                  
         
               
               
               conn.close();
               stat.close();
               
               loop = false;
            } catch (Exception e) {
               e.printStackTrace();
            }
            
            
            //버스 예매
            } else if (sel.equals("2")) {
               System.out.print("날짜(MM-DD형식) : ");
               String date2= scan.nextLine();
               try {
                  conn = util.open();
                  stat = conn.createStatement();
                  
                  String sql4 = "select busstation_seq as 터미널번호, busstationloca as 지역, busstationname as 터미널명 from tblbusstation";
                  
                  rs = stat.executeQuery(sql4);
                  System.out.println("================================================================================================================================");
                  while (rs.next()) { //역번호, 지역, 터미널이름
                     
                     String result = String.format("%s\t%s",rs.getString("터미널번호"),rs.getString("지역"),rs.getString("터미널명"));            


                     
                     System.out.println(result);
                  }
                  System.out.println("================================================================================================================================");
                  
                  System.out.print("출발 버스터미널 : ");
                  String startbus = scan.nextLine();
                  
                  System.out.println();
                  System.out.println();
                  conn.close();
                  stat.close();
                  
                  try {
                     conn = util.open();
                     stat = conn.createStatement();
                     
                     String sql5 = "select busstation_seq as 터미널번호, busstationloca as 지역, busstationname as 터미널명 from tblbusstation";
                     
                     rs = stat.executeQuery(sql5);
                     System.out.println("================================================================================================================================");
                     while (rs.next()) { //역번호, 지역, 터미널이름
                        
                        String result = String.format("%s\t%s",rs.getString("터미널번호"),rs.getString("지역"),rs.getString("터미널명"));            


                        
                        System.out.println(result);
                     }
                     System.out.println("========================================================================================================================");
                     System.out.print("도착 버스터미널번호 : ");
                     String arrivebus = scan.nextLine();                     
                     System.out.println();
                     System.out.println();
//                     rs.close();                     
                     conn.close();
                     stat.close();      
                     
                     try {
                        conn = util.open();
                        stat = conn.createStatement();
                        rs = null;
                        
                        String sql6 = String.format("select DISTINCT bus_seq " + 
                              "    as 버스번호 ,d.busstationloca as 출발지, to_char(busstarttime,'hh24:mi') as 출발시간,bustime as 소요시간,  e.*,  busprice as 가격 " + 
                              "        from (select DISTINCT b.busstationloca as 도착지     "+ 
                              "        from tblbus a" + 
                              "        inner join tblbusstation b" + 
                              "            on a.abusstation_seq2 = b.busstation_seq" + 
                              "            where a.sbusstation_seq = %s and a.abusstation_seq2 = %s) e," + 
                              "        tblbus c "+ 
                              "        inner join tblbusstation d" + 
                              "            on c.sbusstation_seq = d.busstation_seq" + 
                              "             where c.sbusstation_seq = %s and c.abusstation_seq2 = %s" + 
                              "                order by c.bus_seq", startbus,arrivebus,startbus,arrivebus );


                                          
                        rs = stat.executeQuery(sql6);
                        System.out.println("================================================================================================================================");
                        System.out.println("[버스번호]\t[출발지]\t[출발시간]\t[소요시간]\t[도착지]\t[가격]");
                        while (rs.next()) { //역번호, 역이름  도착기준
                           
                           String result = String.format("%s\t%s\t%s\t%s\t%s\t%s",rs.getString("버스번호"),rs.getString("출발지"),rs.getString("출발시간"),rs.getString("소요시간"),rs.getString("도착지"),rs.getString("가격"));            

                           
                           
                           System.out.println(result);      
                        }
                        System.out.println("========================================================================================================================");
                        System.out.println("1. 예매하기");
                        System.out.println("0. 뒤로가기");
                        System.out.println("========================================================================================================================");
                        
                        System.out.print("번호 입력 : ");
                        String num2 = scan.nextLine();
                        
                        switch(num2) {
                        //예매하기
                        case "1":
                           System.out.print("버스번호 : ");
                           String busreserv = scan.nextLine();
                           System.out.print("인원 : ");
                           String count2 = scan.nextLine();
                           
                           String price = String.format("select busprice from tblbus where bus_seq = %s", busreserv);
                           rs = stat.executeQuery(price);                           
                           if ( rs.next()) {
                              String result = String.format("%s", rs.getString("busprice"));

                              System.out.println(Integer.parseInt(result) * Integer.parseInt(count2));   
                           }
                           
                           System.out.println("결제를 진행하시겠습니까?");
                           System.out.println("결제를 진행합니다!!!");
                           System.out.print("비밀번호를 입력해주세요 :");
                           String credit = scan.nextLine();
                           try {
                              conn = util.open();
                              stat = conn.createStatement();
                              rs = null;
                              
                              
                              String sql15 =  String.format("select member_seq from tblmember where memberpw = '%s'",credit);
                              rs = stat.executeQuery(sql15);
                              if ( rs.next()) {
                                 String result = String.format("%s", rs.getString("member_seq"));                                 
                                 String sql18 = String.format("insert into tbltransreserv values (transreserv_seq.nextval,to_date('%s', 'MM-DD'),%s,null,%s,%s)", date2, count2,busreserv, result );
                                 stat.executeUpdate(sql18);
                              }
                           } catch (Exception e) {
                              // TODO: handle exception
                           }
                           
//                           String sql10 = String.format("insert into tbltransreserv values (transreserv_seq.nextval,to_date('%s', 'MM-DD'),%s,%s,null,1)", date2 , count2, busreserv );
                           
                           
                           
                           
                           rs.close();                     
                           conn.close();
                           stat.close();
                           System.out.println();
                           System.out.println("예매 완료!");
                           System.out.print("계속하시려면 엔터를 눌러주세요");
                           System.out.println();
                        //뒤로가기
                        case "0":
                        }
                        
                        
                        
                     } catch (Exception e) {
                        // TODO: handle exception
                     }
                     
                  } catch (Exception e) {
                     // TODO: handle exception
                  }
               } catch (Exception e) {
                  e.printStackTrace();
                  // TODO: handle exception
               }
               
               
            } 
            //예매확인
            else if(sel.equals("3")) {
               System.out.print("비밀번호를 입력해주세요 :");
               String credit = scan.nextLine();
               
            }
               
               
         }//while
         
         
         
      }

}
