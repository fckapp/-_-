package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MariaDBConnect {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		final String driver = "org.mariadb.jdbc.Driver";
		final String DB_IP = "192.168.32.14";
		final String DB_PORT = "3306";
		final String DB_NAME = "bibliotdb";
		final String DB_URL = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
		Connection conn = null; // DB 연결 객체
		PreparedStatement pstmt = null; // SQL 쿼리 실행하기 위한 객체
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(DB_URL, "root", "1234");
			if(conn != null) {
				System.out.println("DB 접속 성공");
			}
		}catch(ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패");
			e.printStackTrace();
		}catch(SQLException e) {
			System.out.println("DB 접속 실패");
			e.printStackTrace();
		}
		
		try {
			String sql = "select * from customers";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); // PreparedStatement 객체를 사용해 SQL 실행하고, 결과를 rs에 저장.
			String userId = null;
			String password = null;
			String name = null;
			while(rs.next()) { // rs는 쿼리 결과를 순회하면서 데이터를 읽게 해줌.
				userId = rs.getString(1);
				password = rs.getString(2);
				name = rs.getString(3);
				
				System.out.println(userId);
				System.out.println(password);
				System.out.println(name);
				System.out.println("--------------------");
			}
			
		}catch(SQLException e) {
			System.out.println("error: " + e);
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null && !conn.isClosed()) {
					conn.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
