<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="com.smhrd.model.Post"%>

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
	<c:if test="${param.message == 'success'}">
		<script>
			alert("게시물 작성 성공!");
		</script>
	</c:if>

	<c:if test="${not empty showFreeBoard}">
		<script>
			document.addEventListener('DOMContentLoaded', function() {
				document.getElementById('free-board').click();
			});
		</script>
	</c:if>

	<c:if test="${not empty successMsg}">
		<script>
			alert("${successMsg}");
		</script>
	</c:if>

	<%
	List<Post> posts = (List<Post>) request.getAttribute("posts");
	Integer currentPage = (Integer) request.getAttribute("currentPage");
	Integer totalPages = (Integer) request.getAttribute("totalPages");
	%>
	<div class="hero">
		<div class="overlay">
			<h1>
				사진 찍기 좋은 명소 추천 서비스<br>PICTOGRAM
			</h1>
		</div>
	</div>
	<div class="header-bar">
		<a href="goMain.do" id="logo">PICTOGRAM</a>
		<nav class="nav-menu">
			<button class="menu-item" id="spot-recommend">명소 추천</button>
			<button class="menu-item" id="free-board">자유 게시판</button>
		</nav>
		<div>
			<a href="goMyPage.do">마이페이지</a> <a href="logout.do">로그아웃</a>
		</div>
	</div>
	<div class="content-container">
		<div id="rec-container">
			<form id="selectionForm">
				<label><input type="checkbox" name="options" value="야경">
					야경</label><br> <label><input type="checkbox" name="options"
					value="시장"> 시장</label><br> <label><input
					type="checkbox" name="options" value="건축물"> 건축물</label><br> <label><input
					type="checkbox" name="options" value="감성적인카페"> 감성적인 카페</label><br>
				<label><input type="checkbox" name="options" value="골목길">
					골목길</label><br> <label><input type="checkbox" name="options"
					value="전망"> 전망</label><br> <label><input
					type="checkbox" name="options" value="숲"> 숲</label><br> <label><input
					type="checkbox" name="options" value="계곡"> 계곡</label><br> <label><input
					type="checkbox" name="options" value="야생화"> 야생화</label><br> <label><input
					type="checkbox" name="options" value="자연 풍경"> 자연 풍경</label><br>
				<label><input type="checkbox" name="options" value="일출일몰">
					일출/일몰</label><br> <label><input type="checkbox" name="options"
					value="해변"> 해변</label><br> <label><input
					type="checkbox" name="options" value="파도"> 파도</label><br> <label><input
					type="checkbox" name="options" value="선박"> 선박</label><br> <label><input
					type="checkbox" name="options" value="항구"> 항구</label><br> <label><input
					type="checkbox" name="options" value="유적지"> 유적지</label><br> <label><input
					type="checkbox" name="options" value="역사적인건물"> 역사적인 건물</label><br>
				<label><input type="checkbox" name="options" value="전통의상">
					전통 의상</label><br> <label><input type="checkbox" name="options"
					value="문화"> 문화</label><br> <label><input
					type="checkbox" name="options" value="박물관"> 박물관</label><br>
				<button type="button" onclick="submitSelection()">추천받기</button>
			</form>
			<div id="map"
				style="width: 100%; height: 500px; margin-top: 20px; display: none;"></div>
		</div>



		<div id="Cpost-container">
			<!-- 자유게시판 내용 -->
			<section class="notice">
				<div class="page-title">
					<div class="container">
						<h3>자유 게시판</h3>
					</div>
				</div>
				<div class="category-buttons">
					<button class="category-btn" data-value="tip">팁</button>
					<button class="category-btn" data-value="talk">잡담</button>
					<button class="category-btn" data-value="coments">건의사항</button>
					<form action="goWriter.do" method="post">
						<input type="hidden" name="userId" value="${userId}"> <input
							type="hidden" name="username" value="${username}">
						<button type="submit" class="write-btn">글쓰기</button>
					</form>
				</div>
				<input id="current-post-type" type="hidden" class="category"
					name="category" value="tip">
				<!-- board list area -->
				<div id="board-list">
					<div class="container">
						<table class="board-table">
							<thead>
								<tr>
									<th scope="col" class="th-num">순번</th>
									<th scope="col" class="th-title">제목</th>
									<th scope="col" class="th-name">등록자명</th>
									<th scope="col" class="th-date">등록일</th>
									<th scope="col" class="th-views">조회수</th>
								</tr>
							</thead>
							<tbody id="board-list-body">
								<!-- 게시글 -->
							</tbody>
						</table>
					</div>
				</div>
				<div class="search">
					<input type="text" id=searchInpit>
					<button id=searchButton onclick="">검색</button>
				</div>
				<!-- 페이지네이션 -->
				<div class="pagination">
					<c:forEach begin="1" end="${totalPages}" var="pageNum">
						<a href="#" class="page-button" data-page="${pageNum}">${pageNum}</a>
					</c:forEach>
				</div>

			</section>
		</div>
	</div>

	<div class="modal-overlay"></div>
	<div class="modal">
		<div class="modal_body">
			<h2 id=post_title></h2>
			<p id="post_author"></p>
			<p id="post_date"></p>
			<img id="post_image" src="" alt="게시글 이미지" class="modal-image" />
			<p id=post_content></p>
		</div>
	</div>


	<div class="footer-bar">
		<div class="team">
			<a href="https://namu.wiki/w/%ED%95%B4%EC%9B%90">Team: 4men</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/main-function.js"></script>
	<script
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=yk3nxm3upu"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main-ai.js"></script>


</body>
</html>
