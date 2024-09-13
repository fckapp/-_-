<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비블리엇</title>
    <!-- =====================================================================================CSS 부분================================================================================================ -->
    <!-- ==========================================================================================JSP 부분========================================================================================= -->
    <link rel="stylesheet" href="./css/maincommon.css">
    <script src="https://kit.fontawesome.com/d5abf4d39e.js" crossorigin="anonymous"></script>
    <script src="./js/toggle.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="./js/menu.js" defer></script>
    <style>
        /* 로그인 상태에 따라 다른 스타일을 적용할 수 있음 */
        /* 로그인 사용자 이름 스타일 */
        .username span{
            font-size: 18px;
            color: #333;
            cursor: pointer;
            padding: 15px;
        }
        .username span:hover{
        	text-decoration: underline;
        	background-color: #D8D8D8;
    		border-radius: 3px;
        }
    </style>
</head>
<!-- ==============================================================================================HTML부분========================================================================================== -->
<body class="home-page"; id="home-page">

    <!-- header 시작 -->
    <div class="header-navbar">
        <nav class="navbar">
            <div class="navbar-logo">
                <a href="<%= request.getContextPath() %>/mainPage"><img class="logo" src="./images/logo.svg" height="70px"></a>
            </div>
            <ul class="navbar-menu">
                <li><a href="#"><span class="navbar-menu-text">제품</span></a></li>
                <li><a href="#"><span class="navbar-menu-text">회사</span></a></li>
                <li><a href="<%=request.getContextPath()%>/recruitment"><span class="navbar-menu-text">채용</span></a></li>
                <li><a href="#"><span class="navbar-menu-text">문의</span></a></li>
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
        
    </div>
    <jsp:include page="navbar.jsp"/>
    <!-- tbody 시작 -->
    <tbody class="main-tbody">
        <div class="wrapper">
            <div class="outter-box img">
                <img class="main-img" src="./images/전기차1.jpg" alt="전기차 사진">
                <div class="inner-box">
                    <button class="btn1 main-1" type="button" onclick="location.href=''">상세보기</button>
                    <button class="btn2" type="button" onclick="location.href=''">문의하기</button>
                </div>
                <h2 class="img-text">EV 배터리</h2>
                <p class="img-text-sub" style="font-size: 15px;">지금 바로 문의하세요.</p>
            </div>
            <div class="outter-box img">
                <img class="main-img" src="./images/전기차2.png" alt="전기차 사진">
                <div class="inner-box">
                    <button class="btn1" type="button" onclick="location.href=''">상세보기</button>
                    <button class="btn2" type="button" onclick="location.href=''">문의하기</button>
                </div>
                <h2 class="img-text" style="font-size: 40px;">EV2 배터리</h2>
                <p class="img-text-sub" style="font-size: 15px;">지금 바로 문의하세요.</p>
            </div>
            <div class="outter-box img">
                <img class="main-img" src="./images/태양광.jpg" alt="태양광 사진">
                <div class="inner-box">
                    <button class="btn1" type="button" onclick="location.href=''">상세보기</button>
                    <button class="btn2" type="button" onclick="location.href=''">문의하기</button>
                </div>
                <h2 class="img-text" style="font-size: 40px;">태양광 배터리</h2>
                <p class="img-text-sub" style="font-size: 15px;">재생에너지 배터리 지금 바로 문의하세요.</p>
            </div>
            <div class="outter-box img">
                <img class="main-img" src="./images/풍력발전기.jpg" alt="풍력발전기 사진">
                <div class="inner-box">
                    <button class="btn1" type="button" onclick="location.href=''">상세보기</button>
                    <button class="btn2" type="button" onclick="location.href=''">문의하기</button>
                </div>
                <h2 class="img-text" style="font-size: 40px;">풍력 배터리</h2>
                <p class="img-text-sub" style="font-size: 15px;">재생에너지 배터리 지금 바로 문의하세요.</p>
            </div>
        </div>
    </tbody>
    <jsp:include page="footer.jsp"/>
</body>
</html>