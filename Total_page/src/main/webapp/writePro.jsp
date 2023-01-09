<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.boardDAO" %>
<%@ page import="board.boardDTO" %>

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
		
		boardDTO bb = new boardDTO();
		bb.setTitle(title);
		bb.setName(name);
		bb.setContent(content);
		bb.setPass(pass);
		
		boardDAO bd = new boardDAO();
		bd.insertBoard(bb);
%>

	<script>
	alert("작성 완료!");
	location.href="Main.jsp";
	</script>
	

</body>
</html>