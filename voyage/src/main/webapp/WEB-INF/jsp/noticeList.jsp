<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Directory HTML-5 Template </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico">

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
    <!-- banner.jsp 시작 -->
    <c:import url="/WEB-INF/jsp/partial/banner.jsp"/>
    <!-- banner.jsp 끝 -->

    <main>

        <!-- Hero Start-->
        <div class="hero-area3 hero-overly2 d-flex align-items-center ">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-9">
                        <div class="hero-cap text-center pt-50 pb-20">
                            <h2><a class="d-inline-block" href="${pageContext.request.contextPath}/noticeList" class="btn btn-primary">공지 사항</a></h2>
                        </div>
                        <!--Hero form -->
                     
                    </div>
                </div>
            </div>
        </div>
        <!--Hero End -->
        <section class="blog_area sectiong-padding">
	       	<div class="container">
		        <div class="row">
		        	<div class="col-lg-8 mb-5 mb-lg-0">
				        <div class="blog_left_sidebar">							
							<c:forEach items="${noticeList}" var="n" >
								<article class="blog_item">
									<div class="blog_details">
										<h2><a class="d-inline-block" href="${pageContext.request.contextPath}/noticeOne?noticeNo=${n.noticeNo}" class="btn btn-primary">${n.noticeTitle}</a></h2>
								        <ul class="blog-info-link">
								        	<li><i class="fa fa-user">${n.noticeViewCnt}</i></li>
								        	<li>개시일 : ${n.createDate}</li>
								        	<li>수정일 : ${n.updateDate}</li>
								        </ul>
							        </div>
				  				 </article>
						    </c:forEach>
						    <nav class="blog-pagination justify-content-center d-flex">
								<ul class="pagination">
								 	<c:if test="${beginRow > (ROW_PER_PAGE * 10)}">
						 				<li class="page-item">
											<a href="/noticeList?currentPage=${pageNo-1}" class="page-link" aria-label="Previous">
												<i class="ti-angle-left">
												</i>
											</a>
										</li>
									</c:if>
									<c:set var="doneLoop" value="false"></c:set>
									<c:forEach var="f" begin="${pageNo}" end="${pageNo + 9}">
										<c:if test="${not doneLoop}">
											<c:choose>
												<c:when test="${currentPage == f}">
													<li class="page-item active">
														<a href="${pageContext.request.contextPath}/noticeList?currentPage=${f}" class="page-link">${f}</a>
													</li>
												</c:when>
												<c:otherwise>
													<li class="page-item">
														<a href="${pageContext.request.contextPath}/noticeList?currentPage=${f}" class="page-link">${f}</a>
													</li>
												</c:otherwise>
											</c:choose>
											<c:if test="${f == lastPage}">
												<c:set var="doneLoop" value="true"></c:set>
											</c:if>
										</c:if>
									</c:forEach>
									<c:if test="${currentPage + 10 <= lastPage}">
										<li class="page-item">
											<a href="${pageContext.request.contextPath}/noticeList?currentPage=${pageNo+10}" class="page-link" aria-label="Next">
												<i class="ti-angle-right">
												</i>
											</a>
										</li>
									</c:if>
								</ul>
							</nav>							    
						</div>
					</div>
					<div class="col-lg-4">
			        	<div class="blog_right_sidebar">
			        		<aside class="single_sidebar_widget search_widget">
					        	<form method="get" action="${pageContext.request.contextPath}/noticeList">
									<div class="form-group">
										<div class="input-group mb-3">
											<input type="text" class="form-control" placeholder="search" name="searchNotice" onfocus="this.placeholder = '' " onblur="this.placeholder = 'search'">																	
										</div>
										<button type="submit" class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn">검색</button>
									</div>
								</form> 
							</aside> 
						</div>
					</div>	
				</div>
	        </div>    
		</section>           
        <!-- listing-area Area End -->
        
    </main>

    <!--footer.jsp 시작  -->
    <c:import url="/WEB-INF/jsp/partial/footer.jsp"/>
    <!--footer.jsp 끝  -->
    
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
        <script src="${pageContext.request.contextPath}/assets/js/price-range.js"></script>
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