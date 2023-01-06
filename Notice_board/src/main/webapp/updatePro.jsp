<%@page import="com.boardDAO"%>
<%@page import="com.boardBeans"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int num= Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String pass = request.getParameter("pass");
	String passck = request.getParameter("passck");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	boardBeans bb = new boardBeans();
	bb.setNum(num);
	bb.setTitle(title);
	bb.setName(name);
	bb.setContent(content);
	
	boardDAO bd = new boardDAO();
	bd.updateContent(bb);
	if(passck.equals(pass)){
%>
<script>
alert("수정 완료!");location.href = "main.jsp";
</script>
<%
	}else{
%>
<script>
alert("비밀번호가 올바르지 않습니다."); history.back();
</script>
<%} %>
</body>
</html>