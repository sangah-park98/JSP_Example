<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	MultipartRequest multipartRequest = new MultipartRequest(
		request, 
		application.getRealPath("./upload"),
		5 * 1024 * 1024 * 1024,
		"UTF-8", 
		new DefaultFileRenamePolicy()
	);
//	getOriginalFileName(): 사용자가 업로드 한 파일 이름을 얻어온다.	
	String filename = multipartRequest.getOriginalFileName("file");
//	getFilesystemName(): 업로드 돼서 실제 디스크에 저장된 파일 이름을 얻어온다.
	String fileRealname = multipartRequest.getFilesystemName("file");
//	getFile(): 업로드하는 파일을 얻어온다.
	File realFile = multipartRequest.getFile("file");
//	length(): 파일의 크기를 얻어온다.
	long fileLength = realFile.length();
//	out.println("원본 파일 이름: " + filename + "<br/>");
//	out.println("업로드된 파일 이름: " + fileRealname + "<br/>");
//	out.println("업로드한 파일 크기: " + fileLength + "<br/>");

//	업로드 제한
	if(fileLength > 5 * 1024 * 1024) { // 용량 제한
		out.println("<script>");
		out.println("alert('와우~~~~" + fileLength + " 바이트 업로드 하는구나~~\\n" + "5242880 바이트까지만 업로드 가능해!')");
		out.println("</script>");
		// 업로드 된 파일을 삭제하기 위해 실제 업로드 된 File 객체를 생성한다.
		File file = new File(application.getRealPath("./upload/") + fileRealname);
		// delete(): 파일을 삭제한다.
		file.delete();
	} else if(!fileRealname.endsWith(".zip") && !fileRealname.endsWith(".png")) { // 파일 종류 제한
		// startsWith(): 인수로 지정된 문자열로 파일 이름이 시작하면 true, 그렇지 않으면 false를 리턴한다.
		// endsWith(): 인수로 지정된 문자열로 파일 이름이 끝나면 true, 그렇지 않으면 false를 리턴한다.
		out.println("<script>");
		out.println("alert('업로드 할 수 있는 파일 형식이 아닙니다.\\n" + "zip 파일과 png만 업로드 가능해!')");
		out.println("</script>");
		File file = new File(application.getRealPath("./upload/") + fileRealname);
		file.delete();
	} else {
		out.println("<script>");
		out.println("alert('업로드 성공')");
		out.println("</script>");
		out.println("원본 파일 이름: " + filename + "<br/>");
		out.println("업로드된 파일 이름: " + fileRealname + "<br/>");
		out.println("업로드한 파일 크기: " + fileLength + "<br/>");
	}

	out.println("<script>");
	out.println("location.href='index.jsp'");
	out.println("</script>");
%>

</body>
</html>