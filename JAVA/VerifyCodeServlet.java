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
 * Servlet implementation class VerifyCodeServlet
 */
@WebServlet("/verifyCode")
public class VerifyCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyCodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String enteredCode = request.getParameter("verificationCode");
		boolean same_code = false;  // 전송된 코드와 입력한 코드가 같은지 여부를 추적할 변수

        // 세션에 저장된 인증번호와 비교
        HttpSession session = request.getSession();
        String savedCode = (String) session.getAttribute("verificationCode");

        if (enteredCode.equals(savedCode)) {
            System.out.println("Same code."); //디버깅용
            same_code = true;
        } else {
            System.out.println("Invalid code."); //디버깅용
            same_code = false;
        }
        
        JSONObject jsonResponse = new JSONObject();
        if (same_code) {
            jsonResponse.put("success", true);
        } else {
            jsonResponse.put("success", false);
            jsonResponse.put("error", "Failed to send email.");
        }

        // JSON 응답 전송
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
	}

}
