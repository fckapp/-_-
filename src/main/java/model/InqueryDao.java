package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class InqueryDao {
	final String driver = "org.mariadb.jdbc.Driver";
	final String DB_IP = "192.168.32.14";
	final String DB_PORT = "3306";
	final String DB_NAME = "bibliotdb";
	final String DB_URL1 = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "1234";
	Connection conn = null;
	
	public InqueryDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
			if (conn != null) {
//				System.out.println("[Inquery]DB접속 성공"); // 디버깅
			}
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 접속 실패");
			e.printStackTrace();
		}
	}
	
	public void insertInquery(Inquery inquery) throws SQLException {
		String sql = "INSERT INTO inqueries (inquire_id_PK, cust_id_FK, category, title, inquire_content, inquire_date) VALUES (?, ?, ?, ?, ?, ?)";
		
		try(Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(sql)){
			stmt.setInt(1, inquery.getInqueryId());
			stmt.setString(2, inquery.getCustId());
			stmt.setString(3, inquery.getCategory());
			stmt.setString(4, inquery.getTitle());
			stmt.setString(5, inquery.getInqueryContent());
			stmt.setTimestamp(6, Timestamp.valueOf(inquery.getInqueryDate()));
			stmt.executeUpdate();
			System.out.println("문의글이 성공적으로 삽입되었습니다.");
		}catch(SQLException e) {
			System.out.println("DB 삽입 실패");
			e.printStackTrace();
			throw e;
		}
	}
	
	public ArrayList<Inquery> getInqueries(int currentPage, int itemsPerPage) {
		ArrayList<Inquery> inqueries = new ArrayList<Inquery>();
		int offset = (currentPage - 1) * itemsPerPage;

		String query = "SELECT * FROM inqueries ORDER BY inquire_date DESC LIMIT ? OFFSET ?";
		
		try (Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
	            PreparedStatement stmt = conn.prepareStatement(query)) {
					stmt.setInt(1, itemsPerPage);  // LIMIT에 해당하는 값을 설정
					stmt.setInt(2, offset);        // OFFSET에 해당하는 값을 설정

	            try (ResultSet rs = stmt.executeQuery()) {
	                while (rs.next()) {  // 사용자 정보가 있는지 확인
	                    // DB에서 조회한 정보로 Inquery 객체를 생성
	                    Inquery inquery = new Inquery();
	                    inquery.setInqueryId(rs.getInt("inquire_id_PK"));
	                    inquery.setInqueryContent(rs.getString("inquire_content"));
	                    inquery.setAdminId(rs.getString("admin_id_fk"));
	                    inquery.setReplyContent(rs.getString("reply_content"));
	                    
	                    inquery.setCategory(rs.getString("category"));
	                    inquery.setTitle(rs.getString("title"));
	                    inquery.setCustId(rs.getString("cust_id_FK"));
	                    inquery.setInqueryDate(rs.getTimestamp("inquire_date").toLocalDateTime());
	                    Timestamp ts = rs.getTimestamp("reply_date");
	                    if (ts != null) {
	                    	inquery.setReplyDate(rs.getTimestamp("reply_date").toLocalDateTime());
	                    }
	                    
	                    inqueries.add(inquery);
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		
		return inqueries;
	}
	
	public int countInqueries(){
		String query = "SELECT COUNT(*) FROM inqueries";
		int cnt = 0;
		
		try (Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
	             PreparedStatement stmt = conn.prepareStatement(query)) {

	            try (ResultSet rs = stmt.executeQuery()) {
	                if (rs.next()) {
	                    cnt = rs.getInt(1);
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		
		return cnt;
	}
	
	public Inquery getInqueryById(int no_id) {
		// 등록자명, 등록일, 카테고리, 제목, 시간, 내용
		String query = "SELECT * FROM inqueries WHERE inquire_id_PK = ?";
		Inquery inquery = null;
		
		try (Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
	            PreparedStatement stmt = conn.prepareStatement(query)) {
					stmt.setInt(1, no_id);

	            try (ResultSet rs = stmt.executeQuery()) {
	                if (rs.next()) {  
	                    // DB에서 조회한 정보로 Inquery 객체를 생성
	                    inquery = new Inquery();
	                    inquery.setInqueryId(rs.getInt("inquire_id_PK"));
	                    inquery.setInqueryContent(rs.getString("inquire_content"));
	                    inquery.setAdminId(rs.getString("admin_id_fk"));
	                    inquery.setReplyContent(rs.getString("reply_content"));
	                    
	                    inquery.setCategory(rs.getString("category"));
	                    inquery.setTitle(rs.getString("title"));
	                    inquery.setCustId(rs.getString("cust_id_FK"));
	                    inquery.setInqueryDate(rs.getTimestamp("inquire_date").toLocalDateTime());
	                    Timestamp ts = rs.getTimestamp("reply_date");
	                    if (ts != null) {
	                    	inquery.setReplyDate(rs.getTimestamp("reply_date").toLocalDateTime());
	                    }
	                    
	                    
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		
		return inquery;
	}
	
	public void updateReply(String adminId, String replyContent, LocalDateTime replyDate, int no) throws SQLException {
		String sql = "UPDATE inqueries SET admin_id_fk = ?, reply_content = ?, reply_date = ? WHERE inquire_id_PK = ?";
		
		try(Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(sql)){
			stmt.setString(1, adminId);
			stmt.setString(2, replyContent);
			stmt.setTimestamp(3, Timestamp.valueOf(replyDate));
			stmt.setInt(4, no);
			stmt.executeUpdate();
			System.out.println("댓글이 업데이트 되었습니다.");
		}catch(SQLException e) {
			System.out.println("DB 삽입 실패");
			e.printStackTrace();
			throw e;
		}
	}
	
	public void deleteReply(int no) throws SQLException {
		String sql = "DELETE FROM inqueries WHERE inquire_id_PK = ?";
		
		try(Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(sql)){

			stmt.setInt(1, no);
			stmt.executeUpdate();
			System.out.println("문의글이 삭제되었습니다.");
		}catch(SQLException e) {
			System.out.println("DB 삽입 실패");
			e.printStackTrace();
			throw e;
		}
	}
}
