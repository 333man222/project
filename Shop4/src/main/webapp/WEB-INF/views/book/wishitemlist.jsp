<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	font-size : 15px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>

	function btnDelete(code){
		if(confirm('삭제하시겠습니까?')){
			location.href='delete?code='+code;
		}	
	}

</script>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
	<h2>[ ${loginName}(${loginId})様 WishList ]</h2>
		</div>
	<table class="table">
	
		<tr>
				<th>商品コード</th>
				<th>タイトル</th>
				<th>値段</th>
				<th>お気に入り削除</th>
		</tr>
		<c:forEach var="wish" items="${list}">
			<tr>
				<td>${wish.code}</td>
				<td>${wish.title}</td>
				<td>${wish.price}</td>
				<td>
				<input type="button" value="削除" onclick="return btnDelete(${wish.code})">
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>	
</body>
</html>