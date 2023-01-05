<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head><title>성공</title></head>
<body>
	<h3>로그인에 성공하셨습니다.</h3>
	
	<%=session.getAttribute("id") %>님의 방문을 환영합니다.
	
	<h2>파일 업로드 및 다운로드를 시작합니다.</h2>
	<form action=file_upload.jsp method=post enctype=multipart/form-data>
		<fieldset>
		<legend>파일 업로드</legend>
		<p>작성자 : <input type=text name=userName></p>
		<p>파일명 : <input type=file name=file></p>
		<p><input type=submit value=upload></p>
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
				<td><img src="../img/404.PNG" alt="404이미지" width="140px" height="100px"></td>
				<td align="center" width="200">404에러 이미지</td>
				<td align="center" width="200"><a href="fileEx01_download.jsp?fileName=404.PNG">다운로드</a></td>
			</tr>	
			<tr>
				<td><img src="../img/500.PNG" alt="500이미지" width="140px" height="100px"></td>
				<td align="center" width="200">500에러 이미지</td>
				<td align="center" width="200"><a href="fileEx01_download.jsp?fileName=500.PNG">다운로드</a></td>
			</tr>	
		</table>
	</fieldset>
	
	
</body>
</html>