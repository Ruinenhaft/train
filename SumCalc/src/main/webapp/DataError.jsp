<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	잘못된 데이터가 입력되었습니다.<br>
	상세 에러 메세지:<%=exception.getMessage() %>
</body>
</html>