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
        	// 검색 part
        	$(function(){
        		$('#searchQBtn').click(function(){
        			// 카테고리 값을 저장할 변수 category 생성 및 선택된 카테고리 값으로 초기화 
        			var category = $('#qnaCategory' option:selected).val();
        			var searchWord = $('#searchWord').val();
        			
        			if(category != null && searchWord != null ){
        				// 이동 경로
            			location.href = "${pageContext.request.contextPath}/qnaList?qnaCategory=" + category + "&searchWord=" + searchWord;
        			} else if(category != null && searchWord == null){
        				location.href = "${pageContext.request.contextPath}/qnaList?qnaCategory=" + category;
        			} else if(searchWord != null && category == null){
        				location.href = "${pageContext.request.contextPath}/qnaList?searchWord=" + searchWord;
        			} else {
        				location.href = "${pageContext.request.contextPath}/qnaList?pageNo=1";	
        			}        		
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
		    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SpoqaHanSansNeo-Regular.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
		body {
			font-family: 'SpoqaHanSansNeo-Regular';
		}
		
	</style>
	
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

   <body>
    <!-- 배너 : 시작 -->
    <c:import url="../partial\\banner.jsp"/>
    <!-- 배너 : 끝 -->

    <main>

        <!-- Hero Start-->
        <div class="hero-area3 hero-overly2 d-flex align-items-center ">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-9">
                        <div class="hero-cap text-center pt-50 pb-20">
                            <h2>문의 사항</h2>
                        </div>
                        <!--Hero form -->
                     </div>
                </div>
            </div>
        </div>
        <!--Hero End -->	
       	<div class="listing-area pt-120 pb-120">
            <div class="container">
                <div class="row">
                   <!-- Left Content -->
                   <div class="col-lg-4">
			        	<div class="blog_left_sidebar">
			        		<aside class="single_sidebar_widget search_widget">
					        	<form method="get" action="${pageContext.request.contextPath}/qnaList">
									<div class="form-group">
										<div class="input-group mb-3">
											<input type="text" class="form-control" placeholder="검색어를 입력하세요" name="searchWord" onfocus="this.placeholder = '' " onblur="this.placeholder = '검색어를 입력하세요'">																	
										</div>
										<button type="submit" class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn">search</button>
									</div>
								</form> 
							</aside> 
						</div>
					</div>
                    <!-- Right content -->
                    <div class="col-xl-8 col-lg-8 col-md-6">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="count mb-35">
                                    <span> + ${totalCount}개의 문의글이 존재합니다.</span>
                                    <!-- 문의글을 작성하는 페이지 이동 버튼  -->
                                    <div class="form-group mt-3">
                                    	<a type="button" href="${pageContext.request.contextPath}/addQ" class="button button-contactForm boxed-btn">Write</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 문의글 목록으로 활용할 예정... or 삭제? -->
                        <!-- listing Details Stat-->
                        <div class="listing-details-area">
                            <div class="container">
                                <div class="row">
                                	<c:forEach items="${qnaList}" var="qna">
                                    	<div class="col-lg-6 ">
                                        	<div class="single-listing mb-30" id = "qnaArrayList">
		                                    	<div class="list-img">
				                                    <img src="${pageContext.request.contextPath}/resources/image/qna/qna2.jpg" alt="">
					                                <!-- <span>Open</span> -->
			                                    </div>
		                                   		<div class="list-caption">
		                                        	<span>${qna.qnaCategory}</span>
		                                        	<h3><a href="${pageContext.request.contextPath}/getQnaOne?qnaNo=${qna.qnaNo}">${qna.qnaTitle}</a></h3>
		                                            <p>${qna.qnaNo}</p>
		                                            <div class="list-footer">
		                                            	<ul>
		                                                	<li>${qna.memberNickname}</li>
		                                                	<li>${qna.qnaSecret}</li>
		                                               	</ul>
		                                            </div>
		                                                <!-- 
		                                                	<div class="list-footer">
			                                                    <ul>
			                                                        <li>+10 278 367 9823</li>
			                                                        <li>contact@midnight.com</li>
			                                                    </ul>
		                                                	</div>
		                                                 -->
		                                          </div>
		                                        </div>
		                                      </div>
                                        </c:forEach>
                                   	</div>
                                </div>
                           	</div>     
                        <!-- listing Details End -->
                        <!--Pagination Start  -->
                        <div class="pagination-area pt-70 text-center">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <div class="single-wrap d-flex justify-content-center">
                                            <nav aria-label="Page navigation example">
                                            	<!-- 페이징 -->
									                <ul class="pagination justify-content-start">
									                   <c:if test="${beginRow > (ROW_PER_PAGE * 10)}">
									                      <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/qnaList?pageNo=${pageNo-1}">&lt;</a></li>
									                   </c:if>
									                   <c:set var="doneLoop" value="false"></c:set>
									                   <c:forEach var="f" begin="${pageNo}" end="${pageNo + 9}">
									                      <c:if test="${not doneLoop}">
									                         <c:choose>
									                            <c:when test="${currentPage == f}">
									                               <li class="page-item active"><a class="page-link">${f}</a></li>
									                            </c:when>
									                            <c:otherwise>
									                               <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/qnaList?currentPage=${f}&searchWord=${searchWord}">${f}</a></li>
									                            </c:otherwise>
									                         </c:choose>
									                         <c:if test="${f == lastPage}">
									                            <c:set var="doneLoop" value="true"></c:set>
									                         </c:if>
									                      </c:if>
									                   </c:forEach>
									                   <c:if test="${currentPage + 10 <= lastPage}">
									                      <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}//qnaList?currentPage=${pageNo+10}">&gt;</a></li>
									                   </c:if>
									                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Pagination End  -->
                    </div>
                </div>
            </div>
        </div>
        <!-- listing-area Area End -->
	
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