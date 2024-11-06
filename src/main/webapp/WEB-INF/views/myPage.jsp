<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/myPage.css" />
</head>
<body>
	<div class="header-bar">
		<!-- <img src="./images/thumbs/pictogram.jpg" alt="Logo" class="header-logo" />  -->
		<a href="goMain.do" class="logo">PICTOGRAM</a>
		<nav class="nav-menu">
			<span class="menu-item" id="spot-recommend">마이페이지</span>
		</nav>
		<div>
		<a href="https://namu.wiki/w/%EC%95%88%EC%9C%A0%EC%A7%84">회원정보수정</a>
		<a href="https://namu.wiki/w/%EC%95%88%EC%9C%A0%EC%A7%84">로그아웃</a>
		</div>
	</div>
	<table class="signup-table">
		<tr>
			<th>회원정보 수정</th>
		</tr>
		<tr>
		<th>ID</th>
		<td>불러올 데이터</td>
		</tr>
		<tr>
			<td>PW</td>
			<td>
			<input type="password" id="pw">
			</td>		
		</tr>
		<tr>
			<th>NAME</th>
			<td>불러올 데이터</td>
		</tr>
		<tr>
			<th>BIRTHDAY</th>
			<td>불러올 데이터</td>
		</tr>
		<tr>
			<th>GENDER</th>
			<td>불러올 데이터</td>
		</tr>
		<tr>
		<td>phone</td>
		<td>
			<input type="text" id="phone">
		</td>
		</tr>
		<tr>
			<th>생성날짜</th>
			<td>불러올 데이터</td>
		</tr>








	</table>









	<div class="footer-bar">
		<!-- 팀 정보 -->
		<div class="team">
			<a href="https://namu.wiki/w/%ED%95%B4%EC%9B%90">Team: 4men</a>
		</div>
	</div>
</body>
</html>