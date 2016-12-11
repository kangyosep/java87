<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- CSS -->
<link rel="stylesheet" href="../account/css/reset.css">	
<link rel="stylesheet"
	href="../node_modules/bootstrap/dist/css/bootstrap.css">	
<link rel="stylesheet" href="../account/css/fonts.css">
<link rel="stylesheet" href="../account/css/account.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>account</title>
</head>

<body>

	<form name="detailForm" >
		<div id="accountWrap" class="container">
			<div class="row">
				<div id="acnt-profile" class="form-group text-center">
					<img src="../account/css/images/user01.png" class=" img-circle"
						id="acnt-user-img" alt="Responsive image"> <label
						for="acnt-input-file">프로필 사진 변경</label>
						<input type="file" id="acnt-input-file" onchange="readURL(this);">
				</div>
			</div>
			<!-- //row 1 -->

			<div class="row ">
				<div class="form-group">
					<h3 class="text-center acnt-title">MY ACCOUNT</h3>
				</div>
			</div>
			<!-- //row 2 -->

			<div id="acnt-info-box" class="row">
				<div id="acnt-info" class="form-group ">
					<label for="exampleInputEmail1"> Email </label> <input type="email"
						class="form-control" id="inputEmail" placeholder="Email">
				</div>
				<div id="acnt-nick" class="form-group">
					<label for="exampleInputName2">Name</label> <input type="text"
						class="form-control" id="inputName" placeholder="Nickname">
				</div>
				<div id="acnt-pwd" class="form-group">
					<label for="InputPassword1">Password</label> <input type="password"
						class="form-control" id="inputPwd" placeholder="Password">
				</div>
				<div id="acnt-con-pwd" class="form-group">
					<label for="InputPassword1">Confirm-Password</label> <input
						type="password" class="form-control" id="inputConPwd"
						placeholder="Confirm-Password">
				</div>
			</div>
			<!-- //row 3 -->

			<input id="acnt-btn" class="btn btn-default btn-sm" type="submit"
				value="Submit">
		</div>
		<!-- //accountWrap -->
	</form>
	
	<!--JS-->
    <script src="../node_modules/jquery/dist/jquery.js"></script>
    <script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    
	<script src="../account/js/account.js"></script>


</body>
</html>