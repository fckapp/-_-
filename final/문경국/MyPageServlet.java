//package model;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//
///**
// * Servlet implementation class MyPageServlet
// */
//@WebServlet("/myPage")
//public class MyPageServlet extends HttpServlet { 
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
//            throws ServletException, IOException {
//		
//		HttpSession session = request.getSession();
//        Integer userId = (Integer) session.getAttribute("userId");
//        
//        
//        User user = (User) session.getAttribute("user");
//  
//		
//        // JSP로 포워딩
//        request.getRequestDispatcher("/myPage").forward(request, response);
//	}
//}