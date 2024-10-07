<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">

<head>
<!-- ==========================================================================================JSP 부분========================================================================================= -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비블리엇 : 데이터 분석</title>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <link rel="stylesheet" href="./css/loading.css">
    <link rel="stylesheet" href="./css/data.css">
    <link rel="stylesheet" href="./css/maincommon.css">
    <script src="https://kit.fontawesome.com/d5abf4d39e.js" crossorigin="anonymous"></script>
    <script src="./js/toggle.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="./js/menu.js" defer></script>

    <script>
        function uploadFiles(event) {
            event.preventDefault(); // 기본 폼 제출 동작 방지
            alert("파일을 업로드 합니다.");
            
         	// 로딩 스피너 보이기
            document.getElementById('loading').style.display = 'block';


            const formData = new FormData();
            const fileInput1 = document.getElementById('fileInput1');
            const fileInput2 = document.getElementById('fileInput2');

            formData.append('files0', fileInput1.files[0]); // 첫 번째 파일
            formData.append('files1', fileInput2.files[0]); // 두 번째 파일

            fetch('http://localhost:8080/Bibliot/upload', {
                method: 'POST',
                body: formData,
                headers: {
                    'Accept': 'application/json'  // 공백 제거
                }
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok: ' + response.statusText);
                }
                return response.json(); // JSON 응답 받기
            })
            .then(data => {
                // 그래프 표시 전에 이전 그래프를 비웁니다.
                document.getElementById('graph').innerHTML = '';
                
                // Plotly 그래프 표시
                Plotly.newPlot('graph', data.data, data.layout).then(() => {
                    // 그래프가 로드된 후 로딩 스피너 숨기고 그래프 표시
                    document.getElementById('loading').style.display = 'none';
                    document.getElementById('graph').style.display = 'block';
                });
            })
            .catch(error => {
                console.error('Fetch error:', error);
                alert('파일 업로드 중 오류가 발생했습니다.');
             	// 로딩 스피너 숨기기
                document.getElementById('loading').style.display = 'none';
            })
        }
    </script>
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
    <div class="dataPage-main-wrapper">
        <div class="dataPage-graph-wrapper">
            <h1 class="dataPage-main-text">Data Analysis</h1>

            <!-- 메인 그래프  -->
            <div class="graph-wrapper">
                <div id="graph" class="dataPage-graph"></div>
            </div>
        </div>
    </div>

    <!-- 파일 업로드  -->
    <div class="dataPage-file-wrapper">
        <div class="dataPage-file-sub-wrapper">
            <label for="fileInput1">
                <div class="btn-upload">Test CSV Upload</div>
            </label>
            <input type="file" id="fileInput1" class="dataPage-file-input1 file-input1" name="files0" accept=".csv" required>

            <label for="fileInput2">
                <div class="btn-upload">Label CSV Upload</div>
            </label>
            <input type="file" id="fileInput2" class="dataPage-file-input1 file-input2" name="files1" accept=".csv" required>

            <button type="button" onclick="uploadFiles(event)" class="dataPage-file-upload-btn">업로드</button>
        </div>
    </div>
   
    <!-- 로딩 스피너 추가 -->
    <div id="loading">
	    <div class="ring">Loading
		  <span class="ring-load"></span>
		</div>
    </div>
</body>
</html>