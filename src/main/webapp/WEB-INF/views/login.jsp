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
						<span>ID :</span> <input type="text" id="login-email" name="user_id">
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
		<form action="join.do">
			<div id="signup-layout" class="signup-layout hidden">
				<!-- 회원가입 폼 -->
				<div id="signup-container" class="signup-container">
					<h1 class="title">Sign Up</h1>
					<div class="form-group">
						<div class="input-style">
							<span>ID :</span> <input type="text" id="signup-id" name="user_id" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-style">
							<span class="test">PW :</span> <input type="password"
								id="signup-pw" name="password" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-style">
							<span>Tel :</span> <input type="text" id="signup-tel" name="tel"/>
						</div>
					</div>
					<button id="fuck-button"
						onclick="showLogin(); event.preventDefault();">회원가입</button>
				</div>

				<!-- 성향 체크리스트 -->
				<div id="preference-container" class="preference-container">
					<h1 id="checkbox-title" class="title">Type Checklist</h1>
					<div class="form-group">
						<div class="checkbox-item">
							<input type="checkbox" id="night-sky" name="preference"
								value="야경">
							<p>야경</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="market" name="preference" value="시장">
							<p>시장</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="architecture" name="preference"
								value="건축물">
							<p>건축물</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="cafe" name="preference" value="감성적인카페">
							<p>감성적인 카페</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="alley" name="preference" value="골목길">
							<p>골목길</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="sunrise-sunset" name="preference"
								value="일출일몰">
							<p>일출/일몰</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="beach" name="preference" value="해변">
							<p>해변</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="wave" name="preference" value="파도">
							<p>파도</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="ship" name="preference" value="선박">
							<p>선박</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="harbor" name="preference" value="항구">
							<p>항구</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="viewpoint" name="preference"
								value="전망">
							<p>전망</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="forest" name="preference" value="숲">
							<p>숲</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="valley" name="preference" value="계곡">
							<p>계곡</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="wildflowers" name="preference"
								value="야생화">
							<p>야생화</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="nature" name="preference" value="자연">
							<p>자연</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="scenery" name="preference" value="풍경">
							<p>풍경</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="ruins" name="preference" value="유적지">
							<p>유적지</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="traditional-clothes" name="preference"
								value="전통의상">
							<p>전통 의상</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="culture" name="preference" value="문화">
							<p>문화</p>
						</div>

						<div class="checkbox-item">
							<input type="checkbox" id="museum" name="preference" value="박물관">
							<p>박물관</p>
						</div>
					</div>
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
</body>
</html>