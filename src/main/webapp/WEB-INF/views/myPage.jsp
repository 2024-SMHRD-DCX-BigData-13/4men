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
	<img src="./images/main2.jpg" alt="myPage" class="background-image">
	<div class="header-bar">
		<!-- <img src="./images/thumbs/pictogram.jpg" alt="Logo" class="header-logo" />  -->
		<a href="goMain.do" class="logo">PICTOGRAM</a>
		<nav class="nav-menu">
			<span class="menu-item" id="spot-recommend">MY PAGE</span>
		</nav>
		<div>
			<a href="logout.do">로그아웃</a>
		</div>
	</div>
	<form action="update.do" method="post">
		<table class="signup-table">
			<tr class="signup-title">
				<th colspan="2" id="tltle">
					<p>MEMBER INFO</p>
				</th>
			</tr>
			<tr>
				<th class=thc>ID</th>
				<td><input type="text" id="id" name="id" value="${member.id}" readonly></td>
			</tr>
			<tr>
				<th class=thc>PW</th>
				<td><input type="password" id="pw" name="pw" value="${member.pw}" ></td>
			</tr>


			<tr>
				<th class=thc>NAME</th>
				<td><input type="text" name="name" value="${member.name}" readonly></td>
			</tr>
			<tr>
				<th class=thc>BIRTHDAY</th>
				<td><input type="text" name="birthdate" value="${member.birthdate}" readonly></td>
			</tr>
			<tr>
				<th class=thc>GENDER</th>
				<td><input type="text" name="gender" value="${member.gender}" readonly></td>
			</tr>
			<tr>
				<th class=thc>PHONE</th>
				<td><input type="text" name="phone" id="phone" value="${member.phone}"></td>
			</tr>
			<tr>
				<th class=thc>생성날짜</th>
				<td><input type="text" name="join_dt" value="${member.join_dt}" readonly></td>
			</tr>

			<tr>
				<td colspan="2">
					<button class="update-button">회원정보 수정</button>
				</td>
			</tr>

		</table>
	</form>

		<div class="team">
			<a href="https://namu.wiki/w/%ED%95%B4%EC%9B%90">Team: 4men</a>
		</div>

</body>

</html>