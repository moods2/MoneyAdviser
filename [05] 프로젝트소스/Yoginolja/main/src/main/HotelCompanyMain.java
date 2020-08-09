package main;

import java.util.Scanner;

public class HotelCompanyMain {

	// 입력받는 스캐너의 선언
	public static Scanner scan = new Scanner(System.in);
	// 루프변수 초기값
	public static Boolean roof = true;

	public static void main(String[] args) {
		HotelCompanyLogin.companyLogins();
		hotelCompanyMain();

	}

	public static void hotelCompanyMain() {
		while (roof) {
			System.out.println("============================================================");
			System.out.println("\t\t[1. 예약/결제내역]");
			System.out.println("\t\t[2. 체크인/체크아웃관리]");
			System.out.println("\t\t[3. 객실별 예약 현황]");
			System.out.println("\t\t[4. 숙박시설 관리]");
			System.out.println("\t\t[5. 객실 관리]");
			System.out.println("\t\t[6. 정산내역]");
			System.out.println("\t\t[7. 통계]");
			System.out.println("\t\t[8. 업체정보 수정]");
			System.out.println("\t\t[0. 뒤로가기]");
			System.out.println("============================================================");
			System.out.print("\t\t선택 (번호) : ");
			String input = scan.nextLine();
			System.out.println("============================================================");

			if (input.equals("1")) {
				// 예약/결제내역
				HotelCompany.reservation();
			} else if (input.equals("2")) {
				// 체크인/체크아웃관리
				HotelCompany.checkinout();
			} else if (input.equals("3")) {
				// 객실별 예약 현황
				HotelCompany.roomreservation();
			} else if (input.equals("4")) {
				// 숙박시설 관리
				HotelCompany.hotellist();
			} else if (input.equals("5")) {
				// 객실관리
				HotelCompany.roommanage();
			} else if (input.equals("6")) {
				// 정산내역
				HotelCompany.account();
			} else if (input.equals("7")) {
				// 통계
				HotelCompany.statistics();
			} else if (input.equals("8")) {
				// 업체정보수정
				HotelCompany.companyupdate();
			} else if (input.equals("0")) {
				// 뒤로가기
				break;
			}

		}

	}
}
