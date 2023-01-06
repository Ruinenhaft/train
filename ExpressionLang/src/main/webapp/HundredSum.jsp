<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int sum =0;
	for(int i = 0 ; i < 101 ; i ++){
		sum += i;
	}
	request.setAttribute("result", new Integer(sum));
	RequestDispatcher dispatcher = request.getRequestDispatcher("HundredResult.jsp");
	dispatcher.forward(request, response);
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>