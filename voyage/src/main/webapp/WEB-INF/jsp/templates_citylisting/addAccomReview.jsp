<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
        	$(function(){
        		var ck = false;
        		
        		// 유효성 검사를 위한 변수 생성
        		var valAccomPaymentDetails = $('#accomPaymentDetails').val();
        		var valAccomReviewTitle = $('#accomReviewTitle').val();
        		var valAccomReviewContent = $('#accomReviewContent').val();
	       		// 이미지 추가 버튼 눌렀을 때
        		$('#addImgBtn').click(function(){
        			let html = '<div><input type="file" name="accomReviewImage" id="accomReviewImage"></div>';
        			$('#Imageinput').append(html);
        		});
        		// 이미지 삭제 버튼 눌렀을 때
        		$('#removeImgBtn').click(function(){
        			$('#Imageinput').children().last().remove();
        		});
        		// send 버튼 눌렀을 때
        		$('#sendABtn').click(function(){
					if(valAccomPaymentDetails == null || valAccomPaymentDetails == undifined || valAccomPaymentDetails == ""){
						alert('결제정보가 없습니다. 이용 완료후 작성 해주세요.');
						location.href = '/voyage/index';
						return;
					}
					if(valAccomReviewTitle == null || valAccomReviewTitle == undifined || valAccomReviewTitle == ""){
						alert('제목이 입력되지 않았습니다. 제목을 입력해주세요.');
						$('#accomReviewTitle').focus();
						return;
					}
					
					if(valAccomReviewContent == null || valAccomReviewContent == defined || valAccomReviewContent == ""){
						alert('내용이 입력되지 않았습니다. 내용을 입력해주세요.');
						$('#accomReviewContent').focus();
						return;
					}
        		 	ck = true;
        			// index : 이미지 파일명, item : 파일 경로
        			$('#accomReviewImage').each(function(index, item){
        				console.log($(item).val());
        				if($(item).val() == ''){
        					ck = false;	
        				}
        			});
        			// 만약 이미지 파일을 선택하지 않았다면
        			if(ck == false){
        				alert('이미지 파일을 선택해주세요');
        			}
        			$('#addAccomReviewForm').submit();
        		});
        	});
        </script>
        
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- <link rel="manifest" href="site.webmanifest"> -->
		<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

		<!-- CSS here -->
            <link rel="stylesheet" href="assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="assets/css/slicknav.css">
            <link rel="stylesheet" href="assets/css/flaticon.css">
            <link rel="stylesheet" href="assets/css/animate.min.css">
            <link rel="stylesheet" href="assets/css/magnific-popup.css">
            <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="assets/css/themify-icons.css">
            <link rel="stylesheet" href="assets/css/slick.css">
            <link rel="stylesheet" href="assets/css/nice-select.css">
            <link rel="stylesheet" href="assets/css/style.css">
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
<body>
   <body>
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
   	<!-- 배너 : 시작 -->
  	<c:import url="../partial\\banner.jsp"/>
   	<!-- 배너 : 끝 -->

    <main>

        <!-- Hero Start-->
        <div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center pt-50">
                            <h2>후기 작성</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Hero End -->
        <!-- Listing caption start-->
        <div class="listing-caption section-padding2">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                       <p class="mb-30">솔직한 후기를 작성해주세요.</p>
                    </div>
                </div>
                
                <!-- From -->
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                    	<!-- 원본 : Massage -->
                        <h3 class="mb-40">Review</h3>
                        <!-- Form -->
                        <form method="post" class="form-contact contact_form mb-80" action="${pageContext.request.contextPath}/addAccomReview" enctype="multipart/form-data" id="accomReviewForm">
                            <div class="row">
                                <div class="col-sm-6">
                                	<div class="form-group">
                                		<input class="form-controle error"  hidden="hidden" name="accomReview.accomReviewPaymentDetails" id="accomReviewPaymentDetails" type="text" value="${accomReview.accomReviewPaymentDetails}">
                                	</div>
                                	<div class="form-group">
                                		<input class="form-controle error"  hidden="hidden" name="accomReview.memberId" id="memberId" type="text" value="${accomReview.memberId}">
                                	</div>
                                    <div class="form-group">
                                    	 <input class="form-control error" name="accomReview.memberNickname" id="memberNickname" type="text" value="${accomReview.memberNickname}" placeholder="닉네임을 입력해주세요">
                                    </div>
                                    <div class="form-group">
	                                    <input class="form-control error" name="accomReview.accomReviewTitle" id="accomReviewTitle" type="text"	placeholder="제목을 입력해주세요">
  									</div>			
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control w-100 error" name="accomReview.accomReviewContent" id="accomReviewContent" cols="30" rows="9" placeholder="내용을 입력해주세요. 이미지 파일을 첨부해주시면 도움이 됩니다."></textarea>
                                    </div>
                                </div>
                                <div>파일 첨부</div>
                                <div>
                                	<button type="button" id="addImgBtn">Add Img</button>
                                	<button type="button" id="removeImgBtn">Del Img</button>
                                </div>
                                <div id="Imageinput"></div>
                            </div>
                            <div class="form-group mt-3">
                            	<!-- 원본 버튼 : Send  -->
                            	<a type="button" href="${pageContext.request.contextPath}/getAccomReviewList" class="button button-contactForm boxed-btn">Back</a>
                                <button type="submit" id="sendABtn" class="button button-contactForm boxed-btn">Send</button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- listing Details Stat-->
                <div class="listing-details-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-6">
                                <div class="single-listing mb-30">
                                    <div class="list-img">
                                        <img src="assets/img/gallery/list1.png" alt="">
                                        <!-- <span>Open</span> -->
                                    </div>
                                    <div class="list-caption">
                                        <span>Open</span>
                                         <h3><a href="listing_details.html">Saintmartine</a></h3>
                                        <p>700/D, Kings road, Green lane, 85/ London</p>
                                        <div class="list-footer">
                                            <ul>
                                                <li>+10 278 367 9823</li>
                                                <li>contact@midnight.com</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="single-listing mb-30">
                                    <div class="list-img">
                                        <img src="assets/img/gallery/list2.png" alt="">
                                        <!-- <span>Open</span> -->
                                    </div>
                                    <div class="list-caption">
                                        <span>Open</span>
                                         <h3><a href="listing_details.html">Saintmartine</a></h3>
                                        <p>700/D, Kings road, Green lane, 85/ London</p>
                                        <div class="list-footer">
                                            <ul>
                                                <li>+10 278 367 9823</li>
                                                <li>contact@midnight.com</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="single-listing mb-30">
                                    <div class="list-img">
                                        <img src="assets/img/gallery/list3.png" alt="">
                                        <!-- <span>Open</span> -->
                                    </div>
                                    <div class="list-caption">
                                        <span>Open</span>
                                         <h3><a href="listing_details.html">Saintmartine</a></h3>
                                        <p>700/D, Kings road, Green lane, 85/ London</p>
                                        <div class="list-footer">
                                            <ul>
                                                <li>+10 278 367 9823</li>
                                                <li>contact@midnight.com</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- listing Details End -->
            </div>
        </div>
        <!-- Listing caption End-->

    </main>
    <footer>
        <!-- Footer Start-->
        <div class="footer-area">
            <div class="container">
               <div class="footer-top footer-padding">
                    <div class="row justify-content-between">
                        <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <div class="single-footer-caption mb-30">
                                    <!-- logo -->
                                    <div class="footer-logo">
                                        <a href="index.html"><img src="assets/img/logo/logo2_footer.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-2 col-md-4 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>Quick Link</h4>
                                    <ul>
                                        <li><a href="#">Home</a></li>
                                        <li><a href="#">Listing</a></li>
                                        <li><a href="#">About</a></li>
                                        <li><a href="#">Contact</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>Categories</h4>
                                    <ul>
                                        <li><a href="#">Reasonable Hotel</a></li>
                                        <li><a href="#">Popular Restaurant</a></li>
                                        <li><a href="#">Easy Shopping</a></li>
                                        <li><a href="#">Night Life</a></li>     
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>Download App</h4>
                                    <ul>
                                        <li class="app-log"><a href="#"><img src="assets/img/gallery/app-logo.png" alt=""></a></li>
                                        <li><a href="#"><img src="assets/img/gallery/app-logo2.png" alt=""></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
               </div>
                <div class="footer-bottom">
                    <div class="row d-flex justify-content-between align-items-center">
                        <div class="col-xl-9 col-lg-8">
                            <div class="footer-copy-right">
                                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-4">
                            <!-- Footer Social -->
                            <div class="footer-social f-right">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fas fa-globe"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
        </div>
        <!-- Footer End-->
    </footer>
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>


    <!-- JS here -->
		<!-- All JS Custom Plugins Link Here here -->
        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
		<!-- Jquery, Popper, Bootstrap -->
		<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="./assets/js/wow.min.js"></script>
		<script src="./assets/js/animated.headline.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>

		<!-- Nice-select, sticky -->
        <script src="./assets/js/jquery.nice-select.min.js"></script>
		<script src="./assets/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>
<!-- 별점 -->
<div class="star-rating">
  <input type="radio" id="5-stars" name="rating" value="5" />
  <label for="5-stars" class="star">&#9733;</label>
  <input type="radio" id="4-stars" name="rating" value="4" />
  <label for="4-stars" class="star">&#9733;</label>
  <input type="radio" id="3-stars" name="rating" value="3" />
  <label for="3-stars" class="star">&#9733;</label>
  <input type="radio" id="2-stars" name="rating" value="2" />
  <label for="2-stars" class="star">&#9733;</label>
  <input type="radio" id="1-star" name="rating" value="1" />
  <label for="1-star" class="star">&#9733;</label>
</div>
</body>
</html>