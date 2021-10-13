<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文情報</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.jumbotron {
	background-image: url('images/background.jpg');
	background-size: cover;
	text-shadow: #888 .2em 0.2em 0.2em;
	color: white;
	text-align : center;
}

.table{
	margin : auto;
	text-align : center;
}
</style>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2>[ ${loginName } (${loginId})様 注文リスト]</h2>
		</div>
		<table class="table">
			<tr>
				<th>購入日</th>
				<th>商品コード</th>
				<th>タイトル</th>
				<th>値段</th>
				<th>個数</th>
				<th>合計金額</th>
			</tr>

			<c:forEach var="o" items="${list}">
				<tr>
					<td>${o.purchasedate }</td>
					<td>${o.code }</td>
					<td>${o.title }</td>
					<td>${o.price }</td>
					<td>${o.cnt }</td>
					<td>${o.cal }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5">トータル金額</td>
				<td>${ham}</td>
			</tr>

		</table>
	</div>
</body>
</html>