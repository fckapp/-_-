<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
	/* ----------------------------------------푸터---------------------------------------*/
footer{
    flex: 0 0 auto;
}
.footer-primary{
    color: #fff;
    letter-spacing: -0.05em;
}
footer .row:first-child{
    background-color: black;
    height: 63px;
    width: 100%;
    border-bottom: 1px solid #222;
}
footer .row:last-child{
    background-color: black;
    height: 85px;
}
.footer-links{
    width: 100%;
}
footer ul{
    display: flex;
    width: 100%;
    flex-wrap: wrap;
    margin: 0;
    padding: 0 0 0 3.75%;
    list-style-type: none;
}
footer li::after{
    content: "/";
    margin: 0 10px;
}
footer li:last-child::after{
    content: "";
}
footer li a:hover{
    color: #fff;
}
footer .inner{
    display: flex;
    width: 100%;
    height: 100%;
    align-items: center;
}
footer li a{
    color: #b4b4b4;
}
footer .col:last-child{
    display: flex;
    flex-direction: row;
    height: 45px;
    align-items: center;
    padding-inline-start: 3.75%;
}
.footer-logo{
    width: 115px;
    height: auto;
    margin-right: 20px;
}
.footer-logo img{
    width: 100%;
}
</style>
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