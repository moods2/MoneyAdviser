package main;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;


public class UserMain {
	
	private static Scanner scan = new Scanner(System.in);
	private static String menuNum = null;
	
	public static void main(String[] args) {	
		UserLogin();	
	}
	
	public static void UserLogin() {
		
		String id;
		String pw;
		DBUtil util = new DBUtil();
		
		while(true) {
			
		System.out.println("============================================================");
		System.out.println("\t\t[유저 로그인]");
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
			
			String sql = "select memberid as id, memberpw as pwd from tblmember";
			
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

				menu();
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

	private static void menu() {
		//메인 메뉴
		
		boolean flag = true;
		
		while(flag) {
		System.out.println("============================================================");
		System.out.println("\t\t[메뉴]");
		System.out.println("============================================================");
		System.out.println("\t\t 1. 교통편 ");
		
		System.out.println();
		System.out.println("\t\t0. 로그아웃");
		System.out.println("============================================================");
		
		System.out.print("\t\t입력 : ");
		String num = scan.nextLine();
		
		switch (num) {

		case "1":
			BusTrain bt = new BusTrain();
			bt.printBusTrain();
			break;
			
		
			
		case "0":
			//로그아웃
		
			}
		}
		
	}
	
	
	
}