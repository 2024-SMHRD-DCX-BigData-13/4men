<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List"%>
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
		</div>
	</div>
	<div class="header-bar">
		<h1 class="logo">PICTOGRAM</h1>
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
			<p>명소 추천 콘텐츠</p>
		</div>

		<div id="Cpost-container">
			<!-- 자유게시판 내용 -->
			<%
			int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
			int pageSize = 10;
			int start = (currentPage - 1) * pageSize;
			int end = Math.min(start + pageSize, ((List) request.getAttribute("posts")).size());
			request.setAttribute("start", start);
			request.setAttribute("end", end);
			int totalPages = (int) Math.ceil(((List) request.getAttribute("posts")).size() / (double) pageSize);
			request.setAttribute("totalPages", totalPages);
			%>

			<section class="notice">
				<div class="page-title">
					<div class="container">
						<h3>자유 게시판</h3>
					</div>
				</div>
				<div class="category-buttons">
  <button class="category-btn" data-value="tip">팁</button>
  <button class="category-btn" data-value="free">잡담</button>
  <button class="category-btn" data-value="suggestion">건의사항</button>
</div>
<input type="hidden" class="category" name="category" value="tip">
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
							<tbody>
								<c:forEach var="i" begin="${start}" end="${end - 1}">
									<tr>
										<td>${posts[i].post_idx}</td>
										<th><a href="#!">${posts[i].post_title}</a></th>
										<td>${posts[i].id}</td>
										<!-- 등록자명 -->
										<td>${posts[i].create_dt}</td>
										<td>${posts[i].post_views}</td>
										<!-- 조회수 -->
									</tr>
								</c:forEach>
								<c:if test="${empty posts}">
									<tr>
										<td colspan="5">등록된 게시글이 없습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>

				<!-- pagination -->
				<div class="pagination">
					<c:if test="${currentPage > 1}">
						<a href="main?page=${currentPage - 1}">&lt;</a>
					</c:if>
					<c:forEach begin="1" end="${totalPages}" var="pageNum">
						<c:if test="${pageNum == currentPage}">
							<span>${pageNum}</span>
						</c:if>
						<c:if test="${pageNum != currentPage}">
							<a href="main?page=${pageNum}">${pageNum}</a>
						</c:if>
					</c:forEach>
					<c:if test="${currentPage < totalPages}">
						<a href="main?page=${currentPage + 1}">&gt;</a>
					</c:if>
				</div>
			</section>
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
</body>
</html>
