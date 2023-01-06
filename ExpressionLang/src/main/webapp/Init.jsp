<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String filename = getInitParameter("db_name");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	DB_NAME 초기화 파라미터의 값은? 
	${initParam.db_name}
	<%=filename %>
</body>
</html>