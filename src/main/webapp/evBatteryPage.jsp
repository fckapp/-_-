<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href="./css/ev_battery_real.css">
	<!-- <link rel="stylesheet" href="./css/reset.css"> -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://kit.fontawesome.com/d5abf4d39e.js" crossorigin="anonymous"></script>
	<script src="./js/toggle.js" defer></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="./js/menu.js" defer></script>
	<title>EV전지 : 비블리엇</title>
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
	<div class="ev_BatteryPage-container">
		<article class="ev_BatteryPage-slider">
			<img src="./images/battery_banner.png">
		</article>
		<section class="business-features" style="background-image: url(./images/battery_2_2.png); height: 610px;">
			<div class="container-boxed">
				<div class="__txt">
					<h3>핵심 경쟁력</h3>
					<p>Bibliot은 팩의 혁신적인 기술이 집약된 전기차 배터리의 셀, 모듈, BMS,<br>
						팩 제품을 통해 안전하고, 빠르고, 환경을 보호할 수 있는 전기차 대중화에 앞장서고 있습니다.<br><br>
						세계 유수의 완성체 업체들과의 다양한 프로젝트 경험을 바탕으로 배터리 생산부터<br>
						폐배터리 재사용까지도 고려한 배터리 생태계를 새롭게 만들어 나가고 있습니다.
					</p>
				</div>
			</div>
			<div class="__features">
				<div class="container-boxed">
					<div class="__cards">
						<div class="__card">
							<div class="__txt">
								<h3 class="__title">
									제품 기술력을<br>바탕으로 한 최적의<br>토탈 솔루션
								</h3>
								<p class="__excerpt">
									높은 기술력을 바탕으로한 셀, 모듈,<br>
									팩과 제품에 최적화된 BMS와 기술<br>
									지원이 가능한 토탈 솔루션을 제공합니다.
								</p>
							</div>
							<span class="__no __1">01</span>
						</div>

						<div class="__card">
							<div class="__txt">
								<h3 class="__title">
									글로벌 완성차<br>업체의 최고<br>파트너
								</h3>
								<p class="__excerpt">
									약 30년의 R&D 역량이 집약된<br>
									제품, 소재, 기술력을 바탕으로 70여개<br>
									글로벌 프로젝트를 수행했습니다.
								</p>
							</div>
							<span class="__no">02</span>
						</div>
						<div class="__card">
							<div class="__txt">
								<h3 class="__title">
									고객과 시장에<br>밀접한 글로벌<br>생산 4각 체계
								</h3>
								<p class="__excerpt">
									한국 - 중국 - 미국 - 폴란드 업계<br>
									최다의 글로벌 생산 거점을 구축함과<br>
									동시에 오래된 생산 경험을 보유해<br>
									고객과 시장에 적절한 빠른 대응이<br>
									가능합니다.
								</p>
							</div>
							<span class="__no">03</span>
						</div>
					</div>
				</div>
			</div>

		</section>

		<section class="business-ev">
			<div class="container-boxed">
				<div class="business-title-area">
					<h3 class="__title">EV Solution</h3>
				</div>
				<div class="__well">
					<div class="business-ev-tech">
						<div class="__item" style="padding: 0 20px;">
							<p class="__subtitle">Extended Driving Distances</p>
							<img src="./images/icon_EVsolution_01.png" alt="">
							<p class="__content">
								고 에너지 밀도 배터리로 장거리 운행<br>실현
							</p>
						</div>
						<div class="__item" style="padding: 0 20px;">
							<p class="__subtitle">Lighter Vehicle Weight</p>
							<img src="./images/icon_EVsolution_02.png" alt="">
							<p class="__content">
								배터리 경량화를 통한 전비 향상
							</p>
						</div>
						<div class="__item" style="padding: 0 20px;">
							<p class="__subtitle">Quick Charging</p>
							<img src="./images/icon_EVsolution_03.png" alt="">
							<p class="__content">
								급속충전을 통해 상용차 수익성<br>극대화
							</p>
						</div>
						<div class="__item" style="padding: 0 20px;">
							<p class="__subtitle">Space Efficiency</p>
							<img src="./images/icon_EVsolution_04.png" alt="">
							<p class="__content">
								다양한 크기의 배터리를 통해<br>공간 활용도 최적화
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
					<ul class="tabmenu">
						<li class="__one active" >
							<a href="#productTab1" class="tab-link" data-target="productTab1">
								<span>EV battery</span>
							</a>
						</li>
						<li>
							<a href="#productTab2" class="tab-link" data-target="productTab2">
								<span>EV battery v2</span>
							</a>
						</li>
					</ul>
				</div>
				<div class="__business-tab-contents">
					<div class="__business-tab-content active" id="productTab1" data-status="active">
						<div class="half_desc">
							<div class="__title">EV battery</div>
							<div class="__content">
								파우치 타입의 배터리 셀로, 길이와 넓이를 다양하게 구현할 수 있어 배터리 용량을 증가시키기
								수월해 최적화 된 셀 구현이 가능합니다.
							</div>
						</div>
						<div class="half_visualization">
							<img src="./images/battery_2.jpg" alt="DB에서 불러와 띄울 것.">
						</div>
					</div>
					<div class="__business-tab-content" id="productTab2" data-status="inactive">
						<div class="half_desc">
							<div class="__title">EV battery v2</div>
							<div class="__content">
								크기 모양의 경계를 넘어 다양한 애플리케이션에 탑재되고 있고, 애플리케이션 공간에
								최적화된 맞춤형 배터리 개발로 공간 활용도와 용량을 동시에 충족시킵니다. 또한
								핵심 소재인 양극재, 분리막 기술역을 바탕으로 고용량, 고밀도, 초슬림의 차별화된 제품을 제공합니다. 
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
	<script>
	document.querySelectorAll('.tab-link').forEach(link => {
	    link.addEventListener('click', function (event) {
	        event.preventDefault();

	        // Remove 'active' class from all tab contents and hide them
	        document.querySelectorAll('.__business-tab-content').forEach(content => {
	            content.classList.remove('active');
	            content.setAttribute('data-status', 'inactive');
	        });

	        // Remove 'active' class from all links
	        document.querySelectorAll('.tabmenu li').forEach(item => {
	            item.classList.remove('active');
	        });

	        // Add 'active' class to the clicked tab content
	        const targetId = this.getAttribute('data-target');
	        const targetTab = document.getElementById(targetId);
	        targetTab.classList.add('active');
	        targetTab.setAttribute('data-status', 'active');

	        // Add 'active' class to the parent <li> element
	        this.parentElement.classList.add('active');
	    });
	});
	</script>
</body>

</html>