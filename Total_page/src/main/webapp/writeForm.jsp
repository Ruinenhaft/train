<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeForm</title>
</head>
<body>
	<h1>writeForm</h1>
	<form action="writePro.jsp" method="post">
		<table border="1">
			<tr><th>이름</th><td><input type="text" name="name"></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
			<tr><th>제목</th><td><input type="text" name="title"></td></tr>
			<tr><th>내용</th><td><textarea cols="20" rows="20" name="content"></textarea></td></tr>
		</table>
		<input type="submit" value="글 작성">
		<input type="button" value="글 목록" onclick="location.href='Main.jsp'">
	</form>
	<form action="FileUpLoad.jsp" method="post" enctype="multipart/form-data">
		 <fieldset>
		<legend>파일 업로드</legend>
		<p>작성자 : <input type="text" name="userName"></p>
		<p>파일명 : <input type="file" name="file"></p>
		<p><input type="submit" value="upload"></p>	 	
	 </fieldset>
	</form>
	<br><hr><br>
	<fieldset>
		<legend>파일 다운로드</legend>
		<table border="1">
			<tr >
				<th>이미지</th>
				<th>이미지 설명</th>
				<th>다운로드 링크</th>
			</tr>
			<tr>
				<td><img src="../img/404.PNG" alt="이미지1" width="140px" height="100px"></td>
				<td align="center" width="200">이미지1</td>
				<td align="center" width="200"><a href="FileDownLoad.jsp?fileName=세팅.PNG">다운로드</a></td>
			</tr>	
			<tr>
				<td><img src="../img/500.PNG" alt="이미지2" width="140px" height="100px"></td>
				<td align="center" width="200">이미지2</td>
				<td align="center" width="200"><a href="FileDownLoad.jsp?fileName=세팅.PNG">다운로드</a></td>
			</tr>	
		</table>
	</fieldset>
</body>
</html>