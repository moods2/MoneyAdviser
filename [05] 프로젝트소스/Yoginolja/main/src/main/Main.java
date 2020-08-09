package main;

import java.util.Scanner;

public class Main {

	public void m() {
		Scanner scan = new Scanner(System.in);
		boolean roof = true;

		while (roof) {

			System.out.println();
			System.out.println("\t\t\t\t----------------------------");
			System.out.println("\t\t\t\t1. 유저 로그인");
			System.out.println("\t\t\t\t2. 관리자 로그인");
			System.out.println("\t\t\t\t3. 숙박업체 로그인");
			System.out.println("\t\t\t\t4. 종료");
			System.out.println("\t\t\t\t----------------------------");

			// 입력받는 값 (1 ~ 4)
			System.out.print("\t\t\t\t선택(번호) : ");
			String input = scan.nextLine();

			if (input.equals("1")) {
				// 1. 유저로그인
				UserMain.UserLogin();
			} else if (input.equals("2")) {
				// 2. 관리자 로그인
				AdminLogin admin = new AdminLogin();
				admin.adminLogin();

			} else if (input.equals("3")) {
				// 3. 업체로그인
				HotelCompanyLogin.companyLogins();
				
			} else if (input.equals("4")) {
				// 종료
				roof = false;
				System.out.println("\t\t\t\t종료 하겠습니다.");

			}

			// 유효성 검사
			else {
				System.out.println("\t\t\t\t----------------------------");
				System.out.println("\t\t\t\t잘못 입력하셨습니다");
				System.out.println("\t\t\t\t1 ~ 4 사이의 숫자를 입력해주세요");
				System.out.println("\t\t\t\t계속 하시려면 엔터를 누르세요...");
				System.out.println("\t\t\t\t----------------------------");
				String enter = scan.nextLine();

			}

		} // while

	}
}
