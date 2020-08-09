package main;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class WatchEnjoy {

	private static Connection conn = null;
	private static Statement stat = null;
	private static Statement stat2 = null;
	private static ResultSet rs = null;
	private static ResultSet rs2 = null;
	private static DBUtil util = new DBUtil();
	private static Scanner scan = new Scanner(System.in);
	String city = "";

	public void eReview() {

		List<AreaBasic> areaList = new ArrayList<AreaBasic>();
		List<AreaReview> reviewList = new ArrayList<AreaReview>();
		List<SelectReview> selectList = new ArrayList<SelectReview>();

//		try {
//			conn = util.open();
//			stat = conn.createStatement();
//
//			String sql = "select l.localname as 지역, e.enjoyname as 즐길거리이름, e.enjoypic as 사진, e.enjoycontent as 설명\r\n"
//					+ "from tbllocal l\r\n" + "    inner join tblenjoy e\r\n"
//					+ "        on l.local_seq = e.local_seq";
//
//			rs = stat.executeQuery(sql);
//
//			System.out.println(
//					"================================================================================================================================");
//			System.out.println("[지역명]\t\t[즐길거리이름]\t\t[즐길거리사진]\t\t[설명]");
//
//			while (rs.next()) {
//
//				AreaBasic enjoy = new AreaBasic(rs.getString("지역"), rs.getString("즐길거리이름"),
//						rs.getString("사진"), rs.getString("설명"));
//
//				areaList.add(enjoy);
//			}
//
//			printList(areaList); // 출력
//			
//			rs.close();
////			conn.close();
////			stat.close();
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
////		conn = util.open();
////		stat = conn.createStatement();
//		
//		System.out.println(
//				"================================================================================================================================");
//		System.out.print("지역명 : ");
//		
//		city = scan.nextLine();
//		
//		String sql2 = "select e.enjoyname as 즐길거리이름, e.enjoypic as 사진, e.enjoycontent as 설명"
//				+ " from tbllocal l"
//				+ " inner join tblenjoy e"
//				+ " on l.local_seq = e.local_seq"
//				+ " where l.localname = '" + city + "'";
//		
//		try {
//			rs = stat.executeQuery(sql2);
//
//			
//			System.out.println("[즐길거리이름]\t[사진]\t[설명]");
//			
//			while(rs.next()) {
//				String result = rs.getString("즐길거리이름") + "\t" + rs.getString("사진") + "\t" + rs.getString("설명");
//				
//				System.out.println(result);
//			}
//		} catch (SQLException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		
		

		System.out.println(
				"================================================================================================================================");
		System.out.println("1. 후기보기");
		System.out.println("2. 후기작성");
		System.out.println("3. 예약하기");
		System.out.println("4. 처음으로 돌아가기");
		System.out.println(
				"================================================================================================================================");
		System.out.print("메뉴 입력 : ");
		String menu = scan.nextLine();

		if (menu.equals("1")) {

			try {
				int cnt = 0;
				conn = util.open();
				stat = conn.createStatement();

				String sql3 = "select l.localname as 지역, e.enjoyname as 즐길거리이름, e.enjoypic as 사진, e.enjoycontent as 설명\r\n"
						+ "from tbllocal l\r\n" + "    inner join tblenjoy e\r\n"
						+ "        on l.local_seq = e.local_seq";
//						+ " where l.localname = '" + city + "'";

				rs = stat.executeQuery(sql3);

				System.out.println(
						"================================================================================================================================");
				System.out.println("[지역명]\t[즐길거리이름]\t\t[즐길거리사진]\t\t[설명]");

				while (rs.next()) {
					
					cnt++;

//					AreaBasic enjoy = new AreaBasic(rs.getString("지역"), rs.getString("즐길거리이름"),
//							rs.getString("사진"), rs.getString("설명"));
//
//					areaList.add(enjoy);
					
					String result = rs.getString("지역") + "\t\t" + rs.getString("즐길거리이름") + "\t" + rs.getString("사진") + "\t" + rs.getString("설명");
					
					System.out.println(result);
					
					if (cnt == 30) {
						System.out.println(
								"================================================================================================================================");
						System.out.print("더 보시겠습니까?(Y/N) : ");
						String answer = scan.nextLine();
						
						if (answer.equals("Y") || answer.equals("y")) {
							System.out.println(
									"================================================================================================================================");
							System.out.println("[음식점이름]\t[회원이름]\t[회원전화번호]\t[인원]\t[날짜]");
							cnt=0;
						} else {
							break;
						}
						
					}
				}

//				printList(areaList); // 출력

				System.out.println(
						"================================================================================================================================");
				System.out.print("즐길거리 이름  : ");

				String num = scan.nextLine();

				// 즐길거리 후기 보기
		
					String sql4 = String
							.format("select e.enjoyname as 이름, m.memberid as 회원아이디, er.enjoyreview as 후기\r\n"
									+ "from tblenjoyreview er -- 즐길거리 후기\r\n" + "    inner join tblmember m -- 회원\r\n"
									+ "        on er.member_seq = m.member_seq\r\n"
									+ "            inner join tblenjoy e -- 즐길거리\r\n"
									+ "                on er.enjoy_seq = e.enjoy_seq where e.enjoyname = '%s'", num);

					rs = stat.executeQuery(sql4);

					System.out.println("[즐길거리]\t\t[회원]\t[후기]");

					while (rs.next()) {

//						AreaReview review = new AreaReview(rs.getString("이름"), rs.getString("회원아이디"),
//								rs.getString("후기"));
//
//						reviewList.add(review);
						cnt++;
						String result = rs.getString("이름") + "\t" + rs.getString("회원아이디") + "\t" + rs.getString("후기");
						
						System.out.println(result);
						
						if (cnt == 30) {
							System.out.println(
									"================================================================================================================================");
							System.out.print("더 보시겠습니까?(Y/N) : ");
							String answer = scan.nextLine();
							
							if (answer.equals("Y") || answer.equals("y")) {
								System.out.println(
										"================================================================================================================================");
								System.out.println("[음식점이름]\t[회원이름]\t[회원전화번호]\t[인원]\t[날짜]");
								cnt=0;
							} else {
								break;
							}
							
						}
					}

//					printList2(reviewList);

					rs.close();
					conn.close();
					stat.close();
					
					eReview();

				

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 즐길거리 후기 작성
		} else if (menu.equals("2")) {

			try {
				
				int cnt = 0;
				conn = util.open();
				stat = conn.createStatement();
				rs = null;

				String sql5 = "select l.localname as 지역, e.enjoy_seq as 즐길거리번호, e.enjoyname as 즐길거리이름, e.enjoypic as 사진, e.enjoycontent as 설명\r\n"
						+ "from tbllocal l\r\n" + "    inner join tblenjoy e\r\n"
						+ "        on l.local_seq = e.local_seq";

				rs = stat.executeQuery(sql5);

				System.out.println(
						"================================================================================================================================");
				System.out.println("[지역명]\t\t[즐길거리이름]\t\t[즐길거리사진]\t\t[설명]");
				
				while (rs.next()) {

//					SelectReview select = new SelectReview(rs.getString("지역"), rs.getString("즐길거리번호"), rs.getString("즐길거리이름"),
//							rs.getString("사진"), rs.getString("설명"));
//
//					selectList.add(select);
					cnt++;
					String result = rs.getString("지역") + "\t" + rs.getString("즐길거리번호") + "\t" + rs.getString("즐길거리이름") + "\t" +
							rs.getString("사진") + "\t" + rs.getString("설명");
					
					System.out.println(result);
					
					if (cnt == 30) {
						System.out.println(
								"================================================================================================================================");
						System.out.print("더 보시겠습니까?(Y/N) : ");
						String answer = scan.nextLine();
						
						if (answer.equals("Y") || answer.equals("y")) {
							System.out.println(
									"================================================================================================================================");
							System.out.println("[음식점이름]\t[회원이름]\t[회원전화번호]\t[인원]\t[날짜]");
							cnt=0;
						} else {
							break;
						}
						
					}
					
					
				}
				rs.close();
				stat.close();
				conn.close();
				
				try {
					conn = util.open();
					stat = conn.createStatement();
					rs = null;
					
					System.out.print("후기 작성을 하기 위해 비밀번호를 입력 : ");
					String pw = scan.nextLine();
					
					String sql14 =  String.format("select member_seq from tblmember where memberpw = '%s'",pw);
					rs = stat.executeQuery(sql14);
					
					System.out.println(
							"================================================================================================================================");
					System.out.print("즐길거리 번호 입력 : ");
					String num1 = scan.nextLine();
					System.out.print("후기 입력 : ");
					String input = scan.nextLine();
					
					if (rs.next()) {
						
					
					String result1 = String.format("%s", rs.getString("member_seq"));

					String sql3 = String.format("insert into tblenjoyreview values (enjoyreview_seq.nextVal, '%s', %s, %s)",
							input, num1, result1);
					
					stat.executeUpdate(sql3);
					}
					
					System.out.println("입력이 완료되었습니다.");

					conn.close();
					rs.close();
					stat.close();
					
				}catch (Exception e) {
					e.printStackTrace();
					System.out.println("잘못 입력하셨습니다.");
				}



			} catch (SQLException e) {
				System.out.println("잘못 입력하셨습니다.");
				e.printStackTrace();
			}

			// 즐길거리 예약하기
		} else if (menu.equals("3")) {

			try {
				int cnt = 0;
				conn = util.open();
				stat = conn.createStatement();

				String sql6 = "select e.enjoy_seq as 즐길거리번호, e.enjoyname as 즐길거리이름, e.enjoypic as 사진, e.enjoycontent as 설명 from tbllocal l inner join tblenjoy e on l.local_seq = e.local_seq";

				rs = stat.executeQuery(sql6);

				while (rs.next()) {
					AreaBasic enjoy = new AreaBasic(rs.getString("즐길거리번호"), rs.getString("즐길거리이름"),
							rs.getString("사진"), rs.getString("설명"));

					areaList.add(enjoy);
				}

				printList(areaList); // 출력
				
				rs.close();
//				conn.close();
				stat.close();
				
				try {
					
//					conn = util.open();
					stat2 = conn.createStatement();
					
					System.out.print("예약을 하기 위해 비밀번호를 입력 : ");
					String pw = scan.nextLine();
					
					System.out.println(
							"================================================================================================================================");
					System.out.print("즐길거리 번호 : ");
					String fun = scan.nextLine();
					System.out.print("인원수 입력 : ");
					String population = scan.nextLine();
					System.out.print("날짜 입력(xxxx-xx-xx) : ");
					String date = scan.nextLine();
					
					String sql14 =  String.format("select member_seq from tblmember where memberpw = '%s'",pw);
					
					rs2 = stat2.executeQuery(sql14);
					
					
					if (rs2.next()) {
						
					String result1 = String.format("%s", rs2.getString("member_seq"));
					String sql7 = String.format(
							"insert into tblenjoyreserv values (enjoyreserv_seq.nextVal, to_date('%s', 'yyyy-mm-dd'), %s, %s, %s)",
							date, population, fun, result1);
					
					stat2.executeUpdate(sql7);
					}
					
					System.out.println("입력이 완료되었습니다.");
					
					conn.close();
					rs2.close();
					stat2.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		} else if (menu.equals("4")) {
			return;
		}
	}

	private static void printList(List<AreaBasic> areaList) {
		for (AreaBasic area : areaList) {
			System.out.println(area.getLocal() + "\t" + area.getAreaName() + "\t"
					+ area.getAreaPic() + "\t" + area.getAreaContent());
		}
	}

	private static void printList2(List<AreaReview> reviewList) {
		for (AreaReview review : reviewList) {
			System.out.println(review.getName() + "\t" + review.getId() + "\t" + review.getReview());
		}
	}
	
	private static void printList3(List<SelectReview> selectList) {
		for (SelectReview select : selectList) {
			System.out.println(select.getLocalNumber() + "\t" + select.getLocal() + "\t" + select.getAreaName() + "\t" + select.getAreaPic() + "\t" + select.getAreaContent());
		}
	}
}
