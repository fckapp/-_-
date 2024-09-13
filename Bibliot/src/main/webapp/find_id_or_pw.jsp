<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비블리엇 아이디/비밀번호 찾기</title>
    <link rel="stylesheet" href="./css/find_id_or_pw.css">
    <script src="https://kit.fontawesome.com/d5abf4d39e.js" crossorigin="anonymous"></script>
    <script src="./js/toggle.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="./js/menu.js" defer></script>
</head>
<body class="home-page"; id="home-page">
    <div class="header-navbar">
        <nav class="navbar">
            <div class="navbar-logo">
                <a href="http://127.0.0.1:5500/mainPage.html#"><img class="logo" src="./images/logo.svg" height="70px"></a>
            </div>
            <ul class="navbar-menu">
                <li><a href="#"><span class="navbar-menu-text">제품</span></a></li>
                <li><a href="#"><span class="navbar-menu-text">회사</span></a></li>
                <li><a href="#"><span class="navbar-menu-text">채용</span></a></li>
                <li><a href="#"><span class="navbar-menu-text">문의</span></a></li>
            </ul>
            <ul class="navbar-aut">
                <li><a href="#"><span class="navbar-menu-text">로그인</span></a></li>
                <li><a href="#"><span class="navbar-menu-text">회원가입</span></a></li>
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
    <div class="menu-pan">
        <div class="menu-pan-box">
            <div class="menu-category">
                <div class="category"><img class="main-product" alt="모델1"></div>
            </div>
            <div class="menu-category">
                <div class="category"><img class="main-product" alt="모델2"></div>
            </div>
            <div class="menu-category">
                <div class="category"><img class="main-product" alt="모델3"></div>
            </div>
            <div class="menu-category">
                <div class="category"><img class="main-product" alt="모델4"></div>
            </div>
        </div>
    </div>
    <section class="find_id_or_pw-container">
        <div class="find_id_or_pw-maintext">계정 찾기</div>
        <div class="find_id_or_pw-iconboxes">
            <div class="find_id_or_pw-iconbox">
                <a href="find_id.jsp"><img src="./images/icon_id.svg" alt="id"></a>
            </div>
            <div class="find_id_or_pw-iconbox">
                <img src="./images/icon_vertical_bar.svg" alt="vertical">
            </div>
            <div class="find_id_or_pw-iconbox">
                <a href="find_pw.jsp"><img src="./images/icon_password.svg" alt="password"></a>
            </div>
        </div>
    </section>
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
</div>

</body>