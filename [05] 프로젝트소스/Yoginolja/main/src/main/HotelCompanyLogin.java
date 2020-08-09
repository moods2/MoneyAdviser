package main;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class HotelCompanyLogin {
	// 계속 넘겨줄 아이디값
	public static String companyname;
	// 계속 넘겨줄 primarykey값
	public static int companynum;
	// pw값 사업자등록번호 대쉬 포함
	public static String companypw;
	// 입력받는 스캐너의 선언
	public static Scanner scan = new Scanner(System.in);

	public static void companyLogins() {

		System.out.println("============================================================");
		System.out.print("\t\t아이디(업체명) : ");
		String inputid = scan.nextLine();
		System.out.print("\t\t비밀번호(사업자등록번호-포함) : ");
		String inputpw = scan.nextLine();
		System.out.println("============================================================");

		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		DBUtil util = new DBUtil();
		// (로그인)제어에 필요한 int 선언 및 초기화
		int control = 0;
		try {
			conn = util.open();
			stat = conn.createStatement();
			String sql = "select * from tblhotelcompany";
			rs = stat.executeQuery(sql);
			while (rs.next()) {
				String seq = rs.getString(1);// 회사번호
				String id = rs.getString(2);// 회사이름-> 아이디
				String pw = rs.getString(6);// 회사사업자등록번호 -> 비밀번호
				if (id.equals(inputid) && pw.equals(inputpw)) {
					control++;
					companynum = Integer.parseInt(seq);
					companyname = id;
					System.out.println("\t\t로그인성공");
					HotelCompanyMain company = new HotelCompanyMain();
					company.hotelCompanyMain();
					// 정보가 잘 들어갔는지 확인
//					System.out.println(companyname);
//					System.out.println(companynum);
					break;

				}

			}
			rs.close();
			stat.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("오류발생");
			e.printStackTrace();
		}
//로그인 정보가 불일치할 경우 재로그인
		if (control == 0) {
			System.out.println("\t\t아이디 또는 비밀번호가 틀렸습니다.");
			System.out.println("\t\t로그인 시도를 다시하려면 엔터를 누르세요.");
			String enter = scan.nextLine();
			companyLogins();

		}

	}
}// class
