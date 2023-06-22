<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 다운로드 페이지</title>
</head>
<body>

<h1>업로드 된 파일 목록</h1>
<%
//	파일이 업로드되는 폴더에 저장된 파일 목록을 얻어온다.
//	실제로 파일이 업로드된 경로를 얻어온다. => realPath
	String uploadDirectory = application.getRealPath("./upload/");
//	out.println(uploadDirectory + "<br/>");
//  list(): 지정된 디렉토리(폴더)에 저장된 파일 목록을 배열로 얻어온다.
	String[] files = new File(uploadDirectory).list();
//	out.println(Arrays.toString(files));
	
	int i = 0;
	out.println(request.getContextPath() + "<br/>");
	for(String file : files) {
		// out.println(++i + ". " + file + "<br/>");
%>

<%=++i%>.
<a href="<%=request.getContextPath()%>//DownloadAction?file=<%=URLEncoder.encode(file, "UTF-8")%>"><%=file%></a><br/>

<%		
	}
%>
<br/>
<a href="index.jsp">돌아가기</a>
<form action="<%=request.getContextPath()%>/DownloadAction" method="post">
	<input type="text" name="name" value="박상아"/>
	<input type="submit" value="눌러봥"/>
</form>


</body>
</html>













