<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type = "text/css">

.invisible {
        clear: none;
        border: 0px none;
        float: none;
        background-color: #ffffff;
        /* 배경을 투명하게 할경우에는 background-color: transparent; */
}

.line{border-top:5px solid #e2e2e2;}
.lineright{border-right:1px solid #e2e2d2;}
.lineleft{border-left:1px solid #e2e2d2;}
.linebottom{border-bottom:1px solid #e2e2d2;}

th{
padding:20px;}

td{
padding:10px}

div{
    margin-right : 50px;
    margin-left : 50px;
}

.d1 {
        margin-top: 30px; 
       }
     
.d2{
       float :left;
       }
      
.d3{
       float:right;
      }
  
.d4{
      }
    
.d5{
      margin-top: 30px;
      float:left;
      }
      
.d6{
      margin-top: 3opx;
      float:right;
      }


</style>


<title>DetailPage</title>

<script type="text/javascript">



</script>

</head>

<body>
     <div class="d1">
              <img src = "images/park.jpg">
              <button name="xbutton" type="button" onclick="alert('닫기');"
              style="width:20px; height:20px; cursor:hand; filter:alpha(opacity=100);
              position:absolute;top:30px;right:35px;z-index:100"></button>
              
              <button name="mbutton" type="button" onclick="alert('가격');"
              style="width:30px; height:30px; curson:hand; filter:alpha(opacity=100);
              position:absolute;top:30px;left:28px;z-index:100"></button>
              </br>
     </div> 
     
     <div class = "d2">
            <br/>
            <font size= "5"> TakahiroK </font> &nbsp&nbsp&nbsp&nbsp <img src = "images/clip.JPG"> 
     </div>
      
     <div class = "d3" style="text-align:right">
            <br/>
            <img src ="images/love.JPG"> &nbsp <font size="5"> 7,674</font> 
            <br/>
            <br/>
     </div>
     
     <div class ="d4">
        
        <table width="100%" height="70" border = "0" cellpadding="0" cellspacing="0">
              <tr>
                    <th class="line">코트</th>
                    <th class="line">하의</th>
                    <th class="line">신발</th>
                    <th class="line">머플러</th>
             </tr>
             <tr>
                    <th class="lineright"><a href="www.naver.com">brandA</a></th>
                    <th class="lineright"><a href="www.naver.com">brandB</a></th>
                    <th class="lineright"><a href="www.naver.com">brandC</a></th>
                    <th><a href="www.naver.com">brandD</a></th>
             </tr>
             <tr>
                    <th>\&nbsp480,000</th>
                    <th>\&nbsp160,000</th>
                    <th>\&nbsp210,000</th>
                    <th>\&nbsp110,000</th>
             </tr>                         
     </table>
   </div>
    
       <div class= "d1">
            <input type="text" class="invisible"  onfocus="this.value='';" value="TakahoroK님의 comment"  size="82"/>
            <HR width="100%" align="right" style="color:#e2e2d2; background-color:#e2e2d2; height:1px; border:none" />
       </div> 
       <div class="d4">
                   <input type="text" class="invisible"  onfocus="this.value='';" value="옷장 구독해주세요."  size="70"/>
                   <HR width="100%" align="right" style="color:#e2e2d2; background-color:#e2e2d2; height:1px; border:none" />       
       </div>
       
       <div class= "d1">
           <font face="Arial Black" font size="4" ><b>Share</b></font>
           <HR width="100%" align="right" style="color:#e2e2d2; background-color:#e2e2d2; height:1px; border:none" />
       </div>
       
       <div class= "d4">
              <img src="images/icon.JPG">
       </div>
       
       <div class= "d1">
          <font face="Nanum Gothic" font size="4" ><b>댓글</b></font>
          <HR width="100%" align="right" style="color:#e2e2d2; background-color:#e2e2d2; height:1px; border:none" />
        </div>
        
        <div>
            <table>
                <tr>
                    <th>userId</th>
                    <td>댓글입력</td>
                </tr>
                <tr>
                    <th style="padding:10px">userA</th>
                    <td style="padding:10px">옷잡 구독</td>
                </tr> 
                <tr>
                    <th style="padding:10px">userB</th>
                    <td style="padding:10px">머플러가 너무 멋지네요!</td>
                </tr>
            </table>
        </div>
        
        
        
   </body>
</html>