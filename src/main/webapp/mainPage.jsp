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
        
    </div>
    <jsp:include page="navbar.jsp"/>
    <!-- tbody 시작 -->
    <tbody class="main-tbody">
        <div class="main-wrapper">
            <div class="outter-box img">
                <video class=mainpage-main-content-video src="./images/제품홍보영상.mp4" aria-label="제품홍보 영상"
                autoplay muted loop></video>
                <h2 class="img-text">Bibliot battery</h2>
                <p class="img-text-sub" style="font-size: 16px;">아래 제품들을 확인해 보세요</p>
            </div>
            <div class="outter-box img">
                <img class="main-img" src="./images/전기차1.jpg" alt="전기차 사진">
                <div class="inner-box">
                    <button class="details-btn" type="button" onclick="location.href='<%=request.getContextPath()%>/EVBattery'">상세보기</button>
                    <button class="inquiry-btn" type="button" onclick="location.href='<%=request.getContextPath()%>/inquery'">문의하기</button>
                </div>
                <h2 class="img-text">EV battery</h2>
                <p class="img-text-sub" style="font-size: 16px;">지금 바로 문의하세요.</p>
            </div>
            <div class="outter-box img">
                <img class="main-img" src="./images/전기차2.png" alt="전기차 사진">
                <div class="inner-box">
                    <button class="details-btn" type="button" onclick="location.href='<%=request.getContextPath()%>/EVBattery'">상세보기</button>
                    <button class="inquiry-btn" type="button" onclick="location.href='<%=request.getContextPath()%>/inquery'">문의하기</button>
                </div>
                <h2 class="img-text" style="font-size: 40px;">EV battery V2</h2>
                <p class="img-text-sub" style="font-size: 16px;">지금 바로 문의하세요.</p>
            </div>
            <div class="outter-box img">
                <img class="main-img" src="./images/태양광.jpg" alt="태양광 사진">
                <div class="inner-box">
                    <button class="details-btn" type="button" onclick="location.href='<%=request.getContextPath()%>/SolarBattery'">상세보기</button>
                    <button class="inquiry-btn" type="button" onclick="location.href='<%=request.getContextPath()%>/inquery'">문의하기</button>
                </div>
                <h2 class="img-text" style="font-size: 40px;">solar power battery</h2>
                <p class="img-text-sub" style="font-size: 16px;">재생에너지 배터리 지금 바로 문의하세요.</p>
            </div>
            <div class="outter-box img">
                <img class="main-img" src="./images/풍력발전기.jpg" alt="풍력발전기 사진">
                <div class="inner-box">
                    <button class="details-btn" type="button" onclick="location.href='<%=request.getContextPath()%>/WindPowerBattery'">상세보기</button>
                    <button class="inquiry-btn" type="button" onclick="location.href='<%=request.getContextPath()%>/inquery'">문의하기</button>
                </div>
                <h2 class="img-text" style="font-size: 40px;">wind power battery</h2>
                <p class="img-text-sub" style="font-size: 16px;">재생에너지 배터리 지금 바로 문의하세요.</p>
            </div>
        </div>
    </tbody>
    <jsp:include page="footer.jsp"/>
    <script>
    
    </script>
</body>
</html>