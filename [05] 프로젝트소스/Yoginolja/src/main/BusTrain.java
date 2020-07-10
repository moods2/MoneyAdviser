package main;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class BusTrain {
	
	
		
		private static Connection conn = null;
		private static Statement stat = null;
		private static ResultSet rs = null;
		private static DBUtil util = new DBUtil();
		private static Scanner scan = new Scanner(System.in);
		
		public void printBusTrain() {
			
			boolean loop = true;
			
			
			while (loop) { // 
				System.out.println("============================================================");
				System.out.println("		[교통수단 예매]");
				System.out.println("============================================================");
				System.out.println("1 : 		[기차 예매]");
				System.out.println("2 : 		[버스 예매]");
				
				Connection conn = null;
				Statement stat = null;
				ResultSet rs = null;
				
				System.out.println("---------------------------------------------------------");
				System.out.print("입력 : ");
				String sel = scan.nextLine();
				
				if (sel.equals("1")) {
				try {
					conn = util.open();
					stat = conn.createStatement();
					
					String sql = "select trainstation_seq as 역번호, trainstationname as 역이름 from tbltrainstation order by trainstation_seq";
					
					rs = stat.executeQuery(sql);
					System.out.println("================================================================================================================================");
//					System.out.println("[과정번호]\t\t\t\t[과정명]\t\t\t\t[과정기간]\t\t[교사명]\t[강의실]");
					while (rs.next()) { //역번호, 역이름  출발기준
						
						String result = String.format("%s\t%s",rs.getString("역번호"),rs.getString("역이름"));				


						
						System.out.println(result);
						
					}
					System.out.println("================================================================================================================================");
					
					System.out.print("출발 기차역 : ");
					String starttrain = scan.nextLine();
					
					System.out.println();
					System.out.println();
					conn.close();
					stat.close();
					
					
						try {
							conn = util.open();
							stat = conn.createStatement();
							rs = null;
							
							String sql2 = "select trainstation_seq as 역번호, trainstationname as 역이름 from tbltrainstation order by trainstation_seq";
													
							rs = stat.executeQuery(sql2);
							System.out.println("================================================================================================================================");
//							System.out.println("[과정번호]\t\t\t\t[과정명]\t\t\t\t[과정기간]\t\t[교사명]\t[강의실]");
							while (rs.next()) { //역번호, 역이름  도착기준
								
								String result = String.format("%s\t%s",rs.getString("역번호"),rs.getString("역이름"));				


								
								System.out.println(result);							
								
							}
							System.out.println("========================================================================================================================");
							System.out.print("도착 기차역번호 : ");
							String arrivetrain = scan.nextLine();
							
							System.out.println("무궁화");
							System.out.println("KTX");
							System.out.println("ITX-새마을");
							System.out.print("기차 종류 : ");
							String traintype = scan.nextLine();
							
							
							System.out.println();
							System.out.println();
//							rs.close();							
							conn.close();
							stat.close();							
							
							
							try {
								conn = util.open();
								stat = conn.createStatement();
								rs = null;
//								System.out.println("왜안대");
//								String sql3 = "select distinct traintype as 기차종류, e.* ," + 
//										"to_char(trainstart_time,'hh24:mi') as 출발시간, d.trainstationname as 도착기차역 ," + 
//										"    to_char(trainarrive_time,'hh24:mi') as 도착시간,trainprice as 가격, trans_seq as 기차번호" + 
//										"        from" + 
//										"        (select  b.trainstationname as 출발기차역 " + 
//										"        from tbltrain a" + 
//										"            inner join tbltrainstation b" + 
//										"                on a.Strainstation_seq = b.trainstation_seq" + 
//										"                     where traintype = '무궁화' and a.Strainstation_seq = 1 and a.Atrainstation_seq = 15) e," + 
//										"                     tbltrain c" + 
//										"            inner join tbltrainstation d" + 
//										"                on c.Atrainstation_seq = d.trainstation_seq" + 
//										"                     where traintype = '무궁화' and c.Strainstation_seq = 1 and c.Atrainstation_seq = 15" + 
//										"                     order by c.trans_seq";
								
								String sql3 = String.format("select distinct traintype as 기차종류, e.* ," + 
										"to_char(trainstart_time,'hh24:mi') as 출발시간, d.trainstationname as 도착기차역 ," + 
										"    to_char(trainarrive_time,'hh24:mi') as 도착시간,trainprice as 가격, trans_seq as 기차번호" + 
										"        from" + 
										"        (select  b.trainstationname as 출발기차역 " + 
										"        from tbltrain a" + 
										"            inner join tbltrainstation b" + 
										"                on a.Strainstation_seq = b.trainstation_seq" + 
										"                     where traintype = '%s' and a.Strainstation_seq = %s and a.Atrainstation_seq = %S) e," + 
										"                     tbltrain c" + 
										"            inner join tbltrainstation d" + 
										"                on c.Atrainstation_seq = d.trainstation_seq" + 
										"                     where traintype = '%S' and c.Strainstation_seq = %S and c.Atrainstation_seq = %S" + 
										"                     order by c.trans_seq", traintype, starttrain,arrivetrain,traintype,starttrain,arrivetrain);


														
								rs = stat.executeQuery(sql3);
								System.out.println("================================================================================================================================");
								System.out.println("[기차종류]\t[출발기차역]\t[출발시간]\t[도착기차역]\t[도착시간]\t[가격]\t[기차번호]");
								while (rs.next()) { //역번호, 역이름  도착기준
									
									String result = String.format("%s\t%s\t%s\t%s\t%s\t%s\t%s",rs.getString("기차종류"),rs.getString("출발기차역"),rs.getString("출발시간"),rs.getString("도착기차역"),rs.getString("도착시간"),rs.getString("가격"),rs.getString("기차번호"));				

									
									
									System.out.println(result);				
							}
								System.out.println("========================================================================================================================");
								System.out.print("예매하기 : ");
								String trainreserv = scan.nextLine();
								rs.close();							
								conn.close();
								stat.close();
							}
								catch (Exception e) {
								// TODO: handle exception
							}
							
							
//							loop = false;
							
							System.out.println();
							System.out.print("계속하시려면 엔터를 눌러주세요");						
							String num3 = scan.nextLine();
						} catch (Exception e) {
							e.printStackTrace();
							// TODO: handle exception
						}
						
			
					
					
					conn.close();
					stat.close();
					
					loop = false;
				} catch (Exception e) {
					e.printStackTrace();
				}
				} else if (sel.equals("2")) {
					
					System.out.println("---------------------------------------------------------");
					System.out.println("1 : 		[1 강의실]");
					System.out.println("2 : 		[2 강의실]");
					System.out.println("3 : 		[3 강의실]");
					System.out.println("4 : 		[4 강의실]");
					System.out.println("5 : 		[5 강의실]");
					System.out.println("6 : 		[6 강의실]");
					System.out.println("---------------------------------------------------------");
					System.out.print("기자재조회강의실 : ");
					String num2 = scan.nextLine();
					
					try {
						conn = util.open();
						stat = conn.createStatement();
						rs = null;
						
						String sql = String.format("SELECT ti.item_seq as 기자재번호, ti.name as 기자재명, ti.itemqty as 기자재수량, ti.room_seq as 강의실" + 
								"    FROM tblItem ti" + 
								"        INNER JOIN tblroom tr" + 
								"            ON tr.room_seq = ti.room_seq" + 
								"                INNER JOIN tblCourselist cl" + 
								"                    ON cl.Courselist_seq = ti.Courselist_seq" + 
								"                        WHERE ti.room_seq = %s ", num2);
												
						rs = stat.executeQuery(sql);
						System.out.println("============================================================");
						System.out.println("[기자재번호]\t[기자재명]\t[기자재수량]\t[강의실]");
						while (rs.next()) { //기자재번호, 기자재명, 기자재수량, 강의실
							
//							String result = String.format("%5s\t\t%6s\t%6s\t\t%5s", rs.getString("기자재번호"),  rs.getString("기자재명"), rs.getString("기자재수량")
//							,rs.getString("강의실"));
							String result = String.format("%-5s\t\t%-6s\t%-6s\t\t%-5s", rs.getString("기자재번호"),  rs.getString("기자재명"), rs.getString("기자재수량")
							,rs.getString("강의실"));
					
							System.out.println(result);
								
						}
						System.out.println("============================================================");
						rs.close();							
						conn.close();
						stat.close();
						
						
						loop = false;
						
						System.out.println();
						System.out.print("계속하시려면 엔터를 눌러주세요");						
						String num3 = scan.nextLine();
					} catch (Exception e) {
						e.printStackTrace();
						// TODO: handle exception
					}
					
					
				}
					
					
			}//while
			
			
			
		}

}

