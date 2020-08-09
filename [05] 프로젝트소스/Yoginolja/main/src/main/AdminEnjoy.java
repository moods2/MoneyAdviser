package main;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class AdminEnjoy {

	private static Connection conn = null;
	private static Statement stat = null;
	private static Statement stat2 = null;
	private static ResultSet rs = null;
	private static ResultSet rs2 = null;
	private static DBUtil util = new DBUtil();
	private static Scanner scan = new Scanner(System.in);

	public void aEnjoy() {

		List<AreaBasic> areaList = new ArrayList<AreaBasic>();

		try {
			conn = util.open();
			stat = conn.createStatement();

			System.out.println(
					"================================================================================================================================");
			System.out.println("1. 즐길거리 조회");
			System.out.println("2. 즐길거리 추가");
			System.out.println("3. 즐길거리 삭제");
			System.out.println("4. 즐길거리 예약 조회(전체 조회)");
			System.out.println("5. 즐길거리 후기 조회(전체 조회)");
			System.out.println("6. 뒤로가기");
			System.out.println(
					"================================================================================================================================");
			System.out.println();
			System.out.print("메뉴 입력 : ");
			String menu = scan.nextLine();

			// 즐길거리 조회
			if (menu.equals("1")) {

				conn = util.open();
				stat = conn.createStatement();

				String sql = "select l.localname as 지역, e.enjoyname as 이름, e.enjoypic as 사진, e.enjoycontent as 설명"
						+ " from tbllocal l inner join tblenjoy e on l.local_seq = e.local_seq";

				rs = stat.executeQuery(sql);

				System.out.println(
						"================================================================================================================================");
				System.out.println("[지역명]\t\t[즐길거리이름]\t\t[즐길거리사진]\t\t[설명]");

				while (rs.next()) {

					AreaBasic enjoy = new AreaBasic(rs.getString("지역"), rs.getString("이름"),
							rs.getString("사진"), rs.getString("설명"));

					areaList.add(enjoy);
				}

				printList(areaList); // 출력

				aEnjoy();

				// 즐길거리 추가
			} else if (menu.equals("2")) {

				conn = util.open();
				stat = conn.createStatement();

				String sql = "select l.localname as 지역, e.enjoyname as 즐길거리이름, e.enjoypic as 사진, e.enjoycontent as 설명"
						+ " from tbllocal l inner join tblenjoy e on l.local_seq = e.local_seq";

				rs = stat.executeQuery(sql);

				System.out.println(
						"================================================================================================================================");
				System.out.println("[지역명]\t\t[즐길거리이름]\t\t[즐길거리사진]\t\t[설명]");

				while (rs.next()) {

					AreaBasic enjoy = new AreaBasic(rs.getString("지역"), rs.getString("즐길거리이름"),
							rs.getString("사진"), rs.getString("설명"));

					areaList.add(enjoy);
				}

				printList(areaList); // 출력
				
				rs.close();
				stat.close();
				
				try {
					
					stat2 = conn.createStatement();
					
					System.out.print("즐길거리 이름 입력 : ");
					String name = scan.nextLine();
					System.out.print("지역명 입력 : ");
					String city = scan.nextLine();
					System.out.print("즐기거리 설명 입력 : ");
					String content = scan.nextLine();
					System.out.print("즐길거리 사진 입력 : ");
					String pic = scan.nextLine();
					
					String sql14 = String.format("select local_seq from tbllocal where localname = '%s'", city);

					rs2 = stat2.executeQuery(sql14);
					
					if (rs2.next()) {
						
					String result1 = String.format("%s", rs2.getString("local_seq"));
					
					String sql2 = String.format("insert into tblenjoy values (enjoy_seq.nextval, '%s', '%s', '%s', %s)",
							name, pic, content, result1);
					
					stat2.executeUpdate(sql2);
					}
					
					System.out.println("즐길거리가 추가되었습니다.");
					
					aEnjoy();
					
				} catch (Exception e) {

					e.printStackTrace();
				}

				
				
				//즐길거리 삭제
			} else if (menu.equals("3")) {

				conn = util.open();
				stat = conn.createStatement();

				
				String sql = "select l.localname as 지역, e.enjoyname as 즐길거리이름, e.enjoypic as 사진, e.enjoycontent as 설명\r\n" + 
						" from tbllocal l\r\n" + 
						"    inner join tblenjoy e\r\n" + 
						"        on l.local_seq = e.local_seq";

				rs = stat.executeQuery(sql);

				System.out.println(
						"================================================================================================================================");
				System.out.println("[지역명]\t\t[즐길거리이름]\t\t[즐길거리사진]\t\t[설명]");
				

				while (rs.next()) {

					AreaBasic enjoy = new AreaBasic(rs.getString("지역"), rs.getString("즐길거리이름"),
							rs.getString("사진"), rs.getString("설명"));
					
					areaList.add(enjoy);
				}


				printList(areaList); // 출력
				
				stat.close();
				rs.close();
				
				try {
					stat2 = conn.createStatement();
					
					System.out.println(
							"================================================================================================================================");
					System.out.print("즐기거리 이름 입력 : ");
					String name = scan.nextLine();
					
					
					String sql2 = String.format("delete from tblenjoy where enjoyName = '%s')", name);
					
					stat2.executeUpdate(sql2);
					
					System.out.println("즐길거리가 삭제되었습니다.");
					
					aEnjoy();
					
					stat2.close();
					conn.close();
					
				} catch (Exception e) {
					// TODO: handle exception
				}



				//즐길거리 예약 조회
			} else if (menu.equals("4")) {
				
				int cnt = 0;
				conn = util.open();
				stat = conn.createStatement();
				
				String sql = "select e.enjoyname as 즐길거리이름, m.membername as 회원이름, m.membertel as 회원전화번호, er.enjoyreservcount as 인원, to_char(er.enjoyreservdate, 'yyyy-mm-dd') as 날짜\r\n" + 
						"from tblenjoyreserv er -- 즐길거리예약\r\n" + 
						"    inner join tblmember m-- 회원\r\n" + 
						"        on m.member_seq = er.member_seq\r\n" + 
						"            inner join tblenjoy e -- 즐길거리\r\n" + 
						"                on er.enjoy_seq = e.enjoy_seq";
				
				rs = stat.executeQuery(sql);
				
				System.out.println(
						"================================================================================================================================");
				System.out.println("[즐길거리이름]\t[회원이름]\t[회원전화번호]\t[인원]\t[날짜]");
				
				while (rs.next()) {
					
					cnt++;
//					String result = rs.getString("즐길거리이름") + "\t" +rs.getString("회원이름") +"\t"+ rs.getString("회원전화번호") +"\t"+ rs.getString("인원") +"\t"+ rs.getString("날짜");
					
					String result = String.format("%s\t%s\t%s\t%s\t%s", rs.getString("즐길거리이름"), rs.getString("회원이름"), rs.getString("회원전화번호"), rs.getString("인원"), rs.getString("날짜"));
					
					System.out.println(result);
					
					if (cnt == 30) {
						System.out.println(
								"================================================================================================================================");
						System.out.print("더 보시겠습니까?(Y/N) : ");
						String answer = scan.nextLine();
						System.out.println();
						System.out.println(
								"================================================================================================================================");
						
						if (answer.equals("y") || answer.equals("Y")) {
							System.out.println(
									"================================================================================================================================");
							System.out.println("[즐길거리이름]\t[회원이름]\t[회원전화번호]\t[인원]\t[날짜]");
							cnt=0;
						} else {
							break;
						}
					}
					
				}
				
				enjoy e = new enjoy();
				e.adminMain();

				//즐길거리 후기 조회
			} else if (menu.equals("5")) {
				
				int cnt = 0;
				conn = util.open();
				stat = conn.createStatement();
				
				String sql = "select er.enjoyreview_seq as 즐길거리후기번호, m.memberid as 회원아이디, e.enjoyname as 즐길거리이름, er.enjoyreview as 즐길거리후기\r\n" + 
						"from tblenjoyreview er -- 즐길거리 후기\r\n" + 
						"    inner join tblmember m -- 회원\r\n" + 
						"        on er.member_seq = m.member_seq\r\n" + 
						"            inner join tblenjoy e -- 음식점\r\n" + 
						"                on er.enjoy_seq = e.enjoy_seq";
				
				rs = stat.executeQuery(sql);
				
				System.out.println(
						"================================================================================================================================");
				System.out.println("[음식점후기번호]\t[회원아이디]\t[음식점이름]\t[음식점후기]");
				
				while (rs.next()) {
//					String result = rs.getString("즐길거리후기번호") + "\t" + rs.getString("회원아이디") + "\t" + rs.getString("즐길거리이름") + "\t" + rs.getString("즐길거리후기");
					
					cnt++;
					String result = String.format("%s\t%s\t%s\t%s", rs.getString("즐길거리후기번호"), rs.getString("회원아이디"), rs.getString("즐길거리이름"), rs.getString("즐길거리후기"));
					
					System.out.println(result);
					
					if (cnt == 30) {
						System.out.println(
								"================================================================================================================================");
						System.out.print("더 보시겠습니까?(Y/N) : ");
						String answer = scan.nextLine();
						if (answer.equals("y") || answer.equals(("Y"))) {
							System.out.println(
									"================================================================================================================================");
							System.out.println("[음식점후기번호]\t[회원아이디]\t[음식점이름]\t[음식점후기]");
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
