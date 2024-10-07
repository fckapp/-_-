package model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MypageServlet
 */
@WebServlet("/myPage")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageServlet() {
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
		request.getRequestDispatcher("/myPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		String redirectURL = (String) session.getAttribute("redirectURL");
		User loggedInUser = (User) session.getAttribute("user");
		String userId = loggedInUser.getId();
		String userPw = loggedInUser.getPassword();
		
		UserDao userDao = new UserDao();
		String action = request.getParameter("action");
		
		switch(action) {
		case "updateName":
			String writtenName = request.getParameter("newName");
			userDao.modifyName(userId, writtenName);
			loggedInUser.setName(writtenName);
			response.sendRedirect(redirectURL);
			break;
		case "updateTel":
			String writtenTel = request.getParameter("newTell");
			userDao.modifyTel(userId, writtenTel);
			loggedInUser.setTel(writtenTel);
			response.sendRedirect(redirectURL);
			break;
		case "updateEmail":
			String writtenEmail = request.getParameter("newEmail");
			userDao.modifyEmail(userId, writtenEmail);
			loggedInUser.setEmail(writtenEmail);
			response.sendRedirect(redirectURL);
			break;
		case "updatePassword":
			String writtenPassword = request.getParameter("new-pw");
			userDao.modifyPassword(userId, writtenPassword);
			loggedInUser.setPassword(writtenPassword);
			response.sendRedirect(redirectURL);
			break;
		case "exit":
			String exitForId = request.getParameter("ex-out-id");
			String exitForPw = request.getParameter("new-out");
			if(userId.equals(exitForId) && userPw.equals(exitForPw)) {
				userDao.exitCustomersTable(userId);
		        if (session != null) {
		            session.invalidate(); // 로그아웃 시 세션 무효화
		        }
		        response.sendRedirect(request.getContextPath() + "/mainPage");  // 리다이렉트
			}else {
				response.sendRedirect(redirectURL + "?errorMessage=Invalid+ID+or+password");
			}
			break;
		}
		
	}

}
