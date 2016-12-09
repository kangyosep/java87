<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="tagdetail.css">
  <!-- <style src="tagdetail.css"></style> -->

  
</head>
<body>

<div class="container">
  <h2>항목 태그하기</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">항목 태그하기</h4>
        </div>
        <div class="modal-body">
          <span class="tname">항&nbsp목</span><input type=”text” id="username" name=”uname” class="text1">
          <span class="tname2">브랜드</span><input type=”text” id="brandname" name=”bname” class="text1">
          <span class="tname3">가격</span><input type=”text” id="price" name=”won” class="text1">
          <span class="tname4">구매처</span>
          
          <span id="label"><select>
          <option>online</option>
          <option>off-line</option>
          </select></span>&nbsp
          
          <input type=”text” id="username" name=”uname” class="text2">
          
          <span class="tname2">사이즈</span><input type=”text” id="brandname" name=”bname” class="text1">
          <sapn class="tname3">설명</sapn><input type=”text” id="brandname" name=”bname” class="text3" maxlength="33" wrap="hard">
           
      <!-- <label for="sel2">input-sm</label> -->
      <!-- <span id=text11><select class="form-control input-sm" id="sel2"></span>
        <option>온라인</option>
        <option>오프라인</option>
      </select>
    </span> -->
    
    
  
          <!-- <HR width="100%" align="right" style="color:#e2e2d2; background-color:#e2e2d2; height:2px; border:none" /> -->
       </div>
        
        <div class="modal-footer">
          <button id=button01 class="combtn">완료</button> 
          <!-- <input type="button" value="완료"  class="combtn" onclick='tage()' /> -->
         <!--  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
        </div>
      </div>
      
    </div>
  </div>
  
</div>

<!-- <script type="text/javascript">
function tage(){
	
	window.location.href="http://www.naver.com";
	
} -->

</script>


</body>
</html>



