<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>숙소 상세 </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico">

      		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
      		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
      		
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
            <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
            
   </head>
   
   <!-- 눈누 - 한산스네오 레귤러 폰트 -->
	<style type="text/css">
	
			  
  .slider {
    width: 600px;
    text-align: center;
    border-radius: 10px;
    overflow: hidden;
  }
  
  .slides {
    display: flex;
    overflow-x: auto;
    /* overflow: hidden; */
    scroll-snap-type: x mandatory;
    scroll-behavior: smooth;
    -webkit-overflow-scrolling: touch;
  }
  .slides::-webkit-scrollbar {
    width: 10px;
    height: 10px;
  }
  .slides::-webkit-scrollbar-thumb {
    background: black;
    border-radius: 10px;
  }
  .slides::-webkit-scrollbar-track {
    background: transparent;
  }
  .slides > div {
    scroll-snap-align: start;
    flex-shrink: 0;
    width: 600px;
    height: 300px;
    margin-right: 50px;
    border-radius: 10px;
    overflow: hidden;
    background: #eee;
    transform-origin: center center;
    transform: scale(1);
    transition: transform 0.5s;
    position: relative;
    
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 100px;
  }
  
  .author-info {
    background: rgba(0, 0, 0, 0.75);
    color: white;
    padding: 0.75rem;
    text-align: center;
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    margin: 0;
  }
  .author-info a {
    color: white;
  }
  #imga {
    object-fit: cover;
    top: ;
    left: ;
    width: auto;
    max-height: 100%;
  }
  
  .slider > a {
    display: inline-flex;
    width: 1.5rem;
    height: 1.5rem;
    background: #eee;
    text-decoration: none;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    margin: 0 0 0.5rem 0;
    position: relative;
  }
  .slider > a:active {
    top: 1px;
  }
  .slider > a:focus {
    background: #000;
  }
  
	
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
                    <img src="${pageContext.request.contextPath}/assets/img/logo/loder.jpg" alt="">
                </div>
            </div>
        </div>
    </div>

   <body>
   
   
   	
   
    <!-- banner.jsp 시작 -->
    <c:import url="/WEB-INF/jsp/partial/banner.jsp"/>
    <!-- banner.jsp 끝 -->

    <main>
        <div class="hero-area3 hero-overly2 d-flex align-items-center ">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-9">
                        <div class="hero-cap text-center pt-50 pb-20">
                            <h2>숙소 상세</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      <section class="blog_area single-post-area section-padding" style="padding-bottom: 20px !important;">
         <div class="container">
         
	         <div class="clear">
	            <div class="card" style="float: left; width: 50%">
	         <div class="card-body">
	            <div class="row">
	               <div class="col mt-0">
	                  <h5 class="card-title">숙소 총 수익</h5>
	               </div>
	            </div>
	            <h1 class="mt-1 mb-3" id="accomTotalProfit">&#8361;</h1>
	            <div class="mb-0 " id="accomProfitMonth">
	            </div>
	         </div>
	      </div>
	      <div class="card" style="float: left;  width: 50%">
	         <div class="card-body">
	            <div class="row">
	               <div class="col mt-0">
	                  <h5 class="card-title">숙소 월 수익</h5>
	               </div>
	            </div>
	            <h1 class="mt-1 mb-3" id="accomMonthTotalProfit">&#8361;</h1>
	            <div class="mb-0 " id="accomProfit">
	            </div>
	         </div>
	      </div>
	         </div>
         
         
            <div class="row">
               <div class="col-lg-8 posts-list">
                  <div class="single-post">
                     <div class="feature-img">
                     </div>
                    <div class="slider">
                    <div class="slides">
                        <c:forEach items="${accomBuildingOne.getAccomBuildingImageList()}" var="abi">
                           <div id="slide-1"><img id="imga" src="${pageContext.request.contextPath}/resources/image/accom_building/${abi.getAccomBuildingImageName()}.${abi.accomBuildingImageExt}" alt=""></div>
                         </c:forEach>
                      </div> 
                      </div>
                     
                     <div class="blog_details">
                        <h2> ${accomBuildingOne.accomBuildingName }</h2>
                        <ul class="blog-info-link mt-3 pt-4 mb-0">
                           <li><a style="color: #555555;"><i class="fa fa-user"></i> 객실 수 ${accomBuildingOne.roomCnt }</a></li>
                        </ul>
                        <div class="quote-wrapper">
                           <div class="quotes">
                              DESCRIPTION : ${accomBuildingOne.accomBuildingDescription }
                           </div>
                        </div>
                     </div>
                  </div>
	              	<!-- listing Details Stat-->
                    <h4 class="pt-35 pb-20">Rooms</h4>
	                <div class="listing-details-area pb-20" style="border-bottom: 1px solid #eee;">
	                        <div class="row">

	                       		<c:forEach items="${accomRoom}" var="ar" varStatus="status">
		                            <div class="col-lg-4 col-md-6">
		                                <div class="single-listing mb-30">
		                                    <div class="list-img">
	                                            <a href="${pageContext.request.contextPath}/host/accomRoomOne?accomRoomNo=${ar.accomRoomNo }&accomBuildingNo=${accomBuildingOne.accomBuildingNo }">
	                                            	<div style="overflow: hidden;">
	                                            		<c:forEach items="${ar.accomRoomImageList }" var="ari" varStatus="status">
	                                            			<img src="${pageContext.request.contextPath}/resources/image/accom_room/${ari.getAccomRoomImageName() }" alt="">
	                                            		</c:forEach>
	                                            	</div>
	                                            </a>
	                                        </div>
		                                    <div class="list-caption" style="padding: 10px 15px 18px 15px;">
		                                        
		                                        <h3>
	                                              	<a href="${pageContext.request.contextPath}/host/accomRoomOne?accomRoomNo=${ar.accomRoomNo }&accomBuildingNo=${accomBuildingOne.accomBuildingNo }" style="font-size: 0.8em;">
	                                              		${ar.getAccomRoomName()} room
	                                              	</a>
	                                            </h3>
		                                        <ul class="blog-info-link mt-3 mb-0 pb-2">
						                           <li><a style="color: #555555; font-size: 0.9em;"><i class="fa fa-user"></i> 기준인원 ${ar.accomRoomStan }</a></li>
						                           <li><a style="color: #555555; font-size: 0.9em;"><i class="fa fa-user"></i> 최대인원 ${ar.accomRoomMax }</a></li>
						                        </ul>
						                        <ul class="blog-info-link pt-2 mb-0">
						                           <li style="font-size: 1.3em;"><a style="color: #555555;">₩ ${ar.accomRoomPrice }</a></li>
						                        </ul>
												<ul class="pt-1">
													<c:forEach items="${ar.accomRoomItemList }" var="art" varStatus="status">
											            <li style="color: #555555;">${art.getAccomRoomItemName()}</li>
													</c:forEach>
												</ul>
		                                        <div class="list-footer mt-0 pt-0">
	                                                 <ul class="pt-3">
			                                             <li>
															<c:forEach items="${ar.hashtagList }" var="arh" varStatus="status">
															        <c:choose>
																        <c:when test="${fn:length(arh.getHashtag()) gt 35}">
																        	<c:out value="${fn:substring(arh.getHashtag(), 0, 34)}···"></c:out>
																        </c:when>
																        <c:otherwise>
																	        <c:out value="${arh.getHashtag()}">
																	        </c:out>
																        </c:otherwise>
																	</c:choose>
															</c:forEach>
														</li>	                                                    
	                                                 </ul>
	                                                 <ul>
	                                                     <li style="width: 60%; text-align: left; font-size: 0.9em;">
			                                                <c:choose>
														        <c:when test="${fn:length(ar.getAccomRoomDescription()) gt 35}">
														        	<c:out value="${fn:substring(ar.getAccomRoomDescription(), 0, 34)}···"></c:out>
														        </c:when>
														        <c:otherwise>
															        <c:out value="${ar.getAccomRoomDescription()}">
															        </c:out>
														        </c:otherwise>
															</c:choose>
														</li>
	                                                 </ul>
	                                             </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </c:forEach>
	                        </div>
	                </div>
               </div>
               <div class="col-lg-4">
                  <div class="blog_right_sidebar">
                     <aside class="single_sidebar_widget post_category_widget">
                        <div align="center"><button onclick="location.href='${pageContext.request.contextPath}/host/addAccomRoom?accomBuildingNo=${accomBuildingOne.accomBuildingNo }'" class="btn btn-finish btn-primary">객실추가</button></div>
                        <br>
                        <h4 class="widget_title">시설</h4>
                        <ul class="list cat-list">
          					<c:forEach items="${accomBuildingOne.accomBuildingFacilityList }" var="abf" varStatus="status">
	          					<li style="color: #555555;">
	                              <a href="#" class="d-flex">
	                                 ${abf.getAccomBuildingFacilityName()}
	                              </a>
	                           </li>
          					</c:forEach>
                        </ul>
                     </aside>
					<aside class="single_sidebar_widget tag_cloud_widget">
                        <h4 class="widget_title">해시태그</h4>
                        <ul class="list">
                        	<c:forEach items="${accomBuildingOne.getHashtagList()}" var="h">
		                       <li>
	                              <a href="${pageContext.request.contextPath}/#">${h.getHashtag() }</a>
	                           </li>
	                     	</c:forEach>	
                        </ul>
                     </aside>
                     <aside class="single_sidebar_widget popular_post_widget">
                        <h3 class="widget_title">Host 추천 장소</h3>
                        <c:forEach items="${accomBuildingOne.getAccomBuildingSpotList()}" var="abs">
	                        <div class="media post_item">
	                           <img src="${pageContext.request.contextPath}/assets/img/post/post_1.png" alt="post">
	                           <div class="media-body">
	                              <a>
	                                 <h3 style="margin-top: 0px !important;">${abs.getAccomBuildingSpotName()}</h3>
	                              </a>
	                              <small style="color: #EB566C;">${abs.getAccomBuildingSpotCategory()}</small>
	                              <h5 style="margin-top: 2px !important;">${abs.getAccomBuildingSpotDescription()}</h5>
	                           </div>
	                        </div>
	                     </c:forEach>
                     </aside>
                     
                     <aside class="single_sidebar">
                     <br>
                        	<form action="${pageContext.request.contextPath}/#" method="get">
							<input type="hidden" name="accomRoomNo" value="${accomBuildingOne.accomBuildingNo}">
                     <div align="center"><button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" type="submit">삭제</button></div>
                     </form>
                     </aside>
                  </div>
               </div>
            </div>
         </div>
      </section>
	
	
	<script type="text/javascript">
		let hostNo = "${hostSession.getHostNo()}";
		let accomBuildingNo = "${param.accomBuildingNo}";
		
		// 숙소 총 수익
        $.ajax(
           {
              type: "GET",
              url:"/voyage/selectAccomProfitOneByHost?hostNo="+hostNo+"&accomBuildingNo="+accomBuildingNo,
              dataType:"text",
              success : function (data) {
                 let accomTotalProfit = data;
                 accomTotalProfit *= 1;
                 $('#accomTotalProfit').append(accomTotalProfit.toLocaleString());
        }
                 
           }      
        )
        
        // 숙소 월 수익
        $.ajax(
           {
              type: "GET",
              url:"/voyage/selectAccomProfitOneByHostToMonth?hostNo="+hostNo+"&accomBuildingNo="+accomBuildingNo,
              dataType:"text",
              success : function (data) {
                 let accomMonthTotalProfit = data;
                 accomMonthTotalProfit *= 1;
                 $('#accomMonthTotalProfit').append(accomMonthTotalProfit.toLocaleString());
                 
        }
                 
           }      
        )
	
        // 해당 사업자의 저번주와 비교한 숙소 수익
        $.ajax(
           {
              type: "GET",
              url:"/voyage/selectAccomProfitOneCompare?hostNo="+hostNo+"&accomBuildingNo="+accomBuildingNo,
              dataType:"text",
              success : function (data) {
                 $('#accomProfit').append(data);
        }
                 
           }      
        )
        
        // 해당 사업자의 저번달과 비교한 숙소 수익
        $.ajax(
           {
              type: "GET",
              url:"/voyage/selectAccomProfitOneCompareByMonth?hostNo="+hostNo+"&accomBuildingNo="+accomBuildingNo,
              dataType:"text",
              success : function (data) {
                 $('#accomProfitMonth').append(data);
        }
                 
           }      
        )
        
	</script>
	
        
    </main>

    <!--footer.jsp 시작  -->
    <c:import url="/WEB-INF/jsp/partial/footer.jsp"/>
    <!--footer.jsp 끝  -->
    
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>


    <!-- JS here -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
    
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