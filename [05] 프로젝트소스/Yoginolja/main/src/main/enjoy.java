package main;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class enjoy {

	private static Connection conn = null;
	private static Statement stat = null;
	private static ResultSet rs = null;
	private static DBUtil util = new DBUtil();
	private static Scanner scan = new Scanner(System.in);

	public static void main(String[] args) {

//		enjoyMain();
		adminMain();
	}

	public static void adminMain() {
		 
		boolean loop = true;
		
		while (loop) {
			
			System.out.println("============================================================");
			System.out.println("\t\t\t[즐길거리]");
			System.out.println("============================================================");
			System.out.println("1 :\t\t[음식점]");
			System.out.println("2 :\t\t[즐길거리]");
			System.out.println("3 :\t\t[로그아웃]");

			Connection conn = null;
			Statement stat = null;
			ResultSet rs = null;

			System.out.println("---------------------------------------------------------");
			System.out.print("입력 : ");
			String sel = scan.nextLine();
			
			switch(sel) {
				
			case "1":
				AdminFood a = new AdminFood();
				a.aFood();
				break;
				
			case "2":
				AdminEnjoy e = new AdminEnjoy();
				e.aEnjoy();
				break;
			case "3":
				return;
			}
			
			
		}
		
	}

	public static void enjoyMain() {

		boolean loop = true;

		while (loop) {
			List<AreaBasic> areaList = new ArrayList<AreaBasic>();
//			List<CitySelect> cityList = new ArrayList<CitySelect>();
			List<AreaReview> reviewList = new ArrayList<AreaReview>();

			System.out.println("============================================================");
			System.out.println("\t\t\t[즐길거리]");
			System.out.println("============================================================");
			System.out.println("1 :\t\t[음식점]");
			System.out.println("2 :\t\t[명소]");
			System.out.println("3 :\t\t[베스트]");
			System.out.println("4 :\t\t[로그아웃]");

			Connection conn = null;
			Statement stat = null;
			ResultSet rs = null;

			System.out.println("---------------------------------------------------------");
			System.out.print("입력 : ");
			String sel = scan.nextLine();

			switch (sel) {

			case "1":
				WatchFood w = new WatchFood();
				w.wReview();
				break;
			case "2":
				WatchEnjoy e = new WatchEnjoy();
				e.eReview();
				break;
			case "3":
				WatchBest b = new WatchBest();
				b.bWatch();
				break;
			}
		}
	}
}

