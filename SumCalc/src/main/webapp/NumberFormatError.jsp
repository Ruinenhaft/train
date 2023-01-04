<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" pageEncoding="UTF-8"%>
<% response.setStatus(200); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	숫자 포맷이 잘못되었습니다..<br><br>
	상세 에러 메세지:<%=exception.getMessage() %>
</body>
</html>