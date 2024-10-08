<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비블리엇</title>
    <!-- =====================================================================================CSS 부분================================================================================================ -->
    <!-- ==========================================================================================JSP 부분========================================================================================= -->
    <link rel="stylesheet" href="./css/maincommon.css">
    <script src="https://kit.fontawesome.com/d5abf4d39e.js" crossorigin="anonymous"></script>
    <script src="./js/toggle.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="./js/menu.js" defer></script>

<link rel="stylesheet" href="./css/widget.css">
<style>
    .svg-container {
        width: 0px;
        height: 0px;
    }

    .svg-container svg {
        width: 100%;
        height: 100%;
    }
    .modal-container {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: rgba(0, 0, 0, 0.5);
        align-items: center;
        justify-content: center;
        z-index: 1000;
    }
    .modal {
        background-color: white;
        padding: 20px;
        border-radius: 5px;
        max-width: 500px;
        width: 100%;
        position: relative;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    
    }
    .modal-help {
        background-color: white;
        padding: 20px;
        border-radius: 5px;
        max-width: 500px;
        width: 100%;
        position: relative;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    
    }
    .close-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        background: none;
        border: none;
        font-size: 1.5rem;
        cursor: pointer;
    }
    .modal-header {
        margin-bottom: 20px;
    }
    .modal-content {
        margin-top: 20px;
    }
    .modal-form div {
        margin-bottom: 15px;
    }
    .form-input {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    .submit-btn {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
    }
    .submit-btn:hover {
        background-color: #0056b3;
    }
    select.form-input {
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='%23333' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 0.75rem center;
        background-size: 16px 12px;
        padding-right: 2.5rem;
    }

    select.form-input::-ms-expand {
        display: none;
    }
    .inquiry-section {
        border: 1px solid #ddd;
        padding: 10px;
        margin-bottom: 10px;
    }
    .inquiry-details {
        display: flex;
        justify-content: space-between;
        font-size: 0.9em;
        color: #666;
    }
    .helpCenter {
        font-size: 14px;
        font-weight: bold;
        text-align: center;
    }
    #modal-photo {
        display: flex;
    }

</style>

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
                <li><a href="<%=request.getContextPath()%>/inquery_form.jsp"><span class="navbar-menu-text">문의</span></a></li>
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
    <div class="board_wrap">
        <div class="board_title">
            <strong>문의사항</strong>
            <p>.</p>
        </div>
        <div class="'board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">No</div>
                    <div class="type">유형</div>
                    <div class="writer">작성자</div>
                    <div class="date">작성일</div>
                    <div class="check">답변</div>
                </div>
                <div>
                    <div class="num">9</div>
                    <div class="type"><a href='#'>일반 문의</a></div>
                    <div class="writer">고객8</div>
                    <div class="date">2024.10.1</div>
                    <div class="check">대기</div>
                </div>
                <div>
                    <div class="num">8</div>
                    <div class="type"><a href='#'>견적 문의</a></div>
                    <div class="writer">고객7</div>
                    <div class="date">2024.9.1</div>
                    <div class="check">대기</div>
                </div>
                <div>
                    <div class="num">7</div>
                    <div class="type"><a href='#'>견적 문의</a></div>
                    <div class="writer">고객6</div>
                    <div class="date">2024.7.1</div>
                    <div class="check">대기</div>
                </div>
                <div>
                    <div class="num">6</div>
                    <div class="type"><a href='#'>견적 문의</a></div>
                    <div class="writer">고객5</div>
                    <div class="date">2024.6.1</div>
                    <div class="check">대기</div>
                </div>
                <div>
                    <div class="num">5</div>
                    <div class="type"><a href='#'>기술 문의</a></div>
                    <div class="writer">고객3</div>
                    <div class="date">2024.5.1</div>
                    <div class="check">완료</div>
                </div>
                <div>
                    <div class="num">4</div>
                    <div class="type"><a href='#'>견적 문의</a></div>
                    <div class="writer">고객4</div>
                    <div class="date">2024.4.1</div>
                    <div class="check">완료</div>
                </div>
                <div>
                    <div class="num">3</div>
                    <div class="type"><a href='#'>견적 문의</a></div>
                    <div class="writer">고객3</div>
                    <div class="date">2024.3.1</div>
                    <div class="check">완료</div>
                </div>
                <div>
                    <div class="num">2</div>
                    <div class="type"><a href='#'>견적 문의</a></div>
                    <div class="writer">고객2</div>
                    <div class="date">2024.2.1</div>
                    <div class="check">완료</div>
                </div>
                <div>
                    <div class="num">1</div>
                    <div class="type"><a href='#'>견적 문의</a></div>
                    <div class="writer">고객1</div>
                    <div class="date">2024.1.1</div>
                    <div class="check">완료</div>
                </div>
            </div>
            <div class="board_page">
                <a href="#" class="bt first"><<</a>
                <a href="#" class="bt next"><</a>
                <a href="#" class="num on">1</a>
                <a href="#" class="num">2</a>
                <a href="#" class="num">3</a>
                <a href="#" class="num">4</a>
                <a href="#" class="num">5</a>
                <a href="#" class="bt prev">></a>
                <a href="#" class="bt last">>></a>
            </div>
            <div class="bt_wrap">
                <a href="#" class="on">목록</a>
                <a href="#" class="edit">수정</a>
            </div>
        </div>
        <aside id="sidebar-btn">
            <ul>
                <li>
                    <img src="./images/documents.png" class="widget">
                    <button type="button" class="btn btn-primary">모든문의</button>
                </li>
                <li>
                    <img src="./images/talk.png" class="widget">
                    <button type="button" class="btn btn-primary" id="openInquiryModal">문의하기</button>
                </li>
                <li>
                    <img src="./images/box.png" class="widget">
                    <button type="button" class="btn btn-primary" id="openMyqueryModal">나의문의</button>
                </li>
                <li>
                    <img src="./images/ask.png" class="widget">
                    <button type="button" class="btn btn-primary" id="openHelpCenterModal">고객센터</button>
                </li>
            </ul>
        </aside>

        <div class="modal-container" id="inquiryModal">
            <div class="modal">
                <button class="close-btn" id="closeModal">
                    <i class="fas fa-times"></i>
                </button>
                <div class="modal-header">
                    <h3>문의하기</h3>
                </div>
                <div class="modal-content">
                 <form class="modal-form" method="post" action="Inquery">
                    <p>문의 내용을 입력해주세요</p>
                    <div>
                        <label for="inquiryType">문의 유형</label>

                        <select id="inquiryType" name="inquiryType" class="form-input">
                            <option value="" disabled selected>선택하세요</option>
                            <option value="general">일반 문의</option>
                            <option value="technical">기술 지원</option>
                            <option value="billing">견적 문의</option>
                            <option value="other">기타</option>
                        </select>
                    </div>
                   
                        <div>
                            <label for="name">이름</label>
                            <input type="text" id="name" placeholder="이름을 입력하세요" class="form-input">
                        </div>
                        <div>
                            <label for="email">이메일</label>
                            <input type="email" id="email" placeholder="이메일을 입력하세요" class="form-input">
                        </div>
                        <div>
                            <label for="inquiryContent">문의 내용</label>
                            <textarea id="inquiryContent" placeholder="문의 내용을 입력하세요" class="form-input"></textarea>
                        </div>
                        <input type="submit" value="제출" class="submit-btn">
                    </form>
                </div>
            </div>
        </div>
        <div class="modal-container" id="myqueryModal">
            <div class="modal">
                <button class="close-btn" id="closeMyqueryModal">
                    <i class="fas fa-times"></i>
                </button>
                <div class="modal-header">
                    <h3>나의문의</h3>
                </div>
                <div class="modal-content">   
                    <div class="inquiry-section">
                        <h4>문의 내용</h4>
                        <p id="myqueryContent"></p>
                    </div>
                    <div class="inquiry-section">
                        <h4>관리자 답변</h4>
                        <p id="myqueryAnswer"></p>
                    </div>
                    <div class="inquiry-details">
                        <div>
                            <p>문의자: <span id="inquiryName"></span></p>
                            <p>이메일: <span id="inquiryEmail"></span></p>
                        </div>
                        <div>
                            <p>문의 유형: <span id="inquiryType"></span></p>
                            <p>문의 모델: <span id="inquiryModel"></span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-container" id="helpCenterModal">
            <div class="modal">
                <button class="close-btn" id="closeModal">
                    <i class="fas fa-times"></i>
                </button>
                <div class="modal-header">
                    <h3>고객센터</h3>
                </div>
                <div class="modal-content">
                    <form class="helpCenter">
                        <img src="./images/phone.png" width="30px" height="30px" id="modal-photo">
                        <div>070-1111-2222</div>
                        <img src="./images/email.png" width="30px" height="30px" id="modal-photo">
                        <div>bibliot@gmail.com</div>
                    </form>
                </div>
            </div>
        </div>
