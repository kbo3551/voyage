<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico">

		<!-- CSS here -->
			<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/bootstrap-select.min.css"> 
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
            <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
            
    
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
                    <img src="${pageContext.request.contextPath}/assets/img/logo/loder.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
    
    
   	<c:import url="/WEB-INF/jsp/partial/banner.jsp"/>

	

	<main>
	

	


        <div class="page-head" style="background-image: url('${pageContext.request.contextPath}/assets/img/page-header.jpg'); background-repeat : no-repeat;"> 
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

        <!-- property area -->
        <form name="UpdateMember" method="post" action="${pageContext.request.contextPath}/member/myPage">
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
	                                    <input name="firstname" type="text" class="form-control" id="firstname" name="firstname" placeholder="성" value="${loginMember.memberFirstName}">
	                                </div>
	                                <div class="form-group">
	                                    <label>Last Name </label>
	                                    <input name="lastname" type="text" class="form-control" id="lastname" name="lastname" placeholder="이름" value="${loginMember.memberLastName}">
	                                </div> 
	                                <div class="form-group">
	                                    <label>Email</label>
	                                    <input name="email" type="email" id="email" name="email" class="form-control" placeholder="이메일" value="${loginMember.memberEmail}">
	                                </div> 
	                                <div class="form-group">
	                                    <label>Phone</label>
	                                    <input name="phone" type="number" class="form-control" id="phone" name="phone" placeholder="전화번호" value="${loginMember.memberPhone}">
	                                </div> 
	                            </div>
	                            <div class="col-sm-5">
	                                <div class="form-group">
	                                  <input type="button" class="btn" style="background: rgba(0,172,238,50);"
	                                  onclick="execDaumPostcode()" value="우편번호">
	                                  <input type="number" class="form-control" id="postalCode" name="postalCode" placeholder="우편번호" value="${loginMember.memberAddress.memberAddressPostalCode}" readonly="readonly">
	                             	</div>
	                            	<div class="form-group">
	                             		<br>  
	                                  <input type="text" class="form-control" id="roadAddress" name="roadAddress" placeholder="도로명주소" value="${loginMember.memberAddress.memberAddressZip}" readonly="readonly">
	                            	</div>
	                            	<div class="form-group">
	                            	 	<br>     
	                                  <input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세주소" value="${loginMember.memberAddress.memberAddressDetail}">
	                              </div>
	                            </div>  
	
	                        </div>
	                        	<div class="clear">
	                        		<div class="col-sm-20">
	                             	<hr>
	                                 <div class="form-group">
	                                     <label>Description</label>
	                                     <textarea rows="5" cols="80" id="description" name="description" placeholder="자기소개">${loginMember.memberDescription }</textarea>
	                                 </div>
	                            	</div>
	                        	</div>
	                        	<div class="col-sm-20 col-sm-offset-1" style="text-align: right;">
	                             <br>
	                             <input type='button' onclick="addAdmin()" class='btn btn-finish btn-primary' name='finish' value='Update' />
	                         </div>
	                         <br>
			            </div>
	                </div>
	                <br>
	                <div><a href="${pageContext.request.contextPath}/member/updateNickname" class="btn">닉네임변경</a></div>
    				<div><a href="${pageContext.request.contextPath}/member/updatePw" class="btn">비밀번호변경</a></div>
	            </div>
	    	</div>
    	</form>
    
    
    	
    	
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
            function addAdmin(){
				if($("#firstname").val() == ""){
					alert('성을 입력해주세요.');
					return;
				} else if($("#lastname").val() == ""){
					alert('이름을 입력해주세요');
					return;
				} else if($("#email").val() == ""){
					alert('이메일 주소를 입력해주세요');
					return;
				} else if($("#phone").val() == ""){
					alert('전화번호를 입력해주세요');
					return;
				} else {
					UpdateMember.submit();
				}
			};
     </script>


	
	</main>


	<c:import url="/WEB-INF/jsp/partial/footer.jsp"/>
    
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>


    <!-- JS here -->
	<!-- All JS Custom Plugins Link Here here -->
       <script src="${pageContext.request.contextPath}/assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
       <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
       <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
       <script src="${pageContext.request.contextPath}/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
       <script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
       <script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
       <script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/animated.headline.js"></script>
       <script src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.js"></script>

	<!-- Nice-select, sticky -->
       <script src="${pageContext.request.contextPath}/assets/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.sticky.js"></script>
       
       <!-- contact js -->
       <script src="${pageContext.request.contextPath}/assets/js/contact.js"></script>
       <script src="${pageContext.request.contextPath}/assets/js/jquery.form.js"></script>
       <script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>
       <script src="${pageContext.request.contextPath}/assets/js/mail-script.js"></script>
       <script src="${pageContext.request.contextPath}/assets/js/jquery.ajaxchimp.min.js"></script>
       
	<!-- Jquery Plugins, main Jquery -->	
       <script src="${pageContext.request.contextPath}/assets/js/plugins.js"></script>
       <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
        
</body>
</html>