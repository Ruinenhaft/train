<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	session.setAttribute("name", name);
	session.setAttribute("age", age);
	session.setAttribute("gender", gender);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문내역</title>
</head>
<body>
	<form action=Result.jsp method=post>
		업무시간          : <input type=text name=work_time><br>
		출퇴근 소요시간     : <input type=text name=commute_time><br>
		취미             : <input type=text name=hobby><br>
		취미에 소요하는 시간 : <input type=text name=hobby_time><br>
		수면시간          : <input type=text name=sleep_time><br>
		<input type=submit value='제출'>
	</form>

</body>
</html>