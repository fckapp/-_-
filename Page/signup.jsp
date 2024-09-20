<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="./css/signup.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/d5abf4d39e.js" crossorigin="anonymous"></script>
        <script src="./js/toggle.js" defer></script>
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="./js/menu.js" defer></script>
        <title>회원가입 : 비블리엇</title>
        <script>
       	let isAuthValid = false; // 인증 여부를 추적하는 전역 변수
        function sendVerificationEmail() {
	        const email = $('#email').val();
	        const action = $('#action').val();
	        console.log('btn click'); // 버튼 클릭 확인 로그
	
	        if (email.length === 0 || email === null) {
	            return alert("이메일을 입력하세요");
	        } else {
	        	alert("5초 정도 소요됩니다. 인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해 주세요.");
	        }
	
	        $.ajax({
	            url: "<%= request.getContextPath() %>/sendEmailVerification",  // 이 부분을 확인
	            type: "post",
	            dataType: "json",
	            data: { "email": email,
						"action": action
	            },  // email 변수를 바로 사용, 보낼 데이터
	            success: function(data) {
	                console.log("Received data:", data);
	                if (data.success) {
	                    alert("인증번호 발송 성공");
	                    $("#Confirm").val(data.authNumber);  // 인증번호 설정
	                } else {
	                    alert("인증번호 발송 실패");
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
                data:{"verificationCode" : $("#verificationCode").val()},     // HTTP 요청과 함께 서버로 보낼 데이터
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
        
    	</script>
    </head>
    
    <body>
        <div class="header-navbar">
            <nav class="navbar">
                <div class="navbar-logo">
                    <a href="<%= request.getContextPath() %>/mainPage"><img class="logo" src="./images/logo.svg" height="70px"></a>
                </div>
                <ul class="navbar-menu">
                    <li><a href="#"><span class="navbar-menu-text">제품</span></a></li>
                    <li><a href="#"><span class="navbar-menu-text">회사</span></a></li>
                    <li><a href="#"><span class="navbar-menu-text">채용</span></a></li>
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
        <jsp:include page="navbar.jsp" />
        
        <div class="accountPage-container">
            <div class="accountPage-contents">
                <h1 class="accountPage-title">회원가입</h1>
                <form action="signup" method="post" id="signupForm">
                	<input type="hidden" name="action" id="action" value="signup">
                    <table class="accountPage-table">
                        <tr>
                            <td>
                                <label for="name">이름</label><br>
                                <input type="text" id="name" name="name" class="accountPage-information-text" required >
                            </td>
                            <td>
                                <label for="id">아이디</label><br>
                                <input type="text" id="id" name="id" class="accountPage-information-text" required >
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <label for="tel">전화번호</label><br>
                                <input type="text" id="tel" name="tel" class="accountPage-information-text" required >
                            </td>
                            <td>
                                <label for="password">비밀번호</label><br>
                                <input type="password" id="password" name="password" class="accountPage-information-text" required >
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="accountPage-table-td-email">
                                <label for="email">이메일</label><br>
                                <input type="text" id="email" name="email" class="accountPage-information-text" required />
                                <button type="button" class="accountPage-request-authentication-number" id="btnSend" onclick="sendVerificationEmail()"><span>인증번호전송</span></button>
                            </td>
                            <td>
                                <label for="verificationCode">인증번호</label><br>
                                <input type="text" id="verificationCode" name="verificationCode" class="accountPage-information-text" required />
                                <button type="button" class="accountPage-request-authentication-number" id="btnCheck" onclick="checkAuthNumber()"><span>인증</span></button>
                            </td>
                        </tr>
                    </table>
                    <input type="text" id="Confirm" name="Confirm" style="display: none" value="">
	                <p id="verificationMessage"></p>
	                <div class="accountPage-sec-agree">
	                    <div class="accountPage-sec-termOfUse">
	                        <input type="checkbox" name="termOfUse" id="termOfUse" value="termOfUse" required/>
	                        <label for="termOfUse">이용약관에 동의합니다.</label>
	                    </div>
	                    <div class="accountPage-sec-personalInfo">
	                        <input type="checkbox" name="personalInfo" id="personalInfo" value="personalInfo" required/>
	                        <label for="personalInfo">개인정보 수집 및 이용에 동의합니다.</label>
	                    </div>
	                    <button type="submit" class="accountPage-account-btn">회원가입 완료</button>
	                </div>
                </form>
                <br>
                <div class="accountPage-sec-footer">
                    <div class="accountPage-sec-one">
                        <a href="" class="accountPage-law-a">
                            <span>개인정보 처리방침 및 법적고지</span>
                        </a>
                    </div>
                    <div class="accountPage-sec-two">
                        <a href="" class="accountPage-inquire-a">
                            <span>문의하기</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="footer.jsp" />
    </body>
    
    </html>