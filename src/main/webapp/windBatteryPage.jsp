<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href="./css/wind_battery.css">
	<!-- <link rel="stylesheet" href="./css/reset.css"> -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://kit.fontawesome.com/d5abf4d39e.js" crossorigin="anonymous"></script>
	<script src="./js/toggle.js" defer></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="./js/menu.js" defer></script>
	<title>풍력발전 배터리 : 비블리엇</title>
</head>

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
	<div class="solar_BatteryPage-container">
		<div class="video-container">
			<article class="solar_BatteryPage-slider">
				<video class="video-background" src="./images/main2.mp4" autoplay muted loop></video>
				<div class="video-overlay">
					<h3><span class="__subtitle">풍력발전 에너지</span><span class="__sub"> 혁신을</span><span class="__sub"> 선도하다.</span></h3>
				  </div>
			</article>
		</div>
		
		<section class="business-features" style="background-image: url(./images/wind.svg); height: 610px;">
			<div class="container-boxed">
				<div class="__txt">
					<h3>
						순간 고출력,<br>
						고속 충방전,<br>
						장수명
					</h3>
				</div>
			</div>
		</section>

		<section class="business-ev">
			<div class="container-boxed">
				<div class="__well">
					<div class="business-ev-tech">
						<div class="__item">
							<img src="./images/SEES_Pouch Cell square.svg" alt="" width="41" height="46">
							<p class="__content">
								울트라커패시터
							</p>
						</div>
						<div class="__item">
							<img src="./images/comp3_ 8000 cycles-1 .svg" alt="" width="50" height="50">
							<p class="__content">
								지속가능 경영
							</p>
						</div>
						<div class="__item">
							<img src="./images/comp3_ High energy density .svg" alt="" width="50" height="50">
							<p class="__content">
								높은 에너지 효율성
							</p>
						</div>
						<div class="__item">
							<img src="./images/SE_Run On Sunshine.svg" alt="" width="47" height="47">
							<p class="__content">
								장기 신뢰성
							</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="business-product">
			<div class="container-boxed">
				<div class="business-title-area">
					<h3 class="__title">Product</h3>
				</div>
				<div class="__business-tab-contents">
					<div class="__business-tab-content active" id="productTab1" data-status="active">
						<div class="half_desc">
							<div class="__title">울트라커패시터</div>
							<div class="__content">
								높은 에너지 밀도, 높은 출력, 긴 수명으로 어떤 용도에도
								신뢰하고 사용할 수 있습니다.
							</div>
						</div>
						<div class="half_visualization">
							<img src="./images/battery_2.jpg" alt="DB에서 불러와 띄울 것.">
						</div>
					</div>
				</div>
			</div>
		</section>
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
</body>

</html>