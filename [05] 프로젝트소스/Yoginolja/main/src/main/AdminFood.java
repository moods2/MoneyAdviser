package main;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class AdminFood {
	
	private static Connection conn = null;
	private static Statement stat = null;
	private static Statement stat2 = null;
	private static ResultSet rs = null;
	private static ResultSet rs2 = null;
	private static DBUtil util = new DBUtil();
	private static Scanner scan = new Scanner(System.in);

	public void aFood() {
		List<AreaBasic> areaList = new ArrayList<AreaBasic>();
		
		try {
			conn = util.open();
			stat = conn.createStatement();
			
			System.out.println(
					"================================================================================================================================");
			System.out.println("1. 음식점 조회");
			System.out.println("2. 음식점 추가");
			System.out.println("3. 음식점 삭제");
			System.out.println("4. 음식점 예약 조회(전체 조회)");
			System.out.println("5. 음식점 후기 조회(전체 조회)");
			System.out.println("6. 뒤로가기");
			System.out.println(
					"================================================================================================================================");
			System.out.println();
			System.out.print("메뉴 입력 : ");
			String menu = scan.nextLine();
			System.out.println(
					"================================================================================================================================");

			
			if (menu.equals("1")) {
				
				conn = util.open();
				stat = conn.createStatement();
				
				String sql = "select l.localname as 지역, f.foodname as 음식점, f.foodpic as 사진, f.foodContent as 설명\r\n"
						+ "from tbllocal l\r\n" + "    inner join tblfood f\r\n"
						+ "        on l.local_seq = f.local_seq\r\n" + "order by l.local_seq asc";
				
				rs = stat.executeQuery(sql);
				
				System.out.println(
						"================================================================================================================================");
				System.out.println("[지역명]\t\t[음식점이름]\t\t[음식점사진]\t\t[설명]");
				
				while (rs.next()) {
					
					AreaBasic food = new AreaBasic(rs.getString("지역"), rs.getString("음식점"),
							rs.getString("사진"), rs.getString("설명"));
					
					areaList.add(food);
				}
				
				printList(areaList); // 출력
				
				aFood();
				

			} else if (menu.equals("2")) {
				
				conn = util.open();
				stat = conn.createStatement();
				
				String sql = "select l.localname as 지역, f.foodname as 음식점, f.foodpic as 사진, f.foodContent as 설명\r\n"
						+ "from tbllocal l\r\n" + "    inner join tblfood f\r\n"
						+ "        on l.local_seq = f.local_seq\r\n" + "order by l.local_seq desc";
				
				rs = stat.executeQuery(sql);
				
				System.out.println(
						"================================================================================================================================");
				System.out.println("[지역명]\t\t[음식점이름]\t\t[음식점사진]\t\t[설명]");
				
				while (rs.next()) {
					
					AreaBasic food = new AreaBasic(rs.getString("지역"), rs.getString("음식점"),
							rs.getString("사진"), rs.getString("설명"));
					
					areaList.add(food);
				}
				
				printList(areaList); // 출력
				
				rs.close();
				stat.close();
				
				try {
					
					stat2 = conn.createStatement();
					
					
					System.out.print("음식점 이름 입력 : ");
					String name = scan.nextLine();
					System.out.print("음식점 설명 입력 : ");
					String content = scan.nextLine();
					System.out.print("음식점 사진 입력 : ");
					String pic = scan.nextLine();
					System.out.print("지역명 입력 : ");
					String city = scan.nextLine();
					
					String sql14 = String.format("select local_seq from tbllocal where localname = '%s'", city);

					rs2 = stat2.executeQuery(sql14);
					
					if (rs2.next()) {
						
					String result1 = String.format("%s", rs2.getString("local_seq"));
					
					String sql2 = String.format("insert into tblfood values (food_seq.nextVal, '%s', '%s', '%s', %s)", name, pic, content, result1);
					
					stat2.executeUpdate(sql2);
					
					}
					
					System.out.println("음식점이 추가되었습니다.");
					
					aFood();
					
					conn.close();
					stat2.close();
					rs2.close();
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
			} else if(menu.equals("3")) {
				
				conn = util.open();
				stat = conn.createStatement();
				
				String sql = "select l.localname as 지역, f.foodname as 음식점, f.foodpic as 사진, f.foodContent as 설명\r\n"
						+ "from tbllocal l\r\n" + "    inner join tblfood f\r\n"
						+ "        on l.local_seq = f.local_seq\r\n" + "order by l.local_seq desc";
				
				rs = stat.executeQuery(sql);
				
				System.out.println(
						"================================================================================================================================");
				System.out.println("[지역명]\t\t[음식점이름]\t\t[음식점사진]\t\t[설명]");
				
				while (rs.next()) {
					
					AreaBasic food = new AreaBasic(rs.getString("지역"), rs.getString("음식점"),
							rs.getString("사진"), rs.getString("설명"));
					
					areaList.add(food);
				}
				stat.close();
				rs.close();
				
				printList(areaList); // 출력
				
				try {
					
					stat2 = conn.createStatement();
					
					
					System.out.println(
							"================================================================================================================================");
					System.out.print("음식점 이름 입력 : ");
					String name = scan.nextLine();

					String sql2 = String.format("delete from tblfood where foodname= '%s'", name);
					
					stat2.executeUpdate(sql2);
					
					System.out.println("음식점이 삭제되었습니다.");
					
					conn.close();
					stat2.close();

					
					aFood();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				

			}	else if (menu.equals("4")) {
				
				int cnt = 0;
				conn = util.open();
				stat = conn.createStatement();
				
				String sql = "select f.foodname as 음식점이름, m.membername as 회원이름, m.membertel as 회원전화번호, fr.foodreservcount as 인원, to_char(fr.foodreservdate, 'yy-mm-dd' )as 날짜\r\n" + 
						"from tblfoodreserv fr -- 음식점예약\r\n" + 
						"    inner join tblmember m-- 회원\r\n" + 
						"        on m.member_seq = fr.member_seq\r\n" + 
						"            inner join tblfood f -- 음식점\r\n" + 
						"                on fr.food_seq = f.food_seq";
				
				rs = stat.executeQuery(sql);
				
				System.out.println("[음식점이름]\t[회원이름]\t[회원전화번호]\t[인원]\t[날짜]");
				
				while (rs.next()) {
					
					cnt++;
					String result = rs.getString("음식점이름") + "\t" +rs.getString("회원이름") +"\t"+ rs.getString("회원전화번호") +"\t"+ rs.getString("인원") +"\t"+ rs.getString("날짜");
					
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
				System.out.println(
						"================================================================================================================================");
				
				enjoy e = new enjoy();
				e.adminMain();
				
			} else if (menu.equals("5")) {
				
				int cnt = 0;
				conn = util.open();
				stat = conn.createStatement();
				
				String sql = "select fr.foodreview_seq as 음식점후기번호, m.memberid as 회원아이디, f.foodname as 음식점이름, fr.foodreview as 음식점후기\r\n" + 
						"from tblfoodreview fr -- 음식점 후기\r\n" + 
						"    inner join tblmember m -- 회원\r\n" + 
						"        on fr.member_seq = m.member_seq\r\n" + 
						"            inner join tblfood f -- 음식점\r\n" + 
						"                on fr.food_seq = f.food_seq";
				
				rs = stat.executeQuery(sql);
				
				System.out.println(
						"================================================================================================================================");
				System.out.println("[음식점후기번호]\t[회원아이디]\t[음식점이름]\t[음식점후기]");
				
				while (rs.next()) {
					
					cnt++;
					String result = rs.getString("음식점후기번호") + "\t" + rs.getString("회원아이디") + "\t" + rs.getString("음식점이름") + "\t" + rs.getString("음식점후기");
					
					System.out.println(result);
					
					if(cnt==30) {
						System.out.println(
								"================================================================================================================================");
						System.out.print("더 입력하시겠습니까?(Y/N) : ");
						String answer = scan.nextLine();
						
						if(answer.equals("y") || answer.equals("Y")) {
							System.out.println(
									"================================================================================================================================");
							System.out.println("[음식점후기번호]\t[회원아이디]\t[음식점이름]\t[음식점후기]");
							cnt = 0;
						} else{
							break;
						}
					}
					
				}
				System.out.println(
						"================================================================================================================================");
				enjoy e = new enjoy();
				e.adminMain();
				
			} else if (menu.equals("6")) {
				enjoy e = new enjoy();
				e.adminMain();
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	private static void printList(List<AreaBasic> areaList) {
		for (AreaBasic area : areaList) {
			System.out.println(area.getLocal() + "\t" + area.getAreaName() + "\t"
					+ area.getAreaPic() + "\t" + area.getAreaContent());
		}
	}
}
