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
	<div class="container" id="login-container">
		<!-- 로그인 박스 -->
		<form action="login.do" class="login-container">
			<div id="login-title-text" class="title">Pictogram</div>
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
			<h1 class="title">Sign Up</h1>
			<div class="login-group">
				<input type="text" id="user_id" placeholder="아이디"> <input
					type="password" id="password" placeholder="비밀번호"> <input
					type="text" id="name" placeholder="이름"> <input type="date"
					id="birthday" />
				<div class="select-gender">
				<select id="gender">
						<option value="" disabled selected hidden>성별</option>
						<option value="남성">남성</option>
						<option value="여성">여성</option>
						<option value="중성">중성</option>
					</select>
				</div>
			</div>
			<div class="login-group">
				<input type="text" id="phone_number" placeholder="핸드폰 번호">
			</div>
			<button type="button" onclick="showLogin();" id=sign_up>회원가입</button>
			<button type="button" onclick="showLogin();">돌아가기</button>
		</form>
	</div>
	<div class="container hidden" id="findid-layout">
		<form method="post">
			<h1 class="title">Find ID</h1>
			<div class="login-group">
				<input type="text" placeholder="이름" id="name-find" name="name-find">
				<input type="date" id="birthday-find" name="birthday-find">
				<input type="text" placeholder="핸드폰 번호" id="phone_number-find"
					name="phone_number-find">
			</div>
			<button type="button" id="find_id" onclick="showLogin();">아이디
				찾기</button>
			<button type="button" onclick="showLogin();">돌아가기</button>
		</form>
	</div>



	<!-- 팀 정보 -->
	<div id="team">
		<a href="https://namu.wiki/w/%EC%95%88%EC%9C%A0%EC%A7%84">Team:
			4men</a>
	</div>

	<script type="text/javascript">
		function showSignUp(event) {
			if (event)
				event.preventDefault(); // 기본 동작 방지
			document.getElementById("login-container").classList.add("hidden");
			document.getElementById("signup-layout").classList.remove("hidden");
			document.getElementById("findid-layout").classList.add("hidden");
		}

		function showFindID(event) {
			if (event)
				event.preventDefault(); // 기본 동작 방지
			document.getElementById("login-container").classList.add("hidden");
			document.getElementById("signup-layout").classList.add("hidden");
			document.getElementById("findid-layout").classList.remove("hidden");
		}

		function showLogin() {
			document.getElementById("signup-layout").classList.add("hidden");
			document.getElementById("findid-layout").classList.add("hidden");
			document.getElementById("login-container").classList
					.remove("hidden");
		}
	</script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/join.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/find.js"></script>
</body>
</html>