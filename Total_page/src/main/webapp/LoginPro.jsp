<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.*" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	session.setAttribute("id", id);//session을 이용해서 전체 세션에 해당 파라미터를 공유
	session.setAttribute("pw", pw);
	int result = 0;
	
	UserDAO uda = new UserDAO();
	result = uda.UserJoin(id, pw);
	
	if(result == 2){
		response.sendRedirect("Main.jsp");
	}else{
		response.sendRedirect("Login.html");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>