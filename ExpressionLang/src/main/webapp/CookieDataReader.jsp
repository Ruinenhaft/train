<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	name 쿠키 데이터의 값은? ${cookie.name.value}
	요청url:${pageContext.request.requestURI}
	요청url:${pageContext.request.serverName}
	요청url:${pageContext.request.serverPort}
	요청url:${pageContext.request.contextPath}
</body>
</html>