<%@page import="java.util.ArrayList"%>
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
	
	ArrayList<SelectIdDTO> sDao = new ArrayList<>();
	sDao = lDao.memberListDTO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
   <script>
   	$(function() {
   		$(".deleteBtn").click(function() {
   			let id = $(this).attr("id");
   			
   			$.ajax({
				url: '${pageContext.request.contextPath}/UpdateServlet',
				data: {id : id},
				type: 'get',
				success: function(response){
					alert("회원이 삭제되었습니다.");
					location.reload();
				},
				error: function(){
					console.log('ajax 통신 실패');	
				}
			});
   		})
   	});
   </script>
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            text-align: left;
        }
        .login-button {
            float: right;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        .action-buttons button {
            padding: 5px 10px;
            margin: 2px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>회원관리</h1>
    <button class="login-button">로그인</button>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>PW</th>
                <th>Name</th>
                <th>Point</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <%
        for(SelectIdDTO dto : sDao) {
        %>
        <tbody>
            <tr>
                <td><%=dto.getId() %></td>
                <td><%=dto.getPw() %></td>
                <td><%=dto.getName() %></td>
                <td><%=dto.getPoint() %></td>
                <td class="action-buttons"><button>수정</button></td>
                <td class="action-buttons deleteBtn" id="<%=dto.getId()%>"><button>삭제</button></td>
            </tr>
        </tbody>
            <% } %>
    </table>
    
</body>
</html>