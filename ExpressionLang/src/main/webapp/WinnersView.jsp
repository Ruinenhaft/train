<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	1등. ${winners[0]}<br>
	2등. ${winners[1]}<br>
	3등. ${winners[2]}<br>
	
	${fruits[0]}<br>
	${fruits[1]}<br>
	${fruits[2]}<br>
	
	${homtown.Edgar}의 주소는? ${homtown[hometown.Edgar]}<br>
	${homtown["Edgar"]}<br>
	${homtown.Edgar}<br>
</body>
</html>