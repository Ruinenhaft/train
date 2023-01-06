<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.boardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>main</h1>
<%
	boardDAO bd = new boardDAO();
%>
<table border="1">
<tr><th>글번호</th><th>글제목</th><th>작성자</th></tr>
<%out.print(bd.makeList()); %>
</table>
<button onclick="location.href='writeForm.jsp'">글쓰기</button>

</body>
</html>
</body>
</html>