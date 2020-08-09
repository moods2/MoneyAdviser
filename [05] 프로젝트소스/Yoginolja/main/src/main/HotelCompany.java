package main;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class HotelCompany {

	// 입력받는 스캐너의 선언
	public static Scanner scan = new Scanner(System.in);
	public static Boolean roof = true;

	// 예약/결제 내역 -> 날짜를 입력받아서 검색된 날짜의 예약/결제 내역 불러오기(지금 다 불러오면 너무 많아서..)
	public static void reservation() {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		DBUtil util = new DBUtil();
		try {
			System.out.println("\t\t조회할 기간을 입력해주세요");
			System.out.print("\t\t시작날짜 : ");
			String dates = scan.nextLine();
			System.out.print("\t\t마지막날짜 : ");
			String datel = scan.nextLine();

			conn = util.open();
			stat = conn.createStatement();
			String sql = String.format(
					"select 예약번호,to_char(날짜,'yyyy-mm-dd'), 가격, 회원아이디 from vwhotelreserv where 숙박업체번호 = %s and 날짜 between '%s' and '%s' order by 날짜 desc",
					HotelCompanyLogin.companynum, dates, datel);
			rs = stat.executeQuery(sql);
			System.out.println("\t\t[예약번호]\t[날짜]\t\t[가격]\t[회원아이디]");
			while (rs.next()) {
				System.out.printf("\t\t%s\t", rs.getString(1));
				System.out.printf("%s\t\t", rs.getString(2));
				System.out.printf("%s\t", rs.getString(3));
				System.out.printf("%s\t\r\n", rs.getString(4));
			}
			rs.close();
			stat.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}

	}

	// 체크인아웃 확인
	public static void checkinout() {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		DBUtil util = new DBUtil();

		try {
			System.out.println("\t\t조회할 기간을 입력해주세요");
			System.out.print("\t\t시작날짜 : ");
			String dates = scan.nextLine();
			System.out.print("\t\t마지막날짜 : ");
			String datel = scan.nextLine();

			conn = util.open();
			stat = conn.createStatement();
			String sql = String.format(
					"select 예약번호, to_char(날짜, 'yyyy-mm-dd') as 날짜, to_char(체크인시각, 'hh24:mi'), to_char(체크아웃시각, 'hh24:mi'), 회원아이디 from vwcheckinout where 숙박업체번호 = %s and 날짜 between '%s' and '%s' order by 날짜 desc",
					HotelCompanyLogin.companynum, dates, datel);
			rs = stat.executeQuery(sql);
			System.out.println("\t\t[예약번호]\t[날짜]\t\t[체크인시각]\t[체크인시각]\t[회원아이디]");
			while (rs.next()) {
				System.out.printf("\t\t%s\t", rs.getString(1));
				System.out.printf("%s\t\t", rs.getString(2));
				System.out.printf("%s\t", rs.getString(3));
				System.out.printf("%s\t", rs.getString(4));
				System.out.printf("%s\t\r\n", rs.getString(5));
			}
			rs.close();
			stat.close();
			conn.close();
			while (roof) {

				System.out.println("============================================================");
				System.out.println("\t\t 1.체크인시각 입력하기");
				System.out.println("\t\t 2.체크아웃시각 입력하기");
				System.out.println("\t\t 0.뒤로가기");
				System.out.print("\t\t선택(번호) : ");
				String input = scan.nextLine();
				System.out.println("============================================================");

				if (input.equals("1")) {
					checkin();
				} else if (input.equals("2")) {
					checkout();
				} else if (input.equals("0")) {
					break;
				}
			}
		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}

	}

	// 체크아웃
	public static void checkout() {
		Connection conn = null;
		Statement stat = null;
		DBUtil util = new DBUtil();

		try {
			System.out.println("\t\t체크아웃시각을 입력할 예약번호를 입력해주세요");
			System.out.print("\t\t예약번호 : ");
			String input = scan.nextLine();
			System.out.println("\t\t체크아웃시각을 입력해주세요");
			System.out.print("\t\t체크아웃시각 : ");
			String inputtime = scan.nextLine();
			conn = util.open();
			stat = conn.createStatement();
			String sql = String.format(
					"update tblroomreserv set checkout = to_date('%s','hh24:mi') where roomreserv_seq = %s", inputtime,
					input);
			stat.executeUpdate(sql);
			System.out.println("\t\t체크아웃 시각이 입력되었습니다.");
			stat.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}
	}

	// 체크인
	public static void checkin() {
		Connection conn = null;
		Statement stat = null;
		DBUtil util = new DBUtil();

		try {
			System.out.println("\t\t체크인시각을 입력할 예약번호를 입력해주세요");
			System.out.print("\t\t예약번호 : ");
			String input = scan.nextLine();
			System.out.println("\t\t체크인시각을 입력해주세요");
			System.out.print("\t\t체크인시각 : ");
			String inputtime = scan.nextLine();
			conn = util.open();
			stat = conn.createStatement();
			String sql = String.format(
					"update tblroomreserv set checkin = to_date('%s','hh24:mi') where roomreserv_seq = %s", inputtime,
					input);
			stat.executeUpdate(sql);
			System.out.println("\t\t체크인 시각이 입력되었습니다.");
			stat.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}
	}

	// 숙박시설조회, 수정, 등록, 삭제
	public static void hotellist() {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		DBUtil util = new DBUtil();
		System.out.println("\t\t숙박시설 정보를 조회합니다.");

		try {
			// 연결
			conn = util.open();
			stat = conn.createStatement();
			String sql = String.format(
					"select  h.hotel_seq, h.hotelname, h.hotelpicture, h.hoteldescription, hcg.hotelcategory, l.localname from tblhotel h inner join tbllocal l"
							+ "    on h.local_seq = l.local_seq"
							+ "        inner join tblhotelcategory hcg on hcg.hotelcategory_seq = h.hotelcategory_seq where hotelcompany_seq=%s",
					HotelCompanyLogin.companynum);
			rs = stat.executeQuery(sql);
			System.out.println("\t\t[숙박시설번호] [숙박시설명]  [숙박시설사진]\t [카테고리]     [지역]      [설명]  ");

			while (rs.next()) {
				System.out.printf("\t\t%s\t", rs.getString(1));
				System.out.printf("%s\t\t", rs.getString(2));
				System.out.printf("%s\t", rs.getString(3));
				System.out.printf("%s\t", rs.getString(5));
				System.out.printf("%s\t", rs.getString(6));
				System.out.printf("%s\t\r\n", rs.getString(4));
			}

			rs.close();
			stat.close();
			conn.close();

			while (roof) {

				System.out.println("============================================================");
				System.out.println("\t\t1. 숙박시설 등록");
				System.out.println("\t\t2. 숙박시설 정보수정");
				System.out.println("\t\t3. 숙박시설 삭제");
				System.out.println("\t\t0. 뒤로가기");
				System.out.println("============================================================");
				System.out.print("\t\t번호 입력 : ");
				String input = scan.nextLine();

				if (input.equals("1")) {
					hotelregist();
				} else if (input.equals("2")) {
					hotelupdate();
				} else if (input.equals("3")) {
					hoteldelete();
				} else if (input.equals("0")) {
					break;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 숙박시설등록
	public static void hotelregist() {
		Connection conn = null;
		CallableStatement stat = null;
		DBUtil util = new DBUtil();

		try {
			System.out.println("\t\t등록할 숙박시설의 정보를 입력해주세요.");
			System.out.print("\t\t숙박시설명 : ");
			String name = scan.nextLine();
			System.out.print("\t\t숙박시설이미지 : ");
			String img = scan.nextLine();
			System.out.print("\t\t숙박시설설명 : ");
			String desc = scan.nextLine();
			System.out.print("\t\t숙박시설카테고리번호 : ");
			String category = scan.nextLine();
			System.out.print("\t\t숙박시설지역번호 : ");
			String local = scan.nextLine();

			conn = util.open();
			String sql = "{call prochotelinsert(?,?,?,?,?,?)}";
			stat = conn.prepareCall(sql);
			stat.setString(1, name);
			stat.setString(2, img);
			stat.setString(3, desc);
			stat.setString(4, category);
			stat.setInt(5, HotelCompanyLogin.companynum);
			stat.setString(6, local);
			stat.executeUpdate();
			System.out.println("\t\t숙박시설이 등록되었습니다.");
			stat.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}
	}

	// 숙박시설정보수정 -> 오류
	public static void hotelupdate() {
		Connection conn = null;
		CallableStatement stat = null;
		DBUtil util = new DBUtil();

		try {
			System.out.println("\t\t수정할 숙박시설의 번호를 입력해주세요.");
			System.out.print("\t\t숙박시설번호 : ");
			int hotelnum = Integer.parseInt(scan.nextLine());
			System.out.println("\t\t수정할 숙박시설의 정보를 입력해주세요.");
			System.out.print("\t\t숙박시설명 : ");
			String name = scan.nextLine();
			System.out.print("\t\t숙박시설이미지 : ");
			String img = scan.nextLine();
			System.out.print("\t\t숙박시설설명 : ");
			String desc = scan.nextLine();
			System.out.print("\t\t숙박시설카테고리번호 : ");
			int category = Integer.parseInt(scan.nextLine());
			System.out.print("\t\t숙박시설지역번호 : ");
			int local = Integer.parseInt(scan.nextLine());

			conn = util.open();
			String sql = "{call prochotelupdate(?,?,?,?,?,?)}";
			stat = conn.prepareCall(sql);

			stat.setInt(1, hotelnum);
			stat.setString(2, name);
			stat.setString(3, img);
			stat.setString(4, desc);
			stat.setInt(5, category);
			stat.setInt(6, local);
			stat.executeUpdate();
			System.out.println("숙박시설이 수정되었습니다.");
			stat.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}
	}

	// 숙박시설삭제
	public static void hoteldelete() {
		Connection conn = null;
		CallableStatement stat = null;
		DBUtil util = new DBUtil();
		System.out.println("============================================================");
		System.out.print("\t\t삭제할 숙박시설번호 입력 : ");
		String hotelNum = scan.nextLine();
		System.out.println("============================================================");
		try {
			conn = util.open();
			String sql = "{call prochoteldelete(?)}";
			stat = conn.prepareCall(sql);
			stat.setString(1, hotelNum);
			stat.executeUpdate();
			stat.close();
			conn.close();
			System.out.println();
			System.out.println("============================================================");
			System.out.println("\t\t삭제가 완료되었습니다.");
			System.out.println("============================================================");
			System.out.println();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//업체정보수정
	public static void companyupdate() {
		Connection conn = null;
		CallableStatement stat = null;
		DBUtil util = new DBUtil();

		try {

			System.out.println("\t\t수정할 업체 정보를 입력해주세요.");
			System.out.print("\t\t숙박업체이름 : ");
			String name = scan.nextLine();
			System.out.print("\t\t전화번호 : ");
			String tel = scan.nextLine();
			System.out.print("\t\t계좌번호 : ");
			String account = scan.nextLine();
			System.out.print("\t\t은행 : ");
			String bank = scan.nextLine();
			System.out.print("\t\t사업자등록번호 : ");
			String ssd = scan.nextLine();

			conn = util.open();
			String sql = "{call prochocompanyupdate(?,?,?,?,?,?)}";
			stat = conn.prepareCall(sql);

			stat.setInt(1, HotelCompanyLogin.companynum);
			stat.setString(2, name);
			stat.setString(3, tel);
			stat.setString(4, account);
			stat.setString(5, bank);
			stat.setString(6, ssd);
			stat.executeUpdate();
			System.out.println("\t\t숙박업체정보가 수정되었습니다.");
			stat.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}

	}

	public static void roommanage() {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		DBUtil util = new DBUtil();
		try {

			System.out.println("==========================<객실 정보>==========================");
			conn = util.open();
			stat = conn.createStatement();
			String sql = String.format(
					"select r.room_seq as \"객실번호\", r.roomname as \"객실명\", r.roomprice as \"가격\", r.roompersoncount as \"수용인원\"  from tblroom r"
							+ "    inner join tblhotel h" + "        on r.hotel_seq = h.hotel_seq"
							+ "            inner join tblhotelcompany hc"
							+ "                on hc.hotelcompany_seq = h.hotelcompany_seq where hc.hotelcompany_seq =%s order by room_seq",
					HotelCompanyLogin.companynum);
			rs = stat.executeQuery(sql);
			System.out.println("\t\t[객실번호]\t[객실명]\t[가격]\t[수용인원]");
			while (rs.next()) {
				System.out.printf("\t\t%s\t", rs.getString(1));
				System.out.printf("%s\t", rs.getString(2));
				System.out.printf("%s\t", rs.getString(3));
				System.out.printf("%s\t\r\n", rs.getString(4));
			}
			rs.close();
			stat.close();
			conn.close();

			while (roof) {
				System.out.println("============================================================");
				System.out.println("\t\t1. 객실등록");
				System.out.println("\t\t2. 객실 정보수정");
				System.out.println("\t\t3. 객실 삭제");
				System.out.println("\t\t0. 뒤로가기");
				System.out.println("============================================================");
				System.out.print("\t\t번호 입력 : ");
				String input = scan.nextLine();

				if (input.equals("1")) {
					roomregist();

				} else if (input.equals("2")) {
					roomupdate();
				} else if (input.equals("3")) {
					roomdelete();
				} else if (input.equals("0")) {
					break;
				}

			}

		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}

	}

	// 객실등록
	private static void roomregist() {
		Connection conn = null;
		CallableStatement stat = null;
		DBUtil util = new DBUtil();

		try {
			System.out.println("\t\t등록할 객실의 정보를 입력해주세요.");
			System.out.print("\t\t객실명 : ");
			String name = scan.nextLine();
			System.out.print("\t\t객실수용인원 : ");
			String count = scan.nextLine();
			System.out.print("\t\t객실가격: ");
			String price = scan.nextLine();

			conn = util.open();
			String sql = "{call procroominsert(?,?,?,?)}";
			stat = conn.prepareCall(sql);
			stat.setInt(1, HotelCompanyLogin.companynum);
			stat.setString(2, price);
			stat.setString(3, count);
			stat.setString(4, name);
			stat.executeUpdate();
			System.out.println("\t\t객실이 등록되었습니다.");
			stat.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}

	}

	// 객실수정
	private static void roomupdate() {
		Connection conn = null;
		CallableStatement stat = null;
		DBUtil util = new DBUtil();

		try {
			System.out.println("\t\t수정할 객실의 정보를 입력해주세요.");

			System.out.print("\t\t객실번호 : ");
			String roomnum = scan.nextLine();
			System.out.print("\t\t객실명 : ");
			String name = scan.nextLine();
			System.out.print("\t\t객실수용인원 : ");
			String count = scan.nextLine();
			System.out.print("\t\t객실가격: ");
			String price = scan.nextLine();
			conn = util.open();
			String sql = "{call procroomupdate(?,?,?,?)}";
			stat = conn.prepareCall(sql);
			stat.setString(1, roomnum);
			stat.setString(2, price);
			stat.setString(3, count);
			stat.setString(4, name);
			stat.executeUpdate();
			System.out.println("\t\t객실이 수정되었습니다.");
			stat.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}

	}

	// 객실삭제
	private static void roomdelete() {
		Connection conn = null;
		CallableStatement stat = null;
		DBUtil util = new DBUtil();

		try {
			System.out.println("\t\t삭제할 객실의 정보를 입력해주세요.");

			System.out.print("\t\t객실번호 : ");
			String roomnum = scan.nextLine();
			conn = util.open();
			String sql = "{call procroomdelete(?)}";
			stat = conn.prepareCall(sql);
			stat.setString(1, roomnum);
			stat.executeUpdate();
			System.out.println("\t\t객실이 삭제되었습니다.");
			stat.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}

	}

//객실별 예약현황
	public static void roomreservation() {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		DBUtil util = new DBUtil();
		try {
			System.out.println("\t\t조회할 정보를 입력해주세요");
			System.out.print("\t\t객실명 : ");
			String roomname = scan.nextLine();
			System.out.print("\t\t시작날짜 : ");
			String dates = scan.nextLine();
			System.out.print("\t\t마지막날짜 : ");
			String datel = scan.nextLine();

			conn = util.open();
			stat = conn.createStatement();
			String sql = String.format(
					"select to_char(hs.issuedate,'yyyy-mm-dd') as 날짜, hs.hotelschedulestate as 예약현황 from tblhotelschedule hs"
							+ "    inner join tblroom r" + "        on hs.room_seq = r.room_seq"
							+ "            inner join tblhotel h" + "                on r.hotel_seq = h.hotel_seq "
							+ "                    inner join tblhotelcompany hc"
							+ "                        on hc.hotelcompany_seq = h.hotelcompany_seq"
							+ "                            where hc.hotelcompany_seq = %s and r.roomname= '%s' and hs.issuedate between '%s' and '%s' order by hs.issuedate",
					HotelCompanyLogin.companynum, roomname, dates, datel);
			rs = stat.executeQuery(sql);
			System.out.println("\t\t[날짜]\t\t[예약상태]");
			while (rs.next()) {
				System.out.printf("\t\t%s\t", rs.getString(1));
				System.out.printf("%s\r\n", rs.getString(2));

			}
			rs.close();
			stat.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}

	}

	// 정산
	public static void account() {
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
			
			//상세내역 출력 후 총액 출력
			String sql2 = String.format(
					"select r.roomprice as 가격, hc.hotelname as 숙박업체명, to_char(hs.issuedate,'yyyy-mm-dd') as 날짜 "
							+ "from tblroomreserv rr " + "    inner join tblhotelschedule hs "
							+ "        on rr.hotelschedule_seq = hs.hotelschedule_seq "
							+ "            inner join tblroom r " + "                on r.room_seq = hs.room_seq "
							+ "                    inner join tblhotel h "
							+ "                        on h.hotel_seq =r.hotel_seq "
							+ "                            inner join tblhotelcompany hc "
							+ "                                on hc.hotelcompany_seq = h.hotelcompany_seq "
							+ "                                    where rr.checkin is not null and rr.checkout is not null and "
							+ "                                        hs.issuedate between '%s' and '%s' and h.hotelcompany_seq= %s "
							+ "                                      order by hs.issuedate, h.hotel_seq",
					dates, datel,HotelCompanyLogin.companynum);
			rs2 = stat.executeQuery(sql2);
			
			System.out.println("\t\t[날짜]\t\t[가격]");
			while (rs2.next()) {
				System.out.printf("\t\t%s\t", rs2.getString(3));
				System.out.printf("%s\r\n", rs2.getString(1));

			}
			
			
			// 총액보기
			String sql1 = String.format("select hc.hotelname as 숙박업체명, sum(r.roomprice) as 가격 "
					+ "from tblroomreserv rr " + "    inner join tblhotelschedule hs "
					+ "        on rr.hotelschedule_seq = hs.hotelschedule_seq " + "            inner join tblroom r "
					+ "                on r.room_seq = hs.room_seq " + "                    inner join tblhotel h "
					+ "                        on h.hotel_seq =r.hotel_seq "
					+ "                            inner join tblhotelcompany hc "
					+ "                                on hc.hotelcompany_seq = h.hotelcompany_seq "
					+ "                                    where rr.checkin is not null and rr.checkout is not null and hs.issuedate between '%s' and '%s' and hc.hotelcompany_seq=%s "
					+ "                                     group by hc.hotelname", dates, datel, HotelCompanyLogin.companynum);

			rs1 = stat.executeQuery(sql1);
			System.out.println("\t\t>>>>>>>>>총액<<<<<<<<<");
			while (rs1.next()) {
				System.out.printf("\t\t%s\r\n", rs1.getInt(2));

			}
			rs1.close();
			rs2.close();
			stat.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}

	}
	//월별 예약건수
	public static void statistics() {
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		DBUtil util = new DBUtil();
		try {
		
			conn = util.open();
			stat = conn.createStatement();
			//6월 예약건수
			String sql = String.format(
					"select count(rr.roomreserv_seq) from tblroomreserv rr " + 
					"    inner join tblhotelschedule hs " + 
					"        on rr.hotelschedule_seq = hs.hotelschedule_seq " + 
					"            inner join tblroom r " + 
					"                on r.room_seq = hs.room_seq " + 
					"                    inner join tblhotel h " + 
					"                        on h.hotel_seq =r.hotel_seq " + 
					"                            inner join tblhotelcompany hc " + 
					"                                on hc.hotelcompany_seq = h.hotelcompany_seq " + 
					"                                    where hc.hotelcompany_seq = %s and hs.issuedate between '2020-06-01' and '2020-06-30'" 
				,HotelCompanyLogin.companynum);
			rs = stat.executeQuery(sql);
			System.out.println("\t\t[월][예약건수]");
			while (rs.next()) {
				System.out.printf("\t\t6월      %s\t\r\n", rs.getString(1));

			}
			
			
			
			//6월 예약건수
			String sql2 = String.format(
					"select count(rr.roomreserv_seq) from tblroomreserv rr " + 
					"    inner join tblhotelschedule hs " + 
					"        on rr.hotelschedule_seq = hs.hotelschedule_seq " + 
					"            inner join tblroom r " + 
					"                on r.room_seq = hs.room_seq " + 
					"                    inner join tblhotel h " + 
					"                        on h.hotel_seq =r.hotel_seq " + 
					"                            inner join tblhotelcompany hc " + 
					"                                on hc.hotelcompany_seq = h.hotelcompany_seq " + 
					"                                    where hc.hotelcompany_seq = %s and hs.issuedate between '2020-08-01' and '2020-08-31'" 
				,HotelCompanyLogin.companynum);
			
			rs2 = stat.executeQuery(sql2);
			while (rs2.next()) {
				System.out.printf("\t\t8월      %s\t\r\n", rs2.getString(1));

			}
			
			
			
			
			
			
			
			rs.close();
			rs2.close();
			stat.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}
	}

	

}// class
