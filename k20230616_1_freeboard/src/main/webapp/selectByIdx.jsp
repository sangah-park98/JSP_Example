<%@page import="com.tjoeun.dao.FreeboardDAO"%>
<%@page import="com.tjoeun.vo.FreeboardVO"%>
<%@page import="com.tjoeun.service.FreeboardService"%>
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

//  increment.jsp 또는 contentView.jsp에서 넘어오는 글번호, 돌아갈 페이지 번호, 분기할 페이지 이름을 받는다.
	int idx = Integer.parseInt(request.getParameter("idx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	String job = request.getParameter("job"); 
	
//	메인글 1건을 얻어오는 메소드를 호출한다.
	FreeboardVO vo = FreeboardService.getInstance().selectByIdx(idx);
//	out.println(vo);

//	브라우저에 출력할 메인글이 저장된 객체, 작업 후 돌아갈 페이지 번호, 줄바꿈에 사용할 엔터키를 보내준다.
	request.setAttribute("vo", vo);
	request.setAttribute("currentPage", currentPage);
	request.setAttribute("enter", "\r\n");
	
//	increment.jsp에서 넘어온 경우 조회수를 증가시킨 메인글을 보여주는 페이지(contentView.jsp)로 넘겨주고
//	contentView.jsp에서 넘어온 경우 메인글을 수정(update.jsp), 삭제(delete.jsp)하는 페이지로 request 영역에
//	저장된 내용을 가지고 넘겨준다.
	pageContext.forward(job + ".jsp");
%>

	
</body>
</html>