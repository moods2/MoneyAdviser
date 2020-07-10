package main;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 오라클 DB 연결해주는 클래스
 * @author DB1조
 *
 */
public class DBUtil {

	private Connection conn = null;
	

	public Connection open() {
		
		String url = "jdbc:oracle:thin:@yoginolja.ccyezlxmksh2.ap-northeast-2.rds.amazonaws.com:1521:orcl";
		String id = "yoginolja";
		String pw = "1234";

		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(url, id, pw);
			
			return conn; //접속 성공
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null; //접속 실패
		
	}// open()

	public Connection open(String host, String id, String pw) {

		String url = "yoginolja.ccyezlxmksh2.ap-northeast-2.rds.amazonaws.com" + "yoginolja" + ":1521:orcl";

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(url, id, pw);
			
			return conn; // 접속 성공

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null; // 접속 실패

	}// open()
	

	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//close()
	
}