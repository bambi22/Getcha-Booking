<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <meta name="viewport" content="width=device-width, initial-scale=1">

<!DOCTYPE html>
<html>
<script type="text/javascript">
$(document).ready(function(e){
	$('#login').click(function() {
		location.href="login";
	});
});
}


function openNav() {
    document.getElementById("mySidenav").style.width = "300px";
    timerId = setInterval(changeColor, 1000);
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>


<style>

body {
    font-family: "Lato", sans-serif;
}
.header {
  text-align: center;
  
}
.frame {
  width: 1300px;
  margin: 0 auto;
  border: 1px solid #aaa;
}
.nav {
  margin: 30px 20px;
  width: 35px;
  margin-right: 50px;
}
.footer {
  text-align: center;
  border-top: 1px solid #aaa;
  margin: 20px 20px 0;
  font-size: 12px;
}
.sidenav {
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    background-color: #F0F8FF;
    overflow-x: hidden;
    transition: 1.5s;
    padding-top: 60px;
   
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}



.box{
	margin:0 auto;
  	width: 180px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden
    display : block;
    margin : auto;
    }
    
  ul{
     
      list-style-type: none;
      float: right;          
     }
   li{
      display: inline;
      margin-top: 60px;
      margin-right: 60px;
     }
     
  
    .input-box {
    width:500px;
            text-align: right;
            padding: 20px;
        }
        button {
            background-color: #1b5ac2;
            color: white;
        }
    
    #cover{
  text-align:center;
}
.title{
border-bottom: solid 1px black;
}
.search{
	margin-top:50px;
	 text-align:center;
    }

	.menu{
	margin-top:50px;
	}
	best-menu{
	margin-top:50px;
	}
     .pro2{
     margin-top:50px;
     }
     
     
</style>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="frame">
 <div class="header">
 		<h1>LOGO</h1>
      <ul>
         <li>로그인</li>
         <li>회원가입</li>
      </ul>
      <p class="title"></p>
  </div>
  
<div class="container">
	<div class="nav">
		<div id="mySidenav" class="sidenav">
		
 			 <a style="href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		</div>
<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
 </div>
 
	<div class="content">
	<a href="restViewProc?restNum=21">식당21번 정보 보기</a>
	<div>
	<p class="pro2" style="text-align:center;"><img src="http://www.travelnbike.com/news/photo/201810/67003_113045_4950.jpg" style="border:2 solid black"  width="900" height="280"></p>
	</div>

	<div class="search">
	<input type="search" class="search-txt" style="width:800px; height:50px;" name="" placeholder="메뉴 검색">
	</div>
	
	<div class="menu" style="text-align: center;">
	<img src="https://image.toast.com/aaaaaqx/md/_0010_sushi_omakase.jpg" class="box" style="border:3 solid black">
	<img src="https://image.toast.com/aaaaaqx/md/_0006_korean_food.jpg" class="box" style="border:3 solid black">
	<img src="https://image.toast.com/aaaaaqx/md/_0007_steak.jpg" class="box" style="border:3 solid black">
	<img src="https://image.toast.com/aaaaaqx/md/_0008_beef.jpg" class="box" style="border:3 solid black">
	</div>
	
	<p class="pro2" style="text-align:center;"><img src="http://www.travelnbike.com/news/photo/201810/67003_113045_4950.jpg" style="border:2 solid black"  width="900" height="280"></p>
	
	<div class="best-menu" style="text-align: center;">
	<img src="#" class="box" style="border:3 solid black">
	<img src="#" class="box" style="border:3 solid black">
	<img src="#" class="box" style="border:3 solid black">
	<img src="#" class="box" style="border:3 solid black">
	</div>
		
		
	<div class="guide" style="text-align: center;">
	<img src="#" class="box" style="border:3 solid black">
	<img src="#" class="box" style="border:3 solid black">
	<img src="#" class="box" style="border:3 solid black">
	<img src="#" class="box" style="border:3 solid black">
	</div>
	
	<div class="new-restaurent" style="text-align: center;">
	<img src="#" class="box" style="border:3 solid black">
	<img src="#" class="box" style="border:3 solid black">
	<img src="#" class="box" style="border:3 solid black">
	<img src="#" class="box" style="border:3 solid black">
	</div>
	
	<div class="Dining Magazine" style="text-align: center;">
	<img src="#" class="box" style="border:3 solid black">
	<img src="#" class="box" style="border:3 solid black">
	<img src="#" class="box" style="border:3 solid black">
	<img src="#" class="box" style="border:3 solid black">
	</div>
	
	
	</div>
	
	
	<div class="footer">
    <p class="copyright">&copy;copy</p>
    </div>
    
	</div>
	
</body>
</html>