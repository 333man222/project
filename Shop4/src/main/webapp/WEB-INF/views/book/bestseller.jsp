<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.jumbotron {
	background-image: url('images/background.jpg');
	background-size: cover;
	text-shadow: #888 .2em 0.2em 0.2em;
	color: white;
	text-align: center;
}

.table {
	margin: auto;
	text-align: center;
	font-size : 15px;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2>[Best Seller]</h2>
		</div>
		<table class="table">
			<tr>
				<th>商品コード</th>
				<td>${best.code}</td>
			</tr>
			<tr>
				<th>タイトル</th>
				<td>${best.title }</td>
			</tr>
			<tr>
				<th>値段</th>
				<td>${best.price }</td>
			</tr>
			<tr>
				<th>販売数量</th>
				<td>${best.cnt }</td>
			</tr>
		</table>
	</div>
</body>
</html>