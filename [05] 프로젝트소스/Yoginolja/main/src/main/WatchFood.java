package main;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class WatchFood {

	private static Connection conn = null;
	private static Statement stat = null;
	private static Statement stat2 = null;
	private static ResultSet rs = null;
	private static ResultSet rs2 = null;
	private static DBUtil util = new DBUtil();
	private static Scanner scan = new Scanner(System.in);

	public void wReview() {

		List<AreaBasic> areaList = new ArrayList<AreaBasic>();
		List<AreaReview> reviewList = new ArrayList<AreaReview>();
		List<SelectReview> selectList = new ArrayList<SelectReview>();

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

				String sql = "select l.localname as 지역, f.foodname as 음식점, f.foodpic as 사진, f.foodContent as 설명\r\n"
						+ "from tbllocal l\r\n" + "    inner join tblfood f\r\n"
						+ "        on l.local_seq = f.local_seq\r\n" + "order by l.local_seq asc";

				rs = stat.executeQuery(sql);

				System.out.println(
						"================================================================================================================================");
				System.out.println("[지역명]\t\t[음식점이름]\t\t[음식점사진]\t\t[설명]");

				while (rs.next()) {

					cnt++;
//					AreaBasic food = new AreaBasic(rs.getString("지역"), rs.getString("음식점"),
//							rs.getString("사진"), rs.getString("설명"));
//					
//					areaList.add(food);

					String result = rs.getString("지역") + "\t" + rs.getString("음식점") + "\t" + rs.getString("사진") + "\t"
							+ rs.getString("설명");

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
							cnt = 0;
						} else {
							break;
						}

					}
//					printList(areaList); // 출력
				}

				System.out.println(
						"================================================================================================================================");
				System.out.print("음식점 이름 : ");

				String num = scan.nextLine();

				cnt = 0;
				String sql2 = String.format("select f.foodname as 음식점, m.memberid as 회원, fr.foodreview as 후기\r\n"
						+ "from tblfoodreview fr inner join tblmember m -- 회원\r\n"
						+ "        on fr.member_seq = m.member_seq\r\n" + "            inner join tblfood f -- 음식점\r\n"
						+ "                on fr.food_seq = f.food_seq where f.foodname = '%s'", num);

				rs = stat.executeQuery(sql2);

				System.out.println("[음식점]\t\t[회원]\t[후기]");

				while (rs.next()) {

//						AreaReview review = new AreaReview(rs.getString("음식점"), rs.getString("회원"), rs.getString("후기"));
//
//						reviewList.add(review);
					cnt++;
					String result = rs.getString("음식점") + "\t" + rs.getString("회원") + "\t" + rs.getString("후기");

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
							cnt = 0;
						} else {
							break;
						}

					}

				}
