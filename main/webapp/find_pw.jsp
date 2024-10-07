<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기 : 비블리엇</title>
    <link rel="stylesheet" href="./css/find_id_or_pw.css">
    <script src="https://kit.fontawesome.com/d5abf4d39e.js" crossorigin="anonymous"></script>
    <script src="./js/toggle.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="./js/menu.js" defer></script>
    <script>
       	let isAuthValid = false; // 인증 여부를 추적하는 전역 변수
        function sendVerificationEmail() {
			const id = $('#id').val();
	        const email = $('#email').val();
	        const action = $('#action_verification').val();
	        console.log('btn click'); // 버튼 클릭 확인 로그
	
	        if (email.length === 0 || email === null) {
	            return alert("이메일을 입력하세요");
	        } else if(id.length === 0 || id === null){
	        	return alert("아이디를 입력하세요");
			} else {
	        	alert("5초 정도 소요됩니다. 인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해 주세요.");
	        }
	
	        $.ajax({
	            url: "<%= request.getContextPath() %>/sendEmailVerification",  // 이 부분을 확인
	            type: "post",
	            dataType: "json",
	            data: { "email": email,
						"action": action,
						"id": id
	            },  // email 변수를 바로 사용, 보낼 데이터
	            success: function(data) {
	                console.log("Received data:", data);
	                if (data.success) {
	                    alert("인증번호 발송 성공");
	                    $("#Confirm").val(data.authNumber);  // 인증번호 설정
	                } else {
	                    alert("인증번호 발송 실패; 아이디와 이메일을 확인해주세요.");
	                    console.log('error: ', data.error);
	                }
	            },
	            error : function(data, textStatus) {
	                console.log('error!!')
	            }
	        });
    	}
        function checkAuthNumber() {
        	$.ajax({
                url:"<%= request.getContextPath() %>/verifyCode",             
                type:"post",                                                  // HTTP 요청 방식(GET, POST)
                dataType:"json",											  // 서버에서 보내줄 데이터의 타입
                data:{"verificationCode" : $("#certNum").val()},     // HTTP 요청과 함께 서버로 보낼 데이터
                success: function(data){
                	console.log("Received data:", data);
	                if (data.success) {
	                    alert("이메일 인증 성공");
	                    isAuthValid = true;
	                } else {
	                    alert("이메일 인증 실패\n인증 번호가 다릅니다.");
	                    isAuthValid = false;
	                    console.log('error: ', data.error);
	                }
				},
				error : function(data, textStatus) {
	                console.log('error!!: ', data);
	            }
            });
        }
     	// form의 submit 이벤트를 가로채는 코드
        $(document).ready(function() {
            $("#signupForm").on("submit", function(e) {
                if (!isAuthValid) {
                    // 인증번호가 유효하지 않으면 폼 제출을 막고 알림 표시
                    e.preventDefault();  // 기본 form 제출 동작을 막음
                    alert("올바른 인증번호를 입력해 주세요.");
                }
                // 인증번호가 유효하면 폼이 정상적으로 제출됨
            });
        });
     	
        function showAlert(password) {
            alert("회원님의 비밀번호는 " + password + "입니다.");
        }
     </script>
</head>
<body class="home-page"; id="home-page">
    <!-- header 시작 -->
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
    <div class="find_pw-container">
        <div class="find_box_text">
    		<h1 class="find_pw-maintext-id">
    			<a href="<%= request.getContextPath() %>/find_id.jsp">아이디 찾기</a>
    		</h1>
    		<h1 class="find_pw-maintext-s"> / </h1>
    		<h1 class="find_pw-maintext-pw">비밀번호 찾기</h1>
    	</div>
        <div class="find_pw-form">
            <form action="find_pw" method="post" id="signupForm">
            <input type="hidden" name=action_verification id="action_verification" value="findPw">
                <table class="find_pw-table">
                    <tr>
                        <td>
                            <label for="id">아이디</label><br>
                            <input type="text" id="id" name="id" class="find_pw-information-text" value="<%= request.getAttribute("selectedId") != null ? request.getAttribute("selectedId") : "" %>" required >
                        </td>
                    </tr>
                    <tr>
                        <td class="find_pw-table-td-email">
                            <label for="email">이메일</label><br>
                            <input type="text" id="email" name="email" class="find_pw-information-text find-email-pw" maxlength="100" required />
                            <button type="button" class="find_pw-request-authentication-number" id="btnSend" onclick="sendVerificationEmail()"><span>인증번호전송</span></button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="certNum">인증번호</label><br>
                            <input type="text" id="certNum" name="certNum" class="find_pw-information-text find-email-pw" required />
                            <button type="button" class="find_pw-request-authentication-number" id="btnCheck" onclick="checkAuthNumber()"><span>인증</span></button>
                        </td>
                    </tr>
                </table>
                <input type="text" id="Confirm" name="Confirm" style="display: none" value="">
            	<button type="submit" class="find_pw-commit-btn">완료</button><br>
            </form>
        </div>
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