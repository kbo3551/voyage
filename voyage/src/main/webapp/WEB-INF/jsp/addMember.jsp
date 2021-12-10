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
		                            <c:choose>
		                            	<c:when test="${param.duplication == 'id'}">
		                            		<p style="color: red; font-weight: bold;">이미 사용중인 아이디입니다.</p>
		                            	</c:when>
		                            	<c:when test="${param.duplication == 'nickname'}">
		                            		<p style="color: red; font-weight: bold;">이미 사용중인 닉네임입니다.</p>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<br>
		                            	</c:otherwise>
		                            </c:choose>
		                             
                                	<form name="AddMember" action="${pageContext.request.contextPath}/addMember" method="post">
                                		<div class="form-group">
		                                    <label for=id>User ID</label>
		                                    
		                                    <input type="text" class="form-control" id="id" name="id" placeholder="아이디입력 *" <c:if test="${param.duplication != 'id'}">value="${member.getMemberId()}"</c:if>>
		                                </div>
		                                <div class="form-group">
		                                    <label for="password">Password</label>
		                                    <input type="password" class="form-control" placeholder="패스워드 *" id="password" name="password">
		                               	</div>
		                               	<div class="form-group">
		                               		<br>  
		                                    <input type="password" class="form-control" placeholder="패스워드확인 *" id="password2">
		                                </div>
										<div class="form-group">
		                                    <label for="firstname">First name</label>
		                                    <input type="text" class="form-control" placeholder="성 *" id="firstname" name="firstname" value="${member.getMemberFirstName()}">
		                                </div>
		                                <div class="form-group">
		                                    <label for="lastname">Last name</label>
		                                    <input type="text" class="form-control" placeholder="이름 *" id="lastname" name="lastname" value="${member.getMemberLastName()}">
		                                </div>
		                                <div class="form-group">
		                                    <label for="nickname">Nick name</label>
		                                    <input type="text" class="form-control" placeholder="닉네임 *" id="nickname" name="nickname" <c:if test="${param.duplication != 'nickname'}">value="${member.getMemberNickname()}"</c:if>>
		                                </div>
		                                <div class="form-group">
		                                    <label for="phone">Phone</label>
		                                    <input type="tel" class="form-control" placeholder="전화번호 ( - 빼고 입력해주세요) *" id="phone" name="phone" value="${member.getMemberPhone()}">
		                                </div>
		                                <div class="form-group">
		                                    <label for="email">Email</label>
		                                    <input type="email" class="form-control" placeholder="이메일 *" id="email" name="email" value="${member.getMemberEmail()}">
		                                </div>
		                                <div class="form-group">
		                                    <label for="socialsecuritynumber">주민등록번호</label>
		                                    <div>
		                                    	<input type="password" class="form-control" placeholder="주민등록번호 ( - 빼고 입력해주세요) *" id="socialsecuritynumber" name="socialsecuritynumber">
		                                    </div>
		                                   
		                                    
		                                </div>
		                                <div class="form-group">
		                                    <label for="address">Post Code</label>
		                                    <input type="button" class="btn" style="background: rgb(0,172,238);
	                                   			   background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(2,126,251,1) 100%);"
		                                    onclick="execDaumPostcode()" value="우편번호">
		                                    <input type="number" class="form-control" id="postalCode" name="postalCode" placeholder="버튼을 클릭해 우편번호 찾기를 진행해주세요 *" readonly="readonly">
		                               	</div>
		                              	<div class="form-group">
		                               		<br>  
		                                    <input type="text" class="form-control" id="roadAddress" name="roadAddress" placeholder="도로명주소가 입력됩니다." readonly="readonly">
		                              	</div>
		                              	<div class="form-group">
		                              	 	<br>     
		                                    <input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세주소">
		                                </div>
   
		                                <div class="form-group">
		                                    <label for="description">Description</label>
		                                    <textarea class="form-control" id="description" name="description" placeholder="자기소개를 적어주세요">${member.getMemberDescription()}</textarea>
		                                </div>
		                                <div class="text-center">
	                                   		<button type="button" class="btn" style="background: rgb(0,172,238);
	                               				background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(138,212,3,1) 100%);
	                                			" onclick="addMember()">회원가입
                                			</button>         
                                		</div>
		                            </form>
		                            <br>
		                            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		                            <script>
		                            	// 다음(카카오) 주소 api
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
			                                        document.getElementById('roadAddress').value = roadAddr;
			                                    }
			                                }).open();
			                            }
			                            
			                            // 유효성 검사
			                            function addMember(){
											if($("#id").val() == ""){
												alert('ID를 입력해주세요.');
												return;
											} else if($("#password").val() == ""){
												alert('패스워드를 입력해주세요.');
												return;
											} else if($("#password2").val() == ""){
												alert('패스워드 확인란을 입력해주세요.');
												return;
											} else if(!($("#password").val() == $("#password2").val())){
												alert('PW 값이 동일하지 않습니다.');
												return;
											} else if($("#firstname").val() == ""){
												alert('성을 입력해주세요');
												return;
											} else if($("#lastname").val() == ""){
												alert('이름을 입력해주세요');
												return;
											} else if($("#nickname").val() == ""){
												alert('닉네임을 입력해주세요');
												return;
											} else if($("#phone").val() == ""){
												alert('전화번호를 입력해주세요');
												return;
											} else if($("#email").val() == ""){
												alert('이메일 주소를 입력해주세요');
												return;
											} else if($("#socialsecuritynumber").val() == ""){
												alert('주민등록번호를 입력해주세요');
												return;
											} else if($("#postalCode").val() == ""){
												alert('우편번호를 입력해주세요');
												return;
											} else {
												AddMember.submit();
											}
										};
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