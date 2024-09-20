<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비블리엇 - 메인페이지</title>
    <!-- =====================================================================================CSS 부분================================================================================================ -->
    <link rel="stylesheet" href="./CSSFile/main_common.css">
    <!-- ==========================================================================================JSP 부분========================================================================================= -->
    <script src="https://kit.fontawesome.com/d5abf4d39e.js" crossorigin="anonymous"></script>
    <script src="./JSFile/mainPage-toggle.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="./JSFile/mainPage-menu.js" defer></script>
    <style>
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
    <div class="header-navbar">
        <nav class="navbar">
            <div class="navbar-logo">
                <a href="http://127.0.0.1:5500/mainPage.html#"><img class="logo" src="./images/로고.png" height="70px"></a>
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
        <!-- 서브 메뉴판 -->
    </div>
    <div class="menu-pan">
        <div class="menu-pan-box">
            <div class="menu-category">
                <div class="category"><img class="main-product" src="./images/EV_배터리_모델1_사진.svg" alt="모델1"></div>
                <div class="main-product-text-box">
                    <h4 class="main-product-text">EV battery</h2>
                    <a href="#" class="main-product-text-1">상세보기</a>
                    <a href="#" class="main-product-text-2">문의하기</a>
                </div>
            </div>
            <div class="menu-category">
                <div class="category" ><img class="main-product" src="./images/EV_배터리_모델2_사진.svg" alt="모델2"></div>
                <div class="main-product-text-box">
                    <h4 class="main-product-text">EV battery V2</h2>
                    <a href="#" class="main-product-text-1">상세보기</a>
                    <a href="#" class="main-product-text-2">문의하기</a>
                </div>
            </div>
            <div class="menu-category">
                <div class="category"><img class="main-product" src="./images/태양광_모델3_사진.svg" alt="모델3"></div>
                <div class="main-product-text-box">
                    <h4 class="main-product-text">solar power battery</h2>
                    <a href="#" class="main-product-text-1">상세보기</a>
                    <a href="#" class="main-product-text-2">문의하기</a>
                </div>
            </div>
            <div class="menu-category">
                <div class="category"><img class="main-product" src="./images/풍력발전기_모델4.svg" alt="모델4"></div>
                <div class="main-product-text-box">
                    <h4 class="main-product-text">wind power battery</h2>
                    <a href="#" class="main-product-text-1">상세보기</a>
                    <a href="#" class="main-product-text-2">문의하기</a>
                </div>
                <a herf="#"><p class="main-product-text"></p></a>
            </div>
        </div>
    </div>
    <!-- tbody 시작 -->
    <tbody class="main-tbody">
        <div class="main-wrapper">
            <div class="outter-box img">
                <video class=mainpage-main-content-video src="./images/제품홍보영상.mp4" aria-label="제품홍보 영상"
                autoplay muted loop></video>
                <h2 class="img-text">Bibliot bettery</h2>
                <p class="img-text-sub" style="font-size: 16px;">아래 제품들을 확인해 보세요</p>
            </div>
            <div class="outter-box img">
                <img class="main-img" src="./images/전기차1.jpg" alt="전기차 사진">
                <div class="inner-box">
                    <button class="details-btn" type="button" onclick="location.href=''">상세보기</button>
                    <button class="inquiry-btn" type="button" onclick="location.href=''">문의하기</button>
                </div>
                <h2 class="img-text">EV battery</h2>
                <p class="img-text-sub" style="font-size: 16px;">지금 바로 문의하세요.</p>
            </div>
            <div class="outter-box img">
                <img class="main-img" src="./images/전기차2.png" alt="전기차 사진">
                <div class="inner-box">
                    <button class="details-btn" type="button" onclick="location.href=''">상세보기</button>
                    <button class="inquiry-btn" type="button" onclick="location.href=''">문의하기</button>
                </div>
                <h2 class="img-text" style="font-size: 40px;">EV battery V2</h2>
                <p class="img-text-sub" style="font-size: 16px;">지금 바로 문의하세요.</p>
            </div>
            <div class="outter-box img">
                <img class="main-img" src="./images/태양광.jpg" alt="태양광 사진">
                <div class="inner-box">
                    <button class="details-btn" type="button" onclick="location.href=''">상세보기</button>
                    <button class="inquiry-btn" type="button" onclick="location.href=''">문의하기</button>
                </div>
                <h2 class="img-text" style="font-size: 40px;">solar power battery</h2>
                <p class="img-text-sub" style="font-size: 16px;">재생에너지 배터리 지금 바로 문의하세요.</p>
            </div>
            <div class="outter-box img">
                <img class="main-img" src="./images/풍력발전기.jpg" alt="풍력발전기 사진">
                <div class="inner-box">
                    <button class="details-btn" type="button" onclick="location.href=''">상세보기</button>
                    <button class="inquiry-btn" type="button" onclick="location.href=''">문의하기</button>
                </div>
                <h2 class="img-text" style="font-size: 40px;">wind power battery</h2>
                <p class="img-text-sub" style="font-size: 16px;">재생에너지 배터리 지금 바로 문의하세요.</p>
            </div>
        </div>
    </tbody>
</body>
</html>