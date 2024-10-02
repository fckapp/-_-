package model;

import java.io.IOException;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class InqueryDetailServlet
 */
@WebServlet("/inqueryDetail")
public class InqueryDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqueryDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String no = request.getParameter("no");
        InqueryDao inqueryDao = new InqueryDao();
        
     // 날짜 포맷터를 생성합니다.
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    
        if (no != null) {
            Inquery inquery = inqueryDao.getInqueryById(Integer.parseInt(no));
            if (inquery.getInqueryDate() != null) {
	            String formattedInqueryDate = inquery.getInqueryDate().format(formatter);
	            inquery.setFormattedInqueryDate(formattedInqueryDate); // 새로운 필드에 설정
	        }
	        if (inquery.getReplyDate() != null) {
	            String formattedReplyDate = inquery.getReplyDate().format(formatter);
	            inquery.setFormattedReplyDate(formattedReplyDate); // 새로운 필드에 설정
	        }
            request.setAttribute("inquery", inquery);
            RequestDispatcher dispatcher = request.getRequestDispatcher("inqueryDetail.jsp"); // 상세 페이지 JSP
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/inquery"); // 리스트 페이지로 리다이렉트
        }
        HttpSession session = request.getSession(); // 세션이 있으면 가져오고 없으면 null 반환
		session.setAttribute("redirectURL", request.getRequestURI());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
