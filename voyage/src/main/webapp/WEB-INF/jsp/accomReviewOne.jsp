<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Directory HTML-5 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/slicknav.css">
<link rel="stylesheet" href="assets/css/flaticon.css">
<link rel="stylesheet" href="assets/css/price_rangs.css">
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
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SpoqaHanSansNeo-Regular.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'SpoqaHanSansNeo-Regular';
}

#di {
	height: auto;
	max-width: 80%;
	text-align: center;
}
</style>
<body>
	<!-- 배너 : 시작 -->
	<c:import url="/WEB-INF/jsp/partial/banner.jsp" />
	<!-- 배너 : 끝 -->

	<main class="content">
		<!-- Hero Start-->
		<div class="hero-area3 hero-overly2 d-flex align-items-center ">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-xl-8 col-lg-9">
						<div class="hero-cap text-center pt-50 pb-20">
							<h2>숙소 리뷰</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="container">
			<div align="center">
				<div id="di" class="card text-white bg-info mb-3">
					<div class="card-header">조회수 :${accomReview.accomReviewViewCnt} &nbsp; 별점 :${accomReview.accomReviewStar}</div>
					<div class="card-body">
						<h4 class="card-title">${accomReview.accomReviewTitle}</h4>
						<p class="card-text">${accomReview.accomReviewContent}</p>
					</div>
					<div>create Date : ${accomReview.createDate}</div>
					<div>update Date : ${accomReview.updateDate}</div>
				</div>
			</div>
		</div>
	</main>

	<!--footer.jsp 시작  -->
	<c:import url="/WEB-INF/jsp/partial/footer.jsp" />
	<!--footer.jsp 끝  -->
	<!-- Scroll Up -->
	<div id="back-top">
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
	<script src="./assets/js/price-range.js"></script>
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

</body>
</html>