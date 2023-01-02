<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>저장페이지</title>
</head>
<body>
	<%
		//getAttribute가 object 타입으로 받기때문에 형변환
		String id = (String)request.getAttribute("id")+",";
		String pw = (String)request.getAttribute("password")+",";
		String address = (String)request.getAttribute("address")+",";
		String signTime = (String)request.getAttribute("signTime");
		
		out.println("ID:" + id + "\n");
		out.println("PW:" + pw + "\n");
		out.println("Addr:" + address + "\n");
		out.println(signTime + "\n");
		
		try{//인자값 2개 BufferedWriter (주소, overwrite여부)
			BufferedWriter bw = new BufferedWriter(new FileWriter("C://Users//admin//workspace//java//Fileio//src//main//webapp//bbs//Sign.txt", true));
			bw.write(id);
			bw.write(pw);
			bw.write(address);
			bw.write(signTime);
			bw.write("\n");//줄바꿈은 따로 해줘야한다.
			bw.close();
			out.println("\n");
			out.println("저장되었습니다.");
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>