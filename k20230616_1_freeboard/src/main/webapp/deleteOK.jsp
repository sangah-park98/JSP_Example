<%@page import="com.tjoeun.service.FreeboardService"%>
<%@page import="com.tjoeun.dao.FreeboardDAO"%>
<%@page import="com.tjoeun.vo.FreeboardVO"%>
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
	
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
%>

<jsp:useBean id="vo" class="com.tjoeun.vo.FreeboardVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
//	삭제할 글의 비밀번호와 삭제하기 위해 입력한 비밀번호를 비교하기 위해 삭제할 글을 얻어온다.
	FreeboardService service = FreeboardService.getInstance();
	FreeboardVO original = service.selectByIdx(vo.getIdx());
	
	out.println("<script>");
	if(original.getPassword().trim().equals(vo.getPassword().trim())) {
		service.delete(vo.getIdx());	
		out.println("alert('" + vo.getIdx() + "번 글 삭제 완료!')");
		
	} else {
		out.println("alert('비밀번호가 올바르지 않습니다.')");
	}
	out.println("location.href='list.jsp?currentPage=" + currentPage + "'");
	out.println("</script>");
%>
	
	
</body>
</html>