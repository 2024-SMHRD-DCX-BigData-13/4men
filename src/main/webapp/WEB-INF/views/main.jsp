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
			<button class="menu-item" id="spot-recommend">명소 추천</button>
			<button class="menu-item" id="free-board">자유 게시판</button>
		</nav>
		<div>
			<a href="#">마이페이지</a> <a href="logout.do">로그아웃</a>
		</div>
	</div>
	<div class="content-container">
		<div id="rec-container">
			<!-- 명소 추천 내용 -->
			<p>명소 추천 콘텐츠</p>
		</div>

		<div id="Cpost-container">
			<!-- 자유게시판 내용 -->
			<section class="notice">
				<div class="page-title">
					<div class="container">
						<h3>자유 게시판</h3>
					</div>
				</div>
				<!-- board seach area -->
				<div id="board-search">
					<div class="container">
						<div class="search-window">
							<form action="">
								<div class="search-wrap">
									<div class="category-select">
										<label for="category">카테고리</label> <select id="category"
											name="category">
											<option value="tip">팁</option>
											<option value="free">잡담</option>
											<option value="suggestion.">건의사항</option>
											<!-- 추가 카테고리 옵션 -->
										</select>
									</div>
									<label for="search" class="blind">공지사항 내용 검색</label> <input
										id="search" type="search" name="" placeholder="검색어를 입력해주세요."
										value="">
									<button type="submit" class="btn btn-dark">검색</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="category-options">
					<button class="category-btn" data-category="tip">팁</button>
					<button class="category-btn" data-category="free">잡담</button>
					<button class="category-btn" data-category="suggestion">건의사항</button>
				</div>
				<!-- board list area -->
				<div id="board-list">
					<div class="container">
						<table class="board-table">
							<thead>
								<tr>
									<th scope="col" class="th-num">번호</th>
									<th scope="col" class="th-title">제목</th>
									<th scope="col" class="th-date">등록일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>3</td>
									<th><a href="#!">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
										<p>테스트</p></th>
									<td>2017.07.13</td>
								</tr>

								<tr>
									<td>2</td>
									<th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
									<td>2017.06.15</td>
								</tr>

								<tr>
									<td>1</td>
									<th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
									<td>2017.06.15</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</section>
		</div>
	</div>
	<div class="footer-bar">
		<!-- 팀 정보 -->
		<div class="team">
			<a href="https://namu.wiki/w/%ED%95%B4%EC%9B%90">Team: 4men</a>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/main-function.js"></script>
</body>
</html>