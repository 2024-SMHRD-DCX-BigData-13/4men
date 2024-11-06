<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pictogram</title>
<link rel="stylesheet" href="assets/css/login.css" />
</head>
<body>
	<div class="video-background">
		<video autoplay loop muted playsinline>
			<source src="./images/fulls/login1.mp4" type="video/mp4">
			Your browser does not support HTML5 video.
		</video>
	</div>
	<div class="header-bar">
		<!-- <img src="./images/thumbs/pictogram.jpg" alt="Logo" class="header-logo" />  -->
		<h1 class="logo">PICTOGRAM</h1>
		<nav class="nav-menu">
			<span class="menu-item" id="spot-recommend">명소 추천</span> <span
				class="menu-item" id="free-board">자유 게시판</span>
			<div class="hover-message hidden" id="login-required">로그인 후 사용
				가능합니다</div>
		</nav>
		<div>Team:4men</div>
	</div>
		<!-- 로그인 박스 -->
	<div class="container" id="login-container">
		<form action="login.do" class="login-container">
			<div id="login-title-text" class="logo">PICTOGRAM</div>
			<div class="login-group">
				<input type="text" name="user_id2" placeholder="아이디"> <input
					type="password" name="password2" placeholder="비밀번호">
				<button type="submit">로그인</button>
				<div class="side">
					<button onclick="showSignUp(event);">회원가입</button>
					<button onclick="showFindID(event);">아이디 찾기</button>
				</div>
			</div>
		</form>
	</div>
	<!-- 회원가입 박스 및 성향 체크리스트 (초기에는 숨김 처리) -->
	<div id="signup-layout" class="container hidden">
		<form method="post">
			<!-- 회원가입 폼 -->
			<div class="title">SIGN UP</div>
			<div class="login-group">
				<input type="text" name="user_id" id="user_id" placeholder="아이디">
				<p id="result"></p>
				<input type="password" name="password" id="password"
					placeholder="비밀번호"> <input type="text" name="name"
					id="name" placeholder="이름"> <input name="birthday"
					type="date" id="birthday" />
				<div class="select-gender">
					<select id="gender" name="gender">
						<option value="" disabled selected hidden>성별</option>
						<option value="남성">남성</option>
						<option value="여성">여성</option>
						<option value="중성">중성</option>
					</select>
				</div>
			</div>
			<div class="login-group">
				<input type="text" name="phone_number" id="phone_number"
					placeholder="핸드폰 번호 (- 제외)">
			</div>
			<button type="button" onclick="showLogin();" id=sign_up>회원가입</button>
			<button type="button" onclick="showLogin();">돌아가기</button>
		</form>
	</div>
	<div class="container hidden" id="findid-layout">
		<form method="post">
			<div class="title">FIND ID</div>
			<div class="login-group">
				<input type="text" placeholder="이름" id="name-find" name="name-find">
				<input type="date" id="birthday-find" name="birthday-find">
				<input type="text" placeholder="핸드폰 번호 (- 제외)"
					id="phone_number-find" name="phone_number-find">
			</div>
			<button type="button" id="find_id" onclick="showLogin();">아이디
				찾기</button>
			<button type="button" onclick="showLogin();">돌아가기</button>
		</form>
	</div>
	<div class="footer-bar">
		<!-- 팀 정보 -->
		<div id="team">
			<a href="https://namu.wiki/w/%ED%95%B4%EC%9B%90">Team:
				4men</a>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/assets/js/login-function.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/join.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/findId.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/check.js"></script>

</body>
</html>