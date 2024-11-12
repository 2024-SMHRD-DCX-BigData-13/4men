<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<link rel="stylesheet" href="assets/css/writer.css" />
</head>
<body>
	<%
	// 세션에서 user_id 값을 가져옴
	String id = (String) session.getAttribute("id");
	%>
	<div class="header-bar">
		<!-- <img src="./images/thumbs/pictogram.jpg" alt="Logo" class="header-logo" />  -->
		<a href="goMain.do" class="logo">PICTOGRAM</a>
		<nav class="nav-menu">
			<span class="menu-item" id="spot-recommend">게시판 작성</span>
		</nav>
		<div>
			<a href="goMyPage.do">마이페이지</a> <a href="logout.do">로그아웃</a>
		</div>
	</div>
	<div class="content-container">
		<h1>게시물 작성</h1>

		<!-- 게시판 작성 -->
		<form action="writer.do" method="post">

			<table class="table-stbox">

				<thead>
					<tr>
						<th class="thl">게시판</th>
						<td><select id="post_type" name="post_type" class="select-button" required>
								<option disabled selected value="">게시판 선택</option>
								<option value="tip">팁</option>
								<option value="talk">잡담</option>
								<option value="coments">건의사항</option>
						</select></td>
					</tr>

					<tr class="name-box">
						<th class="thl">작성자</th>
						<td><input id="id" name="id" type="text" value="<%=id%>" placeholder="<%=id%>" readonly></td>
					</tr>
					<tr class="title-box">
						<th class="thl">제목</th>
						<td><input type="text" maxlength="30" required="required"
							id="post_title" name="post_title" placeholder="제목을 입력하세요"></td>
					</tr>
					<tr class="image-box">
						<th class="thl">파일첨부</th>
						<td><input id="post_file" type="file" name="post_file"
							accept="image/*"></td>
					</tr>
					<tr class="body-box">
						<th class="thl">내용</th>
						<td><textarea type="text" required="required"
								id="post_content" name="post_content" placeholder="내용을 입력하세요"></textarea></td>
					</tr>
					<tr>
						<th></th>
						<td class="buttons">
							<button class="button-1" type=button onclick="history.back();">뒤로가기</button>
							<button class="button-2" type=submit name="writeFrom">작성하기</button>

						</td>
					</tr>

				</thead>
			</table>

		</form>
	</div>


		<div class="team">
			<a href="https://namu.wiki/w/%ED%95%B4%EC%9B%90">Team: 4men</a>
		</div>

</body>
</html>