<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
	String agree= request.getParameter("agree");//Agreement에서 던진 agree파라미터를 받음.
	String result = null;
	
	if (agree.equals("yes")) {
		String id = (String) session.getAttribute("id");//Agreement.jsp에서 공유한 세션 파라미터를 받음
		String password = (String) session.getAttribute("password");
		String name = (String) session.getAttribute("name");
		PrintWriter writer = null;

		try {
			String filePath = application.getRealPath("/WEB-INF/" + id + ".txt");//파일 패스 만들어서
			out.print(filePath);
			writer = new PrintWriter(filePath);//해당 파일패스에 새로운 파일을 생성
			writer.println("아이디:" + id);//줄바꿈을 활용한 id, pw, name을 쓰고
			writer.println("패스워드:" + password);
			writer.println("이름:" + name);
			result = "success";//쓰기 완료시 result 변수에 success를 저장
		} catch (IOException ioe) {
			result = "fail";
		} finally {
			try {
				writer.close();
			} catch (Exception e) {

				}
			}
		}else{
			result = "fail";
		}
	session.invalidate();//세션은 기본적으로 30초로 잡혀있고 세션이 더이상 사용되지 않는다면 세션정보도 필요 없기때문에 세션객체의 invalidate함수를 사용해서 세션제거
	response.sendRedirect("Result.jsp?result="+result);//모든 작업이 끝나면 Result.jsp에 result값을 전달하면서 페이지 생성
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