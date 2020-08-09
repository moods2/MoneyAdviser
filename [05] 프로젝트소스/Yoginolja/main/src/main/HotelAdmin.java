package main;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class HotelAdmin {
	public static Scanner scan = new Scanner(System.in);
	public static Boolean roof = true;
	
	
	public static void hotelAdminMain() {
		
		while(roof) {
			System.out.println("============================================================");
			System.out.println("\t\t[1. 숙박업체 조회]");
			System.out.println("\t\t[2. 숙박업체 등록]");
			System.out.println("\t\t[3. 숙박업체 정산]");
			System.out.println("\t\t[0. 뒤로가기]");
			System.out.println("============================================================");
			System.out.print("\t\t선택 (번호) : ");
			String input = scan.nextLine();
			System.out.println("============================================================");
			
			if(input.equals("1")) {
				//업체 정보 조회 , 삭제, 수정
				HotelAdmin.hotelcompanyvw();
			}else if(input.equals("2")) {
				//업체 등록
				HotelAdmin.hotelcompanyregist();
			}else if(input.equals("3")) {
				//업체 정산
				HotelAdmin.hotelaccount();
			}else if(input.equals("0")) {
				break;
			}
	
		
		}
		
		
		
	}
		
	
	
	//업체 정보 조회 , 삭제, 수정
		public static void hotelcompanyvw() {
			Connection conn = null;
			Statement stat = null;
			ResultSet rs = null;
			DBUtil util = new DBUtil();		
			System.out.println("\t\t숙박업체 정보를 조회합니다.");
			
			
			try {
				//연결
				conn = util.open();
//				System.out.println(conn.isClosed());
				stat = conn.createStatement();
				String sql =  "select * from tblhotelcompany order by hotelcompany_seq";
				rs = stat.executeQuery(sql);
				System.out.println("\t\t[숙박업체번호]  [숙박업체명]\t [전화번호]     [계좌번호]      [은행명]    [사업자등록번호]");
				
				while(rs.next()) {
					System.out.printf("%s\t", rs.getString(1));
					System.out.printf("%s\t\t", rs.getString(2));
					System.out.printf("%s\t", rs.getString(3));
					System.out.printf("%s\t", rs.getString(4));
					System.out.printf("%s\t", rs.getString(5));
					System.out.printf("%s\t\r\n", rs.getString(6));
				}
				
				
				rs.close();
				stat.close();
				conn.close();
				
				while(roof) {
					
				System.out.println("============================================================");
				System.out.println("\t\t1. 숙박업체 삭제");
				System.out.println("\t\t2. 숙박업체 정보수정");
				System.out.println("\t\t3. 뒤로가기");
				System.out.println("============================================================");
				System.out.print("\t\t번호 입력 : ");
				String input = scan.nextLine();
					
				if(input.equals("1")) {
					hotelCompanyDelete();
				
				}else if(input.equals("2")) {
					hotelCompanyUpdate();
					
				}else if(input.equals("3")) {
					break;
					
				}
				
				}
				
				
				
				
				
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
			
			
			
			
		}
		//업체 수정
		private static void hotelCompanyUpdate() {
			Connection conn = null;
			CallableStatement stat2 = null;
			DBUtil util = new DBUtil();
			System.out.println("============================================================");
			System.out.print("\t\t수정할 숙박업체번호 입력 : ");
			String companyNum = scan.nextLine();
			System.out.println("============================================================");
			try {
				conn = util.open();
//				stat = conn.createStatement();
				System.out.print("\t\t숙박업체 명 : ");
				String companyName = scan.nextLine();
				System.out.print("\t\t전화번호 : ");
				String tel = scan.nextLine();
				System.out.print("\t\t계좌번호 : ");
				String accountNum = scan.nextLine();
				System.out.print("\t\t은행  : ");
				String bank = scan.nextLine();
				System.out.print("\t\t사업자등록번호  : ");
				String registNum = scan.nextLine();
				
				
				
				String sql = "{call prochocompanyupdate(?,?,?,?,?,?)}";
				stat2 = conn.prepareCall(sql);
				stat2.setString(1, companyNum);
				stat2.setString(2, companyName);
				stat2.setString(3, tel);
				stat2.setString(4, accountNum);
				stat2.setString(5, bank);
				stat2.setString(6, registNum);
				stat2.executeUpdate();
				stat2.close();
				conn.close();
				
				System.out.println("============================================================");
				System.out.println("\t\t수정이 완료되었습니다.");
				System.out.println("============================================================");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//업체 삭제
		private static void hotelCompanyDelete() {
			Connection conn = null;
			CallableStatement stat = null;
			DBUtil util = new DBUtil();
			System.out.println("============================================================");
			System.out.print("\t\t삭제할 숙박업체번호 입력 : ");
			String companyNum = scan.nextLine();
			System.out.println("============================================================");
			try {
				conn = util.open();
				String sql = "{call prochocompanydelete(?)}";
				stat = conn.prepareCall(sql);
				stat.setString(1, companyNum);
				stat.executeUpdate();
				stat.close();
				conn.close();
				System.out.println("============================================================");
				System.out.println("\t\t삭제가 완료되었습니다.");
				System.out.println("============================================================");
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}

		//업체 등록
		public static void hotelcompanyregist() {
			Connection conn = null;
			CallableStatement stat = null;
			DBUtil util = new DBUtil();
			try {
				conn = util.open();
//				stat = conn.createStatement();
				System.out.println("============================================================");
				System.out.print("\t\t숙박업체 명 : ");
				String companyName = scan.nextLine();
				System.out.print("\t\t전화번호 : ");
				String tel = scan.nextLine();
				System.out.print("\t\t계좌번호 : ");
				String accountNum = scan.nextLine();
				System.out.print("\t\t은행  : ");
				String bank = scan.nextLine();
				System.out.print("\t\t사업자등록번호  : ");
				String registNum = scan.nextLine();
				
				
				
				String sql = "{call prochocompanyinsert(?,?,?,?,?)}";
				stat = conn.prepareCall(sql);
				stat.setString(1, companyName);
				stat.setString(2, tel);
				stat.setString(3, accountNum);
				stat.setString(4, bank);
				stat.setString(5, registNum);
				stat.executeUpdate();
				stat.close();
				conn.close();
				System.out.println("============================================================");
				System.out.println("\t\t등록이 완료되었습니다.");
				System.out.println("============================================================");
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		//업체 정산
		public static void hotelaccount() {
			Connection conn = null;
			Statement stat = null;
			ResultSet rs1 = null;
			ResultSet rs2 = null;
			CallableStatement stat2 = null;
			DBUtil util = new DBUtil();
			try {
				System.out.println("\t\t조회할 기간을 입력해주세요");
				System.out.print("\t\t시작날짜 : ");
				String dates = scan.nextLine();
				System.out.print("\t\t마지막날짜 : ");
				String datel = scan.nextLine();
				conn = util.open();
				stat = conn.createStatement();
				//조회기간 동안의 숙박업체별로 총액 보기
				String sql1 = String.format("select hc.hotelname as 숙박업체명, sum(r.roomprice) as 가격 " + 
						"from tblroomreserv rr " + 
						"    inner join tblhotelschedule hs " + 
						"        on rr.hotelschedule_seq = hs.hotelschedule_seq " + 
						"            inner join tblroom r " + 
						"                on r.room_seq = hs.room_seq " + 
						"                    inner join tblhotel h " + 
						"                        on h.hotel_seq =r.hotel_seq " + 
						"                            inner join tblhotelcompany hc " + 
						"                                on hc.hotelcompany_seq = h.hotelcompany_seq " + 
						"                                    where rr.checkin is not null and rr.checkout is not null and hs.issuedate between '%s' and '%s' " + 
						"                                     group by hc.hotelname", dates, datel);
				
				
				rs1 = stat.executeQuery(sql1);
				System.out.println("\t\t[숙박시설명]\t[총액]");
				while (rs1.next()) {
					System.out.printf("\t\t%s\t\t", rs1.getString(1));
					System.out.printf("%s\r\n", rs1.getInt(2));

				}
				System.out.println("============================================================");
				System.out.println("\t\t전체 내역을 볼 숙박시설명을 입력해주세요");
				System.out.print("\t\t숙박시설명:");
				String hotelname = scan.nextLine();
				System.out.println("============================================================");
				
				
				
				
				
				//숙박업체 선택시 상세 내역 보기
				String sql2 = String.format(
						"select r.roomprice as 가격, hc.hotelname as 숙박업체명, to_char(hs.issuedate,'yyyy-mm-dd') as 날짜 " + 
						"from tblroomreserv rr " + 
						"    inner join tblhotelschedule hs " + 
						"        on rr.hotelschedule_seq = hs.hotelschedule_seq " + 
						"            inner join tblroom r " + 
						"                on r.room_seq = hs.room_seq " + 
						"                    inner join tblhotel h " + 
						"                        on h.hotel_seq =r.hotel_seq " + 
						"                            inner join tblhotelcompany hc " + 
						"                                on hc.hotelcompany_seq = h.hotelcompany_seq " + 
						"                                    where rr.checkin is not null and rr.checkout is not null and " + 
						"                                        hs.issuedate between '%s' and '%s' and h.hotelname= '%s' " + 
						"                                      order by hs.issuedate, h.hotel_seq",
						dates,datel, hotelname);
				rs2 = stat.executeQuery(sql2);
				System.out.printf("\t\t▶▶▶▶▶%s◀◀◀◀◀\r\n",hotelname);
				System.out.println("\t\t[날짜]\t\t[가격]");
				while (rs2.next()) {
					System.out.printf("\t\t%s\t", rs2.getString(3));
					System.out.printf("%s\r\n", rs2.getString(1));

				}
				
			
					//업체 정산 처리 하기
//					System.out.print("\t\t정산하시려면 y를 입력해주세요.");
//					String input = scan.nextLine();
//					if(input.equals("y")) {
//						
//					
//					String sql3 = "{call procpayment(?,?,?)}";
//					stat2 = conn.prepareCall(sql3);
//					while(rs2.next()) {
//						stat2.setString(1, hotelname);
//						stat2.setString(2, dates);
//						stat2.setString(3, datel);
//					}
//					stat2.executeUpdate();
//					System.out.println("\t\t정산이 완료되었습니다.");
//					}else {
//						System.out.println("\t\t이전화면으로 돌아갑니다.");
//						hotelAdminMain();
//						
//					}
//				
				rs1.close();
				rs2.close();
				stat.close();
//				stat2.close();
				conn.close();
				
				
				
				
			} catch (Exception e) {
				System.out.println("오류");
				e.printStackTrace();
			}
			
		}

	
}
