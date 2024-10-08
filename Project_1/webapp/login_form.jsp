<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="./css/login.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/d5abf4d39e.js" crossorigin="anonymous"></script>
    <script src="./js/toggle.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="./js/menu.js" defer></script>
    
    <script>
    $(document).ready(function(){
    	$('#loginPage-account-btn').click(function(){
    		window.location.href="<%= request.getContextPath() %>/signup";
    	});
    });
    </script>
    <title>로그인 : 비블리엇</title>
</head>

<body>
<!--  %
    // 이전 페이지 URL을 가져옴 (로그인 전 머물러 있던 페이지)
    String redirectUrl = request.getParameter("redirectUrl");
    if (redirectUrl == null || redirectUrl.isEmpty()) {
        redirectUrl = request.getContextPath() + "/mainPage"; // 기본값으로 홈 페이지 설정
    }
%>
-->
	<div id="wrapper">
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
	                       	<!--<p class="username"><a href="<%=request.getContextPath()%>/myPage">${sessionScope.user.name}</a>님 환영합니다!</p>  로그인한 사용자 이름 표시 -->
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
	        <!-- 서브 메뉴판 -->
	    </div>
	    <jsp:include page="navbar.jsp"/>
	    <div class="loginPage-container">
	        <div class="loginPage-contents">
	            <h1 class="loginPage-title">로그인</h1>
	            <form method="post">
	                <label for="id">아이디</label><br>
	                <input type="text" id="id" name="id" class="loginPage-information-text" required ><br>
	                
	                <label for="password">비밀번호</label><br>
	                <input type="password" id="password" name="password" class="loginPage-information-text" required ><br>
	                
	                <button type="submit" class="loginPage-login-btn" name="action" value="login">로그인</button><br>
	                <div class="loginPage-problem-div">
	                    <a href="<%= request.getContextPath() %>/Find_ID_OR_PW" class="loginPage-problem-a">
	                        <span>로그인하는데 문제가 있나요?</span>
	                    </a>
	                </div>
	                <button type="button" class="loginPage-account-btn" id="loginPage-account-btn" onclick="movetoSignup()">회원가입</button><br>
	            </form>
	        </div>
	    </div>
	</div>
    <jsp:include page="footer.jsp"/>
</body>

</html>