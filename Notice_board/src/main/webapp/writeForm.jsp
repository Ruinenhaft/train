<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeForm</title>
</head>
<body>
	<h1>writeForm</h1>
	<form action="writePro.jsp" method="post">
		<table border="1">
			<tr><th>이름</th><td><input type="text" name="name"></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
			<tr><th>제목</th><td><input type="text" name="title"></td></tr>
			<tr><th>내용</th><td><textarea cols="20" rows="20" name="content"></textarea></td></tr>
		</table>
		<input type="submit" value="글 작성">
		<input type="button" value="글 목록" onclick="location.href='main.jsp'">
	</form>
</body>
</html>