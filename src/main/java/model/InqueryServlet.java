package model;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class InqueryServlet
 */
@WebServlet("/inquery")
public class InqueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InqueryDao inqueryDao = new InqueryDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqueryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int currentPage = request.getParameter("page") != null 
                ? Integer.parseInt(request.getParameter("page")) 
                : 1;
		int itemsPerPage = 10; // 페이지당 보여줄 글 수
		InqueryDao dao = new InqueryDao();
		ArrayList<Inquery> inqueries = dao.getInqueries(currentPage, itemsPerPage);
		int total_count = dao.countInqueries();
		
		// 날짜 포맷터를 생성합니다.
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    
	    // 각 Inquery 객체에 포맷된 날짜를 추가합니다.
	    for (Inquery inquery : inqueries) {
	        if (inquery.getInqueryDate() != null) {
	            String formattedInqueryDate = inquery.getInqueryDate().format(formatter);
	            inquery.setFormattedInqueryDate(formattedInqueryDate); // 새로운 필드에 설정
	        }
	        if (inquery.getReplyDate() != null) {
	            String formattedReplyDate = inquery.getReplyDate().format(formatter);
	            inquery.setFormattedReplyDate(formattedReplyDate); // 새로운 필드에 설정
	        }
	    }
		
		request.setAttribute("total_count", total_count);
		request.setAttribute("inqueries", inqueries);
		HttpSession session = request.getSession(); // 세션이 있으면 가져오고 없으면 null 반환
		session.setAttribute("redirectURL", request.getRequestURI());
		request.getRequestDispatcher("/inquery_form.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String inqueryTitle = request.getParameter("inqueryTitle");
		String inqueryContent = request.getParameter("inqueryContent");
		String category = request.getParameter("inquiryType");
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		String id = user.getId();
		String name = user.getName();
		
		
		LocalDateTime currentTime = LocalDateTime.now();
        
		Inquery inquery = new Inquery();
		inquery.setCustId(id);
		inquery.setTitle(inqueryTitle);
		inquery.setInqueryContent(inqueryContent);
		inquery.setCategory(category);
		inquery.setInqueryDate(currentTime);
		
		try {
			inqueryDao.insertInquery(inquery);
		}catch(Exception e) {
			request.setAttribute("errorMessage", e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/failRegister.jsp"); // 오류페이지
			dispatcher.forward(request, response);
			return;
		}finally {
			response.sendRedirect(request.getContextPath() + "/inquery");
		}
		
	}

}
