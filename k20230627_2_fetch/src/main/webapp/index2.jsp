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

<!-- fetch()를 실행하는 중복되는 코드가 여러 번 나온다. => 함수로 만들어 호출한다. -->

<ol>
	<li>
		<a onclick="
			// 서버에 요청한다.
			fetch('1')
			// 서버가 응답한 내용이 then() 함수의 익명 함수로 전달된다.
			.then(function (response) {
				// response.status: 서버가 응답한 http 코드를 얻어온다.
				// console.log(response.status);
				// 서버가 정상적으로 응답했나 확인한다.
				if(response.status == 200) {
					// 서버가 정상적으롤 응답했을 경우 실행할 문장을 적는다.
					// alert('요청 성공!');
					// text(): 서버가 응답한 결과를 얻어온다.
					// console.log(response.text()); // fetch의 요청 결과는 promise이다.
					// 서버가 응답한 결과를 then() 함수의 익명 함수로 전달한다.
					response.text()
						.then(function (text) {
							// console.log(text);
							document.querySelectorAll('div')[0].innerHTML= text;
					});
				} else {
					// 서버가 정상적으로 응답하지 못했을 경우 실행할 내용을 코딩한다.
					alert('요청 실패!');
				}
			})
		">1절 가사</a>
	</li>
	
	<!-- function을 지우고 '=>'로 대체한다. -->
	<li>
		<a onclick="
		fetch('2')
		.then((response) => {
			if(response.status == 200) {
				response.text()
					.then((text) => {
						document.querySelectorAll('div')[0].innerHTML= text;
					});
			} else {
				alert('요청 실패!');
			}
		})
		">2절 가사</a>
	</li>
	<li>
		<a onclick="
		fetch('3')
		.then(response => {
			if(response.status == 200) {
				response.text()
					.then(text => {
						document.querySelectorAll('div')[0].innerHTML= text;
					});
			} else {
				alert('요청 실패!');
			}
		})
		">3절 가사</a>
	</li>
		
	<!-- 익명 함수가 실행할 문장이 1문장일 경우 {}를 생략할 수 있다. -->
	<!-- 익명 함수가 실행할 1문장이 return일 경우 return도 생략해야 한다. -->
	<!-- {}를 생략한 1문장의 맨 뒤에 ';'을 쓰면 에러가 발생된다. -->
	<li>
		<a onclick="
		fetch('4')
		.then(response => {
			if(response.status == 200) {
				response.text()
					.then(text => document.querySelectorAll('div')[0].innerHTML= text);
			} else {
				alert('요청 실패!');
			}
		})
		">4절 가사</a></li>
	<li>
		<a onclick="
		fetch('5')
		.then(response => {
			if(response.status == 200) {
				response.text()
					.then(text => document.querySelectorAll('div')[0].innerHTML= text);
				// response.text().then(text => console.log(text))를 아래와 같이 쓸 수 있다.
				// response.text().then(console.log)
			} else {
				alert('요청 실패!');
			}
		})
		">5절 가사</a>
	</li>
</ol>

<div>
	가사가 출력될 영역
</div>

</body>
</html>








