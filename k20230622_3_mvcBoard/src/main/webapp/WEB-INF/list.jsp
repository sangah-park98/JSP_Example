<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 보기</title>
<style type="text/css">
	@font-face {
	    font-family: 'GangwonEdu_OTFBoldA';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	*{
		font-family: GangwonEdu_OTFBoldA;
	}
	
	#id {
		background-color: mistyRose;
	}
	a {
		text-decoration: none;
	}
</style>
</head>
<body>
	<table width="1000" align="center" border="1" cellpadding=5" cellspacing="0">
		<tr>
			<th colspan="5" style="font-size: 30px; text-align: center; background-color: lavender">
				게시판 보기
			</th>
		</tr>
		<tr>
			<td colspan="5" align="right">
				${boardList.totalCount}개(${boardList.currentPage}P / ${boardList.totalPage}P)
			</td>
		</tr>
			<tr>
			<th id="th" style="width: 70px;"><b>글번호</b></th>
			<th id="th" style="width: 610px;"><b>제목</b></th>
			<th id="th" style="width: 100px;"><b>이름</b></th>
			<th id="th" style="width: 150px;"><b>작성일</b></th>
			<th id="th" style="width: 70px;"><b>조회수</b></th>
		</tr>
		<c:set var="list" value="${boardList.list}"/>
		<c:if test="${list.size() == 0}">
			<tr>
				<td colspan="5">
			<marquee>테이블에 저장된 글이 없습니다.</marquee>
				</td>
			</tr>	
		</c:if>
		
		<c:if test="${list.size() != 0}">
		<c:forEach var="vo" items="${list}">
		<tr>
			<td align="center">${vo.idx}</td>
			<!-- 레벨에 따른 들여쓰기 -->
			<td align="center">
				<c:if test="${vo.lev > 0}">
					<c:forEach var="i" begin="1" end="${vo,lev}">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
					Re.
				</c:if>
				<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"></c:set>
				<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"></c:set>
				<a href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
					${subject}
				</a>
			</td>
				
			<td align="center">
				<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')}"></c:set>
				<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"></c:set>
				${name}
			</td>
			<td align="center">
				<fmt:formatDate value="${vo.writeDate}" pattern="yyyy.MM.dd(E)"/>
			</td>
			<td align="center">${vo.hit}</td>
		</tr>
		</c:forEach>	
		</c:if>
		
	</table>

</body>
</html>













