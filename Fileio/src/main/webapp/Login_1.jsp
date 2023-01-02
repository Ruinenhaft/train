<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");//post 형식으로 파라미터를 받아서 변수에 저장
	String password = request.getParameter("password");
	
	out.println("ID:" + id + "\n");
	out.println("PW:" + password + "\n");
	
	//저장된 변수를 request.setAttribute를 통해 (파라미터 이름, 변수) 형식으로 송신
	request.setAttribute("id", id);
	request.setAttribute("password", password);	
	RequestDispatcher dispatcher = request.getRequestDispatcher("Login_2.jsp");
	dispatcher.forward(request, response);//파라미터와 송신지를 저장하여 날려줌
	%>
</body>
</html>