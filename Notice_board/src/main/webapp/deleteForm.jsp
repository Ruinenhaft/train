<%@page import="com.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteForm</title>
</head>
<body>
<h1>deleteForm</h1>
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	boardDAO bd = new boardDAO();
	
%>
<script>
String delete_pass = prompt("정말 삭제 하시겠습니까?", "password");
if(delete_pass == ){
	
<%
	bd.deleteContent(num);
%>
alert("삭제 완료!"); location.href="main.jsp";
}else{history.back();}</script>

</body>
</html>