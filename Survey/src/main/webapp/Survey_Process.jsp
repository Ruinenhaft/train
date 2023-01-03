<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
	String agree= request.getParameter("agree");
	if(agree.equals("yes")){
		String name = (String)session.getAttribute("name");
		String age = (String)session.getAttribute("age");
		String gender = (String)session.getAttribute("gender");
		int work_time = (int)session.getAttribute("work_time");
		int commute_time = (int)session.getAttribute("commute_time");
		String hobby = (String)session.getAttribute("hobby");
		int hobby_time = (int)session.getAttribute("hobby_time");
		int sleep_time = (int)session.getAttribute("sleep_time");
		PrintWriter writer = null;
		
		try{
			String filePath = application.getRealPath("/WEB-INF/"+name+".txt");
			writer = new PrintWriter(filePath);
			writer.println("이름 :"+name);
			writer.println("나이 :"+age);
			writer.println("성별 :"+gender);
			writer.println("엄무시간 :"+work_time);
			writer.println("출퇴시간 :"+commute_time);
			writer.println("취미 :"+hobby);
			writer.println("여가시간 :"+hobby_time);
			writer.println("취침시간 :"+sleep_time);
		}catch(IOException ioe){
			
		}finally{
			try{
				writer.close();
			}catch(Exception e){
				
			}
		}
	}
	response.sendRedirect("Final.html");
	session.invalidate();
	%>
<%if(agree.equals("no")){ session.invalidate();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종료</title>
</head>
<body>
	정보를 저장하지 않았습니다.
</body>
</html>
<%} %>
