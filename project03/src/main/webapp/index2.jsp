<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
href="node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
 href="node_modules/bootstrap/dist/css/bootstrap-theme.min.css" >
</head>
<body>
<h1>환영합니다.</h1>
<a id="link1" href ='#' class="btn btn-info">다음카카오</a><br>
<a id="link2" href ='#'>네이버</a><br>
<a id="link3" href= "#">구글</a>

<!-- <script src="node_modules/jquery/dist/jquery.min.js"></script> -->
<script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>

<script >
// $("#link1").click(function(event){
// event.preventDefault();
// location.href="http://www.google.com"
// });




var link3 = document.getElementById("link3");
link3.onclick = function(event){
event.preventDefault();
location.href="http://www.google.com"
}
</script>
</body>

</html>