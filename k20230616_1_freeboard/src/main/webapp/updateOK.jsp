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
//	수정할 글의 비밀번호와 수정하기 위해 입력한 비밀번호, 수정할 글번호, 수정 후 돌아갈 페이지 번호,
//	수정할 내용(제목, 내용, 공지글)을 비교하기 위해 수정할 글을 받는다.
//	original은 수정 전!
	FreeboardService service = FreeboardService.getInstance();
	FreeboardVO original = service.selectByIdx(vo.getIdx());
	
	out.println("<script>");
	if(original.getPassword().trim().equals(vo.getPassword().trim())) {
		service.update(vo);	
		out.println("alert('" + vo.getIdx() + "번 글 수정 완료!')");
		
	} else {
		out.println("alert('비밀번호가 올바르지 않습니다.')");
	}
	out.println("location.href='list.jsp?currentPage=" + currentPage + "'");
	out.println("</script>");
%>
	
	
</body>
</html>