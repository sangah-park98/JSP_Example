<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//	컨트롤러에서 넘어오는 수정 후 돌아갈 페이지 번호를 받는다.
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));

//	글 1건을 수정했으므로 컨트롤러에게 수정한 글이 있던 1페이지 분량의 글을 얻어오는 요청을 한다.
	response.sendRedirect("list.nhn?currentPage=" + currentPage);

%>
</body>
</html>