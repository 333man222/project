<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>ブックストア</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.jumbotron {
	background-image: url('images/background.jpg');
	background-size: cover;
	text-shadow: #888 .2em 0.2em 0.2em;
	color: white;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<div class="jumbotron">
			<h1>ブックストア</h1>
			<p>我々は本を合理的な値段でご提供致します。</p>
		</div>

		<ul class="nav nav-pills" role="tablist">
			<c:if test="${sessionScope.loginId == null}">
				<li class="active"><a href="join">会員登録</a></li>
				<li><a href="login">ログイン</a></li>
			</c:if>

			<c:if test="${sessionScope.loginId != null}">
				<li><a href="logout">${sessionScope.loginName}様, ログアウト</a></li>
				<li><a href="orderlist">注文リスト</a></li>
				<li><a href="wishitemlist">お気に入り</a></li>
			</c:if>

			<li><a href="booklist">商品リスト</a></li>
			<li><a href="bestSeller">ベストセラー</a></li>
		</ul>
	</div>
</body>
</html>
