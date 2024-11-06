<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<link rel="stylesheet" href="assets/css/findId.css" />
</head>
<body>
    <div class="result_container">
            <p>회원님의 ID</p>
            <strong>>> <%= request.getParameter("user_id") %> <<</strong>
    </div>
</body>
</html>