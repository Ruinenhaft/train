<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>

<%
	int work_time = Integer.parseInt(request.getParameter("work_time"));
	int commute_time = Integer.parseInt(request.getParameter("commute_time"));
	String hobby = (String)request.getParameter("hobby");
	int hobby_time = Integer.parseInt(request.getParameter("hobby_time"));
	int sleep_time = Integer.parseInt(request.getParameter("sleep_time"));
	
	String name = (String)session.getAttribute("name");
	String age = (String)session.getAttribute("age");
	String gender = (String)session.getAttribute("gender");
	
	session.setAttribute("work_time", work_time);
	session.setAttribute("commute_time", commute_time);
	session.setAttribute("hobby", hobby);
	session.setAttribute("hobby_time", hobby_time);
	session.setAttribute("sleep_time", sleep_time);
	
	String result = null;
	int sum_time = (work_time+commute_time) - (hobby_time+sleep_time);
	if(sum_time <= 0)
		result = "여유있게 살고 계시는군요";
	else
		result = "힘내세요";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
</head>
<body>
	<%out.print(name);%>님의 설문결과입니다.<br>
	대한민국 평균은<br>
	업무시간 : 8시간<br>
	출퇴근시간 : 2시간<br>
	여가시간 : 3시간<br>
	수면시간 : 7시간 입니다.<br><br>
	
	평균보다<br>
	업무시간 : <%out.print((int)work_time-8); %><br>
	출퇴근시간 : <%out.print((int)commute_time-2); %><br>
	여가시간 : <%out.print((int)hobby_time-3); %><br>
	수면시간 : <%out.print((int)sleep_time-7); %><br>
	<%out.print(result); %>
	
	<br>
	<br>
	정보 기록에 동의하십니까
	<form action=Survey_Process.jsp method=post>
	<input type=radio name=agree value=yes>네
	<input type=radio name=agree value=no>아니오<br>
	<input type=submit value='전송'>
	</form>
	
</body>
</html>