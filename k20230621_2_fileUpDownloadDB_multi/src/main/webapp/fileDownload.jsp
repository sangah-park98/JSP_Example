<%@page import="java.net.URLEncoder"%>
<%@page import="com.tjoeun.fileupload.FileDAO"%>
<%@page import="com.tjoeun.fileupload.FileVO"%>
<%@page import="java.util.ArrayList"%>
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
//	String[] files = new File("C:/upload").list();
//	for(int i=0; i<files.length; i++) {
//		out.println(i + 1 + ". " + files[i] + "<br/>");
//	}

//	테이블에 저장된 전체 업로드 파일 정보를 얻어온다.
	ArrayList<FileVO> files = new FileDAO().getUploadList();
//	업로드 된 파일 목록을 출력한다.	
	for(FileVO file : files) {
		// out.println(file + "<br/>");
%>

<a href="<%=request.getContextPath()%>//DownloadAction?file=<%=URLEncoder.encode(file.getFilename(), "UTF-8")%>&realfile=<%=URLEncoder.encode(file.getFileRealname(), "UTF-8")%>">
	<%=file.getFilename()%>
</a>
(다운로드 횟수: <%=file.getDownloadCount()%>번)
<br/>

		
<%		
	}
%>

<a href="index.jsp">돌아가기</a>

</body>
</html>