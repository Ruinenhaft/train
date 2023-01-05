<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%
	String location = "C:\\data\\";
	int maxSize = 1024 * 1024 * 5;
	MultipartRequest multi = new MultipartRequest(request, location, maxSize, "utf-8", new DefaultFileRenamePolicy());
	//1. 첫번째 인자는 폼에서 가져온 인자 값을 얻기 위해 request객체로 전달한다.
	//2. 두번째 인자는 업로드 될 파일의 위치를 입력한다.
	//3. 세번째 인자는 파일 업로드 최대 용량 크기를 의미하며 최대 크기를 넘는경우 Exception이 발생한다.
	//4. 네번째 인자는 한글 이름이 넘어올 경우를 생각해서 인코딩을 지정한다
	//5. 다섯번째 인자는 똑같은 파일을 업로드 할 경우 중복되지 않도록 파일이름을 변환 해주는 기능을 갖는다.
	String userName = multi.getParameter("userName");
	Enumeration<?> files = multi.getFileNames();
	//Enumeration
	//MultipartRequest.getFileNames()
	String element = "";
	String filesystemName = "";
	String originalFileName = "";
	String contentType = "";
	long length = 0;
	
	if(files.hasMoreElements()){//다음 정보가 있으면 Like rs.next()
		
		element = (String)files.nextElement();
	
		filesystemName 			= multi.getFilesystemName(element); // 서버에 업로드된 파일명을 반환
		originalFileName 		= multi.getOriginalFileName(element); // 사용자가 업로드한 파일명을 반환
		contentType 			= multi.getContentType(element);	// 업로드된 파일의 타입을 반환 
		length 					= multi.getFile(element).length(); // 파일의 크기를 반환 (long타입)
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>사용자 이름 : <%=userName%></p>
	<p>파라메타 이름 : <%=element%></p>
	<p>서버에 업로드된 파일 이름 : <%=filesystemName%></p>
	<p>유저가 업로드한 파일 이름 : <%=originalFileName%></p>
	<p>파일 타입 : <%=contentType%></p>
	<p>파일 크기 : <%=length%></p>
	
	
</body>
</html>