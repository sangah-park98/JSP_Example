<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다중 파일 업로드</title>
<style type="text/css">
	a {
		text-decoration: none;
	}
</style>
</head>
<body>

<!-- 다중 파일 업로드 -->
<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
	파일1: <input type="file" name="file1"><br/>
	파일2: <input type="file" name="file2"><br/>
	파일3: <input type="file" name="file3"><br/>
	<input type="submit" value="upload"><br/>
</form>
<br/>
<a href="fileDownload.jsp">파일 다운로드 페이지</a>

</body>
</html>