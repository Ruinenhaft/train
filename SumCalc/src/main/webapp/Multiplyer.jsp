<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num1 = 0, num2 = 0, result =0;
		String str1 = request.getParameter("num1");
		String str2 = request.getParameter("num2");
		num1 = Integer.parseInt(str1);
		num2 = Integer.parseInt(str2);
		result = num1 * num2;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=num1 %>*<%=num2 %> = <%=result %>
</body>
</html>