package main;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class HotelUser {
	
	private static Connection conn = null;
    private static Statement stat = null;
    private static ResultSet rs = null;
    private static DBUtil util = new DBUtil();
    
	public void printHotel() {
    	Scanner scan = new Scanner(System.in);
    	
    	
    	System.out.println("============================================================");
    	System.out.println("1. 예약 조회하기");
    	System.out.println("2. 방 조회하기");
    	System.out.println("============================================================");
    	System.out.print("입력 : ");
    	String num = scan.nextLine();
    	
    	switch(num) {
    	case "1":
    		printbook();
    		break;
    	case "2":
    		local(scan);
    		break;
    	}
    	
    	
    	
		

		 
		
	}

	private void local(Scanner scan) {
		//1. 지역선택
		System.out.println("숙박 지역을 선택해 주세요.");
		System.out.println("============================================================");
		
		 try {
		        conn = util.open();
		        stat = conn.createStatement();
		        String result = null;
		        
		        String sql1 = "select local_seq, localname from tblLocal";
		        
		        rs = stat.executeQuery(sql1);
		        while (rs.next()) { //역번호, 역이름  도착기준
		           
		           result = String.format("%s\t%s",rs.getString("local_seq"), rs.getString("localname"));            

		           
		           System.out.println(result); 
		        }
		        
		                           
		        conn.close();
		        stat.close();
			
		    } catch(Exception e) {
			
		    }
		 
		 System.out.println("============================================================");
		 System.out.print("지역 번호입력 : ");
		 String local = scan.nextLine();
		 
		 
		 System.out.println("============================================================");
		 System.out.println("숙박 카테고리를 선택해 주세요.");
		System.out.println("============================================================");
		try {
		    conn = util.open();
		    stat = conn.createStatement();
		    String result = null;
		    
		    String sql1 = "select hotelcategory_seq, hotelcategory from tblhotelcategory";
		    
		    rs = stat.executeQuery(sql1);
		    while (rs.next()) { //역번호, 역이름  도착기준
		       
		       result = String.format("%s\t%s",rs.getString("hotelcategory_seq"), rs.getString("hotelcategory"));            

		       
		       System.out.println(result); 
		    }
		    
		                       
		    conn.close();
		    stat.close();
		
		} catch(Exception e) {
		
		}
		
		System.out.println("============================================================");
		 System.out.print("숙박 카테고리 번호입력 : ");
		 String cate = scan.nextLine();
		 
		 
		 printHotel2(local,cate);
	}

	//예약 조회하기
	private void printbook() {
		Scanner scan = new Scanner(System.in);
		
		System.out.println("============================================================");
		System.out.print("비밀번호 입력 : ");
		String pw = scan.nextLine();
//		
//		String name = null;
//		String date = null;
		
	
		
		 try {
             conn = util.open();
             stat = conn.createStatement();
             rs = null;
             
             
             String sql15 =  String.format("select member_seq from tblmember where memberpw = '%s'",pw);
             rs = stat.executeQuery(sql15);
             if ( rs.next()) {
                String result = String.format("%s", rs.getString("member_seq"));                                 
                String sql18 = String.format("select rr.roomreserv_seq as 예약번호, h.hotelname as 숙박시설명, hs.issuedate as 날짜, r.roomname as 방이름, r.roomprice as 방가격, rr.peoplenum as 인원 from tblroomreserv rr" + 
                		"    inner join tblhotelschedule hs " + 
                		"        on hs.hotelschedule_seq = rr.hotelschedule_seq" + 
                		"            inner join tblroom r " + 
                		"                on hs.room_seq = r.room_seq" + 
                		"                    inner join tblhotel h" + 
                		"                        on r.hotel_seq = h.hotel_seq " + 
                		"                            inner join tblmember m " + 
                		"                                on rr.member_seq = m.member_seq where m.member_seq= %s", result );
                rs = stat.executeQuery(sql18);
                
                System.out.println("[예약번호]\t[숙박시설명]\t[날짜]\t[방이름]\t[방가격]\t[인원]");
	            
	            while (rs.next()) { //역번호, 역이름  도착기준
	               

	               result = String.format("%s\t%s\t%s\t%s\t%s\t%s",rs.getString("예약번호"),rs.getString("숙박시설명"),rs.getString("날짜"),rs.getString("방이름"),rs.getString("방가격"),rs.getString("인원"));            


	               System.out.println(result); 
	        
	            }
             }
          } catch (Exception e) {
             // TODO: handle exception
          }
		 
		 System.out.println("============================================================");
		 System.out.println("1. 예약 취소하기");
		 System.out.println("0. 뒤로가기");
		 System.out.println("============================================================");
		 System.out.print("번호 : ");
		 String num = scan.nextLine();
		 
		 switch(num) {
		 case "1":
			 printcancel();
			 break;
		 }
		 
		
	}

	
	//예약 취소하기
	private void printcancel() {
		Scanner scan = new Scanner(System.in);
		
		System.out.println("============================================================");
		System.out.print("취소를 원하는 예약번호 입력 : ");
		String booknum = scan.nextLine();
		
		
		try {
            conn = util.open();
            stat = conn.createStatement();
            String result = null;
            
            String sql1 = String.format("delete from tblroomreserv where roomreserv_seq =%s", booknum);

            stat.executeUpdate(sql1);
            
            String sql2 = String.format("select hotelschedule_seq from tblroomreserv where roomreserv_seq = %s", booknum);
            rs = stat.executeQuery(sql2);
            if(rs.next()) {
            	String result2 = String.format("%s", rs.getString("hotelschedule_seq"));
            	String sql3 = String.format("update tblhotelschedule set hotelschedulestate = '가능' where hotelschedule_seq = %s", result2);
            	
            	stat.executeUpdate(sql3);
            }
            
            System.out.println("[예약이 취소되었습니다.]");
                               
            conn.close();
            stat.close();
		
        } catch(Exception e) {
		
        }
		
		
		
		
	}

	//지역을 파라미터로 받아와서 호텔 목록 출력
	private void printHotel2(String local,String cate) {
		Scanner scan = new Scanner(System.in);
		
		 try {
	            conn = util.open();
	            stat = conn.createStatement();
	            String result = null;
	            
	            String sql1 = String.format("select hotel_seq as 호텔번호, hotelname as 호텔명, hotelpicture as 호텔사진 from tblhotel where local_seq = %s and hotelcategory_seq = %s", local, cate);

	            rs = stat.executeQuery(sql1);
	            
	            System.out.println("[호텔번호]\t[호텔명]\t[호텔사진]");
	            
	            while (rs.next()) { //역번호, 역이름  도착기준
	               

	               result = String.format("%s\t%s\t%s",rs.getString("호텔번호"),rs.getString("호텔명"),rs.getString("호텔사진"));            

	               
	               System.out.println(result); 
	            }
	            
	                               
	            conn.close();
	            stat.close();
			
	        } catch(Exception e) {
			
	        }
		 
		 System.out.println("============================================================");
		 System.out.print("번호입력 : ");
		 String num = scan.nextLine();
		 
		
		 printHotel3(local, num);
		 
	}

	private void printHotel3(String local, String num) {
		
		Scanner scan = new Scanner(System.in);
		
		 try {
	            conn = util.open();
	            stat = conn.createStatement();
	            String result = null;
	            
	            String sql1 = String.format("select hotel_seq as 호텔번호, hotelname as 호텔명, hotelpicture as 호텔사진, hoteldescription as 호텔설명 from tblhotel where local_seq = %s and hotel_seq = %s", local, num);

	            rs = stat.executeQuery(sql1);
	            
	            System.out.println("[호텔번호]\t[호텔명]\t[호텔사진]\t[호텔설명]");
	            
	            while (rs.next()) { //역번호, 역이름  도착기준
	               

	               result = String.format("%s\t%s\t%s\t%s",rs.getString("호텔번호"),rs.getString("호텔명"),rs.getString("호텔사진"),rs.getString("호텔설명"));            

	               
	               System.out.println(result); 
	            }
	            
	                               
	            conn.close();
	            stat.close();
			
	        } catch(Exception e) {
			
	        }
		 
		 System.out.println("============================================================");
		 System.out.println("1. 리뷰보기");
		 System.out.println("2. 예약하기");
		 System.out.println("0. 뒤로가기");
		 System.out.println("============================================================");
		 System.out.print("번호 입력 : ");
		 String n = scan.nextLine();
		 
		 switch(n) {
		 case "1":
			 printreview(num);
			 break;
		 case "2":
			 printbook(num);
			 break;
		 }
	}

	//날짜별 예약하기
	private void printbook(String num) {
		Scanner scan = new Scanner(System.in);
		System.out.println("============================================================");
		 System.out.print("예약 체크인 날짜 입력 (MM-DD) : ");
		 String date1 = scan.nextLine();
		 System.out.print("예약 체크아웃 날짜 입력 (MM-DD) : ");
		 String date2 = scan.nextLine();
		
		 
		 
		 try {
	            conn = util.open();
	            stat = conn.createStatement();
	            String result = null;
	            
	            String sql1 = String.format("select hs.hotelschedule_seq as 방번호, r.roomname as 방이름, hs.issuedate as 날짜, hs.hotelschedulestate as 예약가능여부, r.roompersoncount as 수용인원, r.roomprice as 가격, hs.hotelschedule_seq as 예약가능방번호  from tblhotelschedule hs" + 
	            		"    inner join tblroom r " + 
	            		"        on hs.room_seq = r.room_seq" + 
	            		"            inner join tblhotel h" + 
	            		"                on r.hotel_seq = h.hotel_seq where h.hotel_seq= %s and hs.issuedate >='2020-%s' and hs.issuedate <= '2020-%s' and  hs.hotelschedulestate ='가능'", num, date1, date2);

	            rs = stat.executeQuery(sql1);
	            
	            System.out.println("[방번호]\t[방이름]\t[날짜]\t[예약가능여부]\t[수용인원]\t[가격]\t[예약가능방번호]");
	            
	            while (rs.next()) { //역번호, 역이름  도착기준
	               

	               result = String.format("%s\t%s\t%s\t%s\t%s\t%s\t%s",rs.getString("방번호"),rs.getString("방이름"),rs.getString("날짜"),rs.getString("예약가능여부"),rs.getString("수용인원"),rs.getString("가격"),rs.getString("예약가능방번호"));            

	               
	               System.out.println(result); 
	               

	            }
	            
	                               
	            conn.close();
	            stat.close();
			
	        } catch(Exception e) {
			
	        }
		 
		 System.out.println("============================================================");
		 System.out.print("예약을 원하는 방 번호 입력 : ");
		 String roomnum = scan.nextLine();
		 System.out.println("============================================================");
		 System.out.print("인원 수  : ");
		 String count = scan.nextLine();
		 
		 printbook2(date1, date2, roomnum, count);
	}

	
	//방 예약메소드
	private void printbook2(String date1, String date2, String roomnum, String count) {
		Scanner scan = new Scanner(System.in);
		System.out.println("============================================================");
		System.out.print("비밀번호 입력 : ");
		String pw = scan.nextLine();
		
        try {
            conn = util.open();
            stat = conn.createStatement();
            rs = null;
            
            
            String sql15 =  String.format("select member_seq from tblmember where memberpw = '%s'",pw);
            rs = stat.executeQuery(sql15);
            if ( rs.next()) {
               String result = String.format("%s", rs.getString("member_seq"));                                 
               String sql18 = String.format("insert into tblroomreserv values(roomreserv_seq.nextval, '2020-%s','2020-%s',%s,%s,%s)", date1, date2,roomnum, count, result );
               stat.executeUpdate(sql18);
            }
            
            
         
            System.out.println("[예약이 완료되었습니다.]");
            conn.close();
            stat.close();
            
            try {
            	conn = util.open();
                stat = conn.createStatement();
                rs = null;
                
				String sql16 = String.format("update tblhotelschedule set hotelschedulestate = '불가능' where hotelschedule_seq = %s", roomnum);
				stat.executeUpdate(sql16);
				
				
			
			} catch (Exception e) {
				// TODO: handle exception
			}
            
            
            
         } catch (Exception e) {
            // TODO: handle exception
         }
        
        
        System.out.println("============================================================");
		 System.out.println("1. 예약 조회하기");
		 System.out.println("0. 뒤로가기");
		 System.out.println("============================================================");
		 System.out.print("번호 입력 : ");
		 String n = scan.nextLine();
		 
		 switch(n) {
		 case "1":
			 printbook();
			 break;
		 }
		
	}

	
	
	
	
	
	//호텔 리뷰보기
	private void printreview(String num) {
		Scanner scan = new Scanner(System.in);
		int cnt=0;
		
		 try {
	            conn = util.open();
	            stat = conn.createStatement();
	            String result = null;
	            
	            String sql1 = String.format("select h.hotelname as 숙박시설명, hr.hotelreviewcontent as 후기, hr.hotelreviewgrade as 평점, m.memberid as 회원아이디" + 
	            		" from tblhotelreview hr" + 
	            		"    inner join tblroomreserv rr " + 
	            		"        on hr.roomreserv_seq = rr.roomreserv_seq" + 
	            		"            inner join tblhotelschedule hs" + 
	            		"                on rr.hotelschedule_seq = hs.hotelschedule_seq" + 
	            		"                    inner join tblroom r " + 
	            		"                        on r.room_seq = hs.room_seq" + 
	            		"                            inner join tblhotel h" + 
	            		"                                on h.hotel_seq = r.hotel_seq" + 
	            		"                                    inner join tblmember m " + 
	            		"                                        on rr.member_seq = m.member_seq" + 
	            		"                                        where h.hotel_seq= %s", num);

	            rs = stat.executeQuery(sql1);
	            
	            System.out.println("[숙박시설명]\t[후기]\t[평점]\t[회원아이디]");
	            
	            while (rs.next()) { //역번호, 역이름  도착기준
	               
	            	cnt++;
	               result = String.format("%s\t%s\t%s\t%s",rs.getString("숙박시설명"),rs.getString("후기"),rs.getString("평점"),rs.getString("회원아이디"));            

	               
	               System.out.println(result); 
	               
	               if(cnt == 30) {
	            		 System.out.println("============================================================");
	            		 System.out.print("더보기?(Y/N) : ");
	            		 String answer = scan.nextLine();
	            		 if(answer.equals("Y") || answer.equals("y")) {
	            			 cnt=0;
	            		 } else {
	            			 break;
	            		 }
	            	 }
	            }
	            
	                               
	            conn.close();
	            stat.close();
			
	        } catch(Exception e) {
			
	        }
	
		
	}

}
