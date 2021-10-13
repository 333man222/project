<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>商品情報</title>
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
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
  $(function(){
	  $("#btn_purchase").on('click', purchase);
	  $("#btn_wishlist").on('click', wishlist);
  });
  
  function purchase() {
	 let cnt = $("#count").val();
	 let quantity = '${book.quantity}';
	 
	 if( parseInt(cnt) > parseInt(quantity) ) {
		alert("在庫数量内でご購入いただけます。");
		$("#count").focus();
		
		return;
	 }
	 
	 if(cnt.trim().length == 0) {
		alert("購入数量をご記入ください。");
		$("#count").focus();
			
		return;
	 }
	 if(cnt < 0){
		alert("購入数量をもう一度ご記入ください。");
		$("#count").focus();
		return;
	 }
	 
	 $.ajax({
		url : 'purchase'
		, method : 'post'
		, data : "code="+${book.code}+"&cnt="+cnt
		,success : function(test) {
			
		}
		
	 });
	 
	 let date = "orderlist?code="+${book.code}+"&cnt="+cnt;
	 location.href = date;
  }
  
  function wishlist() {
	if(confirm('お気に入りリストに入れますか?')){
	 let data = "wishlist?code="+${book.code};
	 location.href = data;
	}
  }
  
  </script>

</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2>[商品詳細情報]</h2>
		</div>
		<table class="table">
		<tr>
			<th>商品コード</th>
			<td>${book.code}</td>
		</tr>
		<tr>
			<th>タイトル</th>
			<td>${book.title}</td>
		</tr>
		<tr>
			<th>値段</th>
			<td>${book.price}</td>
		</tr>
		<tr>
			<th>在庫数量</th>
			<td>${book.quantity}</td>
		</tr>
			<tr>
				<th colspan="2">
					 <label for="count">購入数量</label>
					 <input	type="number" id="count" name="count"> 
					 <input type="button" id="btn_purchase" value="購入する"> 
					 <input type="button"	id="btn_wishlist" value="お気に入り登録">
				 </th>
			</tr>
		</table>
	</div>
</body>
</html>



