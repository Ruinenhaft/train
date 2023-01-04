<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>
<%!
	private PrintWriter logFile;
	public void jspInit(){
		String filename = getInitParameter("file_name");
		try{
			logFile = new PrintWriter(new FileWriter(filename, true));
		}catch(IOException e){
			System.out.printf("%TT - %s 파일을 열 수 없습니다. %n", new GregorianCalendar(), filename);
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재의 날짜와 시각</title>
</head>
<body>
	<%
		GregorianCalendar now = new GregorianCalendar();
		String date = String.format("현재날짜:%TY년%Tm월%Te일", now, now, now);
		String time = String.format("현재시각:%TI시%Tm분%Ts초", now, now, now);
		out.println(date+"<br>");
		out.println(date+"<br>");
		if(logFile != null){
			logFile.printf("%TF %TT에 호출되었습니다.%n", now, now);
			logFile.flush();
		}
		
			
		
	%>
</body>
</html>
<%!
	public void jspDestroy(){
	if(logFile!=null)
		logFile.close();
}
%>