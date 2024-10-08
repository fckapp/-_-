<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비블리엇 - 회사소개</title>
<!-- =====================================================================================CSS 부분================================================================================================ -->
    <link rel="stylesheet" href="./css/maincommon.css">
<!-- ==========================================================================================JSP 부분========================================================================================= -->
    <script src="https://kit.fontawesome.com/d5abf4d39e.js" crossorigin="anonymous"></script>
    <script src="./js/toggle.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="./js/menu.js" defer></script>
    <script src="introductionPage-slide.js" defer></script>
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
                <li><a href="<%=request.getContextPath()%>/introduction.jsp"><span class="navbar-menu-text">회사</span></a></li>
                <li><a href="<%=request.getContextPath()%>/recruitment"><span class="navbar-menu-text">채용</span></a></li>
                <li><a href="#"><span class="navbar-menu-text">문의</span></a></li>
            </ul>
            <ul class="navbar-aut">
                <c:choose>
	                    <c:when test="${not empty sessionScope.user}">
	                        <!-- 로그인 상태 -->
	                        <li>
	                        	<a href="<%= request.getContextPath() %>/myPage.jsp">
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
    <tbody class="introduction-tbody">
        <div class="introduction-wrapper">
            <div class="introduction-first-content">
                <video class=introduction-main-content-video src="./images/회사소개.mp4" aria-label="제품홍보 영상"
                autoplay muted loop>
                </video>
            </div>
            <div class="introduction-main-content-top">
                <h1 class="introduction-main-content-text" style="text-align: center;">회사정보</h1>
                <p class="introduction-main-content-text-sub">자연친화적 그리고 미래지향적 </p>
            </div>
            <!-- <div class="introduction-main-content-end">
               <section class="main-content-end-box introduction-main-content-end-items">
                    <section class="introduction-main-content-end-items">
                        <div class="end-items">
                            <i class="fa-solid fa-car end-items-icons"></i>
                        </div>
                        <p class="end-items-icon-text">Hybrid Electric Vehicle</p>
                    </section>
                    <section class="introduction-main-content-end-items">
                        <div class="end-items">
                            <i class="fa-solid fa-solar-panel end-items-icons"></i>
                        </div>
                        <p class="end-items-icon-text">p-n junction</p>
                    </section>
                    <section class="introduction-main-content-end-items">
                        <div class="end-items">
                            <i class="fa-solid fa-wind end-items-icons"></i>
                        </div>
                        <p class="end-items-icon-text">풍력연계형 에너지저장장치</p>
                    </section>
               </section>
            </div> -->
            <div class="introduction-second-content">
                <h1 class="introduction-second-content-text">We don’t sell just a product, We sell an experience.</h1>
                <p class="introduction-second-content-sub-text">저희는 물건만 판매하는 것이 아닌 경험을 공유합니다.</p>
                <div class="introductionPage-to-detailsPage-btn-box">
                    <button class="introductionPage-to-detailsPage-btn" type="button" onclick="location.href=''">제품 상세보기</button>
                </div>
                <img class="introduction-second-content-back" src="./images/배경데코.svg">
            </div>
            <div class="introduction-third-content">
                <h1 class="introduction-third-content-main-text">CEO & TEAM</h1>
                <div class="introduction-ceo">
                    <div class="introduction-ceo-wrapper">
                        <div class="introduction-ceo-box">
                            <img class="introduction-ceo-img" src="./images/회사소개페이지_ceo사진.png" alt="ceo1">
                            <h2 class="introduction-ceo-name">Jake</h1>
                        </div>
                        <div class="introduction-ceo-text-box">
                            <p class="introduction-ceo-text">
                                대한민국은 지난 외환위기, 글로벌 금융위기 등 고비 때마다 해외에서 돌파구를 찾으며, 위기를 기회로 만들었습니다.<br><br>
                                비블리엇은 외국인투자유치, 온실가스 국제감축 지원 등과 같은 시대가 요구하는 새로운 역할을 능동적으로 수행하며 많은 도전과 어려움을 극복하는데 앞장서 왔습니다.<br><br>
                                지금 우리는 코로나 팬데믹 위기를 넘어, 교역질서의 변화와 공급망 재편, ​디지털 전환,<br>탄소중립 등 새로운 도전에 직면하고 있습니다.<br><br>
                                이러한 도전과 변화에 적극적으로 대응하고 새로운 미래를 대비하기 위해 노력하겠습니다. <br><br>
                                비블리엇의 디지털 무역투자 플랫폼을 통해 우리 중소, 중견기업의 수출과해외진출 확대에 이바지하겠습니다. <br><br>
                                고객 여러분의 변함없는 애정과 관심을 부탁드립니다.
                            </p>
                        </div>
                    </div>
                </div>
                <img class="introduction-third-content-img" src="./images/회사소개페이지_팀사진.jpg" alt="팀사진">
                <div class="introduction-third-content-text-box">
                    <h1 class="introduction-third-content-img-text">Bibliot Team</h1>
                    <p class="introduction-third-content-img-text-sub">비블리엇은 제1원칙 접근법을 사용하여 전 세계의 가장 큰 문제들을 해결합니다.
                        탁월한 성과를 거둔 적이 있다면, <br>비블리엇과 차세대 엔지니어링, 제조 및 운영 문제를 해결하는 데 함께하세요.
                    </p>
                </div>
            </div>
            <div class="introduction-fourth-content">
                <div class="introduction-slide-wrap">
                    <img class="introduction-slide-background-img" src="./images/회사소개 페이지 지도.jpg">
                    <div class="introduction-slide-list clearfix">
                        <div class="introduction-card">
                            <img class="introduction-card-content" src="./images/한국-평택.jpg">
                            <p class="introduction-card-content-text">한국 | Korea</p>
                        </div>
                        <div class="introduction-card">
                            <img class="introduction-card-content" src="./images/중국.jpg">
                            <p class="introduction-card-content-text">중국 | China</p>
                        </div>
                        <div class="introduction-card">
                            <img class="introduction-card-content" src="./images/베트남.jpg">
                            <p class="introduction-card-content-text">베트남 | Vietnam</p>
                        </div>
                        <div class="introduction-card">
                            <img class="introduction-card-content" src="./images/인도지점.jpg">
                            <p class="introduction-card-content-text">인도 | India</p>
                        </div>
                        <div class="introduction-card">
                            <img class="introduction-card-content" src="./images/캐나다-토론토.jpg">
                            <p class="introduction-card-content-text">캐나다 | Canada</p>
                        </div>
                        <div class="introduction-card">
                            <img class="introduction-card-content" src="./images/미국_텍사스 지점.jpg">
                            <p class="introduction-card-content-text">미국 | USA</p>
                        </div>
                    </div>
                </div>
                <div class="introduction-right">
                    <h1 class="introduction-right-text">6개국 글로벌 기업</h1>
                    <p class="introduction-right-text-sub">언제나 여러분들을 기다립니다.</p>
                    <button type="submit" class="go-to-hire-btn" aria-label="채용공고 버튼" onclick="location.href=''">채용정보 보기</button>
                </div>
            </div>
        </div>
    </tbody>
</body>
</html>