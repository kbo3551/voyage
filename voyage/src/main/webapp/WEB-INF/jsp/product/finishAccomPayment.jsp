<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js">
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>VOYAGE | addAccomBuilding</title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/assets/img/favicon.ico">
		
		<link rel="stylesheet" href="${contextPath}/accom/css/bootstrap-select.min.css"> 
		<link rel="stylesheet" href="${contextPath}/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${contextPath}/accom/css/wizard.css">
		<link rel="stylesheet" href="${contextPath}/accom/css/style.css">
		<link rel="stylesheet" href="${contextPath}/accom/css/icheck.min_all.css">

		<!-- CSS here -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/slicknav.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/flaticon.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/price_rangs.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animate.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/themify-icons.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/slick.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/nice-select.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
            
		 <!-- 눈누 - 한산스네오 레귤러 폰트 -->
		<style type="text/css">
		
			@font-face {
			    font-family: 'SpoqaHanSansNeo-Regular';
			    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SpoqaHanSansNeo-Regular.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			
			body {
				background-color:black;
				font-family: 'SpoqaHanSansNeo-Regular';
			}
			
			.container{
				font-size: 18px;
			}
			.form-control {
				font-size: 13px;
			}
			
			.header-area {
			    border-bottom: 0px;
			}
			
			.profiel-container {
			    border: 0px;
			}
		</style>
		
    </head>
    
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
    <script type="text/javascript">
    
	    var IMP = window.IMP; // 생략 가능
	    IMP.init("imp56049127"); // 예: imp00000000
    
	    function requestPay() {
	      // IMP.request_pay(param, callback) 결제창 호출
	      IMP.request_pay({ // param
	          pg: "html5_inicis",
	          pay_method: "card",
	          merchant_uid: "ORD20180131-0000011",
	          name: "노르웨이 회전 의자",
	          amount: 64900,
	          buyer_email: "gildong@gmail.com",
	          buyer_name: "홍길동",
	          buyer_tel: "010-4242-4242",
	          buyer_addr: "서울특별시 강남구 신사동",
	          buyer_postcode: "01181"
	      }, function (rsp) { // callback
		          if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
		              // jQuery로 HTTP 요청
		              jQuery.ajax({
		                  url: "/voyage/", // 예: https://www.myservice.com/payments/complete
		                  method: "POST",
		                  headers: { "Content-Type": "application/json" },
		                  data: {
		                      imp_uid: rsp.imp_uid,
		                      merchant_uid: rsp.merchant_uid
		                  }
		              }).done(function (data) {
		                // 가맹점 서버 결제 API 성공시 로직
		              })
		            } else {
		              alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
		            }
	          });
	    }
   </script>
    
    
    <body>
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="${contextPath}/assets/img/logo/loder.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
    
   	<c:import url="/WEB-INF/jsp/partial/banner.jsp"/>
   	
	<main>
	
	<!-- Hero Start-->
    <div class="hero-area3 hero-overly2 d-flex align-items-center ">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-8 col-lg-9">
                    <div class="hero-cap text-center pt-50 pb-20">
                        <h2>객실 상세</h2>
                    </div>
                    <!--Hero form -->
                
                </div>
            </div>
        </div>
    </div>
    <!--Hero End -->
	
	<!-- property area -->
	<div class="content-area submit-property">
		<div class="container" style="background-color: #FCFCFC;">
			<div class="clearfix">
				<div class="wizard-container">
	
					<div class="wizard-card ct-wizard-orange" id="wizardProperty">
						<form action="${contextPath}/host/addAccomBuilding" method="post" enctype="multipart/form-data" id="accomBuildingForm">
							<div class="wizard-header">
								<h3 class="pt-15 pb-15">
									<b>Reservation</b> _accomodation<br>
									<small>숙소 결제 정보를 확인하세요.</small>
								</h3>
							</div>
	
							<ul>
								<li><a href="#step4" class="reservation" data-toggle="tab">Finished </a></li>
							</ul>
	
							<div class="tab-content" style="padding-left: 46%;">
								<h2>결제 성공!</h2>
							</div>
	
							<div class="wizard-footer">
								<div class="pull-center">
<!-- 									<button type='button' class='btn btn-next btn-primary' style="background-color: #BD83CE; color: #fff;" name='next' value='Next' /> -->
								</div>
								<div class="clearfix"></div>
							</div>
						</form>
					</div>
					<!-- End submit form -->
				</div>
			</div>
		</div>
	</div>
	
	</main>
	<!--footer.jsp 시작  -->
    	<c:import url="/WEB-INF/jsp/partial/footer.jsp"/>
    <!--footer.jsp 끝  -->
    
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>
    
    <!-- JS here -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
    
		<!-- All JS Custom Plugins Link Here here -->
<%--         <script src="${pageContext.request.contextPath}/assets/js/vendor/modernizr-3.5.0.min.js"></script> --%>
		<!-- Jquery, Popper, Bootstrap -->
<%-- 		<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script> --%>
<%--         <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script> --%>
<%--         <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script> --%>
	    <!-- Jquery Mobile Menu -->
<%--         <script src="${pageContext.request.contextPath}/assets/js/jquery.slicknav.min.js"></script> --%>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
<%--         <script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script> --%>
<%--         <script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script> --%>
		<!-- One Page, Animated-HeadLin -->
        <script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
<%--         <script src="${pageContext.request.contextPath}/assets/js/price-range.js"></script> --%>
<%-- 		<script src="${pageContext.request.contextPath}/assets/js/animated.headline.js"></script> --%>
<%--         <script src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.js"></script> --%>

		<!-- Nice-select, sticky -->
<%--         <script src="${pageContext.request.contextPath}/assets/js/jquery.nice-select.min.js"></script> --%>
<%-- 		<script src="${pageContext.request.contextPath}/assets/js/jquery.sticky.js"></script> --%>
        
        <!-- contact js -->
<%--         <script src="${pageContext.request.contextPath}/assets/js/contact.js"></script> --%>
<%--         <script src="${pageContext.request.contextPath}/assets/js/jquery.form.js"></script> --%>
<%--         <script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script> --%>
<%--         <script src="${pageContext.request.contextPath}/assets/js/mail-script.js"></script> --%>
<%--         <script src="${pageContext.request.contextPath}/assets/js/jquery.ajaxchimp.min.js"></script> --%>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	<script src="${contextPath}/accom/js/vendor/modernizr-2.6.2.min.js"></script>
    <script src="${contextPath}/accom/js//jquery-1.10.2.min.js"></script>
    <script src="${contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${contextPath}/accom/js/bootstrap-select.min.js"></script>
    <script src="${contextPath}/accom/js/bootstrap-hover-dropdown.js"></script>
    <script src="${contextPath}/accom/js/easypiechart.min.js"></script>
    <script src="${contextPath}/accom/js/jquery.easypiechart.min.js"></script>
    <script src="${contextPath}/accom/js/owl.carousel.min.js"></script>
    <script src="${contextPath}/accom/js/wow.js"></script>
    <script src="${contextPath}/accom/js/icheck.min.js"></script>

    <script src="${contextPath}/accom/js/price-range.js"></script> 
    <script src="${contextPath}/accom/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
    <script src="${contextPath}/accom/js/jquery.validate.min.js"></script>
    <script src="${contextPath}/accom/js/wizard.js"></script>

    <script src="${contextPath}/accom/js/main.js"></script>
    
    <script src="${contextPath}/accom/js/total-price.js"></script>

</body>
</html>