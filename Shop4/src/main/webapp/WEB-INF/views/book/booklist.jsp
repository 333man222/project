<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>商品リスト</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
}
th{
	text-align : center;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2>[商品リスト]</h2>
		</div>
		<table class="table">
			<thead>
				<tr>
				<th>商品コード</th>
				<th>タイトル</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${list}">
					<tr>
						<td>${book.code}</td>
						<td><a href="detailbook?code=${book.code}">${book.title}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>



