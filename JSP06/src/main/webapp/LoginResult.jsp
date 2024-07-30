<%@page import="dao.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    request.setCharacterEncoding("UTF-8");

	
    
	LoginDAO lDao = new LoginDAO();
    boolean result = lDao.noExist(id, pw);
    
    if(result) {
%>
    	<script> alert("로그인 성공");location.href="Main.jsp"</script>
<%
		
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		response.sendRedirect("Main.jsp");
    } else {
%>
	<script> alert("아이디/비밀번호를 다시 확인하세요"); location.href="Login.jsp";</script>
<%
	}
%>