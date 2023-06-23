<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>javascript ajax</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="icon" href="./images/dog.jpg">
<link rel="stylesheet" href="./css/bootstrap.css"/>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>
<script type="text/javascript" src="./js/ajax.js"></script> <!-- ajax 구현 -->
</head>
<body>

<!-- 회원 출력 양식 -->
<div class="container" style="margin-top: 20px;">
	<div class="form-group row pull-right">
		<div class="col-xs-8">
			<input 
				id="username" 
				class="form-control" 
				type="text" 
				size="20" 
				autocomplete="off"
				onkeyup="searchFunction()"/>
		</div>
		<div class="col-xs-2">
			<input 
				class="btn btn-primary" 
				type="button" 
				value="검색"
				onclick="searchFunction()"/>
		</div>
	</div>
</div>

<div class="container">
	<table class="table table-hover">
		<thead>
			<tr class="info">
				<th style="text-align: center;">번호</th>
				<th style="text-align: center;">이름</th>
				<th style="text-align: center;">나이</th>
				<th style="text-align: center;">성별</th>
				<th style="text-align: center;">이메일</th>
			</tr>
		</thead>
		<tbody id="ajaxTable">
			<tr></tr>
		</tbody>
	</table>
</div>




</body>
</html>