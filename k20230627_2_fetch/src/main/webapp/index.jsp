<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한국을 빛낸 100명의 위인들</title>
<link rel="icon" href="./images/dog.jpg">
<link rel="stylesheet" href="./css/fetch.css">
</head>
<body>

<h2><a href="./summary.jsp">한국을 빛낸 100명의 위인들</a></h2>

<ol>
	<li>
		<!-- <a href="./1.jsp">1절 가사</a> -->
		<a href="#" onclick="document.getElementsByTagName('div')[0].innerHTML='<h2>한국을 빛낸 100명의 위인들 1절</h2><p>아름다운 이 땅에 금수강산에<br/>단군 할아버지가 터 잡으시고<br/>홍익인간 뜻으로 나라 세우니<br/>대대손손 훌륭한 인물도 많아<br/>고구려 세운 동명왕 백제 온조왕<br/>알에서 나온 혁거세<br/>만주 벌판 달려라 광개토대왕 신라장군 이사부<br/>백결 선생 떡방아 삼천 궁녀 의자왕<br/>황산벌의 계백 맞서 싸운 관앙 역사는 흐른다!<br/></p>'">1절 가사</a>
	</li>
	<li>
		<!-- <a href="./2.jsp">2절 가사</a> -->
		<a href="#" onclick="document.querySelectorAll('div')[0].innerHTML='<h2>한국을 빛낸 100명의 위인들 2절</h2><p>말 목 자른 김유신 통일 문무왕 원효대사 해골물 혜초 천축국<br/>바다의 왕자 장보고 발해 대조영 귀주대첩 강감찬 서희 거란족<br/>무단정치 정중부 화포 최무선 죽림칠현 김부식<br/>지눌 국사 조계종 의천 천태종 대마도 정벌 이종무<br/>일편단심 정몽주 목화 씨는 문익점<br/>해동공자 최충 삼국유사 일연<br/>역사는 흐른다!<br/></p>'">2절 가사</a>
	</li>
	<li><a href="./3.jsp">3절 가사</a></li>
	<li><a href="./4.jsp">4절 가사</a></li>
	<li><a href="./5.jsp">5절 가사</a></li>
</ol>

<div>
	가사가 출력될 영역
</div>

</body>
</html>