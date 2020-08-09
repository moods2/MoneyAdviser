package main;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

import main.DBUtil;

public class AdminLogin {
	
	
	public static Boolean roof = true;
	static Scanner scan = new Scanner(System.in);
	private static String menuNum = null;
	
	public static void adminLogin() {
	
		
		String id;
		String pw;
		DBUtil util = new DBUtil();
		
		while(true) {
			
		System.out.println("============================================================");
		System.out.println("\t\t[관리자 로그인]");
		System.out.println("============================================================");
		
		System.out.print("\t\tid : ");
		id = scan.nextLine();
		System.out.print("\t\tpw : ");
		pw = scan.nextLine();
		
		//로그인 유효성 검사
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		ArrayList<String> idList = new ArrayList<String>(3); //id 담을 list
		ArrayList<String> pwdList = new ArrayList<String>(3); //pwd 담을 list
		
		int idNum = 0, answer = 0; //id든 목록의 번호와 로그인 상태 반환 변수
		
		try {

			conn = util.open();
			stat = conn.createStatement();
			
			String sql = "select admin_id as id, admin_pw as pwd from tbladmin";
			
			rs = stat.executeQuery(sql);
			
			while (rs.next()) { // 테이블 id,pwd 가져오기
				
				String result = rs.getString("id") + "\t" + rs.getString("pwd");
				
				idList.add(rs.getString("id"));
				pwdList.add(rs.getString("pwd"));				
			}
			
			for(int i=0; i<idList.size(); i++) {
				if(idList.get(i).equals(id)){ //id 있을 경우
					idNum = i;
						
				}else if(!idList.get(i).equals(id)){
					//없는 id
					answer = 1;
				}
			}

			if(pwdList.get(idNum).equals(pw)){ //pw 있을 경우
				//로그인 성공
				System.out.println("============================================================");
				System.out.printf("로그인 되었습니다.\n");

				adminMenu();
				return;
				
			} else if (!pwdList.get(idNum).equals(pw)){
				//틀린 pwd
				answer = 2;
			}
			
			//오류 메세지 출력
			if(answer == 1) {
				System.out.println("============================================================");
				System.out.println("없는 id입니다.");
				//다시 로그인
				return;
			}else if(answer == 2) {
				System.out.println("============================================================");
				System.out.println("비밀번호가 옳지 않습니다.");
				//다시 로그인
				return;
			}
			
			rs.close();
			stat.close();
			conn.close();
			
			if(menuNum.equals("0")) {
				return;
			}
				


		} catch (Exception e) {
			e.printStackTrace();
		}
		
		}//while
		
		
		
	
	
	}
	
	public static void adminMenu() {

		while(roof) {
			System.out.println("============================================================");
			System.out.println("\t\t[1. 교통]");
			System.out.println("\t\t[2. 숙박]");
			System.out.println("\t\t[3. 관광]");
			System.out.println("\t\t[0. 뒤로가기]");
			System.out.println("============================================================");
			System.out.print("\t\t선택 (번호) : ");
			String input = scan.nextLine();
			System.out.println("============================================================");
			
			if(input.equals("1")) {
				BusTrainAdmin bta = new BusTrainAdmin();
				bta.printBusTrain();
			}else if(input.equals("2")) {
				HotelAdmin.hotelAdminMain();
			}else if(input.equals("3")) {
				EnjoyAdminMain.enjoyAdminMain();
			}else if(input.equals("0")) {
				break;
			}
	
		
		}
	}
	
}
