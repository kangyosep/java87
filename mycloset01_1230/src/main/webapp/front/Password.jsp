<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
body {
  background-color: #f6f6f6;
  font-family: "Open Sans", Arial, Helvetica;
  margin-top: 50px;
  font-size: 14px;
}
div {
  width: 400px;
  margin: 0 auto;
  text-align: center;
}
h1 {
  margin-bottom: 1.5em;
  font-size: 30px;
  color: #484548;
  font-weight: 100;
}
 h1 span {
  display:block;
  font-size: 14px;
  color: #989598;
 }
form p { position: relative; }
label { 
  position: absolute;
  left:-9999px;
  text-indent: -9999px;
}
input {
  width: 250px;
  padding: 15px 12px;
  margin-bottom: 5px;
  border: 1px solid #e5e5e5;
  border-bottom: 2px solid #ddd;
  background: #f2f2f2;
  color: #555;
}
.EmCheck + .unmask {
  position: absolute;
  right: 74px;
  top: 12px;
  text-indent: -9999px;
  width: 25px;
  height: 25px;
  background: #aaa;
  border-radius: 50%;
  cursor:pointer;
  border: none;
  -webkit-appearance:none;
}
.EmCheck + .unmask:before {
  content: "";
  position:absolute;
  top:4px; left:4px;
  width: 17px;
  height: 17px;
  background: #e3e3e3;
  z-index:1;
  border-radius: 50%;
}
.EmCheck[type="text"] + .unmask:after {
  content: "";
  position:absolute;
  top:6px; left:6px;
  width: 13px;
  height: 13px;
  background: #aaa;
  z-index:2;
  border-radius: 50%;
}
</style>
</head>
<body>
<div>
  <h1>Find password<span>이메일을 입력하세요.</span></h1>
  <form>
     <p>
      <label for="password">Your password</label>
      <input type="text" value="" placeholder="Email" id="EmCheck" class="EmCheck">
      <button id="try" class="unmask" type="button" title="Mask/Unmask password to check content">Unmask</button>
    </p>
  </form>
</div>
<!-- Script -->
	<script src="../node_modules/jquery/dist/jquery.js"></script>
<script type="text/javascript">
$('#try').on('click', function(){
	  	 
	  return false;
	});
</script>
</body>
</html>