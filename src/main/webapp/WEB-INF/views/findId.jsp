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
            <h1>아이디 찾기 결과</h1>
            <p>찾으신 아이디는>> <strong><%= request.getParameter("user_id") %></strong> << 입니다.</p>
    </div>
</body>
</html>