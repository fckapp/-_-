package model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

/**
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/checkId")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		User loggedInUser = (User) session.getAttribute("user");
		
        // Get the ID from the request
        String id = request.getParameter("id");
        

        // Validate the ID
        if (id == null || id.trim().isEmpty()) {
            response.getWriter().write("Invalid input");
            return;
        }

        // Use UserDAO to check if the ID exists
        UserDao userDAO = new UserDao();
        boolean exists = userDAO.isIdExists(id);
        
        JSONObject jsonResponse = new JSONObject();
        if (exists) { // 중복된 아이디가 존재할 경우
            jsonResponse.put("duplicate", true);
            jsonResponse.put("message", "This ID is already taken. Please choose another one.");
        } else { // 중복되지 않는 경우
            jsonResponse.put("duplicate", false);
            jsonResponse.put("message", "This ID is available.");
        }

        // JSON 응답 전송
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();

	}

}