</body>  
<script>
    // Existing modal script
    const openModalBtn = document.getElementById('openInquiryModal');
    const closeModalBtn = document.getElementById('closeModal');
    const modal = document.getElementById('inquiryModal');
    const myqueryModalBtn = document.getElementById('openMyqueryModal');
    const myquery = document.getElementById('myqueryModal');
    const helpCenterModalBtn = document.getElementById('openHelpCenterModal');
    const helpCenter = document.getElementById('helpCenterModal');

    openModalBtn.addEventListener('click', () => {
        modal.style.display = 'flex';
    });

    closeModalBtn.addEventListener('click', () => {
        modal.style.display = 'none';
    });

    window.addEventListener('click', (e) => {
        if (e.target === modal) {
            modal.style.display = 'none';
        }
        if (e.target === myquery) {
            myquery.style.display = 'none';
        }
        if (e.target === helpCenter) {
            helpCenter.style.display = 'none';
        }
    });
    
    myqueryModalBtn.addEventListener('click', () => {
        myquery.style.display = 'flex';
    });

    helpCenterModalBtn.addEventListener('click', () => {
        helpCenter.style.display = 'flex';
    });


    // New dropdown script
    document.querySelectorAll('.dropdown-item').forEach(item => {
        item.addEventListener('click', function(e) {
            e.preventDefault();
            const selectedValue = this.getAttribute('data-value');
            const selectedText = this.textContent;
            document.getElementById('inquiryTypeDropdown').textContent = selectedText;
            document.getElementById('inquiryType').value = selectedValue;
        });
    });

    // myquery
    const closeMyqueryModalBtn = document.getElementById('closeMyqueryModal');

    closeMyqueryModalBtn.addEventListener('click', () => {
        myquery.style.display = 'none';
    });

    myqueryModalBtn.addEventListener('click', () => {
    // Populate the modal with example data (replace this with actual data fetching logic)
        document.getElementById('myqueryContent').textContent = "여기에 사용자의 문의 내용이 표시됩니다.";
        document.getElementById('myqueryAnswer').textContent = "여기에 관리자의 답변이 표시됩니다.";
        document.getElementById('inquiryName').textContent = "홍길동";
        document.getElementById('inquiryEmail').textContent = "hong@example.com";
        document.getElementById('inquiryType').textContent = "견적 문의";
        document.getElementById('inquiryModel').textContent = "모델 A";
    
    myquery.style.display = 'flex';
    });
</script>
</html>