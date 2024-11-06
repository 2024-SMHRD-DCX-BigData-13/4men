<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", -1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PICTOGRAM</title>
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>

	<div class="hero">
		<div class="overlay">
			<h1>
				사진 찍기 좋은 명소 추천 서비스<br>PICTOGRAM
			</h1>
			<!-- <button>맞춤 추천</button> -->
		</div>
	</div>
	<div class="header-bar">
		<!-- <img src="./images/thumbs/pictogram.jpg" alt="Logo" class="header-logo" />  -->
		<h1 class="logo">PICTOGRAM</h1>
		<nav class="nav-menu">
			<button class="menu-item" id="spot-recommend" onclick="toggleRec()">명소
				추천</button>
			<button class="menu-item" id="free-board" onclick="toggleCpost()">자유
				게시판</button>
		</nav>
		<div>
			<a href="#">마이페이지</a> <a href="logout.do">로그아웃</a>
		</div>
	</div>

	<div id="rec-container" class="content-container hidden">
		<!-- 명소 추천 내용 -->
		<p>명소 추천 콘텐츠</p>
	</div>

	<div id="Cpost-container" class="content-container hidden ">
		<!-- 자유게시판 내용 -->
		<p>자유게시판 콘텐츠</p>
	</div>

	<div class="footer-bar">
		<!-- 팀 정보 -->
		<div class="team">
			<a href="https://namu.wiki/w/%ED%95%B4%EC%9B%90">Team: 4men</a>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/assets/js/main-function.js"></script>
</body>
</html>