<%@page import="dto.SelectIdDTO"%>
<%@page import="dao.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession hs = request.getSession();
	
	String pw = (String)hs.getAttribute("pw");
	String id = (String)hs.getAttribute("pw");
	
	LoginDAO lDao = new LoginDAO();    
	SelectIdDTO lDto = lDao.selectIdDTO(id, pw);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }
        .header a {
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            padding-top: 35px;
        }
        .header .user-info {
            align-items: center;
        }
        .header .user-info p {
            margin: 0 10px;
            font-size: 16px;
        }
        .header .user-info button {
            padding: 5px 10px;
            cursor: pointer;
        }
        .header .user-info .points {
            font-size: 14px;
        }
        .points {
        	display: flex;
        	text-align:center;
        	padding-left: 98px;
        }
         body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }
        .header a {
            text-decoration: none;
            color: #333;
            font-size: 40px;
            font-weight: bold;
        }
        .header .user-info {
            text-align: right;
        }
        .header .user-info p {
            margin: 0;
            font-size: 16px;
            color: #333;
        }
        .content {
            text-align: center;
            padding: 20px;
        }
        .course-container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-top: 20px;
        }
        .course {
            border-radius: 10px;
            width: 300px;
            margin: 10px;
            padding: 20px;
            text-align: left;
        }
        .course img {
            width: 100%;
            border-radius: 10px;
        }
        .course h2 {
            font-size: 18px;
            margin: 10px 0;
        }
        .course .rating, .course .level, .course .time, .course .points {
            font-size: 14px;
            margin: 5px 0;
        }
        .ad {
            margin: 20px 0;
            text-align: right;
        }
        .ad img {
            width: 170px;
            height: auto;
        }
    </style>
</head>
<body>
   <header class="header">
        <a href="/">메인페이지</a>
        <div class="user-info">
            <div style="font-weight: bold;"><%=lDto.getName() %>(<%=lDto.getId() %>)님 안녕하세요.
             <button onclick="logout()">로그아웃</button>
             <button type="button" id="memberList">회원관리</button>
            </div>
            <div style="font-weight: bold; padding-right:120px;">포인트: <%=lDto.getPoint() %>점</div>
        </div>
    </header>
    <div class="content">
        <h1>구입할 컨텐츠를 선택하세요.</h1>
        <div class="course-container">
            <div class="course">
            	<button type="button" id="IntrotoProgramming" onclick="" style="background-color:#fff; border:none;">
                	<img src="2.png" alt="Intro to Programming" >
             	</button>
                <div class="points">100,000포인트</div>
            </div>
            <div class="course">
            	<button type="button" id="Java Programming" onclick="" style="background-color:#fff; border:none;">
	                <img src="3.png" alt="Java Programming">
                </button>
	            <div class="points">500,000포인트</div>
            </div>
            <div class="course">
            	<button type="button" id="C++" onclick="" style="background-color:#fff; border:none;">
                	<img src="4.png" alt="C++">
                </button>
                <div class="points">300,000포인트</div>
            </div>
        </div>
        <div class="ad">
            <p style:>&lt;광고&gt;</p>
            <img src="5.png" alt="광고 이미지">
        </div>
    </div>
    <script>
        function logout() {
            alert('로그아웃 되었습니다.');
            window.location.href="Login.jsp";
        }
        $(function() {
        	$("#memberList").click(function() {
        		window.location.href="MemberList.jsp";
        	})
        });
    </script>
</body>
</html>