<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원정보</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/assets/img/favicon.ico">

		<!-- CSS here -->
			<link rel="stylesheet" href="${contextPath}/accom/css/bootstrap-select.min.css"> 
            <link rel="stylesheet" href="${contextPath}/assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/slicknav.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/flaticon.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/price_rangs.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/animate.min.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/magnific-popup.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/themify-icons.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/slick.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/nice-select.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/style.css">
            <link rel="stylesheet" href="${contextPath}/bootstrap/css/bootstrap.min.css">
            
    
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
		background-color:black;
		font-family: 'SpoqaHanSansNeo-Regular';
	}
	
	.container{
		font-size: 18px;
	}
	.form-control {
		font-size: 13px;
	}

}
</style>


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
	

	


        <div class="page-head" style="background-image: url('${contextPath}/assets/img/page-header.jpg'); background-repeat : no-repeat;"> 
            <div class=" container">
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1 profiel-container" style="line-height:125%">
                    <br>
                    <br>                
                    <br>
                    <br>
                    <br>
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header --> 

	        <div class="content-area user-profiel" style="background-color: #FCFCFC;">&nbsp;
	            <div class="container">   
	                <div class="row">
	                    <div class="col-sm-10 col-sm-offset-1 profiel-container">
	                   		<h1 class="page-title">Hello!  <span class="orange strong" style="color: olive;">${loginMember.getMemberNickname()}</span></h1>
							<br>
	                        <div class="profiel-header">
	                            <h2>
	                                YOUR PROFILE <br>
	                            </h2>
	                            <hr>
	                        </div>
	                        <div class="clear"> 
	                            <div class="col-sm-5">
	                                <div class="form-group">
	                                    <label>First Name</label>
	                                    <input name="firstname" type="text" class="form-control" id="firstname" name="firstname" placeholder="성" value="${loginMember.memberFirstName}" readonly="readonly">
	                                </div>
	                                <div class="form-group">
	                                    <label>Last Name </label>
	                                    <input name="lastname" type="text" class="form-control" id="lastname" name="lastname" placeholder="이름" value="${loginMember.memberLastName}" readonly="readonly">
	                                </div> 
	                                <div class="form-group">
	                                    <label>Email</label>
	                                    <input name="email" type="email" id="email" name="email" class="form-control" placeholder="이메일" value="${loginMember.memberEmail}" readonly="readonly">
	                                </div> 
	                                <div class="form-group">
	                                    <label>Phone</label>
	                                    <input name="phone" type="number" class="form-control" id="phone" name="phone" placeholder="전화번호" value="${loginMember.memberPhone}" readonly="readonly">
	                                </div> 
	                            </div>
	                            <div class="col-sm-5">
	                                <div class="form-group">
	                                  <label>우편번호</label>
	                                  <input type="number" class="form-control" id="postalCode" name="postalCode" placeholder="우편번호" value="${loginMember.memberAddress.memberAddressPostalCode}" readonly="readonly">
	                             	</div>
	                            	<div class="form-group" style="line-height:168%">
	                             		<br> 
	                                  <input type="text" class="form-control" id="roadAddress" name="roadAddress" placeholder="도로명주소" value="${loginMember.memberAddress.memberAddressZip}" readonly="readonly">
	                            	</div>
	                            	<div class="form-group" style="line-height:169%">
	                            	 	<br> 
	                                  <input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세주소" value="${loginMember.memberAddress.memberAddressDetail}" readonly="readonly">
	                              </div>
	                            </div>  
	
	                        </div>
	                       	<div class="clear">
	                       		<div class="col-sm-20">
	                            	<hr>
	                                <div class="form-group">
	                                    <label>Description</label>
	                                    <textarea rows="5" style="width: 78.7%;" id="description" name="description" placeholder="자기소개" readonly="readonly">${loginMember.memberDescription }</textarea>
	                                </div>
	                           	</div>
	                       	</div>
	                       	<div class="col-sm-20 col-sm-offset-1" style="text-align: right;">
	                            <br>
	                            <a href="${contextPath}/member/pwCheck?route=1" class='btn btn-finish btn-primary'>수정</a>
	                        </div>
	                        <br>
		            	</div>
	                </div>
	                <br>
	                <div><a href="${contextPath}/member/pwCheck?route=2" class="btn">닉네임변경</a></div>
	   				<div><a href="${contextPath}/member/pwCheck?route=3" class="btn">비밀번호변경</a></div>
	   				<div><a href="${contextPath}/member/pwCheck?route=4" class="btn">회원탈퇴</a></div>
	            </div>
	    	</div>


	
	</main>


	<c:import url="/WEB-INF/jsp/partial/footer.jsp"/>
    
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