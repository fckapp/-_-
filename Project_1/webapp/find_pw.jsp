<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기 : 비블리엇</title>
    <link rel="stylesheet" href="./css/find_id_or_pw.css">
    <script src="https://kit.fontawesome.com/d5abf4d39e.js" crossorigin="anonymous"></script>
    <script src="./js/toggle.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="./js/menu.js" defer></script>
</head>
<body class="home-page"; id="home-page">
    <!-- header 시작 -->
    <div class="header-navbar">
        <nav class="navbar">
            <div class="navbar-logo">
                <a href="<%= request.getContextPath() %>/mainPage"><img class="logo" src="./images/logo.svg" height="70px"></a>
            </div>
            
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
        
    </div>
    <jsp:include page="navbar.jsp"/>
    <div class="find_pw-container">
        <div class="find_pw-maintext">비밀번호 찾기</div>
        <div class="find_pw-form">
            <form action="find_pw" method="post">
                <table class="find_pw-table">
                    <tr>
                        <td>
                            <label for="id">아이디</label><br>
                            <input type="text" id="id" name="id" class="find_pw-information-text" required >
                        </td>
                    </tr>
                    <tr>
                        <td class="find_pw-table-td-email">
                            <label for="email">이메일</label><br>
                            <input type="text" id="email" name="email" class="find_pw-information-text" required />
                            <button type="button" class="find_pw-request-authentication-number"><span>인증번호전송</span></button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="certNum">인증번호</label><br>
                            <input type="text" id="certNum" name="certNum" class="find_pw-information-text" required />
                            <button type="button" class="find_pw-request-authentication-number"><span>인증</span></button>
                        </td>
                    </tr>
                </table>
                
            </form>
            <button type="submit" class="find_pw-commit-btn">완료</button><br>
        </div>
    </div>
    <footer class="sec-footer">
        <div class="footer-primary">
            <div class="row">
                <div class="inner">
                    <div class="footer-links">
                        <ul>
                            <li><a href="">Contact Us</a></li>
                            <li><a href="">법적고지</a></li>
                            <li><a href="">이용약관</a></li>
                            <li><a href=""><b>개인정보처리방침</b></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="inner">
                    <div class="col">
                        <div class="footer-logo"><img src="./images/logo_white.svg" alt=""></div>
                        <p class="footer-copyright">
                            ⓒ<span id="footerYear">2024</span> 비블리엇.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>

</body>