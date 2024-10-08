package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(false);  // 세션이 있으면 가져오고, 없으면 null
		response.getWriter().append("Served at: " + session);
        if (session != null) {
            session.invalidate();  // 세션 무효화
            
        }
        String redirectUrl = request.getHeader("referer"); // 이전 페이지의 URL을 가져옴
        if (redirectUrl == null) {
            redirectUrl = request.getContextPath() + "/mainPage"; // 이전 페이지가 없으면 홈으로 이동
        }
        response.sendRedirect(redirectUrl);
//        response.sendRedirect(request.getContextPath() + "/mainPage");  // 로그아웃 후 메인 페이지로 이동 
//        response.sendRedirect(request.getRequestURI()); // 원래 있던 페이지로 이동
//        request.getRequestDispatcher("/recruitmentPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
