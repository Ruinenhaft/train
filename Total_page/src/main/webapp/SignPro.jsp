<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	
	if(id != null && pw != null && name != null){
		UserDTO udt = new UserDTO();
		udt.setUserID(id);
		udt.setUserPassword(pw);
		udt.setUserName(name);
		
		UserDAO uda = new UserDAO();
		uda.UserInsert(id, pw, name);
		}else{
		response.sendRedirect("SignForm.html");
		return;
		}
		response.sendRedirect("Login.html");
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