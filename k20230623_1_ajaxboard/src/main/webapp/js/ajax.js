//	javascript ajax 구현
//	XHR(XMLHttpRequest): javascript에서 http를 통한 데이터 송수신을 지원하는 객체
const searchRequest = new XMLHttpRequest(); // 검색용

//	ajax 검색 요청 함수
function searchFunction() {
	// console.log('searchFunction()');
	// console.log(document.getElementById('username').value);
	
	// XHR객체.open('요청방식', '요청주소', 동기방식), 동기방식: 동기식 => false, 비동기식 => true
	// encodeURIComponent(): 문자열을 유니코드(UTF-8)로 인코딩 한다.
	
	// GET 방식 요청
	let url = './AjaxSearch?name=' + encodeURIComponent(document.getElementById('username').value);
	// console.log(url);
	searchRequest.open('GET', url, true);
	// send() 함수로 서버에 요청(서블릿 호출)한다.
	// 데이터를 url의 일부인 쿼리 스트링(?~~~~)으로 전송할 경우 send() 함수의 인수로 null을 지정한다.
	searchRequest.send(null);
	
	// POST 방식 요청
	/*
	let url = './AjaxSearch'; // POST 방식은 url에 쿼리 스트링을 사용하지 않는다.
	searchRequest.open('POST', url, true);
	// GET 방식은 정보가 url에 담겨서 넘어가지만 POST 방식은 정보가 헤더에 담겨서 넘어간다.
	// setRequestHeader() 함수로 반드시 헤더 정보를 포함시켜야 한다.
	searchRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	// 데이터를 send() 함수의 인수로 전달한다.
	searchRequest.send('name=' + encodeURIComponent(document.getElementById('username').value));
	*/
	
	// onreadystatechange를 사용해서 ajax 요청이 완료되면 자동으로 실행할 콜백 함수 이름을 지정한다. 
	searchRequest.onreadystatechange = searchProcess; // ()를 쓰면 안된다.
}

//	ajax 요청이 완료되면 실행할 콜백 함수
function searchProcess() {
//	console.log('searchFunction() 함수에서 요청한 ajax가 완료되면 자동으로 실행되는 함수');
	
//	XHR 객체의 readyState
//	0: 아직 실행되지 않음 
//	1: 로딩중
//	2: 로딩됨
//	3: 통신중
//	4: 통신완료
//	console.log('readyState: ' + searchRequest.readyState);

//	XHR 객체의 status
//	200: 수신성공
//	3xx: 금지
//	4xx: 페이지없음
//	5xx: 서버오류
//	console.log('status: ' + searchRequest.status);

//	통신이 정상적으로 완료되었음을 확인하고 필요한 작업을 실행한다.
	if (searchRequest.readyState == 4 && searchRequest.status == 200) {
		
		
		
	} else {
		alert('요청 실패');
	}
}



















