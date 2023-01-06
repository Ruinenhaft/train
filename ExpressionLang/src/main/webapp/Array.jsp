<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%
	String winner[] = new String[3];
	winner[0] = "김";
	winner[1] = "이";
	winner[2] = "박";
	
	ArrayList<String> items = new ArrayList<String>();
	items.add("딸기");
	items.add("오렌지");
	items.add("복숭아");
	
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("Edgar","보스턴");
	map.put("Tomas","오하이오");
	map.put("John","워싱턴");
	
	request.setAttribute("homtown", map);
	request.setAttribute("fruits", items);
	request.setAttribute("winners", winner);
	RequestDispatcher dispatcher = request.getRequestDispatcher("WinnersView.jsp");
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