<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.Inquery" %>
<%@ page import="model.InqueryDao" %>
<%
	Inquery inquery = (Inquery) request.getAttribute("inquery"); // 서블릿에서 전달한 inquery 객체 가져오기
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비블리엇 : 문의 상세</title>
    <!-- =====================================================================================CSS 부분================================================================================================ -->
    <!-- ==========================================================================================JSP 부분========================================================================================= -->
    <link rel="stylesheet" href="./css/maincommon.css">
    <script src="https://kit.fontawesome.com/d5abf4d39e.js" crossorigin="anonymous"></script>
    <script src="./js/toggle.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="./js/menu.js" defer></script>
</head>
<!-- ==============================================================================================HTML부분========================================================================================== -->
<body class="home-page"; id="home-page">
	<style>
	h1, h2, h3{
		color: #333;
	}
	textarea {
	  width: 100%;
	  height: 100px; /* 초기 높이 */
	  resize: none; /* 세로 방향으로만 크기 조절 가능 */
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  padding: 10px;
	  font-family: Pretendard;
	  font-size: 16px;
	  box-sizing: border-box; /* 패딩과 보더를 포함한 너비 계산 */
	}
	</style>

    <!-- header 시작 -->
    <div class="header-navbar">
        <nav class="navbar">
            <div class="navbar-logo">
                <a href="<%= request.getContextPath() %>/mainPage"><img class="logo" src="./images/logo.svg" height="70px"></a>
            </div>
            <ul class="navbar-menu">
                <li><a href="<%=request.getContextPath()%>/EVBattery"><span class="navbar-menu-text">제품</span></a></li>
                <li><a href="<%=request.getContextPath()%>/introduction"><span class="navbar-menu-text">회사</span></a></li>
                <li><a href="<%=request.getContextPath()%>/recruitment"><span class="navbar-menu-text">채용</span></a></li>
                <li><a href="<%=request.getContextPath()%>/inquery"><span class="navbar-menu-text">문의</span></a></li>
            </ul>
            <ul class="navbar-aut">
                <c:choose>
	                    <c:when test="${not empty sessionScope.user}">
	                        <!-- 로그인 상태 -->
	                        <li>
	                        	<a href="<%= request.getContextPath() %>/myPage">
		                        	<div>
		                        		<img class="account_icon" src="./images/account.svg" height="24px">
		                        		<span class="navbar-menu-text">account</span>
		                        	</div>
	                        	</a>
	                        </li>
	                        <li>
	                            <a href="<%= request.getContextPath() %>/logout">
	                            	<div>
	                            		<img class="logout_icon" src='./images/logout4.svg' height="24px">
	                            		<span class="navbar-menu-text">logout</span>
	                            	</div>
	                            </a>
	                        </li>
	                    </c:when>
	                    <c:when test="${not empty sessionScope.admin}">
	                        <!-- 관리자 로그인 상태 -->
	                        <li>
	                            <a href="<%= request.getContextPath() %>/logout">
	                            	<div>
	                            		<img class="logout_icon" src='./images/logout4.svg' height="24px">
	                            		<span class="navbar-menu-text">logout</span>
	                            	</div>
	                            </a>
	                        </li>
	                    </c:when>
	                    <c:otherwise>
	                        <!-- 비로그인 상태 -->
	                        <li>
	                        	<a href="<%= request.getContextPath() %>/login">
		                        	<div>
		                        		<img class="login_icon" src='./images/login4.svg' height="24px">
		                        		<span class="navbar-menu-text">login</span>
		                        	</div>
	                        	</a>
	                        </li>
	                        <li>
	                        	<a href="<%= request.getContextPath() %>/signup">
	                        	<div>
	                        		<img class="signup_icon" src='./images/signup.svg' height="24px">
	                        		<span class="navbar-menu-text">signup</span>
	                        	</div>
	                        	</a>
	                        </li>
	                    </c:otherwise>
	            </c:choose>
                <li class="navbar-find-icon">
                    <input type="text" class="search-input" placeholder="Search..." />
                    <a href="#" class="fa-solid fa-magnifying-glass"></a>
                </li>
            </ul>
            <a href="#" class="navbar-togglebtn">
                <i class="fa-solid fa-bars"></i>
            </a>
        </nav>
        <jsp:include page="navbar.jsp"/>
        <div class="btnBack-container">  
	        <div class="back-button">
	            <a href="<%= request.getContextPath() %>/inquery">목록</a> <!-- 목록으로 돌아가는 버튼 -->
	        </div>
	        <c:choose>
		        <c:when test="${not empty sessionScope.admin}">
		            <!-- 관리자 로그인 상태 -->
		            <div class="delete-button">
		            	<a href="<%= request.getContextPath() %>/reply?inquireId=<%= inquery.getInqueryId() %>">삭제</a> <!-- 게시판 글 삭제 버튼 -->
		        	</div>
		        </c:when>
	        </c:choose>
	    </div>
        <div class="inquery-container">
	        <div class="inquiry-detail">
	            <h2><%= inquery.getTitle() %></h2> <!-- 문의 제목 -->
	            <p><strong>문의자:</strong> <%= inquery.getCustId() %></p> <!-- 고객 ID 또는 이름 -->
	            <p><strong>일자:</strong> <%= inquery.getFormattedInqueryDate() %></p> <!-- 포맷된 날짜 -->
	            <p><strong>내용:</strong></p>
	            <p><%= inquery.getInqueryContent()%></p> <!-- 문의 내용 -->
			</div>
		</div>
		<div class="comments-container">
			<div class="comments-detail">
	            <h3>관리자의 댓글</h3>
	            <c:if test="${not empty inquery.replyContent}">
	                <p><%= inquery.getReplyContent()%></p> <!-- 관리자 댓글 -->
	            </c:if>
	            <c:if test="${empty inquery.replyContent}">
	                <p>댓글이 없습니다.</p> <!-- 댓글이 없을 경우 메시지 -->
	            </c:if>
	        </div>
	        
			<c:choose>
			<c:when test="${not empty sessionScope.admin}">
	             <!-- 관리자 로그인 상태 -->
	             <div class="reply-section">
	            	<h3>댓글 남기기(수정하기)</h3>
		            <form action="<%= request.getContextPath()%>/reply" method="post">
		                <input type="hidden" name="inqueryId" value="${inquery.inqueryId}">
		                <textarea name="replyContent" rows="4" required></textarea><br>
		                <input type="submit" value="댓글 달기">
		            </form>
	        	</div>
	        </c:when>
	        </c:choose>
	        </div>
	    </div>
	    
	<jsp:include page="footer.jsp"/>
</body>
</html>
