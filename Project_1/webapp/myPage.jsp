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
    <link rel="stylesheet" href="./css/maincommon.css">
    <!-- ==========================================================================================JSP 부분========================================================================================= -->
   <link rel="stylesheet" href="./css/maincommon.css">
    <script src="https://kit.fontawesome.com/d5abf4d39e.js" crossorigin="anonymous"></script>
    <script src="./js/toggle.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="./js/menu.js" defer></script>
    <script src="./js/myPagemodal.js" defer></script>
    <script src="./js/MyPage_Profile.js" defer></script>
    <script>
	    function sendVerificationCode() {
	        const newEmail = document.getElementById('newEmail').value;
	
	        fetch('updateEmail', {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/x-www-form-urlencoded',
	            },
	            body: `newEmail=${encodeURIComponent(newEmail)}&sendVerification=true`
	        })
	        .then(response => response.text())
	        .then(data => {
	            alert(data); // 서버 응답 메시지 표시
	        })
	        .catch(error => console.error('Error:', error));
	    }
	
	    function verifyEmail() {
	        const verificationCode = document.getElementById("verificationCode").value; // 인증번호 가져오기
	        const newEmail = document.getElementById("newEmail").value; // 새 이메일 주소 가져오기

	        fetch("updateEmail", {
	            method: "POST",
	            headers: {
	                'Content-Type': 'application/x-www-form-urlencoded',
	            },
	            body: `newEmail=${encodeURIComponent(newEmail)}&verificationCode=${encodeURIComponent(verificationCode)}`
	        })
	        .then(response => response.text())
	        .then(data => {
	            console.log(data); // 서버 응답 로그
	        })
	        .catch(error => console.error('Error:', error));
	    }
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
                        <div class="mypage-sub-box-content">
                            <h3 class="mypage-sub-box-content-text-main">아이디</h3>
                            <p class="mypage-sub-box-content-text" style="margin-bottom: 60px;">${sessionScope.user.id}</p>
                        </div>
                        <div class="mypage-sub-box-content">
                            <h3 class="mypage-sub-box-content-text-main">비밀번호</h3>
                            <p class="mypage-sub-box-content-text" >***********</p>
                            <button type="button" class="mypage-sub-box-content-text-sub pw-popup">재설정하기</button>
                        </div>
                        <div class="mypage-sub-box-content">
                            <button type="button" class="mypage-sub-box-content-text-sub out-popup" style="margin-top: 85px;">탈퇴하기</button>
                        </div>
                     </div>
                </div>
                <!-- 이름 수정 모달창 -->
                <div class="mypage-modal-wrapper">
                    <div class="mypage-modal">
                        <h1 class="modal-name">이름 수정<span class="closebtn name-closebtn">&times;</span></h1>
                        <div class="mypage-items-list name-items-list">
                            <div class="mypage-items-ex name-items-ex">
                                <label class="ex-name" for="ex-name">
                                    <span>기존 이름</span>
                                 </label>
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
                                   	<input type="text" class="mypage-text-input name-text" id="newName" name="newName" required="이름을 입력하세요." placeholder="이름을 입력하세요.">
                               	</div>
                           	</div>
                       	</div>
                       	<div class="mypage-change-btn-box">
                           	<button type="submit" class="mypage-change-btn name-change-btn" id="saveName" value="이름 수정완료" aria-label="이름 수정 버튼">수정하기</button>
                       	</div>
                    </div>
                </div>
                <!-- 전화번호 수정 모달창 -->
                <div class="mypage-modal-wrapper tell-modal-wrapper">R
                    <div class="mypage-modal mypage-tell-modal">
                        <h1 class="modal-name">전화번호 수정<span class="closebtn tell-closebtn">&times;</span></h1>
                        <div class=" mypage-items-list tell-items-list-1">
                            <div class="mypage-items-ex tell-items-ex">
                                <label class="ex-tell" for="newTell">
                                    <span>기존 전호번호</span>
                                </label>
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
                                   	<input type="text" class="mypage-text-input tell-text" id="newTell" name="newTell" required="전화번호를 입력하세요." placeholder="전화번호를 입력하세요.">
                               	</div>
                           	</div>
                       	</div>
                       	<div class="mypage-change-btn-box">
                           	<button type="submit" class="mypage-change-btn tell-change-btn" id="savePhone" aria-label="전화번호 수정 버튼">수정하기</button>
                       	</div>
                    </div>
                </div> -->
                <!-- 이메일 수정 모달창 -->
                <div class="mypage-modal-wrapper email-modal-wrapper">
                    <div class="mypage-modal mypage-email-modal">
                        <h1 class="modal-name">이메일 수정<span class="closebtn email-closebtn">&times;</span></h1>
                        <form method="post" action="updateEmail">
	                       <div class=" mypage-items-list email-items-list-1">
	                           <div class="mypage-items-ex email-items-ex">
	                               <label class="ex-email" for="ex-email">
	                                   <span>새 이메일</span>
	                               </label>
	                               <div class="mypage-text-box email-text-box-1">
	                                   <input type="email" class="mypage-text-input email-text" id="newEmail" name="newEmail" required="이메일을 입력하세요." placeholder="이메일을 입력하세요.">
	                               </div>
	                               <div class="mypage-text-aut-box email-text-aut-btn">
	                          			<button type="button" class="mypage-emailAut-btn email-aut-btn" id="sendVerification" name="sendVerification" aria-label="이메일 인증 버튼">인증번호 보내기</button>
	                      			</div> 
	                           </div>
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
	                           	<button type="button" class="mypage-emailAut-btn email-aut-btn" id="email-aut-btn" onclick="verifyEmail()" aria-label="인증번호 버튼">인증하기</button>
	                       	</div> 
	                       	<div class="mypage-change-btn-box">
	                           	<button type="submit" class="mypage-change-btn email-change-btn" id="email-change-btn" aria-label="이메일 수정 버튼">수정하기</button>
	                       	</div>
                       	</form>
                    </div>
                </div>
                <!-- 비밀번호 수정 모달창 -->
                <div class="mypage-modal-wrapper pw-modal-wrapper">
                    <div class="mypage-modal mypage-pw-modal">
                        <h1 class="modal-name">비밀번호 수정<span class="closebtn pw-closebtn">&times;</span></h1>
                        <div class=" mypage-items-list pw-items-list-1">
                            <div class="mypage-items-ex pw-items-ex">
                                <label class="ex-email" for="ex-email">
                                    <span>기존 비밀번호</span>
                                </label>
                                <div class="mypage-text-box pw-text-box-1">
                                    <input type="text" class="mypage-text-input pw-text" name="ex-pw">
                                </div>
                            </div>
                        </div>
                        <div class="mypage-pwCheck-btn-box" style="margin-bottom: 30px;">
                            <button type="submit" class="mypage-change-btn pw-autCheck-btn" id="email-change-btn" aria-label="비밀번호 확인 버튼">비밀번호 확인</button>
                        </div>
                        <div class="mypage-items-list pw-items-list-2">
                            <div class="mypage-items-new pw-item-new">
                                <label class="new-pw" for="new-pw">
                                    <span>새 비밀번호</span>
                                </label>
                                <div class="mypage-text-box pw-text-box-2" style="margin-bottom: 15px;">
                                    <input type="text" class="mypage-text-input pw-text" name="new-pw" required="비밀번호를 입력하세요." placeholder="비밀번호를 입력하세요.">
                                </div>
                                <label class="new-pw ne-pw-again" for="new-pw-again">
                                    <span>새 비밀번호 확인</span>
                                </label>
                                <div class="mypage-text-box pw-text-box-2">
                                    <input type="text" class="mypage-text-input pw-text" name="new-pw" required="비밀번호를 입력하세요." placeholder="비밀번호를 입력하세요.">
                                </div>
                            </div>
                        </div>
                        <div class="mypage-change-btn-box">
                            <button type="submit" class="mypage-change-btn pw-change-btn" id="pw-change-btn" aria-label="비밀번호 수정 버튼">수정하기</button>
                        </div>
                    </div>
                </div>
                <!-- 탈퇴 모달창 -->
                <div class="mypage-modal-wrapper out-modal-wrapper">
                    <div class="mypage-modal mypage-out-modal">
                        <h1 class="modal-name">탈퇴하기<span class="closebtn out-closebtn">&times;</span></h1>
                        <div class=" mypage-items-list out-items-list-1">
                            <div class="mypage-items-ex out-items-ex">
                                <label class="ex-out" for="ex-out">
                                    <span>아이디</span>
                                </label>
                                <div class="mypage-text-box out-text-box-1">
                                    <input type="text" class="mypage-text-input out-text" name="ex-out" re>
                                </div>
                            </div>
                        </div>
                        <div class="mypage-items-list out-items-list-2">
                            <div class="mypage-items-new out-item-new">
                                <label class="new-out" for="new-out">
                                    <span>비밀번호</span>
                                </label>
                                <div class="mypage-text-box out-text-box-2">
                                    <input type="text" class="mypage-text-input out-text" name="new-out" required="비밀번호를 입력하세요.">
                                </div>
                            </div>
                        </div>
                        <div class="mypage-change-btn-box">
                            <button type="submit" class="mypage-change-btn tell-change-btn" id="tell-change-btn" aria-label="전화번호 수정 버튼">탈퇴하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <p class="mypage-account-text">아이디 혹은 비밀번호를 잊어버리셨나요?</p>
        <div class="find-account-box">
            <button type="submit" class="mypage-find-account" aria-label="계정찾기" onclick="location.href=''">계정찾기</button>
        </div>
    </tbody>
</body>
</html>