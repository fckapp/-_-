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
    <style>
		.toggle-container {
            display: flex;
            background-color: #000000;
            border-radius: 30px;
            padding: 5px;
            width: 150px;
            cursor: pointer;
            position: relative;
            margin-bottom: 40px;
        }

        .toggle-option {
            flex: 1;
            text-align: center;
            padding: 8px 0;
            color: #fff;
            transition: color 1s;
            posistion: relative;
            z-index: 2;
            font-weight: 600;
            font-size: large;
        }

        .toggle-option.active {
            color: #000;
            background-color: #fff;
            border-radius: 25px;
            transition: all 2s;
        }

        .toggle-indicator {
            position: absolute;
            background-color: #424242;
            width: 50%;
            height: 80%;
            border-radius: 25px;
            transition: all 1s;
            z-index: 1;
        }
	</style>
</head>

<body>
	
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
	        <!-- 서브 메뉴판 -->
	    </div>
	    <jsp:include page="navbar.jsp"/>
	    <div class="loginPage-container">
	        <div class="loginPage-contents">
	            <h1 class="loginPage-title">로그인</h1>
	            <div id="toggle" class="toggle-container">
				    <div id="userOption" class="toggle-option active">개인</div>
				    <div id="adminOption" class="toggle-option">관리자</div>
				    <div class="toggle-indicator"></div>
				</div>
	            <form method="post">
	            	<input type="hidden" id="role" name="role" value="user">
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
    <script>
    window.onload = function() {
        const params = new URLSearchParams(window.location.search);
        const errorMessage = params.get("errorMessage");
        if (errorMessage) {
            alert(decodeURIComponent(errorMessage));
        }
    };
    
    const toggleContainer = document.getElementById('toggle');
    const userOption = document.getElementById('userOption');
    const adminOption = document.getElementById('adminOption');
    const toggleIndicator = document.querySelector('.toggle-indicator');
    const roleInput = document.getElementById('role');
    
    let isUser = true;

    function updateToggle() {
        if (isUser) {
            userOption.classList.add('active');
            adminOption.classList.remove('active');
            toggleIndicator.style.left = '0';
            roleInput.value = 'user';
        } else {
            adminOption.classList.add('active');
            userOption.classList.remove('active');
            toggleIndicator.style.left = '50%';
            roleInput.value = 'admin';
        }
    }

    toggleContainer.addEventListener('click', () => {
        isUser = !isUser;
        updateToggle();
    });

    updateToggle();
    </script>
</body>

</html>