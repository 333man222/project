<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title>ログイン</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script>
  	$(function() {
  		$("#loginBtn").on('click',loginSubmit);
  	});
  	function loginSubmit() {
  		let userid  = $("#userid").val();
  		let userpwd  = $("#userpwd").val(); // R, W
  		
  		if(userid.trim().length < 3 || userid.trim().length >10 ) {
			alert("IDは3~10文字で入力してください。");
  			return;
  		} 
  		if(userpwd.trim().length < 3 || userpwd.trim().length >10 ) {
			alert("パスワードは3~10文字で入力してください。");
  			return;
  		}

  		$("#loginForm").submit();
  	}
  </script>

</head>
<body>

<div class="container">
  <h2>[ ログイン ]</h2>
  <form id="loginForm" action="login" method="POST">
    <div class="form-group">
      <label for="userid">ID:</label>
      <input type="text" class="form-control" id="userid" name="userid" placeholder="Enter userid">
    </div>
    <div class="form-group">
      <label for="userpwd">Password:</label>
      <input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="Enter password">
    </div>
    
    <button id="loginBtn" type="submit" class="btn btn-primary">Login</button>
  </form>
</div>
</body>
</html>
