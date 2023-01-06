<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.boardDAO"%>
<%@page import="com.boardBeans"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		boardBeans bb = new boardBeans();
		bb.setTitle(title);
		bb.setName(name);
		bb.setContent(content);
		bb.setPass(pass);
		
		boardDAO bd = new boardDAO();
		bd.insertBoard(bb);
%>
	<script>
	alert("작성 완료!");
	location.href="main.jsp";
	</script>
	

</body>
</html>