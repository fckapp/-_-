package model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();
	private AdminDao adminDao = new AdminDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.sendRedirect(request.getContextPath() + "/login");
		request.getRequestDispatcher("./login_form.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		String role = request.getParameter("role");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		String redirectURL = (String) session.getAttribute("redirectURL");
		
		if(role.equals("user")) {
			// 사용자 ID로 DB에서 사용자 정보 조회
			User user = userDao.getUserById(id); // DB에서 유저정보조회
			
			if(user != null && user.getPassword().equals(password)) {
				//로그인 성공 시 세션에 유저 객체 저장
				
				session.setAttribute("user", user);
				session.setMaxInactiveInterval(60 * 60);  //초단위임 세션 타임아웃: 1시간으로 설정
				
	            // 로그인 성공 후 원래 페이지로 리다이렉트
	            response.sendRedirect(redirectURL);

			}else {
				request.setAttribute("errorMessage", "Invalid ID or Password");
				response.sendRedirect("/Bibliot/login?errorMessage=Invalid+ID+or+password");
			}
		}else if(role.equals("admin")){
			Admin admin = adminDao.getAdminById(id);
			
			if(admin != null && admin.getAdmin_password().equals(password)) {
				//로그인 성공 시 세션에 관리자 객체 저장
				
				session.setAttribute("admin", admin);
				session.setMaxInactiveInterval(60 * 60);  //초단위임 세션 타임아웃: 1시간으로 설정
				
	            // 로그인 성공 후 원래 페이지로 리다이렉트
	            response.sendRedirect(redirectURL);

			}else {
				request.setAttribute("errorMessage", "Invalid ID or Password");
				response.sendRedirect("/Bibliot/login?errorMessage=Invalid+ID+or+password");
			}
		}
		
		
		
	}

}
