<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
<style type="text/css">
.commentButton {
	width: 460px;
	border: 1px solid black;
	border-radius: 70px;
}

#commentButton {
	width: 380px;
}

#com_delete{
  float:right; 
}

#com_delete com_update{
}

input[type=text]{
    width: 300px;
    padding: 5px 10px 6px 10px;
    margin-top: 7px; 
    margin-bottom: 7px;
    margin-right: 10px;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

#comment_block{
  height:40px;
  
  margin: 5px;
  outline: 3px;
}

.btn btn-default{
 color:red;
 background-color: yellow;
}


#nick{
color:blue;
}

#com_delete{
background-color:red;
}
</style>

</head>
<body>

	<div style="width:440px" class="container">
		<button type="button" class="commentButton" data-toggle="collapse" id="commentButton"
			data-target="#demo">댓글</button>
		<div id="demo" class="collapse">
			<div class="commentInput">

				<!-- /////////////////////////////////////// -->
				<!-- /////////////////////////////////////// -->

				<form name="comment_input" action="/comment/addComment"
					method="POST" id="cmt_form">
					
			<input type="hidden" id="styleNo" name="styleNo" value="181">
            <input type="hidden" id="hrs" name="hrs" value="101">
            <input type="hidden" id="nick" name="nick" value="101">
					<div>
						<span id="comment_user_nick">${user.nick}</span>&nbsp&nbsp<input type="text" name="content" id="content" maxleng="2000" >
						<input type="button" value="전송" id="cmt_insert" class="btn btn-default btn-sm">
					</div>
					
				</form>
			</div>
			
			<br/>
			
			<div id="commentList"></div>
			
	</div>
	</div>






  
 <!-- <script src="../node_modules/jquery/dist/jquery.js"></script>--> 
	<!-- <script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"> -->
	


 <script type="text/javascript">
    $("#commentButton").click(function(){
              $.get('/comment/getCommentList?styleNo=181',function(map){
                   	     var row='';  	  
            	   $.each(map.commentList,function(index,comment){
                  		 row+="<div id='comment_block'><span id='cmtNo' style=visibility:hidden;'>"+comment.cmtNo+"</span>"+"<span id ='cmt_nick'> "+comment.nick+"</span>"+'&nbsp'+"<span id='cmt_content'> "+comment.content+"</span>"+'&nbsp<span id ="cmt_hrs">'+comment.hrs+"</span>";
                  		 row+="<div id='com_delete'>";
                  		 if(comment.userNo==map.user.user_no){
                  			  	row+="<a href='#'  id='delCmt2'>삭제</a>";
                  		 }
                  		 row+="</div></div>";
            	  }) 
            	  $("#commentList").append(row);
           });
        });
    
     $("#cmt_insert").click(function(){
    	  var form = new FormData($("#cmt_form")[0]);
    	  console.log( $( this ).serialize());
    	   
    	  $.ajax({
    		    url:'/comment/addComment',
    		    processData : false,
    		    contentType:false,
    		    data:form,
    		    type:'POST',
    		    success: function(comment){
    		    	$("#commentList").append("<div id='comment_block'>  <span id ='cmt_nick'> "+comment.nick+"</span>"+"&nbsp&nbsp<span id='cmt_content'>"+comment.content+"</span>&nbsp&nbsp<span id='cmt_hrs'>"+comment.hrs+"</span>"
    		    			+"<div id='com_delete'><a href='#' id='delCmt2' class='delCmt'>삭제</a></div></div>");
    		    }
    	   });
    	   $("#content").val("");
     });
    		///댓글삭제
    	$(document).on("click","#delCmt2",function(){
    		$(this).parent().parent().remove();	
    		$.post('/comment/deleteComment',{"cmtNo":cmtNo},function(cmt){
    			}); 
    		});
       </script> 

        
    
</body>

</html>