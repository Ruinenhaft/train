<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.boardDAO" %>
<%@ page import="board.boardDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm</title>
</head>
<body>
	<h1>updateForm</h1>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		boardDAO bd = new boardDAO();
		boardDTO bb = bd.readContent(num);
		String passck = bb.getPass();
	%>
	<form action="updatePro.jsp" method="post">
<table border="1">
<tr><th>글제목</th><td><input type="text" name="title" value="<%=bb.getTitle()%>"></td></tr>
<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
<tr><th>작성자</th><td><input type="text" name="name" value="<%=bb.getName()%>"></td></tr>
<tr><th>글내용</th><td><textarea name="content" cols="20" rows="20"><%=bb.getContent()%></textarea></td></tr>
</table>
<input type="hidden" value="<%=num %>" name="num">
<input type="hidden" value="<%=passck%>" name="passck">
<input type="submit" value="수정하기">
</form>

<button onclick="location.href='deleteForm.jsp?num=<%=num%>'">삭제하기</button>
<button onclick="location.href='main.jsp'">글목록</button>
</body>
</html>