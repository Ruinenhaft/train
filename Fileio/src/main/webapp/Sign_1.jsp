<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입정보</title>
</head>
<body>
	<h2>가입정보</h2>
	<%
	request.setCharacterEncoding("euc-kr");//한글 안깨지게 인코딩
	String id = request.getParameter("id");//html name=id의 값을 받아온다.
	String password = request.getParameter("password");
	String address = request.getParameter("addr");
	Date date = new Date();//현재시간
	String signTime = "Sign in :" + date;
	
	out.println("ID:" + id + "\n");
	out.println("PW:" + password + "\n");
	out.println("Addr:" + address + "\n");
	out.println("SignTime:" + signTime + "\n");
	
	
	//등록정보를 RequestDispatcher 함수를 통해 Sign_2.jsp 파일로 전송
	request.setAttribute("id", id);
	request.setAttribute("password", password);
	request.setAttribute("address", address);
	request.setAttribute("signTime", signTime);
	RequestDispatcher dispatcher = request.getRequestDispatcher("Sign_2.jsp");
	dispatcher.forward(request, response);
	
	%>
</body>
</html>