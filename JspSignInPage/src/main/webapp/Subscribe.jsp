<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%
	request.setCharacterEncoding("UTF-8");
	String agree= request.getParameter("agree");//Agreement에서 던진 agree파라미터를 받음.
	String id = null;
	String password = null;
	String name = null;
	String result = null;
	
	if (agree.equals("yes")) {
		if((String) session.getAttribute("id") != null){
			id = (String) session.getAttribute("id");//Agreement.jsp에서 공유한 세션 파라미터를 받음	
		}
		if((String) session.getAttribute("password") != null){
			password = (String) session.getAttribute("password");	
		}
		if((String) session.getAttribute("name") != null){
			name = (String) session.getAttribute("name");	
		}
		
		if(id == null || password == null || name == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("</script>");
			script.close();
			return;
		}
		
		PrintWriter writer = null;
		UserDAO userDAO = new UserDAO();
		int join = userDAO.join(id, password, name);
		if(join == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입에 성공했습니다.')");
			script.println("location.href='Login.html';");
			script.println("</script>");
			script.close();
			return;
		}
		}else{
			result = "fail";
		}
	session.invalidate();//세션은 기본적으로 30초로 잡혀있고 세션이 더이상 사용되지 않는다면 세션정보도 필요 없기때문에 세션객체의 invalidate함수를 사용해서 세션제거
	//response.sendRedirect("Result.jsp?result="+result);//모든 작업이 끝나면 Result.jsp에 result값을 전달하면서 페이지 생성
	//sendRedirect() 사용시 주의할점
	//sendRedirect("/"); 사용시 즉각적으로 해당 root 페이지로 이동하는것이 아닌 하단의 html 코드를 수행하기 때문.
	//해당 방식을 막기위해서는 if else코드를 사용하여 if(code == null) response.sendRedirect("Result.jsp?result="+result);
	//else html코드 수행 형식으로 변환해야 한다.
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