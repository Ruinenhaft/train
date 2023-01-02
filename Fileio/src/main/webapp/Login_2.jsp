<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		BufferedReader br = null;
		String id = (String)request.getAttribute("id");
		String pw = (String)request.getAttribute("password");
		int flag = 0;
		try{
			br = new BufferedReader(new FileReader("C://Users//admin//workspace//java//Fileio//src//main//webapp//bbs//Sign.txt"));
			String line = "";
			
			while((line = br.readLine()) != null){//각 라인을 읽으며 null을 발견할때까지 반복
				String[] comp = line.split(",");//읽은 라인을 ","을 기준으로 배열로 저장
				if(comp[0].equals(id) && comp[1].equals(pw)){//0번 1번에 아이디 비밀번호 순으로 저장되어있으므로 비교하여 확인
					flag = 1;//아이디와 비밀번호가 일치하다면 출력문을 위해 flag 남기고
					break;//탐색 종료
				}
			}
			if(flag == 0)
				out.println("아이디와 비밀번호를 확인해주세요");
			else
				out.println("로그인 성공");
		}catch(Exception e){
			
		}
	%>
</body>
</html>