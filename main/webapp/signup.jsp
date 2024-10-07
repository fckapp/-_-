<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    let currentStep = 0;
    let isIdChecked = false; // ID 중복 확인 여부 플래그
    let isEmailVerified = false; // 이메일 인증 여부 플래그

    function showStep(step) {
        $('.step').hide(); // 모든 스텝 숨김
        $('.step').eq(step).show(); // 현재 스텝만 표시
    }

    function nextStep() {
        if (currentStep === 0) {
            const name = $('#name').val();
            const tel = $('#tel').val();

            // 이름과 전화번호가 입력되지 않으면 경고
            if (!name) {
                return alert("이름을 입력해 주세요.");
            }
            if (!tel) {
                return alert("전화번호를 입력해 주세요.");
            }
         	// 전화번호가 010으로 시작하지 않으면 경고
            if (!tel.startsWith("010")) {
                return alert("전화번호는 010으로 시작해야 합니다.");
            }
        }

        if (currentStep === 1 && !isIdChecked) {
            return alert("중복된 아이디 입니다. 다른 아이디를 입력한 후 중복을 확인해주세요.");
        }

        if (currentStep === 2 && !isEmailVerified) {
            return alert("이메일 인증을 완료해 주세요.");
        }

        if (currentStep < 3) { // 마지막 단계까지 (0, 1, 2 단계)
            currentStep++;
            showStep(currentStep);
        }
    }

    function prevStep() {
        if (currentStep > 0) {
            currentStep--;
            showStep(currentStep);
        }
    }

    // 중복 아이디 체크 및 색상 변경
    function checkIdDuplication() {
        const id = $('#id').val();
        if (!id) {
            return alert("아이디를 입력하세요.");
        }

        $.ajax({
            url: "<%= request.getContextPath() %>/checkId",
            type: "post",
            dataType: "json",
            data: { id },
            success: function(data) {
                if (data.duplicate) {
                    $('#id').css('borderColor', 'red'); // 중복일 때 빨간색
                    alert("중복된 아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                    isIdChecked = false;
                } else {
                    $('#id').css('border-color', 'green'); // 사용 가능할 때 초록색
                    alert("사용 가능한 아이디입니다.");
                    isIdChecked = true; // ID 중복 확인 성공
                }
            },
            error: function() {
                console.log('Error during checking ID duplication');
            }
        });
    }

    // 이메일 인증 요청
    function sendVerificationEmail() {
        const email = $('#email').val();
        const action = $('#action_verification').val();
        if (!email) {
            return alert("이메일을 입력하세요.");
        }

        alert("5초 정도 소요됩니다. 인증번호가 오지 않으면 입력하신 정보가 맞는지 확인해 주세요.");

        $.ajax({
            url: "<%= request.getContextPath() %>/sendEmailVerification",
            type: "post",
            dataType: "json",
            data: {"email": email,
				   "action": action},
            success: function(data) {
                if (data.success) {
                    $('#email').css('border-color', 'green'); // 성공 시 초록색
                    $("#Confirm").val(data.authNumber);  // 인증번호 설정
                    alert("인증번호가 전송되었습니다.");
                } else {
                    $('#email').css('border-color', 'red'); // 실패 시 빨간색
                    alert("인증번호 전송에 실패하였습니다.");
                }
            },
            error: function() {
                console.log('Error during sending verification email');
            }
        });
    }

    // 인증번호 체크
    function checkAuthNumber() {
        const verificationCode = $('#verificationCode').val();
        if (!verificationCode) {
            return alert("인증번호를 입력하세요.");
        }

        $.ajax({
            url: "<%= request.getContextPath() %>/verifyCode",
            type: "post",
            dataType: "json",
            data: {"verificationCode" : $("#verificationCode").val()},
            success: function(data) {
                if (data.success) {
                    $('#verificationCode').css('border-color', 'green'); // 인증 성공 시 초록색
                    alert("인증 성공");
                    isEmailVerified = true; // 이메일 인증 성공
                } else {
                    $('#verificationCode').css('border-color', 'red'); // 인증 실패 시 빨간색
                    alert("인증 실패. 올바른 인증번호를 입력해 주세요.");
                    isEmailVerified = false;
                }
            },
            error: function() {
                console.log('Error during verifying code');
            }
        });
    }

    $(document).ready(function() {
        showStep(currentStep); // 초기 스텝 표시

        $("#signupForm").on("submit", function(e) {
            if (!isEmailVerified) {
                // 인증번호가 유효하지 않으면 폼 제출을 막고 알림 표시
                e.preventDefault();  // 기본 form 제출 동작을 막음
                alert("올바른 인증번호를 입력해 주세요.");
            }
            // 인증번호가 유효하면 폼이 정상적으로 제출됨
        });
        $("#signupForm").on("submit", function(e) {
            if (isDuplicated) {
                // 중복된 아이디가 존재할 경우
                e.preventDefault();  // 기본 form 제출 동작을 막음
                alert("중복된 아이디입니다. 다른 아이디를 입력해주세요.");
            }
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
        </div>
        <jsp:include page="navbar.jsp" />
	    <div class="accountPage-container">
	        <div class="accountPage-contents">
	            <h1 class="accountPage-title">회원가입</h1>
	            <form action="signup" method="post" id="signupForm">
	            <input type="hidden" name="action_verification" id="action_verification" value="signup">
	                <div class="step">
	                    <h2 class="accountPage-sub-title">1단계: 이름 및 전화번호 입력</h2>
	                    <label for="name">이름</label>
	                    <input type="text" id="name" name="name" class="signupPage-information-text" required>
	
	                    <label for="tel">전화번호</label>
	                    <input type="text" id="tel" name="tel" class="signupPage-information-text" maxlength="11" pattern="010\d{7,8}" title="전화번호는 010으로 시작하고, 11자리 숫자여야 합니다." required>
	
	                    <button type="button" onclick="nextStep()" class="accountPage-next-btn-1">다음</button>
	                </div>
	
	                <div class="step">
	                    <h2 class="accountPage-sub-title">2단계: 아이디 및 비밀번호 입력</h2>
	                    <label for="id">아이디</label>
	                    <input type="text" id="id" name="id" class="signupPage-information-text signupPage-id" maxlength="11" pattern=".{1,11}" required>
	                    <button type="button" onclick="checkIdDuplication()" class="check-btn">중복확인</button>
	
	                    <label for="password">비밀번호</label>
	                    <input type="password" id="password" name="password" class="signupPage-information-text" maxlength="20" required>
	
						<div class="button-container">
					        <button type="button" onclick="prevStep()" class="accountPage-last-btn">이전</button>
					        <button type="button" onclick="nextStep()" class="accountPage-next-btn">다음</button>
					    </div>
	                </div>
	
	                <div class="step">
	                    <h2 class="accountPage-sub-title">3단계: 이메일 인증</h2>
	                    <label for="email">이메일</label>
	                    <input type="text" id="email" name="email" class="signupPage-information-text signupPage-email" required>
	                    <button type="button" onclick="sendVerificationEmail()" class="check-btn">인증번호 전송</button>
	
	                    <label for="verificationCode">인증번호</label>
	                    <input type="text" id="verificationCode" name="verificationCode" class="signupPage-information-text signupPage-email" required>
	                    <button type="button" onclick="checkAuthNumber()" class="check-btn">인증</button>
	                    
	                    	<div class="accountPage-sec-termOfUse">
	                        	<input type="checkbox" name="termOfUse" id="termOfUse" value="termOfUse" required/>
	                        	<label for="termOfUse">이용약관에 동의합니다.</label>
	                    	</div>
	                    	<div class="accountPage-sec-personalInfo">
	                        	<input type="checkbox" name="personalInfo" id="personalInfo" value="personalInfo" required/>
	                        	<label for="personalInfo">개인정보 수집 및 이용에 동의합니다.</label>
	                    	</div>
	                    
	                    <div class="button-container"> 
	                    	<button type="button" onclick="prevStep()" class="accountPage-last-btn">이전</button>
	                    	<button type="submit" class="accountPage-next-btn">계정생성</button>
	                    </div>
	                </div>
	            </form>
	        </div>
	    </div>
</body>
</html>