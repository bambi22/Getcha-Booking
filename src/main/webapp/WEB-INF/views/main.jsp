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
    <link rel="stylesheet" href="resources/css1/style.css">
<style>
.item{height: 270px;}
#sidebar{left:-250px;}
</style>
<script>
$('#sidebar').find('span').text('OPEN');
</script>
  </head>
  <body>
<div class="wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-6 d-flex align-items-center">
						<p class="mb-0 phone pl-md-2">
							<a href="#" class="mr-2"><span class="fa fa-phone mr-1"></span> 010 1234 5678</a> 
							<a href="#"><span class="fa fa-paper-plane mr-1"></span> GETCHA@gmail.com</a>
						</p>
					</div>
					<div class="col-md-6 d-flex justify-content-md-end">
						<div class="social-media mr-4">
			    		<p class="mb-0 d-flex">
			    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a>
			    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a>
			    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a>
			    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-dribbble"><i class="sr-only">Dribbble</i></span></a>
			    		</p>
		        </div>
		        <div class="reg">
		        	      <c:if test = "${sessionScope.email == null }">
                 <p class="mb-0"><a href="${root}index?formpath=login" class="mr-2">로그인</a> 
                 <a href="${root}index?formpath=member">회원가입</a></p>
                  </c:if>  
                    <c:if test="${ sessionScope.email != null }">
                   <%--  <p class="mb-0"><a class="mr-2" >회원 : ${sessionScope.email}님</a> --%>
                    <img src="resources/img/icon/profileIcon.png" style="width:40px">
                    <span ><a href="logout" style="color:white">로그아웃</a></span>
                    </c:if>
		        </div>
					</div>
				</div>
			</div>
		</div>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container" style="z-index:6">
	      <a class="navbar-brand" href="">GETCHA</a>
	      

	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          
	          <li class="nav-item"><a href="#" class="nav-link">이동</a></li>
	          <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">이동</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="#">이동1</a>
                <a class="dropdown-item" href="#">이동2</a>
                <a class="dropdown-item" href="#">이동3</a>
                <a class="dropdown-item" href="#">이동4</a>
              </div>
            </li>
	          <li class="nav-item"><a href="#" class="nav-link">이동</a></li>
	          <li class="nav-item"><a href="#" class="nav-link">이동</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
  	
    
	 
    <!-- END nav -->
    
    <div class="hero-wrap"  >
      <div class="overlay" data-stellar-background-ratio="0.5" style="background-image: url('resources/images/메인.jpg'); opacity:1; background-size:cover; min-height:100%; background-position: center;"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-8 ftco-animate d-flex align-items-end">
          	<div class="text w-100 text-center">
	            <h1 class="mb-4">원하는 <span>식당을 </span>선택! <span>예약해보세요</span>.</h1>
	            <p><a href="#" class="btn btn-primary py-2 px-4">식당보기</a> <a href="#" class="btn btn-white btn-outline-white py-2 px-4">메뉴보기</a></p>
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
    </section>
    <div style="margin-top:100px;"></div>
     <section class="ftco-section testimony-section img" style="background-image: url(resources/images/bg_4.jpg);">
    	<div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
          	<span class="subheading">promotion</span>
            <h2 class="mb-3">프로모션</h2>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel ftco-owl">
              <div class="item" style="background-image: url(resources/images/1-20211118리베르떼1.png);">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></div>
                  <div class="text">
                    <p class="mb-4"></p>
                    <div class="d-flex align-items-center">
                   
                    	<div class="pl-3">
		                    <p class="name"></p>
		                    <span class="position"></span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item" style="background-image: url(resources/images/1-20211118리베르떼1.png);">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></div>
                  <div class="text">
                    <p class="mb-4"></p>
                    <div class="d-flex align-items-center">
                    	
                    	<div class="pl-3">
		                    <p class="name"></p>
		                    <span class="position"></span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item" style="background-image: url(resources/images/1-20211118리베르떼1.png);">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></div>
                  <div class="text">
                    <p class="mb-4"></p>
                    <div class="d-flex align-items-center">
                    	
                    	<div class="pl-3">
		                    <p class="name"></p>
		                    <span class="position"></span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item" style="background-image: url(resources/images/1-20211118리베르떼1.png);">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></div>
                  <div class="text">
                    <p class="mb-4"></p>
                    <div class="d-flex align-items-center">
                    	
                    	<div class="pl-3">
		                    <p class="name"></p>
		                    <span class="position"></span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item" style="background-image: url(resources/images/1-20211118리베르떼1.png);">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></div>
                  <div class="text">
                    <p class="mb-4"></p>
                    <div class="d-flex align-items-center">
                    	
                    	<div class="pl-3">
		                    <p class="name"></p>
		                    <span class="position"></span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section ftco-no-pb">
			<div class="container">
				<div class="row">
					<div class="col-md-6 img img-3 d-flex justify-content-center align-items-center" style="background-image: url(resources/images/33-20211122-팔레드%20신_북경오리.jpg;">
					</div>
					<div class="col-md-6 wrap-about pl-md-5 ftco-animate py-5">
	          <div class="heading-section">
	          	<span class="subheading">Since 2021</span>
	            <h2 class="mb-4">GETCHA 새로운 맛을 만나다</h2>

	            <p>설명글.</p>
	            <p>설명글.</p>
	            <p class="year">
	            	<strong class="number" data-number="100"></strong>
		            <span>설명글</span>
	            </p>
	          </div>

					</div>
				</div>
			</div>
		</section>

		<section class="ftco-section ftco-no-pb">
			<div class="container">
				<div class="row">
					<div class="col-lg-2 col-md-4 ">
						<div class="sort w-100 text-center ftco-animate">
							<div class="img" style="background-image: url(resources/images/kind-1.jpg);"></div>
							<h3>Brandy</h3>
						</div>
					</div>
					<div class="col-lg-2 col-md-4 ">
						<div class="sort w-100 text-center ftco-animate">
							<div class="img" style="background-image: url(resources/images/kind-2.jpg);"></div>
							<h3>Gin</h3>
						</div>
					</div>
					<div class="col-lg-2 col-md-4 ">
						<div class="sort w-100 text-center ftco-animate">
							<div class="img" style="background-image: url(resources/images/kind-3.jpg);"></div>
							<h3>Rum</h3>
						</div>
					</div>
					<div class="col-lg-2 col-md-4 ">
						<div class="sort w-100 text-center ftco-animate">
							<div class="img" style="background-image: url(resources/images/kind-4.jpg);"></div>
							<h3>Tequila</h3>
						</div>
					</div>
					<div class="col-lg-2 col-md-4 ">
						<div class="sort w-100 text-center ftco-animate">
							<div class="img" style="background-image: url(resources/images/kind-5.jpg);"></div>
							<h3>Vodka</h3>
						</div>
					</div>
					<div class="col-lg-2 col-md-4 ">
						<div class="sort w-100 text-center ftco-animate">
							<div class="img" style="background-image: url(resources/images/kind-6.jpg);"></div>
							<h3>Whiskey</h3>
						</div>
					</div>

				</div>
			</div>
		</section>

		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center pb-5">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<span class="subheading">Our Delightful offerings</span>
            <h2>우리의 즐거운 제안</h2>
          </div>
        </div>
				<div class="row">
					<div class="col-md-3 d-flex">
						<div class="product ftco-animate">
							<div class="img d-flex align-items-center justify-content-center" style="background-image: url(resources/images/prod-1.jpg);">
								<div class="desc">
									<p class="meta-prod d-flex">
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>
									</p>
								</div>
							</div>
							<div class="text text-center">
								<span class="sale">Sale</span>
								<span class="category">Brandy</span>
								<h2>Bacardi 151</h2>
								<p class="mb-0"><span class="price price-sale">$69.00</span> <span class="price">$49.00</span></p>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex">
						<div class="product ftco-animate">
							<div class="img d-flex align-items-center justify-content-center" style="background-image: url(resources/images/prod-2.jpg);">
								<div class="desc">
									<p class="meta-prod d-flex">
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>
									</p>
								</div>
							</div>
							<div class="text text-center">
								<span class="seller">Best Seller</span>
								<span class="category">Gin</span>
								<h2>Jim Beam Kentucky Straight</h2>
								<span class="price">$69.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex">
						<div class="product ftco-animate">
							<div class="img d-flex align-items-center justify-content-center" style="background-image: url(resources/images/prod-3.jpg);">
								<div class="desc">
									<p class="meta-prod d-flex">
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>
									</p>
								</div>
							</div>
							<div class="text text-center">
								<span class="new">New Arrival</span>
								<span class="category">Rum</span>
								<h2>Citadelle</h2>
								<span class="price">$69.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex">
						<div class="product ftco-animate">
							<div class="img d-flex align-items-center justify-content-center" style="background-image: url(resources/images/prod-4.jpg);">
								<div class="desc">
									<p class="meta-prod d-flex">
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>
									</p>
								</div>
							</div>
							<div class="text text-center">
								<span class="category">Rum</span>
								<h2>The Glenlivet</h2>
								<span class="price">$69.00</span>
							</div>
						</div>
					</div>

					<div class="col-md-3 d-flex">
						<div class="product ftco-animate">
							<div class="img d-flex align-items-center justify-content-center" style="background-image: url(resources/images/prod-5.jpg);">
								<div class="desc">
									<p class="meta-prod d-flex">
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>
									</p>
								</div>
							</div>
							<div class="text text-center">
								<span class="category">Whiskey</span>
								<h2>Black Label</h2>
								<span class="price">$69.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex">
						<div class="product ftco-animate">
							<div class="img d-flex align-items-center justify-content-center" style="background-image: url(resources/images/prod-6.jpg);">
								<div class="desc">
									<p class="meta-prod d-flex">
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>
									</p>
								</div>
							</div>
							<div class="text text-center">
								<span class="category">Tequila</span>
								<h2>Macallan</h2>
								<span class="price">$69.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex">
						<div class="product ftco-animate">
							<div class="img d-flex align-items-center justify-content-center" style="background-image: url(resources/images/prod-7.jpg);">
								<div class="desc">
									<p class="meta-prod d-flex">
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>
									</p>
								</div>
							</div>
							<div class="text text-center">
								<span class="category">Vodka</span>
								<h2>Old Monk</h2>
								<span class="price">$69.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex">
						<div class="product ftco-animate">
							<div class="img d-flex align-items-center justify-content-center" style="background-image: url(resources/images/prod-8.jpg);">
								<div class="desc">
									<p class="meta-prod d-flex">
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>
										<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>
									</p>
								</div>
							</div>
							<div class="text text-center">
								<span class="category">Whiskey</span>
								<h2>Jameson Irish Whiskey</h2>
								<span class="price">$69.00</span>
							</div>
						</div>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-md-4">
						<a href="product.html" class="btn btn-primary d-block">View All Products <span class="fa fa-long-arrow-right"></span></a>
					</div>
				</div>
			</div>
		</section>
  
   


		
    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<span class="subheading">Blog</span>
            <h2>Recent Blog</h2>
          </div>
        </div>
        <div class="row d-flex">
          <div class="col-lg-6 d-flex align-items-stretch ftco-animate">
          	<div class="blog-entry d-flex">
          		<a href="blog-single.html" class="block-20 img" style="background-image: url('resources/images/image_1.jpg');">
              </a>
              <div class="text p-4 bg-light">
              	<div class="meta">
              		<p><span class="fa fa-calendar"></span> 23 April 2020</p>
              	</div>
                <h3 class="heading mb-3"><a href="#">The Recipe from a Winemaker’s Restaurent</a></h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                <a href="#" class="btn-custom">Continue <span class="fa fa-long-arrow-right"></span></a>

              </div>
            </div>
          </div>
          <div class="col-lg-6 d-flex align-items-stretch ftco-animate">
          	<div class="blog-entry d-flex">
          		<a href="blog-single.html" class="block-20 img" style="background-image: url('resources/images/image_2.jpg');">
              </a>
              <div class="text p-4 bg-light">
              	<div class="meta">
              		<p><span class="fa fa-calendar"></span> 23 April 2020</p>
              	</div>
                <h3 class="heading mb-3"><a href="#">The Recipe from a Winemaker’s Restaurent</a></h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                <a href="#" class="btn-custom">Continue <span class="fa fa-long-arrow-right"></span></a>

              </div>
            </div>
          </div>
          <div class="col-lg-6 d-flex align-items-stretch ftco-animate">
          	<div class="blog-entry d-flex">
          		<a href="blog-single.html" class="block-20 img" style="background-image: url('resources/images/image_3.jpg');">
              </a>
              <div class="text p-4 bg-light">
              	<div class="meta">
              		<p><span class="fa fa-calendar"></span> 23 April 2020</p>
              	</div>
                <h3 class="heading mb-3"><a href="#">The Recipe from a Winemaker’s Restaurent</a></h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                <a href="#" class="btn-custom">Continue <span class="fa fa-long-arrow-right"></span></a>

              </div>
            </div>
          </div>
          <div class="col-lg-6 d-flex align-items-stretch ftco-animate">
          	<div class="blog-entry d-flex">
          		<a href="blog-single.html" class="block-20 img" style="background-image: url('resources/images/image_4.jpg');">
              </a>
              <div class="text p-4 bg-light">
              	<div class="meta">
              		<p><span class="fa fa-calendar"></span> 23 April 2020</p>
              	</div>
                <h3 class="heading mb-3"><a href="#">The Recipe from a Winemaker’s Restaurent</a></h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                <a href="#" class="btn-custom">Continue <span class="fa fa-long-arrow-right"></span></a>

              </div>
            </div>
          </div>
        </div>
      </div>
    </section>	

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
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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