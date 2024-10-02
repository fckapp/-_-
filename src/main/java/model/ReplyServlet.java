package model;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ReplyServlet
 */
@WebServlet("/reply")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		InqueryDao dao = new InqueryDao();
		int inqueryId = Integer.parseInt(request.getParameter("inquireId"));
		try {
			dao.deleteReply(inqueryId);
			response.sendRedirect(request.getContextPath() + "/inquery");
		}catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "삭제 도중 에러.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/errorPage.jsp"); // 오류 페이지로 포워딩
            dispatcher.forward(request, response);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("admin");
		
		String id = admin.getAdmin_id();
		int inqueryId = Integer.parseInt(request.getParameter("inqueryId"));
		String replyContent = request.getParameter("replyContent");
		
		LocalDateTime replyDate = LocalDateTime.now();
		
		InqueryDao dao = new InqueryDao();
		try {
			dao.updateReply(id, replyContent, replyDate, inqueryId);
			response.sendRedirect(request.getContextPath() + "/inqueryDetail?no=" + inqueryId);
		}catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "댓글 작성 중 오류가 발생했습니다.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/errorPage.jsp"); // 오류 페이지로 포워딩
            dispatcher.forward(request, response);
        }
		
		
	}

}
