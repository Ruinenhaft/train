<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("euc-kr");
String id = request.getParameter("id");//PersonalInfo에서 던진 파라미터를 받음
String password = request.getParameter("password");
String name = request.getParameter("name");
session.setAttribute("id", id);//session을 이용해서 전체 세션에 해당 파라미터를 공유
session.setAttribute("password", password);
session.setAttribute("name", name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>약관</h3>
	------------------------------------------------<br>
	1. 회원 정보는 웹 사이트의 운영을 위해서만 사용됩니다.<br>
	2. 웹 사이트의 정상 운영을 방해하는 회원은 탈퇴 처리합니다.<br>
	------------------------------------------------<br>
	<form action=Subscribe.jsp method=post><!-- Subscribe.jsp 에 post형식으로 값을 던짐. -->
	위의 약관에 동의하십니까?
	<input type=radio name=agree value=yes>동의함
	<input type=radio name=agree value=no>동의하지 않음 <br><br>
	<input type=submit value='확인'>
	</form>
	
</body>
</html>