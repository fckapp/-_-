package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/updateName")
public class MyPage_name extends HttpServlet {
	final String driver = "org.mariadb.jdbc.Driver";
	final String DB_IP = "192.168.32.14";
	final String DB_PORT = "3306";
	final String DB_NAME = "bibliotdb";
	final String DB_URL1 = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "1234";
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session = request.getSession();
        String newName = request.getParameter("name");
//        String id = (String) request.getAttribute("id");

        try (Connection connection = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD)) {
        	 connection.setAutoCommit(false);
        	 User user = (User) session.getAttribute("user");
        	
            String sql = "UPDATE customers SET cust_name = ? WHERE cust_id_PK = ?";
            
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            	preparedStatement.setString(1, user.getName()); // 첫 번째 파라미터
                preparedStatement.setString(2, user.getId());

                int rowsUpdated = preparedStatement.executeUpdate();
                if (rowsUpdated > 0) {
                	
                	user.setName(newName);
//                	user.setId(id);
                	
                    response.setStatus(HttpServletResponse.SC_OK);
                    
                    System.out.println("성공적으로 DB에 반영 되었습니다.");
                    System.out.println("New Name: " + newName);
                    System.out.println("User ID: " + user.getId());
                    
                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