//					printList2(reviewList);

				rs.close();
				conn.close();
				stat.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (menu.equals("2")) {

			try {
				int cnt = 0;
				conn = util.open();
				stat = conn.createStatement();
				rs = null;

				String sql2 = "select l.localname as 지역, f.food_seq as 음식점번호, f.foodname as 음식점, f.foodpic as 사진, f.foodContent as 설명\r\n"
						+ "from tbllocal l\r\n" + "    inner join tblfood f\r\n"
						+ "        on l.local_seq = f.local_seq\r\n" + "order by l.local_seq desc";

				rs = stat.executeQuery(sql2);

				System.out.println(
						"================================================================================================================================");
				System.out.println("[지역명]\t[음식점번호]\t[음식점이름]\t\t[음식점사진]\t\t[설명]");

				while (rs.next()) {

//						SelectReview food = new SelectReview(rs.getString("지역"), rs.getString("음식점번호"), rs.getString("음식점"),
//								rs.getString("사진"), rs.getString("설명"));
//						
//						selectList.add(food);

					cnt++;
					String result = rs.getString("지역") + "\t" + rs.getString("음식점번호") + "\t" + rs.getString("음식점")
							+ "\t" + rs.getString("사진") + "\t" + rs.getString("사진");

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
							cnt = 0;
						} else {
							break;
						}

					}
				}

				rs.close();
				stat.close();

				try {

					stat2 = conn.createStatement();

					printList3(selectList); // 출력
					System.out.println(
							"================================================================================================================================");
					System.out.println();

					System.out.print("예약을 하기 위해 비밀번호를 입력 : ");
					String pw = scan.nextLine();

					System.out.println(
							"================================================================================================================================");
					System.out.print("음식점 번호 입력 : ");
					String num1 = scan.nextLine();
					System.out.print("후기 입력 : ");
					String input = scan.nextLine();

					String sql14 = String.format("select member_seq from tblmember where memberpw = '%s'", pw);

					rs2 = stat2.executeQuery(sql14);

					if (rs2.next()) {

						String result1 = String.format("%s", rs2.getString("member_seq"));

						String sql3 = String.format("insert into tblfoodreview values (foodreview_seq.nextVal, '%s', %s, %s)",
								input, num1, result1);
						stat2.executeUpdate(sql3);

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

		} else if (menu.equals("3")) {

			try {
				int cnt = 0;
				conn = util.open();
				stat = conn.createStatement();

				String sql = "select l.localname as 지역, f.food_seq as 음식점번호, f.foodname as 음식점, f.foodpic as 사진, f.foodcontent as 설명\r\n"
						+ "from tbllocal l\r\n" + "    inner join tblfood f\r\n"
						+ "        on l.local_seq = f.local_seq order by l.local_seq";

				rs = stat.executeQuery(sql);

				while (rs.next()) {
//					AreaBasic food = new AreaBasic(rs.getString("지역"), rs.getString("음식점"),
//							rs.getString("사진"), rs.getString("설명"));
//					
//					areaList.add(food);

					cnt++;
					String result = rs.getString("지역") + "\t" + rs.getString("음식점번호") + "\t" + rs.getString("음식점")
							+ "\t" + rs.getString("사진") + "\t" + rs.getString("사진");

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
							cnt = 0;
						} else {
							break;
						}

					}

				}

				rs.close();
				stat.close();

				try {
					stat2 = conn.createStatement();

					System.out.println(
							"================================================================================================================================");
					System.out.println();

					System.out.print("예약을 하기 위해 비밀번호를 입력 : ");
					String pw = scan.nextLine();


					System.out.println(
							"================================================================================================================================");
					System.out.print("음식점 번호 : ");
					String store = scan.nextLine();
					System.out.print("인원수 입력 : ");
					String population = scan.nextLine();
					System.out.print("날짜 입력(xxxx-xx-xx) : ");
					String date = scan.nextLine();
					
					String sql14 = String.format("select member_seq from tblmember where memberpw = '%s'", pw);

					rs2 = stat2.executeQuery(sql14);

					if (rs2.next()) {

						String result1 = String.format("%s", rs2.getString("member_seq"));

						String sql2 = String.format(
								"insert into tblfoodreserv values (foodreserv_seq.nextVal, to_date('%s', 'yyyy-mm-dd'), %s, %s, %s)",
								date, population, store, result1);

						stat2.executeUpdate(sql2);

					}
					System.out.println("입력이 완료되었습니다.");

					conn.close();
					rs2.close();
					stat2.close();

				} catch (Exception e) {
					e.printStackTrace();
				}

//				

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			return;
		}
	}

	private static void printList(List<AreaBasic> areaList) {
		for (AreaBasic area : areaList) {
			System.out.println(area.getLocal() + "\t" + area.getAreaName() + "\t" + area.getAreaPic() + "\t"
					+ area.getAreaContent());
		}
	}

	private static void printList2(List<AreaReview> reviewList) {
		for (AreaReview review : reviewList) {
			System.out.println(review.getName() + "\t" + review.getId() + "\t" + review.getReview());
		}
	}

	private static void printList3(List<SelectReview> selectList) {
		for (SelectReview select : selectList) {
			System.out.println(select.getLocalNumber() + "\t" + select.getLocal() + "\t" + select.getAreaName() + "\t"
					+ select.getAreaPic() + "\t" + select.getAreaContent());
		}
	}
}
