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

//	jQuery onload
$(() => {
	if (location.hash) {
		fetchAjax(location.hash.substring(2));
	} else {
		fetchAjax('summary');
	}
	
//	list 파일의 내용을 읽어서 <ol id="list"> ~ </ol> 사이에 넣어주는 fetch
	/*
	fetch('list').then(res => {
			if(res.status == 200) {
				res.text().then(data => $('#list').html(data));
			} else {
				alert('응답 실패!');
			}
		});
	*/
//	fetch('list').then(res => res.text().then(data => $('#list').html(data)));
//	위와 같이 then() 내부에 then()이 나오는 기법을 nested라 한다.	
fetch('list')
      .then(res => {
         if(res.status == 200) {
            res.text()
               .then( text => document.getElementById('list').innerHTML = text )
         } else {
            document.getElementById('list').innerHTML = '요청 실패!!';
         }
      })
//	list2 파일의 내용을 읽어서 <ol id="list2"> ~ </ol> 사이에 넣어주는 fetch
	/*
	fetch('list2')
		.then(function (res) {
			res.text()
				.then(function (data) {
					console.log(data);
					// split() 함수를 사용해서 ','를 경계로 문자열을 분리해서 배열로 리턴한다.
					let obj = data.split(',');
					console.log(obj);
					
					// <ol> 태그 내부에 출력할 태그 목록을 만든다.
					// <li><a href="#!1" onclick="fetchAjax('1')">1절 가사</a></li>
					let items = '';
					for(let i=1; i<=obj.length; i++) {
						let item = '<li><a href="#!' + i + '" onclick="fetchAjax(\'' + i + '\')">' + obj[i-1] + '</a></li>';
						console.log(item);
						items += item;
					}
					$('#list2').html(items);
				});
		})
	*/
	/*
	화살표 함수로 줄인 것
	
	fetch('list2')
		.then(res => {
			res.text()
				.then(data => {
					let obj = data.split(',');
					let items = '';
					for(let i=1; i<=obj.length; i++) {
						let item = '<li><a href="#!' + i + '" onclick="fetchAjax(\'' + i + '\')">' + obj[i-1] + '</a></li>';
						items += item;
					}
					$('#list2').html(items);
				});
		})
	*/
	
	fetch('list2')
		.then(function (res) {
			return res.text();
		})
		.then(function (data) {
			let obj = data.split(',');
			let items = '';
			for(let i=1; i<=obj.length; i++) {
					let item = '<li><a href="#!' + i + '" onclick="fetchAjax(\'' + i + '\')">' + obj[i-1] + '</a></li>';
					items += item;
			}
			$('#list2').html(items);
		});
	
	
});














