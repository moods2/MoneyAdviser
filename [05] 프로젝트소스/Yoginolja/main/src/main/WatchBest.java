package main;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class WatchBest {

	private static Connection conn = null;
	private static Statement stat = null;
	private static ResultSet rs = null;
	private static DBUtil util = new DBUtil();
	private static Scanner scan = new Scanner(System.in);

	public void bWatch() {

		List<BestAreaBasic> bestList = new ArrayList<BestAreaBasic>();

		try {
			conn = util.open();
			stat = conn.createStatement();

			String sql = "select l.localname as 지역, e.enjoyname as 즐길거리이름, f.foodname as 음식점이름, h.hotelname as 숙박시설이름 \r\n"
					+ "from tblbesttourspot b -- 베스트\r\n" + "    inner join tblenjoy e -- 즐길거리\r\n"
					+ "        on b.enjoy_seq = e.enjoy_seq\r\n" + "            inner join tblfood f -- 음식점\r\n"
					+ "                on b.food_seq = f.food_seq\r\n"
					+ "                    inner join tblhotel h -- 숙박시설\r\n"
					+ "                        on h.hotel_seq = b.hotel_seq\r\n"
					+ "                            inner join tbllocal l -- 지역\r\n"
					+ "                                on b.local_seq = l.local_seq\r\n";

			rs = stat.executeQuery(sql);

			while (rs.next()) {

				bestList.add(new BestAreaBasic(rs.getString("지역"), rs.getString("즐길거리이름"), rs.getString("음식점이름"),
						rs.getString("숙박시설이름")));
			}

			System.out.println(
					"================================================================================================================================");
			System.out.print("조회하실 지역명을 입력하세요 : ");
			String city = scan.nextLine();
			
			for (int i = 0; i < bestList.size(); i++) {
				
				if (bestList.get(i).getAreaName().equals(city)) {
					
					System.out.printf("%s\t%s\t\t%s\t%s\t", bestList.get(i).getAreaName(),
							bestList.get(i).getEnjoyName(),
							bestList.get(i).getFoodName(),
							bestList.get(i).getHotelName());
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
