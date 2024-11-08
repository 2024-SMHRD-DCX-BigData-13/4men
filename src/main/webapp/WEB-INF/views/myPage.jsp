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
    <img src="./images/main2.jpg"
        alt="myPage" class="background-image">
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

    <table class="signup-table">
        <tr class="signup-title">
            <th colspan="2" id="tltle">
                <p>MEMBER INFO</p>
            </th>
        </tr>
        <tr>
            <th class=thc>ID</th>
            <td>불러올 데이터</td>
        </tr>
        <tr>
            <th class=thc>PW</th>
            <td>
                <input type="password" id="pw">
            </td>
        </tr>


        <tr>
            <th class=thc>NAME</th>
            <td>불러올 데이터</td>
        </tr>
        <tr>
            <th class=thc>BIRTHDAY</th>
            <td>불러올 데이터</td>
        </tr>
        <tr>
            <th class=thc>GENDER</th>
            <td>불러올 데이터</td>
        </tr>
        <tr>
            <th class=thc>PHONE</th>
            <td>
                <input type="text" id="phone">
            </td>
        </tr>
        <tr>
            <th class=thc>생성날짜</th>
            <td>불러올 데이터</td>
        </tr>

        <tr>
            <td colspan="2">
                <button class="update-button">회원정보 수정</button>
            </td>
        </tr>
        
    </table>

    
    <div class="footer-bar">
        <!-- 팀 정보 -->
        <div class="team">
            <a href="https://namu.wiki/w/%ED%95%B4%EC%9B%90">Team: 4men</a>
        </div>
    </div>
</body>

</html>