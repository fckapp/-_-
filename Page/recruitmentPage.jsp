<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비블리엇-채용정보</title>
    <link rel="stylesheet" href="./css/recruitment.css">
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
<body class="home-page"; id="home-page">
	<div id='wrapper'>
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
	    <div class="recruitmentPage-container">
	        <article class="recruitmentPage-slider">
	            <div class="recruitmentPage-slider-text-box">
	                <div class="recruitmentPage-slider-text">채용정보</div>
	                <div class="recruitmentPage-slider-subtext">도전적인 과업을 통한 의미있는 성장</div>
	            </div>
	            <img src="./images/recruitment_banner.svg" alt="채용정보페이지배너사진">
	        </article>
	        <section class="recruitmentPage-sec-inform">
	            <div class="recruitmentPage-sec-inform-title">WE ARE LOOKING FOR</div>
	            <div class="recruitmentPage-sec-inform-sub">
	                <span>창의적으로 도전할 수 있는 용기있는 분들을 찾고 있습니다.</span>
	            </div>
	            <section class="recruitmentPage-sec-careers">
	                <div class="sec-careers-one">
	                    <img src="./images/creative.png" alt="creative 사진">
	                    <div class="career-div-p">
	                        <span>Creative</span>
	                        <p>기존의 형식에서 벗어나 새로운 생각을 가지고 발상과 인식의 전환을 이끌어 낼 수 있는 창의적인 인재,
	                            목표의식과 위기의식을 갖고 끊임없는 창의적인 개선을 통해 위기를 극복해 나갈 수 있는 인재.
	                            바로 비블리엇이 바라는 인재입니다.
	                        </p>
	                    </div>
	                </div>
	                <div class="sec-careers-two">
	                    <img src="./images/challenging.png" alt="challenging 사진">
	                    <div class="career-div-p">
	                        <span>Challenging</span>
	                        <p>어렵고 남들이 기피하는 분야에도 도전하는 개척정신과 변화의 개혁을 선도하려는 강한 모험정신을 가진 인재,
	                            실패를 두려워 하지않는 인재.
	                            바로 비블리엇이 원하는 인재입니다.
	                        </p>
	                    </div>
	                </div>
	                <div class="sec-careers-three">
	                    <img src="./images/passion.png" alt="passion 사진">
	                    <div class="career-div-p">
	                        <span>Passion</span>
	                        <p>‘처음’이 되고 싶은 열망으로 세상의 혁신을 주도하는 인재,
	                            누가 시키지 않더라도 자발적인 의지로 변화를 만들어내는 인재.
	                            바로 비블리엇이 원하는 인재입니다.
	                        </p>
	                    </div>
	                </div>
	            </section>
	        </section>
	        <section class="recruitmentPage-sec-mainJob">
	            <h2>주요 직무</h2>
	            <div class="recruitmentPage-mainJob-container">
	                <div class="recruitmentPage-mainJob-box">
	                    <img src="./images/recruitment_img1.svg" alt="">
	                    <div class="recruitmentPage-research-box-p">
	                        <span>연구팀</span>
	                        <p>
	                            유/무기 소재 합성 및 분석, 금속/고분자 재료 물성,
	                            차세대 전지기술, 전지소재 및 공정기술을 연구하고,
	                            배터리 시스템 요구사항 분석 및 설계, 표준 시스템
	                            개발 및 최적화를 합니다.
	                        </p>
	                    </div>
	                </div>
	                <div class="recruitmentPage-mainJob-box">
	                    <img src="./images/recruitment_img2.svg" alt="">
	                    <div class="recruitmentPage-research-box-p">
	                        <span>생산팀</span>
	                        <p>
	                            생산량/수율/가동율/설비종합효율을 관리 및 개선하고,
	                            생산계획 수립 및 실적관리, 라인운영 최적화 관리를 하며,
	                            국내외 신공정 기술 개발/지원/확산 등 제조지능화 관련 DX 활동을 합니다.
	                        </p>
	                    </div>
	                </div> 
	                <div class="recruitmentPage-mainJob-box">
	                    <img src="./images/recruitment_img3.svg" alt="">
	                    <div class="recruitmentPage-research-box-p">
	                        <span>비즈니스 서포트팀</span>
	                        <p>
	                            상품 경쟁력 강화를 위한 전략 수립하고,
	                            지역별 시장 수요 분석 및 신시장 성장 동력 선제적 발굴 및 확산하며,
	                            고객 Needs 분석을 통한 제품 컨셉 개발 방향성 수립합니다.
	                        </p>
	                    </div>
	                </div>
	            </div>
        	</section>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>
    
</body>
</html>