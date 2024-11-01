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
	<div class="container" id="main-container">
		<!-- 로그인 박스 -->
		<form action="login.do" id="login-container" class="login-container">
			<div id="login-title-text" class="title">Pictogram</div>
			<div class="login-box">
				<div class="form-group">
					<div class="input-style">
						<span>ID :</span> <input type="text" id="login-email"
							name="user_id">
					</div>
				</div>
				<div class="form-group">
					<div class="input-style">
						<span>PW :</span> <input type="password" id="pw" name="password">
					</div>
				</div>
				<div class="form-group">
					<button class="login-button" type="submit">로그인</button>
					<button onclick="showSignUp(); event.preventDefault();">회원가입</button>
				</div>
			</div>
		</form>

		<!-- 회원가입 박스 및 성향 체크리스트 (초기에는 숨김 처리) -->
		<form method="post">
			<div id="signup-layout" class="signup-layout hidden">
				<!-- 회원가입 폼 -->
				<div id="signup-container" class="signup-container">
					<h1 class="title">Sign Up</h1>
					<div class="form-group">
						<div class="input-style">
							<span>ID :</span> <input type="text" id="user_id" name="user_id" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-style">
							<span class="test">PW :</span> <input type="password"
								id="password" name="password" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-style">
							<span>name :</span> <input type="text" id="name" name="name" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-style">
							<span>birthday :</span> <input type="text" id="birth_date"
								name="birth_date" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-style">
							<span>gender :</span> <input type="text" id="gender"
								name="gender" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-style">
							<span>phone_number :</span> <input type="text" id="phone_number"
								name="phone_number" />
						</div>
					</div>
					<button id="fuck-button" type="button" onclick="showLogin()">회원가입</button>
				</div>
			</div>
		</form>
	</div>

	<!-- 팀 정보 -->
	<div id="team">
		<a href="https://namu.wiki/w/%EC%95%88%EC%9C%A0%EC%A7%84">Team:
			4men</a>
	</div>

	<script type="text/javascript">
		function showSignUp() {
			document.getElementById("login-container").classList.add("hidden");
			document.getElementById("signup-layout").classList.remove("hidden");
		}

		function showLogin() {
			document.getElementById("signup-layout").classList.add("hidden");
			document.getElementById("login-container").classList
					.remove("hidden");
		}
	</script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/join.js"></script>
</body>
</html>