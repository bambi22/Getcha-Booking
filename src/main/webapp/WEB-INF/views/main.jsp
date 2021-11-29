<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
   <meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<!DOCTYPE html>
<html>
  <head>
    <title>GETCHA</title>
    
 
    
    <link href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="resources/css1/animate.css">
    
    <link rel="stylesheet" href="resources/css1/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css1/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/css1/magnific-popup.css">
    
    <link rel="stylesheet" href="resources/css1/flaticon.css">
    <link rel="stylesheet" 	href="resources/css1/style.css">
<style>

#sidebar{left:-250px;}
.reg{
margin-right:80px;
margin-top:10px;
}
.navbar-brand{
font-size:20px;}
.wrap{
height:40px;
position:fixed;
}
.search{
margin-bottom:540px;
}
#keywordInput{
height: 50;
}
</style>
<script>
$('#sidebar').find('span').text('OPEN');
</script>
  </head>
  <body>
<div class="wrap">
			<div >
				<div class="row">	
					<div class="col-md-6 d-flex align-items-center">
						<p class="mb-0 phone pl-md-2">
						  <a class="navbar-brand" href="">GETCHA</a>
							<a  class="mr-2"><span class="fa fa-phone mr-1"></span> 010 1234 1234</a> 
							<a href="#"><span ></span> GETCHA@gmail.com</a>
						</p>
					</div>
					<div class="col-md-6 d-flex justify-content-md-end">
						
		        <div class="reg">
		        	      <c:if test = "${sessionScope.email == null }">
                 <p class="mb-0"><a href="${root}index?formpath=login" class="mr-2">로그인</a> 
                 <a href="${root}index?formpath=member">회원가입</a></p>
                  </c:if>  
                    <c:if test="${ sessionScope.email != null }">
                   <%--  <p class="mb-0"><a class="mr-2" >회원 : ${sessionScope.email}님</a> --%>
                    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" >
          
	          <li  class="nav-item dropdown">
              <img src="resources/img/icon/profileIcon.png" style="width:40px">
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="${root}memberViewProc">회원정보</a>
                <a class="dropdown-item" href="${root }reservationViewProc">예약 보기</a>
                <a class="dropdown-item" href="${root }reviewProc">내 리뷰</a>
                <a class="dropdown-item" href="${root }myCollectProc">관심 식당</a>
              </div>
            </li>	   

                    <span ><a href="logout" style="color:white">로그아웃</a></span>
                    </c:if>
		        </div>
					</div>
				</div>
			</div>
		</div>
		 </nav>
  	
   
  	
    
	 
    <!-- END nav -->
    
    <div class="hero-wrap"  >
      <div class="overlay" style="background-image: url('resources/images/메인.jpg'); opacity:1; background-size:cover; min-height:100%; background-position: center;"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-8 ftco-animate d-flex align-items-end">
          	<div class="text w-100 text-center">
	            
	               <section class="search" id="search_container">
			<form action="searchProc" method="get" >	
   				<input type="text" name="keyword" id="keywordInput" placeholder="검색 키워드 입력" style="width:600px"/>
			</form>
		</section>
            </div>
          </div>
        </div>
      </div>
    </div>
    <section class="ftco-intro">
    	<div class="container">
    		<div class="row no-gutters">
    			<div class="col-md-4 d-flex">
    				<div class="intro d-lg-flex w-100 ftco-animate">
    					<div class="icon">
    						<span class="flaticon-support"></span>
    					</div>
    					<div class="text">
    						<h2>GETCHA</h2>
    						<p>설명글</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-4 d-flex">
    				<div class="intro color-1 d-lg-flex w-100 ftco-animate">
    					<div class="icon">
    						<span class="flaticon-cashback"></span>
    					</div>
    					<div class="text">
    						<h2>GETCHA</h2>
    						<p>설명글.</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-4 d-flex">
    				<div class="intro color-2 d-lg-flex w-100 ftco-animate">
    					<div class="icon">
    						<span class="flaticon-free-delivery"></span>
    					</div>
    					<div class="text">
    						<h2>GETCHA</h2>
    						<p>설명글.</p>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
   
  

	

    <footer class="ftco-footer">
      <div class="container">
        <div class="row mb-5">
          <div class="col-sm-12 col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2 logo"><a href="#">GETCHA <span></span></a></h2>
              <p>Far far away, behind the word mountains, far from the countries.</p>
              <ul class="ftco-footer-social list-unstyled mt-2">
                <li class="ftco-animate"><a href="#"><span class="fa fa-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="fa fa-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="fa fa-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-sm-12 col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">설명</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>설명</a></li>
                <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>설명</a></li>
                <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>설명</a></li>
                <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>설명</a></li>
              </ul>
            </div>
          </div>
          <div class="col-sm-12 col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">설명</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>설명</a></li>
                <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>설명</a></li>
                <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>설명</a></li>
                <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>설명</a></li>
              </ul>
            </div>
          </div>
          <div class="col-sm-12 col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">설명</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>설명</a></li>
                <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>설명</a></li>
                <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>설명</a></li>
                <li><a href="#"><span class="fa fa-chevron-right mr-2"></span>설명</a></li>
              </ul>
            </div>
          </div>
          <div class="col-sm-12 col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">설명</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon fa fa-map marker"></span><span class="text">설명</span></li>
	                <li><a href="#"><span class="icon fa fa-phone"></span><span class="text">010 1234 5678</span></a></li>
	                <li><a href="#"><span class="icon fa fa-paper-plane pr-4"></span><span class="text">GETCHA@gmail.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
      </div>
      
    </footer>
  

 


  <script src="resources/jsmain/jquery.min.js"></script>
  <script src="resources/jsmain/jquery-migrate-3.0.1.min.js"></script>
  <script src="resources/jsmain/popper.min.js"></script>
  <script src="resources/jsmain/bootstrap.min.js"></script>
  <script src="resources/jsmain/jquery.easing.1.3.js"></script>
  <script src="resources/jsmain/jquery.waypoints.min.js"></script>
  <script src="resources/jsmain/jquery.stellar.min.js"></script>
  <script src="resources/jsmain/owl.carousel.min.js"></script>
  <script src="resources/jsmain/jquery.magnific-popup.min.js"></script>
  <script src="resources/jsmain/jquery.animateNumber.min.js"></script>
  <script src="resources/jsmain/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="resources/jsmain/google-map.js"></script>
  <script src="resources/jsmain/main.js"></script>

  </body>
</html>