<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title>会員登録</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <style>
  	span {
  		color : red;
  		font-size : 0.8em;
  	}
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <script>
  	$(function() {
  		$("#userid").on('keyup', idCheck);
  		$("#joinBtn").on('click',joinSubmit);
  	});
  	function joinSubmit() {
  		let userpwd  = $("#userpwd").val(); // R, W
  		let username = $("#username").val(); // R, W
  		let address  = $("#address").val(); // R, W
  		
  		if(userpwd.trim().length < 3 || userpwd.trim().length >10 ) {
			alert("パスワードは3~10文字にしてください。");
  			return;
  		}

  		if(username.trim().length == 0 ) {
			alert("お名前を　入力してください。");
  			return;
  		}
  		if(address.trim().length == 0 ) {
			alert("住所を記入してください。");
  			return;
  		}
  		
  		$("#joinForm").submit();
  	}
  	
  	// 사용가능한 아이디인지 체크하는 함수(ajax)
  	function idCheck(){
		let userid = $("#userid").val(); 
		
		if(userid.trim().length < 3 || userid.trim().length > 10 ) {
			$("#idresult").text("IDは3~10文字にしてください。");
			return;
  		}
		$("#idresult").text("");
		
  		$.ajax({
  			url : 'idCheck'
  			, method : 'get'
  			, data : "userid=" + $("#userid").val()
  			, success : function(resp) { // var resp = "success"
  				if(resp == "success") {
  					$("#idresult").css("color", "blue");
					$("#idresult").text("使用できるID");
  				} else {
  					$("#idresult").css("color", "red");
					$("#idresult").text("既に使用されているIDです。");
  				}
  			}
  		}); 
	}
 </script>

</head>
<body>

<div class="container">
  <h2>会員登録</h2>
  <form id="joinForm" action="join" method="POST">
    <div class="form-group">
      <label for="userid">ID:</label>
      <input type="text" class="form-control" id="userid" name="userid" placeholder="Enter userid">
      <span id="idresult"></span>
    </div>
    <div class="form-group">
      <label for="userpwd">Password:</label>
      <input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="Enter password">
    </div>
    <div class="form-group">
      <label for="username">Name:</label>
      <input type="text" class="form-control" id="username" name="username" placeholder="Enter your name">
    </div>
    <div class="form-group">
      <label for="address">Address:</label>
      <input type="text" class="form-control" id="address" name="address" placeholder="Enter your address">
    </div>
    <div class="form-group">
      <label for="phone">Phone:</label>
      <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter phone number">
    </div>
    <button id="joinBtn" type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>

</body>
</html>
