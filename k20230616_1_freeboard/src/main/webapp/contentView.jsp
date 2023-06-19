<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>게시글 보기</title>
<style type="text/css">
	* {
		font-family: 강원교육모두;
	}

	#th {
		text-align: center; 
		background-color: mistyRose;"
	}

</style>
<!-- bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- bootstrap icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<head>
<meta charset="UTF-8">
</head>
<body>
<div>
	<table class="table" style="width: 700px; margin-left: auto; margin-right: auto;">
		<tr class="table-info">
			<th colspan="4" style="font-size: 30px; text-align: center; background-color: lavender">
				<i class="bi bi-card-list"></i>
					게시글 보기
				<i class="bi bi-card-list"></i>
			</th>
		</tr>
		<tr>
			<td id="th" style="width: 100px; text-align: center;"><b>글번호</b></td>
			<td id="th" style="width: 350px; text-align: center;"><b>이름</b></td>
			<td id="th" style="width: 150px; text-align: center;"><b>작성일</b></td>
			<td id="th" style="width: 100px; text-align: center;"><b>조회수</b></td>
		</tr>
		
		<tr>
			<td align="center">${vo.idx}</td>
			<td align="center">
					<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')}"></c:set>
					<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"></c:set>
					${name}
			</td>
			<td align="center">
				<jsp:useBean id="date" class="java.util.Date"/>
				<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month && date.date == vo.writeDate.date}">
					<fmt:formatDate value="${vo.writeDate}" pattern="a h:mm:ss"/>
				</c:if>
				<c:if test="${date.year != vo.writeDate.year || date.month != vo.writeDate.month || date.date != vo.writeDate.date}">
					<fmt:formatDate value="${writeDate}" pattern="yyyy.MM.dd(E)"/>
				</c:if>
			</td>	
			<td align="center">${vo.hit}</td>
		</tr>
		<tr>
			<th align="center" style="text-align: center;">제목</th>
			<td colspan="3">
				<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"></c:set>
				<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"></c:set>
				${subject}
			</td>
		</tr>
		<tr>	
			<th align="center" style="text-align: center;">내용</th>
			<td colspan="3">
				<c:set var="content" value="${fn:replace(vo.content, '<', '&lt;')}"></c:set>
				<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"></c:set>
				<c:set var="content" value="${fn:replace(content, enter, '<br/>')}"></c:set>
				${content}
			</td>
		</tr>	
		<tr class="table-secondary">
			<td colspan="4" align="center">
				<input 
					type="button" 
					value="수정하기"
					class="btn btn-outline-primary btn-sm"
					style="font-size: 13px;"
					onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=update'"
					/>
				<input
					type="reset" 
					value="삭제하기" 
					class="btn btn-outline-danger btn-sm"
					style="font-size: 13px;"
					onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=delete'"
					/>
				<!--  
					history.back(), history.go(-1)를 사용하면 단순히 전 화면으로 돌아가기 때문에 증가된 조회수가 반영X
					조회수 반영을 위해서는 location.href를 사용해야 한다.
				-->
				<input 
					class="btn btn-outline-warning btn-sm"
					style="font-size: 13px;"
					type="button" 
					value="돌아가기" 
					onclick="location.href='list.jsp?currentPage=${currentPage}'"/>
			</td>
		</tr>
	</table>
</div>

<hr style="color: black; width: 700px; margin-left: auto; margin-right: auto;">


<!-- 댓글폼 -->


</body>
</html>











