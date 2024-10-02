package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDao {
	final String driver = "org.mariadb.jdbc.Driver";
	final String DB_IP = "192.168.32.14";
	final String DB_PORT = "3306";
	final String DB_NAME = "bibliotdb";
	final String DB_URL1 = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "1234";
	Connection conn = null;

	public UserDao() {
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

	public void insertUser(User user) throws SQLException {
		String sql = "INSERT INTO customers (cust_id_PK, cust_password, cust_name, telnum, email) VALUES (?, ?, ?, ?, ?)";

		try (Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, user.getId());
			stmt.setString(2, user.getPassword());
			stmt.setString(3, user.getName());
			stmt.setString(4, user.getTel());
			stmt.setString(5, user.getEmail());
			stmt.executeUpdate();
			System.out.println("사용자 정보가 성공적으로 삽입되었습니다.");
		} catch (SQLException e) {
			System.out.println("DB 삽입 실패");
			e.printStackTrace();
			throw e;
		}
	}

	public User getUserById(String userId) {
		User user = null;

		String query = "SELECT cust_id_PK, cust_password, cust_name, telnum, email FROM customers WHERE cust_id_PK = ?";

		try (Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, userId); // 입력받은 ID를 쿼리에 바인딩
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) { // 사용자 정보가 있는지 확인
					// DB에서 조회한 정보로 User 객체를 생성
					user = new User();
					user.setId(rs.getString("cust_id_PK"));
					user.setName(rs.getString("cust_name"));
					user.setPassword(rs.getString("cust_password"));
					user.setTel(rs.getString("telnum"));
					user.setEmail(rs.getString("email"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user; // 조회된 사용자 정보를 반환 (없으면 null 반환)
	}

	public ArrayList<User> getUsersByName(String userName) {
		ArrayList<User> arrayOfUsers = new ArrayList<>();

		String query = "SELECT cust_id_PK, cust_password, cust_name, telnum, email FROM customers WHERE cust_name = ?";

		try (Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, userName); // 입력받은 name을 쿼리에 바인딩
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) { // 사용자 정보가 있는지 확인
					// DB에서 조회한 정보로 User 객체를 생성
					User user = new User();
					user.setId(rs.getString("cust_id_PK"));
					user.setName(rs.getString("cust_name"));
					user.setPassword(rs.getString("cust_password"));
					user.setTel(rs.getString("telnum"));
					user.setEmail(rs.getString("email"));

					arrayOfUsers.add(user);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return arrayOfUsers; // 조회된 사용자 정보를 반환 (없으면 null 반환)
	}

	public void modifyName(String id, String newName) {
		String query = "SELECT cust_name FROM customers WHERE cust_id_PK = ?";

		try (Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD)) {
			PreparedStatement stmt = conn.prepareStatement(query);

			stmt.setString(1, id);
			stmt.execute();
			
			query = "UPDATE customers SET cust_name = ? WHERE cust_id_PK = ?";
			PreparedStatement updateStmt = conn.prepareStatement(query);

			updateStmt.setString(1, newName);
			updateStmt.setString(2, id);
			updateStmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public boolean isIdExists(String id) {
		String query = "SELECT cust_id_PK FROM customers WHERE cust_id_PK = ?";
		boolean exists = false;

		try (Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD)) {
			PreparedStatement stmt = conn.prepareStatement(query);

			stmt.setString(1, id);
			stmt.execute();
			
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
	                exists = true; // ID found
	            }
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return exists;
	}
	
	
	public void modifyTel(String id, String newTel) {
		String query = "SELECT telnum FROM customers WHERE cust_id_PK = ?";

		try (Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD)) {
			PreparedStatement stmt = conn.prepareStatement(query);

			stmt.setString(1, id);
			stmt.execute();
			
			query = "UPDATE customers SET telnum = ? WHERE cust_id_PK = ?";
			PreparedStatement updateStmt = conn.prepareStatement(query);

			updateStmt.setString(1, newTel);
			updateStmt.setString(2, id);
			updateStmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public void modifyEmail(String id, String newEmail) {
		String query = "SELECT email FROM customers WHERE cust_id_PK = ?";

		try (Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD)) {
			PreparedStatement stmt = conn.prepareStatement(query);

			stmt.setString(1, id);
			stmt.execute();
			
			query = "UPDATE customers SET email = ? WHERE cust_id_PK = ?";
			PreparedStatement updateStmt = conn.prepareStatement(query);

			updateStmt.setString(1, newEmail);
			updateStmt.setString(2, id);
			updateStmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public void modifyPassword(String id, String newPassword) {
		String query = "SELECT cust_password FROM customers WHERE cust_id_PK = ?";

		try (Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD)) {
			PreparedStatement stmt = conn.prepareStatement(query);

			stmt.setString(1, id);
			stmt.execute();
			
			query = "UPDATE customers SET cust_password = ? WHERE cust_id_PK = ?";
			PreparedStatement updateStmt = conn.prepareStatement(query);

			updateStmt.setString(1, newPassword);
			updateStmt.setString(2, id);
			updateStmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public void exitCustomersTable(String id) {
		String query = "DELETE FROM customers WHERE cust_id_PK = ?";
		try (Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD)) {
			PreparedStatement stmt = conn.prepareStatement(query);

			stmt.setString(1, id);
			stmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
