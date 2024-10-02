<%@ page contentType="text/html; charset=UTF-8" language="java" %>

    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비블리엇</title>
    <!-- =====================================================================================CSS 부분================================================================================================ -->
    <link rel="stylesheet" href="./css/myPage.css">
    <!-- ==========================================================================================JSP 부분========================================================================================= -->
   
    <script src="https://kit.fontawesome.com/d5abf4d39e.js" crossorigin="anonymous"></script>
    <script src="./js/toggle.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="./js/menu.js" defer></script>
    <script src="./js/myPagemodal.js" defer></script>
    <script>
    let isAuthValid = false; // 인증 여부를 추적하는 전역 변수
    function sendVerificationEmail() {
        const email = $('#newEmail').val();
        const action = $('#action_verification').val();
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
            dataType:"json",					
            // 서버에서 보내줄 데이터의 타입
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
    function checkPassword() { // 기존 비밀번호가 일치하는지 확인하는 메소드
    	$.ajax({
            url:"<%= request.getContextPath() %>/CheckPassword",             
            type:"post",                                                  // HTTP 요청 방식(GET, POST)
            dataType:"json",					
            // 서버에서 보내줄 데이터의 타입
            data:{"ex-password" : $("#ex-password").val()},     // HTTP 요청과 함께 서버로 보낼 데이터
            success: function(data){
            	console.log("Received data:", data);
                if (data.check) {
                    alert("비밀번호가 동일합니다.");
                    isChecked = true;
                } else {
                    alert("비밀번호가 다릅니다.");
                    isChecked = false;
                }
			},
			error : function(data, textStatus) {
                console.log('error!!: ', data);
            }
        });
    }
 	// form의 submit 이벤트를 가로채는 코드
    $(document).ready(function() {
        $("#modifyForm").on("submit", function(e) {
            if (!isAuthValid) {
                // 인증번호가 유효하지 않으면 폼 제출을 막고 알림 표시
                e.preventDefault();  // 기본 form 제출 동작을 막음
                alert("올바른 인증번호를 입력해 주세요.");
            }
            // 인증번호가 유효하면 폼이 정상적으로 제출됨
        });
        
        $("#modifyForm-password").on("submit", function(e) {
            if (!isChecked) {
                // 인증번호가 유효하지 않으면 폼 제출을 막고 알림 표시
                e.preventDefault();  // 기본 form 제출 동작을 막음
                alert("올바른 기존 비밀번호를 입력해 주세요.");
            }
            // 인증번호가 유효하면 폼이 정상적으로 제출됨
        });
    });
    </script>
</head>
<!-- ==============================================================================================HTML부분========================================================================================== -->
<body class="home-page"; id="home-page">
<%
	User user = (User) session.getAttribute("user");
%>
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
    <tbody class="mypage-main">
        <h1 class="mypage-main-text">My Page</h1>
        <div class="mypage-main-box">
            <div class="mypage-main-box-1">
                <div class="mypage-main-box-2">
                    <div class="mypage-sub-box-1">
                        <!-- 아이디 -->
                        <div class="mypage-sub-box-content">
                            <h3 class="mypage-sub-box-content-text-main">성명</h3>
                            <p class="mypage-sub-box-content-text">${sessionScope.user.name}</p>
                            <button type="button" class="mypage-sub-box-content-text-sub name-popup">수정하기</button>
                        </div>
                        <!-- 전화번호 -->
                        <div class="mypage-sub-box-content">
                            <h3 class="mypage-sub-box-content-text-main">전화번호</h3>
                            <p class="mypage-sub-box-content-text">${sessionScope.user.tel}</p>
                            <button type="button" class="mypage-sub-box-content-text-sub tell-popup">수정하기</button>
                        </div>
                        <!-- 이메일 -->
                        <div class="mypage-sub-box-content">
                            <h3 class="mypage-sub-box-content-text-main">이메일</h3>
                            <p class="mypage-sub-box-content-text">${sessionScope.user.email}</p>
                            <button type="button" class="mypage-sub-box-content-text-sub email-popup">수정하기</button>
                        </div>
                     </div>
                     <div class="mypage-sub-box-2">
                        <!--  <div class="mypage-sub-box-content">
                            <h3 class="mypage-sub-box-content-text-main">아이디</h3>
                            <p class="mypage-sub-box-content-text">${sessionScope.user.id}</p>
                            <button type="button" class="mypage-sub-box-content-text-sub id-popup">수정하기</button>
                        </div>-->
                        <div class="mypage-sub-box-content">
                            <h3 class="mypage-sub-box-content-text-main">비밀번호</h3>
                            <p class="mypage-sub-box-content-text hidden-p"></p>
                            <button type="button" class="mypage-sub-box-content-text-sub pw-popup">재설정하기</button>
                        </div>
                        <div class="mypage-sub-box-content">
                        	<h3 class="mypage-sub-box-content-text-main hidden-h3"></h3>
                        	<p class="mypage-sub-box-content-text hidden-p"></p>
                            <button type="button" class="mypage-sub-box-content-text-sub out-popup">탈퇴하기</button>
                        </div>
                     </div>
                </div>
                <!-- 이름 수정 모달창 -->
                <form action="myPage" method="post">
                <div class="mypage-modal-wrapper">
                    <div class="mypage-modal">
                        <h1 class="modal-name">이름 수정<span class="closebtn name-closebtn">&times;</span></h1>
                        <div class="mypage-items-list name-items-list">
                            <div class="mypage-items-ex name-items-ex">
                                <div class="ex-name">
                                    <span>기존 이름</span>
                                 </div>
                                <div class="mypage-text-box name-text-box-1">
                                    <p>${sessionScope.user.name}</p>
                                </div>
                            </div>
                        </div>
                        <div class="mypage-items-list name-items-list">
                           	<div class="mypage-items-new name-item-new">
                               	<label class="new-name" for="newName">
                                   	<span>새 이름</span>
                               	</label>
                               	<div class="mypage-text-box name-text-box-2">
                                   	<input type="text" class="mypage-text-input name-text" id="newName" name="newName" maxlength="100" required placeholder="이름을 입력하세요.">
                               	</div>
                           	</div>
                       	</div>
                       	<div class="mypage-change-btn-box">
                       		<input type="hidden" name="action" value="updateName">
                           	<button type="submit" class="mypage-change-btn name-change-btn" id="saveName" value="이름 수정완료" aria-label="이름 수정 버튼">수정하기</button>
                       	</div>
                    </div>
                </div>
                </form>
                
                <!-- 전화번호 수정 모달창 -->
                <form action="myPage" method="post">
                <div class="mypage-modal-wrapper tell-modal-wrapper">
                    <div class="mypage-modal mypage-tell-modal">
                        <h1 class="modal-name">전화번호 수정<span class="closebtn tell-closebtn">&times;</span></h1>
                        <div class=" mypage-items-list tell-items-list-1">
                            <div class="mypage-items-ex tell-items-ex">
                                <div class="ex-tell">
                                    <span>기존 전화번호</span>
                                </div>
                                <div class="mypage-text-box tell-text-box-1">
                                    <p>${sessionScope.user.tel}</p>
                                </div>
                            </div>
                        </div>
                        <div class="mypage-items-list tell-items-list-2">
                            <div class="mypage-items-new tell-item-new">
                               	<label class="new-tell" for="newTell">
                                   	<span>새 전화번호</span>
                               	</label>
                               	<div class="mypage-text-box tell-text-box-2">
                                   	<input type="text" class="mypage-text-input tell-text" id="newTell" name="newTell" maxlength="11" pattern="010\d{7,8}" required placeholder="010부터 입력하세요.">
                               	</div>
                           	</div>
                       	</div>
                       	<div class="mypage-change-btn-box">
                       		<input type="hidden" name="action" value="updateTel">
                           	<button type="submit" class="mypage-change-btn tell-change-btn" id="savePhone" aria-label="전화번호 수정 버튼">수정하기</button>
                       	</div>
                    </div>
                </div>
                </form>
                <!-- 이메일 수정 모달창 -->
                <form action="myPage" method="post" id="modifyForm">
                <input type="hidden" name="action_verification" id="action_verification" value="signup">
                <div class="mypage-modal-wrapper email-modal-wrapper">
                    <div class="mypage-modal mypage-email-modal">
                        <h1 class="modal-name">이메일 수정<span class="closebtn email-closebtn">&times;</span></h1>
                        
	                       <div class="mypage-items-list email-items-list-1">
	                           <div class="mypage-items-ex email-items-ex">
	                               <label class="newEmail" for="newEmail">
	                                   <span>새 이메일</span>
	                               </label>
	                               <div class="mypage-text-box email-text-box-1">
	                                   <input type="email" class="mypage-text-input email-text" id="newEmail" name="newEmail" maxlength="100" required placeholder="이메일을 입력하세요.">
	                               </div>
	                               
	                           </div>
	                       	</div>
	                       	<div class="mypage-text-aut-box email-text-aut-btn">
	                          			<button type="button" class="mypage-emailAut-btn email-aut-btn" id="btnSend" onclick="sendVerificationEmail()">인증번호 보내기</button>
	                          			<input type="text" id="Confirm" name="Confirm" style="display: none" value="">
	                      	</div>
	                        <div class="mypage-items-list email-items-list-2">
							   <div class="mypage-items-new email-item-new">
							       <label class="new-email" for="verificationCode">
							           <span>인증번호</span>
							       </label>
							       <div class="mypage-text-box email-text-box-2">
							           <input type="text" class="mypage-text-input email-text" id="verificationCode" name="verificationCode" required placeholder="인증번호를 입력하세요.">
							       </div>
							   </div>
							</div>
	                       	<div class="mypage-text-aut-box email-text-aut-btn">
	                           	<button type="button" class="mypage-emailAut-btn email-aut-btn" id="btnCheck" onclick="checkAuthNumber()">인증하기</button>
	                       	</div> 
	                       	<div class="mypage-change-btn-box">
	                       		<input type="hidden" name="action" value="updateEmail">
	                           	<button type="submit" class="mypage-change-btn email-change-btn" id="email-change-btn" aria-label="이메일 수정 버튼">수정하기</button>
	                       	</div>
                       	
                    </div>
                </div>
                </form>
                <!-- 비밀번호 수정 모달창 -->
                <form action="myPage" method="post" id="modifyForm-password">
                <div class="mypage-modal-wrapper pw-modal-wrapper">
                    <div class="mypage-modal mypage-pw-modal">
                        <h1 class="modal-name">비밀번호 수정<span class="closebtn pw-closebtn">&times;</span></h1>
                        <div class=" mypage-items-list pw-items-list-1">
                            <div class="mypage-items-ex pw-items-ex">
                                <label class="ex-password" for="ex-password">
                                    <span>기존 비밀번호</span>
                                </label>
                                <div class="mypage-text-box pw-text-box-1">
                                    <input type="password" class="mypage-text-input pw-text" id="ex-password" maxlength="20" pattern=".{1,20}" required>
                                </div>
                            </div>
                        </div>
                        <div class="mypage-pwCheck-btn-box" style="margin-bottom: 30px;">
                            <button type="button" class="mypage-change-btn pw-autCheck-btn" id="email-change-btn" onclick="checkPassword()">비밀번호 확인</button>
                        </div>
                        <div class="mypage-items-list pw-items-list-2">
                            <div class="mypage-items-new pw-item-new">
                                <label class="new-pw" for="new-pw">
                                    <span>새 비밀번호</span>
                                </label>
                                <div class="mypage-text-box pw-text-box-2" style="margin-bottom: 15px;">
                                    <input type="password" class="mypage-text-input pw-text" id="new-pw" name="new-pw" maxlength="20" pattern=".{1,20}" required placeholder="비밀번호를 입력하세요.">
                                </div>
                            </div>
                        </div>
                        <div class="mypage-change-btn-box">
                        	<input type="hidden" name="action" value="updatePassword">
                            <button type="submit" class="mypage-change-btn pw-change-btn" id="pw-change-btn" aria-label="비밀번호 수정 버튼">수정하기</button>
                        </div>
                    </div>
                </div>
                </form>
                <!-- 탈퇴 모달창 -->
                <form action="myPage" method="post">
                <div class="mypage-modal-wrapper out-modal-wrapper">
                    <div class="mypage-modal mypage-out-modal">
                        <h1 class="modal-name">탈퇴하기<span class="closebtn out-closebtn">&times;</span></h1>
                        <div class=" mypage-items-list out-items-list-1">
                            <div class="mypage-items-ex out-items-ex">
                                <label class="ex-out-id" for="ex-out-id">
                                    <span>아이디</span>
                                </label>
                                <div class="mypage-text-box out-text-box-1">
                                    <input type="text" class="mypage-text-input out-text" id="ex-out-id" name="ex-out-id">
                                </div>
                            </div>
                        </div>
                        <div class="mypage-items-list out-items-list-2">
                            <div class="mypage-items-new out-item-new">
                                <label class="new-out" for="new-out">
                                    <span>비밀번호</span>
                                </label>
                                <div class="mypage-text-box out-text-box-2">
                                    <input type="password" class="mypage-text-input out-text" id="new-out" name="new-out" required="비밀번호를 입력하세요.">
                                </div>
                            </div>
                        </div>
                        <div class="mypage-change-btn-box">
                        	<input type="hidden" name="action" value="exit">
                            <button type="submit" class="mypage-change-btn tell-change-btn" id="tell-change-btn">탈퇴하기</button>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </tbody>
    <jsp:include page="footer.jsp"/>
    <script>
    window.onload = function() {
        const params = new URLSearchParams(window.location.search);
        const errorMessage = params.get("errorMessage");
        if (errorMessage) {
            alert(decodeURIComponent(errorMessage));
        }
    };
    </script>
</body>
</html>