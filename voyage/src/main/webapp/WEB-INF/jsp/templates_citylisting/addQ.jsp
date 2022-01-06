<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Directory HTML-5 Template </title>
        <!-- jquery here -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
        	$(function(){
        		var ck = false;
        		
        		// 유효성 검사를 위한 변수 생성
        		var valMemberId = $('#memberId').val();
        		var valMemberNickname = $('#memberNickname').val();
        		var valQnaTitle = $('#qnaTitle').val();
        		var valQnaContent = $('#qnaContent').val();
        		});
        		// send 버튼 눌렀을 때
        		$('#sendQBtn').click(function(){
					if(valMemberNickname == null || valMemberNickname == undifined || valMemberNickname == ""){
						alert('닉네임을 찾을 수가 없습니다. 다시 로그인 해주세요.');
						location.href = '/login';
						return;
					}
					if(valQnaTitle == null || valQnaTitle == undifined || valQnaTitle == ""){
						alert('제목이 입력되지 않았습니다. 제목을 입력해주세요.');
						$('#qnaTitle').focus();
						return;
					}
					// qnaCategory 유효성 검사
					/*if($('#qnaCategory').val() == null || ){
						return;
					}*/
					// qnaSecret 유효성 검사
					
					if(valQnaContent == null || valQnaContent == defined || valQnaContent == ""){
						alert('내용이 입력되지 않았습니다. 내용을 입력해주세요.');
						$('#qnaContent').focus();
						return;
					}
        		 	ck = true;
        			// index : 이미지 파일명, item : 파일 경로
        			$('#qnaImg').each(function(index, item){
        				console.log($(item).val());
        				if($(item).val() == ''){
        					ck = false;	
        				}
        			});
        			// 만약 이미지 파일을 선택하지 않았다면...
        			if(ck == false){
        				alert('이미지 파일을 선택해주세요');
        			}
        			$('#addQForm').submit();
        		});
        	});
        </script>
        <!-- jquery end -->
        
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
                            <h2>문의 작성</h2>
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
                    	<!-- 
                    	<h3 class="mb-20">Description</h3>
                        <p class="mb-30">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or rannjdomised words which don't look even slightly believable. If you are going to use a passage of fhorem Ipvbsum, you need to orem Ipsum available, but the ma be sure there isvgnn't anything embarrassing.</p>
                        <p class="mb-30">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or rannjdomised words which don't look even slightly believable. If you are going to use a passage of fhorem Ipvbsum.</p>
                    	 -->
                       <h3 class="mb-20">경고</h3>
                       <p class="mb-30">질문은 최대한 상세히 되도록이면 사진이나 이미지파일 첨부해서 작성해주세요.</p>
                       <p class="mb-30">지나친 모욕, 원색적인 욕설 등 과한 비방글은 추후 관리자의 판단 하에 삭제될 수 있습니다.</p>
                    </div>
                </div>
                <!-- Contact From -->
                <!-- From -->
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                    	<!-- 원본 : Massage -->
                        <h3 class="mb-40">Question</h3>
                        <!-- Form -->
                        <form method="post" class="form-contact contact_form mb-80" action="${pageContext.request.contextPath}/addQ" enctype="multipart/form-data" id="qnaForm">
                            <div class="row">
                                <div class="col-sm-6">
                                	<div class="form-group">
                                		<input class="form-controle error"  hidden="hidden" name="qna.memberId" id="memberId" type="text" value="${qna.memberId}" placeholder="아이디를 입력해주세요">
                                	</div>
                                    <div class="form-group">
                                    	<!-- 
                                    		원본 : <input class="form-control error" name="name" id="name" type="text"  placeholder="Your Name">
                                    	 -->
                                    	 <input class="form-control error" name="qna.memberNickname" id="memberNickname" type="text" placeholder="닉네임을 입력해주세요">
                                    </div>
                                    <div class="form-group">
                                    	
	                                    <!-- 
	                                    	원본 : <input class="form-control error" name="email" id="email" type="email" placeholder = "Enter email address">
	                                    -->
	                                    <input class="form-control error" name="qna.qnaTitle" id="qnaTitle" type="text"	placeholder="제목을 입력해주세요">
  									</div>
                                	<table class="form-group">
                                		<tr>
                                			<td>
                                				<select name="qna.qnaCategory" id="qnaCategory">
				                            		<option value="예약문의">예약</option>
				                                	<option value="결제문의">결제</option>
				                                	<option value="기타">기타</option>
												</select>
                                			</td>
                                			
                                			<td>
                                				<input name="qna.qnaSecret" id="qnaSecret" type="checkbox" value="비밀글"/>
	                                			<label><span>비밀글</span></label>
                                			</td>
                                			
                                			<td>
                                				<input name="qna.qnaSecret" id="qnaSecret" type="checkbox" value="공개글"/>
	                                			<label><span>공개글</span></label>
                                			</td>
                                		</tr>
                                	</table>			
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control w-100 error" name="qna.qnaContent" id="qnaContent" cols="30" rows="9" placeholder="내용을 상세히 입력해주세요. 1) 정확한 날짜와 시간  2) 사진이나 이미지 첨부  3) 상세한 상황 설명 "></textarea>
                                    </div>
                                </div>
                                <div>파일 첨부</div>
                                <div>
                                	<div><input type="file" name="qnaImg" id="qnaImg"></div>
                                </div>
                                <div id="Imginput"></div>
                            </div>
                            <div class="form-group mt-3">
                            	<!-- 원본 버튼 : Send  -->
                            	<a type="button" href="${pageContext.request.contextPath}/qnaList" class="button button-contactForm boxed-btn">Back</a>
                                <button type="submit" id="sendQBtn" class="button button-contactForm boxed-btn">Send</button>
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