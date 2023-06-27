function fetchAjax(pageName) {
	fetch(pageName)
		.then(response => {
			if(response.status == 200) {
				response.text()
					.then(text => document.querySelectorAll('div')[0].innerHTML= text);
			} else {
				document.querySelectorAll('div')[0].innerHTML= '요청 실패!';
			}
		});
}