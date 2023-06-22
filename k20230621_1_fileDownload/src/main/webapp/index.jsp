<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
<style type="text/css">
	a {
		text-decoration: none;
	}
</style>
</head>
<body>

<!-- 단일 파일 업로드 -->
<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
	<input type="file" name="file"><br/>
	<input type="submit" value="upload"><br/>
</form>
<br/>
<a href="fileDownload.jsp">파일 다운로드 페이지</a>

</body>
</html>