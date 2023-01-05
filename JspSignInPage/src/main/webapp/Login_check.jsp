<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String name = null;
	
	session.setAttribute("id", id);//session을 이용해서 전체 세션에 해당 파라미터를 공유
	session.setAttribute("password", pw);
	//session.setAttribute("name", name);
	

	
	if(id == "" || pw == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("</script>");
		script.close();
		return;
	}
	
	PrintWriter writer = null;
	UserDAO userDAO = new UserDAO();
	int login = userDAO.Select(id, pw);
	if(login == 2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인에 성공했습니다.')");
		script.println("location.href='Result.jsp';");
		script.println("</script>");
		script.close();
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