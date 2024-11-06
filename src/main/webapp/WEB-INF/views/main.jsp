<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PICTOGRAM</title>
<link rel="stylesheet" href="assets/css/main.css"/>
</head>
<body>
      <div class="hero">
         <div class="overlay">
            <h1>어디서 찍어도 인생샷!<br>추천 사진 명소로 떠나보세요</h1>
            <br>
            <button>맞춤 추천</button>
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
            <a href="#">마이페이지</a>
            <a href="#">로그아웃</a>
         </div>
      </div>
     
      
         <div class="footer-bar">
            <!-- 팀 정보 -->
            <div class="team">
               <a href="https://namu.wiki/w/%ED%95%B4%EC%9B%90">Team: 4men</a>
            </div>
         </div>

<script
		src="${pageContext.request.contextPath}/assets/js/post-function.js"></script>
</body>
</html>