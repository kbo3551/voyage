<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<title>로그인</title>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	
	h2, label {
		color:white;
	}
	
	.btn:hover {
		color: black;
		
	}
	
	.btn:before {
		background: rgb(190,255,255);
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
		
		<!-- Hero Area Start-->
        <div class="slider-area hero-overly">
            <div class="single-slider hero-overly  slider-height d-flex align-items-center">
		            <div class="container" style="margin-top: 128px">
		
		                <div class="col-md-6">
		                    <div class="box-for overflow">                         
		                        <div class="col-md-12 col-xs-12 login-blocks">
		                        
 									<c:choose>
 										<c:when test="${failed == '1'}">
 											<p style="color: red; font-weight: bold;">아이디 또는 비밀번호를 틀렸습니다.</p>
 										</c:when>
 										<c:when test="${failed == '2'}">
 											<p style="color: red; font-weight: bold;">탈퇴한 회원입니다.</p>
 										</c:when>
 										<c:when test="${failed == '3'}">
 											<p style="color: red; font-weight: bold;">정지당한 회원입니다.</p>
 										</c:when>
 									</c:choose>
 									
		                            <h2>Login</h2> 
		                            <form id="login" action="${contextPath}/login" method="post">
			                                	<label for="id">User ID</label>
		                                <div class="form-group">
			                                    <input type="text" class="form-control" id="id" name="id">
		                                </div>
		                                <div class="form-group" style="clear: both;">
		                                    <label for="password">Password</label>
		                                    <input type="password" class="form-control" id="password" name="password">
		                                </div>
		                                <div class="text-center">
		                                    <button type="button" class="btn" style="background: rgb(0,172,238);
                                    		background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(2,126,251,1) 100%);
                                    		"
                                    		onclick="loginAction()"
                                    		> Log in</button>
		                                    
		                                </div>
		                            </form>
		                            <br>
		                            
		                            <h2>Social login</h2> 
		                            
		                            <p>
		                             <a href="#"><i class="fab fa-facebook-f"></i></a>
	                                <a href="#"><i class="fab fa-twitter"></i></a>
	                                <a href="#"><i class="fas fa-globe"></i></a>
		                            </p> 
		                        </div>
		                        
		                        <div class="text-center">
                                    <a href="${contextPath}/addMember"><button type="submit" class="btn" style="background: rgb(0,172,238);
                                    background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(2,126,251,1) 100%);
                                    ">sign up</button></a>
                                </div>
		                        
		                    </div>
		                </div>
		                
		                <script type="text/javascript">
			             	// 유효성 검사
	                        function loginAction(){
								if($("#id").val() == ""){
									alert('ID를 입력해주세요.');
									return;
								} else if($("#password").val() == ""){
									alert('패스워드를 입력해주세요.');
									return;
								} else {
									login.submit();
								}
							};
		                </script>
		
		            </div>
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