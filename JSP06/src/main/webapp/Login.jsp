<%@page import="dao.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center; 
            align-items: center; 
            height: 100vh;
        }
        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            width: 300px;
            text-align: center;
        }
        .login-container h1 {
            margin-bottom: 20px;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 75%;
            padding: 10px;
            margin-bottom: 5px;
            border: 1px solid #ccc;
        }
        .login-container button {
            width: 100%;
            padding: 10px;
            cursor: pointer;
            margin-bottom: 5px;
        }
    </style>
    
</head>
<body>
	 <div class="login-container">
        <h1>로그인</h1>
        <form action="LoginResult.jsp">
           ID  :  <input type="text" name="id"><br>
           PW  :  <input type="password" name="pw">
            <button type="submit" class="loginBtn">로그인</button>
            <button type="button" id="joinBtn">회원가입</button>
        </form>
    </div>
    
    <script>
    	$(function() {
    		$("#joinBtn").click(function(){
    			location.href="Join.jsp"
    		})
    	})
    </script>
</body>
</html>