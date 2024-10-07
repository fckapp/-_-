package model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Find_PW
 */
@WebServlet("/find_pw")
public class Find_PW extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Find_PW() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String selectedId = request.getParameter("selectedId");
		request.setCharacterEncoding("UTF-8");
		request.setAttribute("selectedId", selectedId);
		HttpSession session = request.getSession(); 
		session.setAttribute("redirectURL", request.getRequestURI());
		request.getRequestDispatcher("/find_pw.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = request.getParameter("id");
		
		UserDao userDao = new UserDao();
		User user = userDao.getUserById(userId);
		String password = user.getPassword();
		
		if (password != null) {
            // 비밀번호를 request에 저장하고 find_pw.jsp로 포워딩
            request.setAttribute("password", password);
            request.getRequestDispatcher("/find_pw_success.jsp").forward(request, response);
        } else {
            // 해당 정보로 비밀번호를 찾을 수 없는 경우
            request.setAttribute("errorMessage", "해당 정보로 비밀번호를 찾을 수 없습니다.");
            request.getRequestDispatcher("/find_pw_success.jsp").forward(request, response);
        }
		
	}

}