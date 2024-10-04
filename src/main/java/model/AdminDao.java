package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao {
	final String driver = "org.mariadb.jdbc.Driver";
	final String DB_IP = "192.168.32.14"; //192.168.32.14, localhost
	final String DB_PORT = "3306"; //3307
	final String DB_NAME = "bibliotdb";
	final String DB_URL1 = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "1234";
	Connection conn = null;
	
	public AdminDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
			if (conn != null) {
//				System.out.println("DB접속 성공"); // 디버깅
			}
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 접속 실패");
			e.printStackTrace();
		}
	}
	
	public void insertAdmin(Admin admin) throws SQLException {
		String sql = "INSERT INTO administrators (admin_id_PK, admin_password, admin_name) VALUES (?, ?, ?)";

		try (Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, admin.getAdmin_id());
			stmt.setString(2, admin.getAdmin_password());
			stmt.setString(3, admin.getAdmin_name());
			stmt.executeUpdate();
			System.out.println("관리자 정보가 성공적으로 삽입되었습니다.");
		} catch (SQLException e) {
			System.out.println("DB 삽입 실패");
			e.printStackTrace();
			throw e;
		}
	}

	public Admin getAdminById(String adminId) {
		Admin admin = null;

		String query = "SELECT admin_id_PK, admin_password, admin_name FROM administrators WHERE admin_id_PK = ?";

		try (Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, adminId); // 입력받은 ID를 쿼리에 바인딩
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) { // 관리자 정보가 있는지 확인
					// DB에서 조회한 정보로 Admin 객체를 생성
					admin = new Admin();
					admin.setAdmin_id(rs.getString("admin_id_PK"));
					admin.setAdmin_name(rs.getString("admin_name"));
					admin.setAdmin_password(rs.getString("admin_password"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return admin; // 조회된 사용자 정보를 반환 (없으면 null 반환)
	}
}
