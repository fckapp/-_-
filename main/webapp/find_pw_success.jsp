<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기 결과</title>
    <script>
        window.onload = function() {
            // 비밀번호가 있을 경우 alert
            var password = "<%= request.getAttribute("password") != null ? request.getAttribute("password") : "" %>";
            var errorMessage = "<%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>";

            if (password) {
                alert("비밀번호: " + password);
                window.location.href = "<%= request.getContextPath() %>/login"; // 비밀번호를 알린 후 로그인 페이지로 리다이렉션
            } else if (errorMessage) {
                alert(errorMessage);
                history.back(); // 오류가 있을 경우 이전 페이지로 돌아가기
            }
        };
    </script>
</head>
<body>
    <h1>비밀번호 찾기 결과</h1>
    <p>결과를 확인하고 있습니다...</p>
</body>
</html>