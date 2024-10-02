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
 * Servlet implementation class SignupController
 */
@WebServlet("/signup")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(); // 세션이 있으면 가져오고 없으면 null 반환
		session.setAttribute("redirectURL", request.getRequestURI());
		request.getRequestDispatcher("./signup.jsp").forward(request, response);
		
//		response.sendRedirect(request.getContextPath() + "/signup"); // 리디렉션한 횟수가 너무 많다는 오류뜸.
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		// 모델 객체 생성 및 데이터 저장
		User user = new User();
		user.setId(id);
		user.setPassword(password);
		user.setName(name);
		user.setTel(tel);
		user.setEmail(email);
		
		try {
			// 회원 가입 처리
			userDao.insertUser(user);
		}catch(Exception e) {
			// 회원 가입 실패 처리
			request.setAttribute("errorMessage", e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/failRegister.jsp");
			dispatcher.forward(request, response);
			return;
		}
		
		// 가입 결과에 따라 적절한 뷰로 이동
		request.setAttribute("id", user.getId());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/mainPage.jsp");
		dispatcher.forward(request, response);
//		HttpSession session = request.getSession();
//		String redirectURL = (String) session.getAttribute("redirectURL");
//        response.sendRedirect(redirectURL);
		
	}

}
