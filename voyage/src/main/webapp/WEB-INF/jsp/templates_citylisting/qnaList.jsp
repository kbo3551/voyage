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
                        <form action="" id="searchQnaForm" class="search-box search-box2">
                            <div class="input-form">
                            	<!-- 
                            	 <input type="text" placeholder="What are you looking for?">
                            	 -->
                               	 <input type="text" placeholder="문의사항을 검색해보세요" id="qnaSearchKeyword" value="">
                            </div>
                            <div class="select-form">
                                <div class="select-itms">
                                    <select name="select" id="selectQnaCategory">
                                    	<!--  
                                    	<option value="">All Catagories</option>
                                        <option value="">Catagories One</option>
                                        <option value="">Catagories Two</option>
                                        <option value="">Catagories Three</option>
                                        <option value="">Catagories Four</option>
                                    	-->
                                        <option value="">전체</option>
                                        <option value="예약문의">예약</option>
                                        <option value="결제문의">결제</option>
                                        <option value="기타">기타</option>
                                    </select>
                                </div>
                            </div>
                            <!-- Search box -->
                            <div class="search-form">
                                <a type="button" id="qnaSearchBtn">Search</a>
                            </div>	
                        </form>	
                    </div>
                </div>
            </div>
        </div>
        <!--Hero End -->
        <!-- listing Area Start -->
        <!-- 
        	<div class="listing-area pt-120 pb-120">
            <div class="container">
                <div class="row">
                   Left content
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="row">
                            <div class="col-12">
                                    <div class="small-section-tittle2 mb-45">
                                    <h4>Advanced Filter</h4>
                                </div>
                            </div>
                        </div>
                        Job Category Listing start
                        <div class="category-listing mb-50">
                            single one
                            <div class="single-listing">
                                input
                                <div class="input-form">
                                    <input type="text" placeholder="What are you finding?">
                                </div>
                                Select job items start
                                <div class="select-job-items1">
                                    <select name="select1">
                                        <option value="">Choose categories</option>
                                        <option value="">Category 1</option>
                                        <option value="">Category 2</option>
                                        <option value="">Category 3</option>
                                    </select>
                                </div>
                                Select job items End
                                Select job items start
                                <div class="select-job-items2">
                                    <select name="select2">
                                        <option value="">Location</option>
                                        <option value="">Dhaka</option>
                                        <option value="">Mirpur</option>
                                        <option value="">Dannondi</option>
                                    </select>
                                </div>
                               Select job items End
                                select-Categories start
                                <div class="select-Categories pt-140 pb-20">
                                    <label class="container">Full Time
                                        <input type="checkbox" >
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">Ratings
                                        <input type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                select-Categories End
                                Select job items start
                                <div class="select-job-items2">
                                    <select name="select2">
                                        <option value="">Area (km)</option>
                                        <option value="">Dhaka- 1km</option>
                                        <option value="">Dinajpur- 2km</option>
                                        <option value="">Chittagong - 3km</option>
                                    </select>
                                </div>
                               Select job items End
                            </div>

                            <div class="single-listing">
                                Range Slider Start
                                <aside class="left_widgets p_filter_widgets price_rangs_aside sidebar_box_shadow">
                                    <div class="small-section-tittle2">
                                        <h4>Price range</h4>
                                    </div>
                                    <div class="widgets_inner">
                                        <div class="range_item">
                                        
                                         주석 : <div id="slider-range"></div>
                                            <input type="text" class="js-range-slider" value="" />
                                            <div class="d-flex align-items-center">
                                                <div class="price_text">
                                                    <p>Price :</p>
                                                </div>
                                                <div class="price_value d-flex justify-content-center">
                                                    <input type="text" class="js-input-from" id="amount" readonly />
                                                    <span>to</span>
                                                    <input type="text" class="js-input-to" id="amount" readonly />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </aside>
                             Range Slider End
                                 <a href="#" class="btn list-btn mt-20">Reset</a>
                            </div>
                        </div>
                        Job Category Listing End
                    </div>
       		-->  	
       	<div class="listing-area pt-120 pb-120">
            <div class="container">
                <div class="row">
                   <!-- Left Content -->
                    <!-- Right content -->
                    <div class="col-xl-8 col-lg-8 col-md-6">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="count mb-35">
                                    <span> + ${qnaTotalCount}개의 문의글이 존재합니다.</span>
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
			                                    	<img src="assets/img/gallery/list1.png" alt="">
				                                    	<!-- <span>Open</span> -->
		                                        </div>
		                                   		<div class="list-caption">
		                                        	<span>${qna.qnaCategory}</span>
		                                            <h3><a href="${pageContext.request.contextPath}/getQnaOne?qnaNo=${qna.qnaNo}">${qna.qnaTitle}</a></h3>
		                                            <p>${qna.qnaNo}</p>
		                                            <div class="list-footer">
		                                            	<ul>
		                                                	<li>${qna.memberNickname}</li>
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
                                    <!-- 
                                    	<div class="col-lg-6 ">
                                        <div class="single-listing mb-30">
                                            <div class="list-img">
                                                <img src="assets/img/gallery/list2.png" alt="">
                                                주석 :<span>Open</span> 
                                            </div>
                                            <div class="list-caption">
                                                주석 : 원본 : OPEN
                                                주석 : 문의글 카테고리를 가져와서 표시 
                                                <span>OPEN</span>
                                                 <h3><a href="${pageContext.request.contextPath}/getQnaOne">Saintmartine</a></h3>
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
                                    <div class="col-lg-6 ">
                                        <div class="single-listing mb-30">
                                            <div class="list-img">
                                                <img src="assets/img/gallery/list3.png" alt="">
                                                주석 : <span>Open</span> 
                                            </div>
                                            <div class="list-caption">
                                                <span>Open</span>
                                                 <h3><a href="/getQnaOne">Saintmartine</a></h3>
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
                                    <div class="col-lg-6 ">
                                        <div class="single-listing mb-30">
                                            <div class="list-img">
                                                <img src="assets/img/gallery/list4.png" alt="">
                                                주석 : <span>Open</span> 
                                            </div>
                                            <div class="list-caption">
                                                <span>Open</span>
                                                 <h3><a href="/getQnaOne">Saintmartine</a></h3>
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
                                    <div class="col-lg-6 ">
                                        <div class="single-listing mb-30">
                                            <div class="list-img">
                                                <img src="assets/img/gallery/list5.png" alt="">
                                                주석 : <span>Open</span> 
                                            </div>
                                            <div class="list-caption">
                                                <span>Open</span>
                                                 <h3><a href="/getQnaOne">Saintmartine</a></h3>
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
                                    <div class="col-lg-6 ">
                                        <div class="single-listing mb-30">
                                            <div class="list-img">
                                                <img src="assets/img/gallery/list6.png" alt="">
                                                주석 : <span>Open</span>
                                            </div>
                                            <div class="list-caption">
                                                <span>Open</span>
                                                 <h3><a href="/getQnaOne">Saintmartine</a></h3>
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
                         -->
                                    
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
                                                	<li class="page-item"><a class="page-link" href="qnaList?pageNo=${pageNo-10}"><span class="ti-angle-left"></span></a></li>
                                                    <c:forEach items="${navArray}" var="n">
                                                    	<c:if test="${n != 0}">
                                                    		<c:choose>
                                                    			<c:when test="${n eq pageNo}">
                                                    				<li class="page-item active"><a  class="page-link" href="qnaList?pageNo=${n}">${n}</a></li>
                                                    			</c:when>
                                                    			<c:otherwise>
                                                    				<li class="page-item active"><a  class="page-link" href="qnaList?pageNo=${n}">${n}</a></li>
                                                    			</c:otherwise>
                                                    		</c:choose>
                                                    	</c:if>
                                                    </c:forEach>
                                                	<li class="page-item"><a class="page-link" href="qnaList?pageNo=${pageNo+10}"><span class="ti-angle-right"></span></a></li>
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