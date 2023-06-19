<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정할 글 보기</title>
<style type="text/css">
	* {
		font-family: 강원교육모두;
	}

	#th {
		text-align: center; 
		background-color: mistyRose;"
	}

</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- bootstrap icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>

<form class="m-3" action="updateOK.jsp" method="post">
	<table class="table" style="width: 700px; margin-left: auto; margin-right: auto;">
	<tr class="table-info">
			<th colspan="4" style="font-size: 30px; text-align: center; background-color: lavender">
				<i class="bi bi-card-list"></i>
					수정할 글 보기
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
			<th id="th" align="center" style="text-align: center;">
				<label for="subject">제목</label>
			</th>
			<td colspan="2">
				<%-- 
				<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"></c:set>
				<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"></c:set>
				${subject} 
				--%>
				<input 
					id="subject"
					type="text" 
					name="subject"
					class="form-control form-control-sm"
					style="font-size: 13px;"
					value="${vo.subject}"
					/>
			</td>
			<th id="th" class="align-middle table-info" width="100">
				공지글 
				<c:if test="${fn:trim(vo.notice) == 'YES'}"> <!-- 공지글인가? -->
					<input class="form-check-input" type="checkbox" name="notice" value="YES" checked="checked"/>
				</c:if>
				<c:if test="${fn:trim(vo.notice) != 'YES'}"> <!-- 공지글이 아닌가? -->
					<input class="form-check-input" type="checkbox" name="notice" value="YES"/>
				</c:if>
			</th>
		</tr>
		<tr>	
			<th id="th" align="center" style="text-align: center;">
				<label for="content">내용</label>
			</th>
			<td colspan="3">
				<%--
				<c:set var="content" value="${fn:replace(vo.content, '<', '&lt;')}"></c:set>
				<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"></c:set>
				<c:set var="content" value="${fn:replace(content, enter, '<br/>')}"></c:set> 
				--%>
				<textarea 
					id="content"
					rows="10"
					style="resize: none;"
					class="form-control form-control-sm"
					name="content"
				>${vo.content}</textarea>
			</td>
		</tr>	
		<tr class="table-secondary">
			<td colspan="4" align="center">
				<div class="row g-3 align-items-center" 
					style="width: 90%; margin-left: auto; margin-right: auto;">
					<div class="col-auto">
						<label for="password">비밀번호</label>
					</div>
					<div class="col-auto">
						<input 
							id="password" 
							class="form-control form-control-sm" 
							type="password" 
							name="password"
							style="font-size: 13px;"/>
					</div>		
					<div class="col-auto">
						<input 
							class="btn btn-outline-primary btn-sm"
							type="submit"
							value="수정하기"
							style="font-size: 13px;"
							/>				
						<input 
							class="btn btn-outline-danger btn-sm"
							type="reset"
							value="다시쓰기"
							style="font-size: 13px;"
							/>				
						<input 
							class="btn btn-outline-warning btn-sm"
							type="button"
							value="돌아가기"
							style="font-size: 13px;"
							onclick="history.back()"
							/>				
						<input 
							class="btn btn-outline-success btn-sm"
							type="button"
							value="목록보기"
							style="font-size: 13px;"
							onclick="location.href='list.jsp?currentPage=${currentPage}'"
							/>
					</div>				
				</div>
			</td>
		</tr>
	</table>
	
	<input type="hidden" name="idx" value="${vo.idx}"/>
	<input type="hidden" name="currentPage" value="${currentPage}"/>
	
</form>

</body>
</html>








