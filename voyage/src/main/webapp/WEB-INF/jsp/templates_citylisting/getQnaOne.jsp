<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Directory HTML-5 Template </title>
        <!-- jQuery here -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
        	// 버튼 눌렀을 때, 이동 경로 설정
        	$(function(){
        		// 관리자의 답변 여부를 확인할 변수 valAnswerDate, valAnswerContent 생성
        		var valAdminId = $('#adminId').val();
        		var valAnswerContent = $('#answerContent').val();
        		
        		// Back 버튼 눌렀을 때
        		$('#goBackBtn').click(function(){
        			location.href ='${pageContext.request.contextPath}/qnaList';
        		});
        		// Edit 버튼 눌렀을 때
        		$('#moveModQBtn').click(function(){
        			// 관리자 답변 여부에 따라 페이지 이동 여부 결정
        			// 답변 없음 => 수정 가능
        			// 답변 존재 => 수정 불가
        			if(valAdminId == null || valAdminId == undefined || valAdminId == ""){
     					if(valAnswerContent == null || valAnswerContent == undefined || valAnswerContent == ""){
  							// 수정 페이지로 이동
     						location.href =	'${pageContext.request.contextPath}/modifyQ?qnaNo=' + $('#qnaNo').val();
     						return;
     					} else {
     						alert('해당 문의글은 관리자의 답변 내용이 존재해 수정할 수 없습니다.');
     						$('#answerContent').focus();
     						return;
     					}  				
        			} else {
        				alert('해당 문의글은 관리자의 답변 기록이 존재해 수정할 수 없습니다.');
        				$('#adminId').focus();
        				return;
        			}
        			
        		});
        		// Del 버튼 눌렀을 때
        		$('#moveRemQBtn').click(function(){
        			// 관리자 답변 여부에 따라 페이지 이동 여부 결정
        			// 답변 없음 => 수정 가능
        			// 답변 존재 => 수정 불가
        			if(valAdminId == null || valAdminId == undefined || valAdminId == ""){
     					if(valAnswerContent == null || valAnswerContent == undefined || valAnswerContent == ""){
     						// 삭제 페이지로 이동
     						location.href ='${pageContext.request.contextPath}/removeQ?qnaNo=' + $('#qnaNo').val();
     						return;
     					} else {
     						alert('해당 문의글은 관리자의 답변 내용이 존재해 삭제할 수 없습니다.');
     						$('#answerContent').focus();
     						return;
     					}  				
        			} else {
        				alert('해당 문의글은 관리자의 답변 기록이 존재해 삭제할 수 없습니다.');
        				$('#adminId').focus();
        				return;
        			}
        		});
        	});
        </script>
        <!-- jQuery end -->
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- <link rel="manifest" href="site.webmanifest">  -->
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
                            <h2>문의내용</h2>
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
                        <h3 class="mb-20">경고</h3>
                        <p class="mb-30">문의 내용은 관리자의 답글이 달리기 전까지만 수정, 삭제가 가능합니다.</p>
                        <p class="mb-30">해당 게시글에 오타가 난 경우나 문의 내용을 잘못 적었는데 답글이 달린 경우 등 상황에서는 새로 문의글을 적어주시면 확인 후 답변 드리겠습니다.</p>
           				<p class="mb-30">다른 경우에도 마찬가지오니 이 점 유의해서 활용해주시길 바랍니다.</p>
                        
                    </div>
                </div>
                <!-- Contact From -->
                <!-- Form -->
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                    	<!-- 원본 : Massage -->
                        <h3 class="mb-40">Question</h3>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                    	Title : <input class="form-control error" name="qnaTitle" id="qnaTitle" value="${qna.qnaTitle}" readonly="readonly">
                                    </div>
                   					<div class="form-group">
                                    	No : <input class="form-control error" name="qnaNo" id="qnaNo" value="${qna.qnaNo}" readonly="readonly">
                                   	</div>
                                   	<div class="form-group">
                                   		Category : <input class="form-control error" name="qnaCategory" id="qnaCategory" value="${qna.qnaCategory}" readonly="readonly">
                                   	</div>
                                    <div class="form-group">
                                    	Nickname : <input class="form-control error" name="memberNickname" id="memberNickName" value="${qna.memberNickname}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        Content : <textarea class="form-control w-100 error" name="qnaContent" id="qnaContentOne" cols="30" rows="9" readonly="readonly">${qna.qnaContent}</textarea>
                                    </div>
                                    <!-- 이미지 -->
                                    <div class="form-group">
	                                	<c:forEach items="${qnaImgList}" var="qnaImg">
	                                   		<input type="file" name="qnaImg" id="qnaImg[0]" value="${pageContext.request.contextPath}/resources/image/qna/${qnaImg.qnaImgName}.${qnaImg.qnaImgExt}">
	                                    </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-3">
                            	<!-- 원본 버튼 : Send  -->
                                <button type="button" id="goBackBtn"class="button button-contactForm boxed-btn">Back</button>
                                <button type="button" id="moveModQBtn" class="button button-contactForm boxed-btn">Edit</button>
                                <button type="button" id="moveRemQBtn" class="button button-contactForm boxed-btn">Del</button>
                            </div>
                    </div>
                </div>
                <!-- Answer Here -->
              	<div class="row justify-content-center">
                	<div class="col-lg-8">
                    	<h3 class="mb-40">Answer</h3>
                    		<div class="row">
                    			<div class="col-sm-6">
                                    <div class="form-group">
                                    	ID : <input class="form-control error" name="adminId" id="adminId" type="text" value="${qna.qnaAnswer.adminId}"readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-12">
                                	<div class="form-group">
                                        Content : <textarea class="form-control w-100 error" name="answerContent" id="answerContent" cols="30" rows="9" readonly="readonly">${qna.qnaAnswer.answerContent}</textarea>
                                    </div>
                                </div>
                    		</div>
                    	</div>
                    </div>
                    <!-- Answer End -->
             
                <!-- 다른 사용자들이 단 문의글로 이용할 예정... or 삭제? -->
                <!-- listing Details Stat-->
                <div class="listing-details-area">
                    <div class="container">
                    	<h3 class="mb-40">Others</h3>
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
    <!--footer.jsp 시작  -->
    <c:import url="../partial\\footer.jsp"/>
    <!--footer.jsp 끝  -->
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