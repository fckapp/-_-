<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href="./css/ev_battery_real.css">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://kit.fontawesome.com/d5abf4d39e.js" crossorigin="anonymous"></script>
	<script src="./js/toggle.js" defer></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="./js/menu.js" defer></script>
	<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
	<script src="./js/EV_1pipchart.js"></script>
	<script src="./js/EV_1barchart.js"></script>
	<script src="./js/EV_1linechart.js"></script>
	<title>EV_1전지 : 비블리엇</title>
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
	                        	<a href="<%= request.getContextPath() %>/index.jsp">
		                        	<div>
		                        		<img class="account_icon" src="./images/데이터분석.png" height="24px">
		                        		<span class="navbar-menu-text">Data Analysis</span>
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
    <div class="evbattery-main">
    	<div class="background-blur"></div> <!-- 흐림 효과 배경 추가 -->
		<div class="left-main-wrapper">
			<div class="left-main-wrapper-box">
				<div class="left-btn-1">
					<a href="<%= request.getContextPath() %>/evBatteryPage.jsp">EV_1 배터리</a>
				</div>
				<div class="left-btn-2">
					<a href="">EV_2 배터리</a>
				</div>
				<div class="left-btn-3">
					<a href="">태양열 배터리</a>
				</div>
				<div class="left-btn-4">
					<a href="">풍력 배터리</a>
				</div>
				<div class="left-btn-5">
					<a href="<%=request.getContextPath()%>/inquery">문의하기</a>
				</div>
			</div>
		</div>
		<div class="right-main-wrapper">
			<div class="right-main-wrapper-box">
				<div class="right-top">
					<div class="right-top-pip" id="right-top-pip"></div>
					<div class="right-top-right">
						<div class="right-top-bar" id="right-top-bar"></div>
					</div>
				</div>
				<div class="right-under">
					<div class="right-under-line" id="right-under-line"></div>
				</div>
			</div>
		</div>
	</div>
	<script>
		drawPieChart1();
		drawBarChart();
		drawlineChart()
	</script>
</body>
</html>