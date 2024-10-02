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
 * Servlet implementation class PasswordCheckServlet
 */
@WebServlet("/CheckPassword")
public class PasswordCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordCheckServlet() {
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
		String writtenPassword = request.getParameter("ex-password");
		String loggedInUserPassword = loggedInUser.getPassword();
		
		JSONObject jsonResponse = new JSONObject();
		if(writtenPassword.equals(loggedInUserPassword)) { // 입력한 비밀번호와 db에 저장된 비밀번호가 같은 경우
			jsonResponse.put("check", true);
            jsonResponse.put("message", "same password");
		}else {
			jsonResponse.put("check", false);
            jsonResponse.put("message", "not same");
		}
		
		// JSON 응답 전송
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
		
		
		
	}

}
