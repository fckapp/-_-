package model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Find_ID
 */
@WebServlet("/Find_ID")
public class Find_ID extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userDao = new UserDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Find_ID() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); 
		session.setAttribute("redirectURL", request.getRequestURI());
		request.getRequestDispatcher("/find_id.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		ArrayList<User> equal_name_list = userDao.getUsersByName(name); // DB에서 유저정보조회
		
		ArrayList<String> matchingUserIDs = new ArrayList<>();
		
		for(User user: equal_name_list) {
			if(user.getEmail().equals(email)) {
				matchingUserIDs.add(user.getId());
				
			}
		}
		
//		System.out.println("아이디들 : " + matchingUserIDs);
		
		request.setAttribute("matchingUserIDs", matchingUserIDs);
		RequestDispatcher dispatcher = request.getRequestDispatcher("./find_id_success.jsp");
		dispatcher.forward(request, response);
	}

}
