<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>후기</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/assets/img/favicon.ico">

		<!-- CSS here -->
          <link rel="stylesheet" href="${contextPath}/assets/css/bootstrap.min.css">
		  <link rel="stylesheet" href="${contextPath}/assets/css/owl.carousel.min.css">
		  <link rel="stylesheet" href="${contextPath}/assets/css/slicknav.css">
		  <link rel="stylesheet" href="${contextPath}/assets/css/flaticon.css">
		  <link rel="stylesheet" href="${contextPath}/assets/css/animate.min.css">
		  <link rel="stylesheet" href="${contextPath}/assets/css/magnific-popup.css">
		  <link rel="stylesheet" href="${contextPath}/assets/css/fontawesome-all.min.css">
		  <link rel="stylesheet" href="${contextPath}/assets/css/themify-icons.css">
		  <link rel="stylesheet" href="${contextPath}/assets/css/slick.css">
		  <link rel="stylesheet" href="${contextPath}/assets/css/nice-select.css">
		  <link rel="stylesheet" href="${contextPath}/assets/css/style.css">
   </head>
	
	<!-- 눈누 - 한산스네오 레귤러 폰트 -->
	<style type="text/css">
	
		@font-face {
		    font-family: 'SpoqaHanSansNeo-Regular';
		    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SpoqaHanSansNeo-Regular.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
		body {
			font-family: 'SpoqaHanSansNeo-Regular';
		}
		
	</style>
	
	<!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/loder.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
	
   <body>
    <!-- 배너 : 시작 -->
    <c:import url="/WEB-INF/jsp/partial/banner.jsp"/>
    <!-- 배너 : 끝 -->

    <main>

        <!-- Hero Start-->
        <div class="hero-area3 hero-overly2 d-flex align-items-center ">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-9">
                        <div class="section-tittle text-center mb-80">
                            <span>We are offering for you</span>
                            <h2 style="color: white">Featured Categories</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Categories Area Start -->
        <div class="categories-area section-padding30">
            <div class="container">
                <div class="row">
                	<div class="col-lg-30 col-md-6 col-sm-6">
                        <div class="single-cat text-center mb-50">
                            <a href="${contextPath}/getActivityReviewList">
	                            <div class="cat-icon">
	                                <span class="flaticon-drink"></span>
	                            </div>
	                            <div class="cat-cap">
	                                <h5>체험</h5>
	                                <p>체험 후기</p>
	                                View Details
	                            </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-30 col-md-6 col-sm-6">
                        <div class="single-cat text-center mb-50">
                        	<a href="${contextPath}/getAccomReviewList">
	                            <div class="cat-icon">
	                                <span class="flaticon-bed"></span>
	                            </div>
	                            <div class="cat-cap">
	                                <h5>숙소</h5>
	                                <p>숙소 후기</p>
	                                View Details
	                            </div>
                            </a>
                        </div>
                    </div>
                 </div>
            </div>
        </div>
        <!-- Categories Area End -->

    </main>
    <!--footer.jsp 시작  -->
    <c:import url="/WEB-INF/jsp/partial/footer.jsp"/>
    <!--footer.jsp 끝  -->
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>


    <!-- JS here -->
		<!-- All JS Custom Plugins Link Here here -->
        <script src="${contextPath}/assets/js/vendor/modernizr-3.5.0.min.js"></script>
		<!-- Jquery, Popper, Bootstrap -->
		<script src="${contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="${contextPath}/assets/js/popper.min.js"></script>
        <script src="${contextPath}/assets/js/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="${contextPath}/assets/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="${contextPath}/assets/js/owl.carousel.min.js"></script>
        <script src="${contextPath}/assets/js/slick.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="${contextPath}/assets/js/wow.min.js"></script>
		<script src="${contextPath}/assets/js/animated.headline.js"></script>
        <script src="${contextPath}/assets/js/jquery.magnific-popup.js"></script>

		<!-- Nice-select, sticky -->
        <script src="${contextPath}/assets/js/jquery.nice-select.min.js"></script>
		<script src="${contextPath}/assets/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="${contextPath}/assets/js/contact.js"></script>
        <script src="${contextPath}/assets/js/jquery.form.js"></script>
        <script src="${contextPath}/assets/js/jquery.validate.min.js"></script>
        <script src="${contextPath}/assets/js/mail-script.js"></script>
        <script src="${contextPath}/assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="${contextPath}/assets/js/plugins.js"></script>
        <script src="${contextPath}/assets/js/main.js"></script>
        
    </body>
</html>