<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>회원가입</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
                    <img src="assets/img/logo/loder.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
    
    
    <c:import url="partial\\banner.jsp"/>

	
        
	<main>
		
		<!-- Hero Area Start-->
        <div class="slider-area hero-overly">
            <div class="single-slider hero-overly  slider-height d-flex align-items-center">
		            <div class="container" style="margin-top: 128px">
		            <!-- 
		                <div class="col-md-6">
		                    <div class="box-for overflow">
		                        <div class="col-md-12 col-xs-12 register-blocks">
		                            <h2 style="color:white">New account</h2> 
		                            <form action="" method="post">
		                                <div class="form-group">
		                                    <label for="name">Name</label>
		                                    <input type="text" class="form-control" id="name">
		                                </div>
		                                <div class="form-group">
		                                    <label for="email">Email</label>
		                                    <input type="text" class="form-control" id="email">
		                                </div>
		                                <div class="form-group">
		                                    <label for="password">Password</label>
		                                    <input type="password" class="form-control" id="password">
		                                </div>
		                                <div class="text-center">
		                                    <button type="submit" class="btn btn-default">Register</button>
		                                </div>
		                            </form>
		                        </div>
		                    </div>
		                </div>
		            -->
		
		                <div class="col-md-6">
		                    <div class="box-for overflow">                         
		                        <div class="col-md-12 col-xs-12 login-blocks">
		                            <h2>Sign up</h2> 
		                            <br>
		                            <br>
		                            <form action="" method="post">
		                                <div class="form-group">
		                                    <label for=id>User ID Check</label>
		                                    <div>
		                                    	<input type="text" class="form-control" id="idCheck" placeholder="아이디입력">
		                                   		<input type="button" class="btn" style="background: rgb(0,172,238);
		                                   			   background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(2,126,251,1) 100%);"
			                                    onclick="idCheck()" value="중복검사"> 
		                                    </div>
		                                            
		                                </div>
                                	</form> 
                                	<form action="" method="post">
                                		<div class="form-group">
		                                    <label for=id>User ID</label>
		                                    <input type="text" class="form-control" id="id" placeholder="체크한 아이디가 이곳에 들어옵니다." disabled="disabled">
		                                </div>
		                                <div class="form-group">
		                                    <label for="password">Password</label>
		                                    <input type="password" class="form-control" placeholder="패스워드" id="password">
		                                    <input type="password" class="form-control" placeholder="패스워드확인" id="password2">
		                                </div>
										<div class="form-group">
		                                    <label for="firstname">First name</label>
		                                    <input type="text" class="form-control" placeholder="성" id="firstname">
		                                </div>
		                                <div class="form-group">
		                                    <label for="lastname">Last name</label>
		                                    <input type="text" class="form-control" placeholder="이름" id="lastname">
		                                </div>
		                                <div class="form-group">
		                                    <label for="nickname">Nick name</label>
		                                    <input type="text" class="form-control" placeholder="닉네임" id="nickname">
		                                </div>
		                                <div class="form-group">
		                                    <label for="phone">Phone</label>
		                                    <input type="tel" class="form-control" placeholder="전화번호 ( - 빼고 입력해주세요)" id="phone">
		                                </div>
		                                <div class="form-group">
		                                    <label for="email">Email</label>
		                                    <input type="email" class="form-control" placeholder="이메일" id="email">
		                                </div>
		                                <div class="form-group">
		                                    <label for="socialsecuritynumber">주민등록번호</label>
		                                    <div>
		                                    	<input type="password" class="form-control" placeholder="주민등록번호 ( - 빼고 입력해주세요)" id="socialsecuritynumber">
		                                    </div>
		                                    
		                                    
		                                </div>
		                                <div class="form-group">
		                                    <label for="address">Post Code</label>
		                                    <input type="button" class="btn" style="background: rgb(0,172,238);
	                                   			   background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(2,126,251,1) 100%);"
		                                    onclick="execDaumPostcode()" value="우편번호">
		                                    <input type="text" class="form-control" id="postalCode" placeholder="버튼을 클릭해 우편번호 찾기를 진행해주세요" disabled="disabled">
		                                    <input type="text" class="form-control" id="roadAddress" placeholder="도로명주소가 입력됩니다." disabled="disabled">
		                                    <input type="text" class="form-control" id="detailAddress" placeholder="상세주소">
		                                </div>
   
		                                <div class="form-group">
		                                    <label for="description">Description</label>
		                                    <textarea class="form-control" id="description">안녕하세요.</textarea>
		                                </div>
		                                <div class="text-center">
	                                   		<button type="button" class="btn" style="background: rgb(0,172,238);
	                                   				background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(138,212,3,1) 100%);">
	                                   				 회원가입</button>         
                                		</div>
		                            </form>
		                            <br>
		                            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		                            <script>
			                            function execDaumPostcode() {
			                                new daum.Postcode({
			                                    oncomplete: function(data) {
			                                        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			                                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                                        var roadAddr = data.roadAddress; // 도로명 주소 변수
			                                        var extraRoadAddr = ''; // 참고 항목 변수
	
			                                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                                            extraRoadAddr += data.bname;
			                                        }
			                                        // 건물명이 있고, 공동주택일 경우 추가한다.
			                                        if(data.buildingName !== '' && data.apartment === 'Y'){
			                                           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                                        }
			                                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                                        if(extraRoadAddr !== ''){
			                                            extraRoadAddr = ' (' + extraRoadAddr + ')';
			                                        }
	
			                                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                                        document.getElementById('postalCode').value = data.zonecode;
			                                        document.getElementById("roadAddress").value = roadAddr;
			                                    }
			                                }).open();
			                            }
		                            </script>
		                            
		                        </div> 
		                    </div>
		                </div>
		
		            </div>
		        </div>
            </div>
	
	</main>
    
    <c:import url="partial\\footer.jsp"/>
    
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
        
</body>
</html>