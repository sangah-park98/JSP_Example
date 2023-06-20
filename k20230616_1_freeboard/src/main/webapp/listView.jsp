<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 보기</title>
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
<!-- custom style -->
<link rel="stylesheet" href="./css/style.css">
</head>
<body>

<div class="m-3">
	<table class="table" style="width: 1000px; margin-left: auto; margin-right: auto;">
		<tr class="table-info">
			<th colspan="5" style="font-size: 30px; text-align: center; background-color: lavender">
				<i class="bi bi-card-list"></i>
				게시판 보기
				<i class="bi bi-card-list"></i>
			</th>
		</tr>
		<tr>
			<td colspan="5" align="right">
				${freeboardList.totalCount}개(${freeboardList.currentPage}P / ${freeboardList.totalPage}P)
			</td>
		</tr>
		<tr class="table-success">
			<td id="th" style="width: 70px; text-align: center;"><b>글번호</b></td>
			<td id="th" style="width: 610px; text-align: center;"><b>제목</b></td>
			<td id="th" style="width: 100px; text-align: center;"><b>이름</b></td>
			<td id="th" style="width: 150px; text-align: center;"><b>작성일</b></td>
			<td id="th" style="width: 70px; text-align: center;"><b>조회수</b></td>
		</tr>
	
		<!-- 오늘 날짜를 기억하는 Date 클래스 객체를 useBean으로 만든다. -->
		<jsp:useBean id="date" class="java.util.Date"/>
		<%-- ${date} --%>
		
		<!-- 공지글을 출력한다. -->
		<c:if test="${currentPage == 1}">
			<c:forEach var="vo" items="${notice}">
				<tr class="table-warning">
					<td align="center">
						<img alt="notice" src="./images/notice.png">
					</td>
					<td align="center">
						<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"></c:set>
						<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"></c:set>
						<a href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
							${subject}(${vo.commentCount})
						</a>
					</td>
					<td align="center">
						<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')}"></c:set>
						<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"></c:set>
						${name}
					</td>
					<td>
						<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month && date.date == vo.writeDate.date}">
						<fmt:formatDate value="${vo.writeDate}" pattern="a h:mm:ss"/>
						</c:if>
						<c:if test="${date.year != vo.writeDate.year || date.month != vo.writeDate.month || date.date != vo.writeDate.date}">
						<fmt:formatDate value="${writeDate}" pattern="yyyy.MM.dd(E)"/>
						</c:if>
					</td>
					<td align="center">${vo.hit}</td>
				
					<c:if test="${vo.hit > 10}">
					<img alt="hot" src="./images/fire.jpg" width="17" height="17">
					</c:if>
					</tr>
			</c:forEach>
		</c:if>
		
		<!-- 메인글을 출력한다. -->
		<!-- list.jsp에서 requset 영역에 저장한 freeboardList에서 1페이지 분량의 글이 저장된 ArrayList를 꺼내온다. -->
		<c:set var="list" value="${freeboardList.list}"/>
		<%-- ${list} --%>
		
		<!-- 메인글이 1건도 없으면 글이 없다고 출력한다. -->
		<c:if test="${list.size() == 0}">
			<marquee>테이블에 저장된 글이 없습니다.</marquee>
		</c:if>
			<tr>
				<td colspan="5"></td>
			</tr>	
		<!-- 메인글이 있으면 메인글의 개수만큼 반복하며 글 제목을 출력한다. -->
		<c:if test="${list.size() != 0}">
		<c:forEach var="vo" items="${list}">
		<tr>
			<td align="center">${vo.idx}</td>
			<td align="center">
				<!-- 제목에 태그를 적용할 수 없게 한다. -->
				<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"></c:set>
				<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"></c:set>
				
				<!-- 제목에 하이퍼링크를 걸어준다. -->
				<!-- 하이퍼링크를 클릭하면 조회수를 증가시키고 클릭한 메인글의 내용을 표시한다. -->
				
				<a href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
					${subject}(${vo.commentCount})
				</a>
				
				<!-- 오늘 입력된 글에 new 아이콘 이미지를 표시한다. -->
				<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month && date.date == vo.writeDate.date}">
					<img src="./images/new1.png">
				</c:if>
				
				
				<!-- 조회수가 일정 횟수를 넘어가면 hot 아이콘을 표시한다. -->
				<c:if test="${vo.hit > 10}">
					<img alt="hot" src="./images/fire.jpg" width="17" height="17">
				</c:if>
			</td>
			<td align="center">
				<!-- 이름에 태그를 적용할 수 없게 한다. -->
				<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')}"></c:set>
				<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"></c:set>
				${name}
			</td>
			<td align="center">
				<!-- 오늘 입력된 글은 시간만, 오늘이 아니면 날짜만 출력한다. -->
				<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month && date.date == vo.writeDate.date}">
					<fmt:formatDate value="${vo.writeDate}" pattern="a h:mm:ss"/>
				</c:if>
				<c:if test="${date.year != vo.writeDate.year || date.month != vo.writeDate.month || date.date != vo.writeDate.date}">
					<fmt:formatDate value="${writeDate}" pattern="yyyy.MM.dd(E)"/>
				</c:if>
			</td>
			<td align="center">${vo.hit}</td>
		</tr>
		</c:forEach>	
		</c:if>
		
		<!-- 페이지 이동 버튼 -->
		<tr>
			<td colspan="5" align="center">
			
				<!-- 처음으로 -->
				<c:if test="${freeboardList.currentPage > 1}">
					<button 
						class='button button1' 
						type="button" 
						title="첫 페이지로 이동합니다." 
						onclick="location.href='?currentPage=1'"
					>처음</button>
				</c:if>
			
				<c:if test="${freeboardList.currentPage <= 1}">
					<button 
						class='button button2' 
						type="button" 
						disabled="disabled" 
						title="이미 첫 페이지 입니다."
					>처음</button>
				</c:if>
				
				<!-- 10페이지 앞으로 -->
				<c:if test="${freeboardList.startPage > 1}">
					<button 
						class='button button1' 
						type="button" 
						title="이전 10페이지로 이동합니다." 
						onclick="location.href='?currentPage=${freeboardList.startPage - 1}'"
					>이전</button>
				</c:if>
				
				<c:if test="${freeboardList.startPage <= 1}">
					<button 
						class='button button2' 
						type="button" 
						disabled="disabled" 
						title="이미 첫 10페이지 입니다."
					>이전</button>
				</c:if>
				
				<!-- 페이지 이동 버튼 -->
				<c:forEach var="i" begin="${freeboardList.startPage}" end="${freeboardList.endPage}" step="1">
					<c:if test="${freeboardList.currentPage == i}">
						<button class='button button2' type='button' disabled='disabled'>${i}</button>
					</c:if>
					<c:if test="${freeboardList.currentPage != i}">
						<button 
							class='button button1' 
							type='button' 
							title="${i}페이지로 이동합니다."
							onclick="location.href='?currentPage=${i}'"
						>${i}</button>
					</c:if>
				</c:forEach>
				
				<!-- 10페이지 뒤로 -->
				<c:if test="${freeboardList.endPage < freeboardList.totalPage}">
					<button 
						class='button button1' 
						type="button" 
						title="다음 10페이지로 이동합니다." 
						onclick="location.href='?currentPage=${freeboardList.endPage + 1}'"
					>다음</button>
				</c:if>
				
				<c:if test="${freeboardList.endPage >= freeboardList.totalPage}">
					<button 
						class='button button2' 
						type="button" 
						disabled="disabled" 
						title="이미 마지막 10페이지 입니다."
					>다음</button>
				</c:if>
				
				<!-- 마지막으로 -->
				<c:if test="${freeboardList.currentPage < freeboardList.totalPage}">
				<button
					class='button button1'  
					type="button" 
					title="마지막 페이지로 이동합니다." 
					onclick="location.href='?currentPage=${freeboardList.totalPage}'"
				>끝</button>
				</c:if>
				
				<c:if test="${freeboardList.currentPage >= freeboardList.totalPage}">
					<button 
						class='button button2' 
						type="button" 
						disabled="disabled" 
						title="이미 마지막 페이지 입니다."
					>끝</button>
				</c:if>
				
			</td>
		</tr>
		
		
		
		<!-- 글쓰기 버튼 -->
		<tr class="table-secondary">
			<td colspan="5" align="right">
				<input 
					class="btn btn-outline-primary btn-sm"
					type="button" 
					value="글쓰기"
					style="font-size: 13px;"
					onclick="location.href='insert.jsp'"/>
			</td>
		</tr>
	</table>
</div>


</body>
</html>