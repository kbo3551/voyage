<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

        <!-- Hero Start-->
        <div class="hero-area3 hero-overly2 d-flex align-items-center ">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-9">
                        <div class="hero-cap text-center pt-50 pb-20">
                            <h2>객실 상세</h2>
                        </div>
                        <!--Hero form -->
                    
                    </div>
                </div>
            </div>
        </div>
        <!--Hero End -->
      <!--================Blog Area =================-->
      <section class="blog_area single-post-area section-padding" style="padding-bottom: 20px !important;">
         <div class="container">
            <div class="row">
               <div class="col-lg-8 posts-list">
                  <div class="single-post">
                     <div class="feature-img">
                        <c:forEach items="${accomRoomOne.accomRoomImageList }" var="ari" varStatus="status">
                   			<img src="${pageContext.request.contextPath}/resources/image/accom_room/${ari.getAccomRoomImageName() }" alt="">
                   		</c:forEach>
                     </div>
                     <div class="blog_details">
                        <h2> ${accomRoomOne.accomRoomName } room</h2>
                        <ul class="blog-info-link mt-3 pt-4 mb-0">
                           <li><a style="color: #555555;"><i class="fa fa-user"></i> 기준인원 ${accomRoomOne.accomRoomStan }</a></li>
                           <li><a style="color: #555555;"><i class="fa fa-comments"></i> 최대인원 ${accomRoomOne.accomRoomMax }</a></li>
                        </ul>
                        <ul class="blog-info-link mt-3 mb-4">
                           <li style="font-size: 1.3em;"><a style="color: #555555;">₩ ${accomRoomOne.accomRoomPrice }</a></li>
                        </ul>
<!--                         <p class="excert"> -->
<%--                            DESCRIPTION : ${activity.activityDescription } --%>
<!--                         </p> -->
<!--                         <p> -->
<!--                            MCSE boot camps have its supporters and its detractors. Some people do not understand why you -->
<!--                            should have to spend money on boot camp when you can get the MCSE study materials yourself at a -->
<!--                            fraction of the camp price. However, who has the willpower to actually sit through a -->
<!--                            self-imposed MCSE training. who has the willpower to actually -->
<!--                         </p> -->
                        <div class="quote-wrapper">
                           <div class="quotes">
                              DESCRIPTION : ${accomRoomOne.accomRoomDescription }
                              <br><br>
<%--                               <small>오픈: ${accomRoomOne.activityOpenHour } / 마감: ${accomRoomOne.activityCloseHour }</small> --%>
                           </div>
                        </div>
<!--                         <p> -->
<!--                            MCSE boot camps have its supporters and its detractors. Some people do not understand why you -->
<!--                            should have to spend money on boot camp when you can get the MCSE study materials yourself at a -->
<!--                            fraction of the camp price. However, who has the willpower -->
<!--                         </p> -->
<!--                         <p> -->
<!--                            MCSE boot camps have its supporters and its detractors. Some people do not understand why you -->
<!--                            should have to spend money on boot camp when you can get the MCSE study materials yourself at a -->
<!--                            fraction of the camp price. However, who has the willpower to actually sit through a -->
<!--                            self-imposed MCSE training. who has the willpower to actually -->
<!--                         </p> -->
                     </div>
                  </div>
                  <div class="navigation-top">
                     <div class="d-sm-flex justify-content-between text-center">
                        <p class="like-info"><span class="align-middle"><i class="fa fa-heart"></i></span> Lily and 4
                           people like this</p>
                        <div class="col-sm-4 text-center my-2 my-sm-0">
                           <!-- <p class="comment-count"><span class="align-middle"><i class="fa fa-comment"></i></span> 06 Comments</p> -->
                        </div>
                        <ul class="social-icons">
                           <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                           <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                           <li><a href="#"><i class="fab fa-dribbble"></i></a></li>
                           <li><a href="#"><i class="fab fa-behance"></i></a></li>
                        </ul>
                     </div>
<!--                      <div class="navigation-area"> -->
<!--                         <div class="row"> -->
<!--                            <div -->
<!--                               class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center"> -->
<!--                               <div class="thumb"> -->
<!--                                  <a href="#"> -->
<!--                                     <img class="img-fluid" src="assets/img/post/preview.png" alt=""> -->
<!--                                  </a> -->
<!--                               </div> -->
<!--                               <div class="arrow"> -->
<!--                                  <a href="#"> -->
<!--                                     <span class="lnr text-white ti-arrow-left"></span> -->
<!--                                  </a> -->
<!--                               </div> -->
<!--                               <div class="detials"> -->
<!--                                  <p>Prev Post</p> -->
<!--                                  <a href="#"> -->
<!--                                     <h4>Space The Final Frontier</h4> -->
<!--                                  </a> -->
<!--                               </div> -->
<!--                            </div> -->
<!--                            <div -->
<!--                               class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center"> -->
<!--                               <div class="detials"> -->
<!--                                  <p>Next Post</p> -->
<!--                                  <a href="#"> -->
<!--                                     <h4>Telescopes 101</h4> -->
<!--                                  </a> -->
<!--                               </div> -->
<!--                               <div class="arrow"> -->
<!--                                  <a href="#"> -->
<!--                                     <span class="lnr text-white ti-arrow-right"></span> -->
<!--                                  </a> -->
<!--                               </div> -->
<!--                               <div class="thumb"> -->
<!--                                  <a href="#"> -->
<!--                                     <img class="img-fluid" src="assets/img/post/next.png" alt=""> -->
<!--                                  </a> -->
<!--                               </div> -->
<!--                            </div> -->
<!--                         </div> -->
<!--                      </div> -->
                  	</div>
	                <!-- listing Details End -->
                  <h4 class="pt-45">Host Comment</h4>
                  <div class="blog-author mt-0">
                     <div class="media align-items-center">
                        <img src="${pageContext.request.contextPath}/assets/img/blog/author.png" alt="">
                        <div class="media-body">
                           <a>
                              <h4>Harvard milan</h4>
                           </a>
                           <p>Second divided from form fish beast made. Every of seas all gathered use saying you're, he
                              our dominion twon Second divided from</p>
                        </div>
                     </div>
                  </div>
                  <div class="comments-area">
                     <h4>Recent Review</h4>
                     <div class="comment-list">
                        <div class="single-comment justify-content-between d-flex">
                           <div class="user justify-content-between d-flex">
                              <div class="thumb">
                                 <img src="${pageContext.request.contextPath}/assets/img/comment/comment_1.png" alt="">
                              </div>
                              <div class="desc">
                                 <p class="comment">
                                    Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                                    Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                                 </p>
                                 <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center">
                                       <h5>
                                          <a>Emilly Blunt</a>
                                       </h5>
                                       <p class="date">December 4, 2017 at 3:12 pm </p>
                                    </div>
                                    <div class="reply-btn">
                                       <a href="${pageContext.request.contextPath}/#" class="btn-reply text-uppercase">chat</a>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="comment-list">
                        <div class="single-comment justify-content-between d-flex">
                           <div class="user justify-content-between d-flex">
                              <div class="thumb">
                                 <img src="${pageContext.request.contextPath}/assets/img/comment/comment_2.png" alt="">
                              </div>
                              <div class="desc">
                                 <p class="comment">
                                    Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                                    Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                                 </p>
                                 <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center">
                                       <h5>
                                          <a>Emilly Blunt</a>
                                       </h5>
                                       <p class="date">December 4, 2017 at 3:12 pm </p>
                                    </div>
                                    <div class="reply-btn">
                                       <a href="${pageContext.request.contextPath}/#" class="btn-reply text-uppercase">chat</a>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="comment-list">
                        <div class="single-comment justify-content-between d-flex">
                           <div class="user justify-content-between d-flex">
                              <div class="thumb">
                                 <img src="${pageContext.request.contextPath}/assets/img/comment/comment_3.png" alt="">
                              </div>
                              <div class="desc">
                                 <p class="comment">
                                    Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                                    Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                                 </p>
                                 <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center">
                                       <h5>
                                          <a>Emilly Blunt</a>
                                       </h5>
                                       <p class="date">December 4, 2017 at 3:12 pm </p>
                                    </div>
                                    <div class="reply-btn">
                                       <a href="${pageContext.request.contextPath}/#" class="btn-reply text-uppercase">chat</a>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
<!--                   <div class="comment-form"> -->
<!--                      <h4>Leave a Reply</h4> -->
<!--                      <form class="form-contact comment_form" action="#" id="commentForm"> -->
<!--                         <div class="row"> -->
<!--                            <div class="col-12"> -->
<!--                               <div class="form-group"> -->
<!--                                  <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="9" -->
<!--                                     placeholder="Write Comment"></textarea> -->
<!--                               </div> -->
<!--                            </div> -->
<!--                            <div class="col-sm-6"> -->
<!--                               <div class="form-group"> -->
<!--                                  <input class="form-control" name="name" id="name" type="text" placeholder="Name"> -->
<!--                               </div> -->
<!--                            </div> -->
<!--                            <div class="col-sm-6"> -->
<!--                               <div class="form-group"> -->
<!--                                  <input class="form-control" name="email" id="email" type="email" placeholder="Email"> -->
<!--                               </div> -->
<!--                            </div> -->
<!--                            <div class="col-12"> -->
<!--                               <div class="form-group"> -->
<!--                                  <input class="form-control" name="website" id="website" type="text" placeholder="Website"> -->
<!--                               </div> -->
<!--                            </div> -->
<!--                         </div> -->
<!--                         <div class="form-group"> -->
<!--                            <button type="submit" class="button button-contactForm btn_1 boxed-btn">Send Message</button> -->
<!--                         </div> -->
<!--                      </form> -->
<!--                   </div> -->
               </div>
               <div class="col-lg-4">
                  <div class="blog_right_sidebar">
                     <aside class="single_sidebar_widget search_widget">
                        <form action="${pageContext.request.contextPath}/calendarAccom" method="get">
<!--                            <div class="form-group"> -->
<!--                               <div class="input-group mb-3"> -->
<!--                                  <input type="text" class="form-control" placeholder='Search Keyword' -->
<!--                                     onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'"> -->
<!--                                  <div class="input-group-append"> -->
<!--                                     <button class="btns" type="button"><i class="ti-search"></i></button> -->
<!--                                  </div> -->
<!--                               </div> -->
<!--                            </div> -->
								<input type="hidden" name="accomRoomNo" value="${accomRoomOne.accomRoomNo }">
                           <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" id="submitBtn">
                           		예약
                           </button>
                        </form>
                        
                     </aside>
<!--                      <aside class="single_sidebar_widget post_category_widget"> -->
<!--                         <h4 class="widget_title">Facilities</h4> -->
<!--                         <ul class="list cat-list"> -->
<!--                            <li> -->
<!--                               <a href="#" class="d-flex"> -->
<!--                                  <p>Resaurant food</p> -->
<!--                                  <p>(37)</p> -->
<!--                               </a> -->
<!--                            </li> -->
<!--                            <li> -->
<!--                               <a href="#" class="d-flex"> -->
<!--                                  <p>Travel news</p> -->
<!--                                  <p>(10)</p> -->
<!--                               </a> -->
<!--                            </li> -->
<!--                            <li> -->
<!--                               <a href="#" class="d-flex"> -->
<!--                                  <p>Modern technology</p> -->
<!--                                  <p>(03)</p> -->
<!--                               </a> -->
<!--                            </li> -->
<!--                            <li> -->
<!--                               <a href="#" class="d-flex"> -->
<!--                                  <p>Product</p> -->
<!--                                  <p>(11)</p> -->
<!--                               </a> -->
<!--                            </li> -->
<!--                            <li> -->
<!--                               <a href="#" class="d-flex"> -->
<!--                                  <p>Inspiration</p> -->
<!--                                  <p>(21)</p> -->
<!--                               </a> -->
<!--                            </li> -->
<!--                            <li> -->
<!--                               <a href="#" class="d-flex"> -->
<!--                                  <p>Health Care</p> -->
<!--                                  <p>(21)</p> -->
<!--                               </a> -->
<!--                            </li> -->
<!--                         </ul> -->
<!--                      </aside> -->
					<aside class="single_sidebar_widget tag_cloud_widget">
                        <h4 class="widget_title">해시태그</h4>
                        <ul class="list">
                        	<c:forEach items="${accomRoomOne.getHashtagList()}" var="h">
		                       <li>
	                              <a href="${pageContext.request.contextPath}/#">${h.getHashtag() }</a>
	                           </li>
	                     	</c:forEach>	
                        </ul>
                     </aside>
<!--                      <aside class="single_sidebar_widget tag_cloud_widget"> -->
<!--                         <h4 class="widget_title">Items</h4> -->
<!--                         <ul class="list"> -->
<%--                         	<c:forEach items="${accomRoomOne.getAccomRoomItemList()}" var="art"> --%>
<!-- 		                       <li> -->
<%-- 	                              <a href="${pageContext.request.contextPath}/#">${art.getAccomRoomItemName() }</a> --%>
<!-- 	                           </li> -->
<%-- 	                     	</c:forEach>	 --%>
<!--                         </ul> -->
<!--                      </aside> -->
                     <aside class="single_sidebar_widget post_category_widget">
                        <h4 class="widget_title">Items<span style="font-size: 0.6em; padding-left: 5%;">추가 가능한 물품 목록</span></h4>
                        <ul class="list cat-list">
          					<c:forEach items="${accomRoomOne.getAccomRoomItemList()}" var="art" varStatus="status">
	          					<li style="color: #555555;">
	                              <a href="#" class="d-flex">
	                                 ${art.getAccomRoomItemName() } <span style="font-size: 0.9em; padding-left: 3%;">₩${art.getAccomRoomItemPrice() }</span>
	                              </a>
	                           </li>
          					</c:forEach>
                        </ul>
                      </aside>
<!--                      <aside class="single_sidebar_widget popular_post_widget"> -->
<!--                         <h3 class="widget_title">Host 추천 장소</h3> -->
<%--                         <c:forEach items="${accomRoomOne.getActivitySpotList()}" var="acs"> --%>
<!-- 	                        <div class="media post_item"> -->
<%-- 	                           <img src="${pageContext.request.contextPath}/assets/img/post/post_1.png" alt="post"> --%>
<!-- 	                           <div class="media-body"> -->
<!-- 	                              <a> -->
<%-- 	                                 <h3 style="margin-top: 0px !important;">${acs.getActivitySpotName()}</h3> --%>
<!-- 	                              </a> -->
<%-- 	                              <small style="color: #EB566C;">${acs.getActivitySpotCategory()}</small> --%>
<%-- 	                              <h5 style="margin-top: 2px !important;">${acs.getActivitySpotDescription()}</h5> --%>
<!-- 	                           </div> -->
<!-- 	                        </div> -->
<%-- 	                     </c:forEach> --%>
<!--                         <div class="media post_item"> -->
<!--                            <img src="assets/img/post/post_2.png" alt="post"> -->
<!--                            <div class="media-body"> -->
<!--                               <a href="blog_details.html"> -->
<!--                                  <h3>The Amazing Hubble</h3> -->
<!--                               </a> -->
<!--                               <p>02 Hours ago</p> -->
<!--                            </div> -->
<!--                         </div> -->
<!--                         <div class="media post_item"> -->
<!--                            <img src="assets/img/post/post_3.png" alt="post"> -->
<!--                            <div class="media-body"> -->
<!--                               <a href="blog_details.html"> -->
<!--                                  <h3>Astronomy Or Astrology</h3> -->
<!--                               </a> -->
<!--                               <p>03 Hours ago</p> -->
<!--                            </div> -->
<!--                         </div> -->
<!--                         <div class="media post_item"> -->
<!--                            <img src="assets/img/post/post_4.png" alt="post"> -->
<!--                            <div class="media-body"> -->
<!--                               <a href="blog_details.html"> -->
<!--                                  <h3>Asteroids telescope</h3> -->
<!--                               </a> -->
<!--                               <p>01 Hours ago</p> -->
<!--                            </div> -->
<!--                         </div> -->
<!--                      </aside> -->
                     
                     <aside class="single_sidebar_widget instagram_feeds">
                        <h4 class="widget_title">Instagram Feeds</h4>
                        <ul class="instagram_row flex-wrap">
                           <li>
                              <a href="#">
                                 <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/post/post_5.png" alt="">
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/post/post_6.png" alt="">
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/post/post_7.png" alt="">
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/post/post_8.png" alt="">
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/post/post_9.png" alt="">
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/post/post_10.png" alt="">
                              </a>
                           </li>
                        </ul>
                     </aside>
<!--                      <aside class="single_sidebar_widget newsletter_widget"> -->
<!--                         <h4 class="widget_title">Newsletter</h4> -->
<!--                         <form action="#"> -->
<!--                            <div class="form-group"> -->
<!--                               <input type="email" class="form-control" onfocus="this.placeholder = ''" -->
<!--                                  onblur="this.placeholder = 'Enter email'" placeholder='Enter email' required> -->
<!--                            </div> -->
<!--                            <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" -->
<!--                               type="submit">Subscribe</button> -->
<!--                         </form> -->
<!--                      </aside> -->
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!--================ Blog Area end =================-->
      
      <!-- Listing caption start-->
        <div class="listing-caption">
            <div class="container">
                <div class="row justify-content-center pt-80" style="border-top: 1px solid #eee;">
<!--                     <div class="col-lg-10"> -->
<!--                         <h3 class="mb-20">Description</h3> -->
<!--                         <p class="mb-30">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or rannjdomised words which don't look even slightly believable. If you are going to use a passage of fhorem Ipvbsum, you need to orem Ipsum available, but the ma be sure there isvgnn't anything embarrassing.</p> -->
<!--                         <p class="mb-30">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or rannjdomised words which don't look even slightly believable. If you are going to use a passage of fhorem Ipvbsum.</p> -->
<!--                     </div> -->
<!--                     	<div class="row pb-30" style="justify-content: center; flex-wrap: nowrap !important;"> -->
<!--                             <div class="col-sm-5"> -->
<!--                             	<div style="text-align: left; padding-right: 8%;"> -->
<!-- 	                                <h3 style="letter-spacing: 0.1em;"><i class="fa fa-map-marker"></i> Address</h3> -->
<!-- 	                                <p> -->
<%-- 	                                    <small>${activityOne.activityAddress.activityAddressZip }</small><br> --%>
<%-- 	                                    <small>${activityOne.activityAddress.activityAddressDetail }</small> --%>
<!-- 	                                </p> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             /.col-sm-4 -->
<!--                             <div class="col-sm-5"> -->
<!--                             	<div style="text-align: left; padding-left: 8%;"> -->
<!-- 	                                <h3><i class="fa fa-phone"></i> Call center</h3> -->
<!-- 	                                <p class="text-muted">전화문의</p> -->
<%-- 	                                <p><strong>${activityOne.activityPhone }</strong></p> --%>
<!--                                 </div> -->
<!--                             </div> -->
<!--                             /.col-sm-4 -->
<!--                             <div class="col-sm-5"> -->
<!--                             	<div style="text-align: left;"> -->
<!-- 	                                <h3><i class="fa fa-envelope"></i> Voyage E-mail</h3> -->
<!-- 	                                <p class="text-muted"></p> -->
<!-- 	                                <ul> -->
<!-- 	                                    <li><strong><a href="mailto:">oliweq@naver.com</a></strong>   </li> -->
<%-- 	                                    <li><strong><a href="${pageContext.request.contextPath}/qnaList">Q&A</a></strong> - Q&A 문의</li> --%>
<!-- 	                                </ul> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             /.col-sm-4 -->
<!--                         </div> -->
                            <!-- /.row -->
                </div>
                <!-- Map -->
                <div class="row justify-content-center mb-100 pb-50" style="border-bottom: 1px solid #eee;">
                    <div class="col-xl-12">
                        <h3 class="mb-30 ml-100"></h3>
                        <div class="d-none d-sm-block mb-30 pb-4">
                            <div id="map" style="height: 300px; position: relative; overflow: hidden;"><div style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; background-color: rgb(229, 227, 223);"><div class="gm-style" style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px;"><div tabindex="0" style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; cursor: url(&quot;https://maps.gstatic.com/mapfiles/openhand_8_8.cur&quot;), default; touch-action: pan-x pan-y;"><div style="z-index: 1; position: absolute; left: 50%; top: 50%; width: 100%; transform: translate(0px, 0px);"><div style="position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div style="position: absolute; z-index: 991; transform: matrix(1, 0, 0, 1, -100, -189);"><div style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: -256px; top: 0px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: -256px; top: -256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 0px; top: -256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 256px; top: -256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 256px; top: 0px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 256px; top: 256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 0px; top: 256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: -256px; top: 256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: -512px; top: 256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: -512px; top: 0px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: -512px; top: -256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 512px; top: -256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 512px; top: 0px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div><div style="position: absolute; left: 512px; top: 256px; width: 256px; height: 256px;"><div style="width: 256px; height: 256px;"></div></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: -1;"><div style="position: absolute; z-index: 991; transform: matrix(1, 0, 0, 1, -100, -189);"><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0px; top: 0px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: 0px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: -256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0px; top: -256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: -256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: 0px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: 256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0px; top: 256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: 256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -512px; top: 256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -512px; top: 0px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -512px; top: -256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 512px; top: -256px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 512px; top: 0px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 512px; top: 256px;"></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div style="position: absolute; z-index: 991; transform: matrix(1, 0, 0, 1, -100, -189);"><div style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i470!3i302!4i256!2m3!1e0!2sm!3i476185792!2m3!1e2!6m1!3e5!3m14!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC5zOi02MHxwLmw6LTYw!4e0&amp;key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;token=70038" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 256px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i471!3i302!4i256!2m3!1e0!2sm!3i476185840!2m3!1e2!6m1!3e5!3m14!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC5zOi02MHxwLmw6LTYw!4e0&amp;key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;token=84496" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 256px; top: 256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i471!3i303!4i256!2m3!1e0!2sm!3i476185840!2m3!1e2!6m1!3e5!3m14!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC5zOi02MHxwLmw6LTYw!4e0&amp;key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;token=107953" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 0px; top: 256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i470!3i303!4i256!2m3!1e0!2sm!3i476185792!2m3!1e2!6m1!3e5!3m14!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC5zOi02MHxwLmw6LTYw!4e0&amp;key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;token=93495" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -256px; top: 256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i469!3i303!4i256!2m3!1e0!2sm!3i476185792!2m3!1e2!6m1!3e5!3m14!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC5zOi02MHxwLmw6LTYw!4e0&amp;key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;token=85128" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -512px; top: 256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i468!3i303!4i256!2m3!1e0!2sm!3i476185504!2m3!1e2!6m1!3e5!3m14!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC5zOi02MHxwLmw6LTYw!4e0&amp;key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;token=46831" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -512px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i468!3i302!4i256!2m3!1e0!2sm!3i476184952!2m3!1e2!6m1!3e5!3m14!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC5zOi02MHxwLmw6LTYw!4e0&amp;key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;token=10814" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -512px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i468!3i301!4i256!2m3!1e0!2sm!3i476184952!2m3!1e2!6m1!3e5!3m14!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC5zOi02MHxwLmw6LTYw!4e0&amp;key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;token=118428" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 512px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i472!3i301!4i256!2m3!1e0!2sm!3i476185636!2m3!1e2!6m1!3e5!3m14!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC5zOi02MHxwLmw6LTYw!4e0&amp;key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;token=43995" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 512px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i472!3i302!4i256!2m3!1e0!2sm!3i476185840!2m3!1e2!6m1!3e5!3m14!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC5zOi02MHxwLmw6LTYw!4e0&amp;key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;token=905" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 512px; top: 256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i472!3i303!4i256!2m3!1e0!2sm!3i476185840!2m3!1e2!6m1!3e5!3m14!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC5zOi02MHxwLmw6LTYw!4e0&amp;key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;token=24362" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -256px; top: 0px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i469!3i302!4i256!2m3!1e0!2sm!3i476185792!2m3!1e2!6m1!3e5!3m14!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC5zOi02MHxwLmw6LTYw!4e0&amp;key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;token=61671" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -256px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i469!3i301!4i256!2m3!1e0!2sm!3i476185792!2m3!1e2!6m1!3e5!3m14!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC5zOi02MHxwLmw6LTYw!4e0&amp;key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;token=38214" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 0px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i470!3i301!4i256!2m3!1e0!2sm!3i476185792!2m3!1e2!6m1!3e5!3m14!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC5zOi02MHxwLmw6LTYw!4e0&amp;key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;token=46581" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 256px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;"><img draggable="false" alt="" role="presentation" src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i9!2i471!3i301!4i256!2m3!1e0!2sm!3i476185792!2m3!1e2!6m1!3e5!3m14!2sen-US!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC5zOi02MHxwLmw6LTYw!4e0&amp;key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;token=94061" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div></div></div><div class="gm-style-pbc" style="z-index: 2; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px; opacity: 0;"><p class="gm-style-pbt"></p></div><div style="z-index: 3; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px; touch-action: pan-x pan-y;"><div style="z-index: 4; position: absolute; left: 50%; top: 50%; width: 100%; transform: translate(0px, 0px);"><div style="position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 107; width: 100%;"></div></div></div></div><iframe aria-hidden="true" frameborder="0" style="z-index: -1; position: absolute; width: 100%; height: 100%; top: 0px; left: 0px; border: none;" src="about:blank"></iframe><div style="margin-left: 5px; margin-right: 5px; z-index: 1000000; position: absolute; left: 0px; bottom: 0px;"><a target="_blank" rel="noopener" href="https://maps.google.com/maps?ll=-31.197,150.744&amp;z=9&amp;t=m&amp;hl=en-US&amp;gl=US&amp;mapclient=apiv3" title="Open this area in Google Maps (opens a new window)" style="position: static; overflow: visible; float: none; display: inline;"><div style="width: 66px; height: 26px; cursor: pointer;"><img alt="" src="https://maps.gstatic.com/mapfiles/api-3/images/google_white5.png" draggable="false" style="position: absolute; left: 0px; top: 0px; width: 66px; height: 26px; user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></a></div><div style="background-color: white; padding: 15px 21px; border: 1px solid rgb(171, 171, 171); font-family: Roboto, Arial, sans-serif; color: rgb(34, 34, 34); box-sizing: border-box; box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 16px; z-index: 10000002; display: none; width: 300px; height: 180px; position: absolute; left: 315px; top: 150px;"><div style="padding: 0px 0px 10px; font-size: 16px; box-sizing: border-box;">Map Data</div><div style="font-size: 13px;">Map data ©2019 Google</div><button draggable="false" title="Close" aria-label="Close" type="button" class="gm-ui-hover-effect" style="background: none; display: block; border: 0px; margin: 0px; padding: 0px; position: absolute; cursor: pointer; user-select: none; top: 0px; right: 0px; width: 37px; height: 37px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224px%22%20height%3D%2224px%22%20viewBox%3D%220%200%2024%2024%22%20fill%3D%22%23000000%22%3E%0A%20%20%20%20%3Cpath%20d%3D%22M19%206.41L17.59%205%2012%2010.59%206.41%205%205%206.41%2010.59%2012%205%2017.59%206.41%2019%2012%2013.41%2017.59%2019%2019%2017.59%2013.41%2012z%22%2F%3E%0A%20%20%20%20%3Cpath%20d%3D%22M0%200h24v24H0z%22%20fill%3D%22none%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="pointer-events: none; display: block; width: 13px; height: 13px; margin: 12px;"></button></div><div class="gmnoprint" style="z-index: 1000001; position: absolute; right: 166px; bottom: 0px; width: 121px;"><div draggable="false" class="gm-style-cc" style="user-select: none; height: 14px; line-height: 14px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; box-sizing: border-box; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a style="text-decoration: none; cursor: pointer; display: none;">Map Data</a><span>Map data ©2019 Google</span></div></div></div><div class="gmnoscreen" style="position: absolute; right: 0px; bottom: 0px;"><div style="font-family: Roboto, Arial, sans-serif; font-size: 11px; color: rgb(68, 68, 68); direction: ltr; text-align: right; background-color: rgb(245, 245, 245);">Map data ©2019 Google</div></div><div class="gmnoprint gm-style-cc" draggable="false" style="z-index: 1000001; user-select: none; height: 14px; line-height: 14px; position: absolute; right: 95px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; box-sizing: border-box; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a href="https://www.google.com/intl/en-US_US/help/terms_maps.html" target="_blank" rel="noopener" style="text-decoration: none; cursor: pointer; color: rgb(68, 68, 68);">Terms of Use</a></div></div><button draggable="false" title="Toggle fullscreen view" aria-label="Toggle fullscreen view" type="button" class="gm-control-active gm-fullscreen-control" style="background: none rgb(255, 255, 255); border: 0px; margin: 10px; padding: 0px; position: absolute; cursor: pointer; user-select: none; border-radius: 2px; height: 40px; width: 40px; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; overflow: hidden; top: 0px; right: 0px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%20018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23666%22%20d%3D%22M0%2C0v2v4h2V2h4V0H2H0z%20M16%2C0h-4v2h4v4h2V2V0H16z%20M16%2C16h-4v2h4h2v-2v-4h-2V16z%20M2%2C12H0v4v2h2h4v-2H2V12z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23333%22%20d%3D%22M0%2C0v2v4h2V2h4V0H2H0z%20M16%2C0h-4v2h4v4h2V2V0H16z%20M16%2C16h-4v2h4h2v-2v-4h-2V16z%20M2%2C12H0v4v2h2h4v-2H2V12z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23111%22%20d%3D%22M0%2C0v2v4h2V2h4V0H2H0z%20M16%2C0h-4v2h4v4h2V2V0H16z%20M16%2C16h-4v2h4h2v-2v-4h-2V16z%20M2%2C12H0v4v2h2h4v-2H2V12z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"></button><div draggable="false" class="gm-style-cc" style="user-select: none; height: 14px; line-height: 14px; position: absolute; right: 0px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; box-sizing: border-box; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a target="_blank" rel="noopener" title="Report errors in the road map or imagery to Google" href="https://www.google.com/maps/@-31.197,150.744,9z/data=!10m1!1e1!12b1?source=apiv3&amp;rapsrc=apiv3" style="font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); text-decoration: none; position: relative;">Report a map error</a></div></div><div class="gmnoprint gm-bundled-control gm-bundled-control-on-bottom" draggable="false" controlwidth="40" controlheight="81" style="margin: 10px; user-select: none; position: absolute; bottom: 95px; right: 40px;"><div class="gmnoprint" controlwidth="40" controlheight="81" style="position: absolute; left: 0px; top: 0px;"><div draggable="false" style="user-select: none; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px; cursor: pointer; background-color: rgb(255, 255, 255); width: 40px; height: 81px;"><button draggable="false" title="Zoom in" aria-label="Zoom in" type="button" class="gm-control-active" style="background: none; display: block; border: 0px; margin: 0px; padding: 0px; position: relative; cursor: pointer; user-select: none; overflow: hidden; width: 40px; height: 40px; top: 0px; left: 0px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpolygon%20fill%3D%22%23666%22%20points%3D%2218%2C7%2011%2C7%2011%2C0%207%2C0%207%2C7%200%2C7%200%2C11%207%2C11%207%2C18%2011%2C18%2011%2C11%2018%2C11%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpolygon%20fill%3D%22%23333%22%20points%3D%2218%2C7%2011%2C7%2011%2C0%207%2C0%207%2C7%200%2C7%200%2C11%207%2C11%207%2C18%2011%2C18%2011%2C11%2018%2C11%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpolygon%20fill%3D%22%23111%22%20points%3D%2218%2C7%2011%2C7%2011%2C0%207%2C0%207%2C7%200%2C7%200%2C11%207%2C11%207%2C18%2011%2C18%2011%2C11%2018%2C11%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"></button><div style="position: relative; overflow: hidden; width: 30px; height: 1px; margin: 0px 5px; background-color: rgb(230, 230, 230); top: 0px;"></div><button draggable="false" title="Zoom out" aria-label="Zoom out" type="button" class="gm-control-active" style="background: none; display: block; border: 0px; margin: 0px; padding: 0px; position: relative; cursor: pointer; user-select: none; overflow: hidden; width: 40px; height: 40px; top: 0px; left: 0px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23666%22%20d%3D%22M0%2C7h18v4H0V7z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23333%22%20d%3D%22M0%2C7h18v4H0V7z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218%22%20height%3D%2218%22%20viewBox%3D%220%200%2018%2018%22%3E%0A%20%20%3Cpath%20fill%3D%22%23111%22%20d%3D%22M0%2C7h18v4H0V7z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"></button></div></div><div class="gmnoprint" controlwidth="40" controlheight="40" style="display: none; position: absolute;"><div style="width: 40px; height: 40px;"><button draggable="false" title="Rotate map 90 degrees" aria-label="Rotate map 90 degrees" type="button" class="gm-control-active" style="background: none rgb(255, 255, 255); display: none; border: 0px; margin: 0px 0px 32px; padding: 0px; position: relative; cursor: pointer; user-select: none; width: 40px; height: 40px; top: 0px; left: 0px; overflow: hidden; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224%22%20height%3D%2222%22%20viewBox%3D%220%200%2024%2022%22%3E%0A%20%20%3Cpath%20fill%3D%22%23666%22%20fill-rule%3D%22evenodd%22%20d%3D%22M20%2010c0-5.52-4.48-10-10-10s-10%204.48-10%2010v5h5v-5c0-2.76%202.24-5%205-5s5%202.24%205%205v5h-4l6.5%207%206.5-7h-4v-5z%22%20clip-rule%3D%22evenodd%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224%22%20height%3D%2222%22%20viewBox%3D%220%200%2024%2022%22%3E%0A%20%20%3Cpath%20fill%3D%22%23333%22%20fill-rule%3D%22evenodd%22%20d%3D%22M20%2010c0-5.52-4.48-10-10-10s-10%204.48-10%2010v5h5v-5c0-2.76%202.24-5%205-5s5%202.24%205%205v5h-4l6.5%207%206.5-7h-4v-5z%22%20clip-rule%3D%22evenodd%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224%22%20height%3D%2222%22%20viewBox%3D%220%200%2024%2022%22%3E%0A%20%20%3Cpath%20fill%3D%22%23111%22%20fill-rule%3D%22evenodd%22%20d%3D%22M20%2010c0-5.52-4.48-10-10-10s-10%204.48-10%2010v5h5v-5c0-2.76%202.24-5%205-5s5%202.24%205%205v5h-4l6.5%207%206.5-7h-4v-5z%22%20clip-rule%3D%22evenodd%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="height: 18px; width: 18px;"></button><button draggable="false" title="Tilt map" aria-label="Tilt map" type="button" class="gm-tilt gm-control-active" style="background: none rgb(255, 255, 255); display: block; border: 0px; margin: 0px; padding: 0px; position: relative; cursor: pointer; user-select: none; width: 40px; height: 40px; top: 0px; left: 0px; overflow: hidden; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218px%22%20height%3D%2216px%22%20viewBox%3D%220%200%2018%2016%22%3E%0A%20%20%3Cpath%20fill%3D%22%23666%22%20d%3D%22M0%2C16h8V9H0V16z%20M10%2C16h8V9h-8V16z%20M0%2C7h8V0H0V7z%20M10%2C0v7h8V0H10z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218px%22%20height%3D%2216px%22%20viewBox%3D%220%200%2018%2016%22%3E%0A%20%20%3Cpath%20fill%3D%22%23333%22%20d%3D%22M0%2C16h8V9H0V16z%20M10%2C16h8V9h-8V16z%20M0%2C7h8V0H0V7z%20M10%2C0v7h8V0H10z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="width: 18px;"><img src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2218px%22%20height%3D%2216px%22%20viewBox%3D%220%200%2018%2016%22%3E%0A%20%20%3Cpath%20fill%3D%22%23111%22%20d%3D%22M0%2C16h8V9H0V16z%20M10%2C16h8V9h-8V16z%20M0%2C7h8V0H0V7z%20M10%2C0v7h8V0H10z%22%2F%3E%0A%3C%2Fsvg%3E%0A" style="width: 18px;"></button></div></div></div></div></div><div style="background-color: white; font-weight: 500; font-family: Roboto, sans-serif; padding: 15px 25px; box-sizing: border-box; top: 5px; border: 1px solid rgba(0, 0, 0, 0.12); border-radius: 5px; left: 50%; max-width: 375px; position: absolute; transform: translateX(-50%); width: calc(100% - 10px); z-index: 1;"><div><img alt="" src="https://maps.gstatic.com/mapfiles/api-3/images/google_gray.svg" draggable="false" style="padding: 0px; margin: 0px; border: 0px; height: 17px; vertical-align: middle; width: 52px; user-select: none;"></div><div style="line-height: 20px; margin: 15px 0px;"><span style="color: rgba(0, 0, 0, 0.87); font-size: 14px;">This page can't load Google Maps correctly.</span></div><table style="width: 100%;"><tr><td style="line-height: 16px; vertical-align: middle;"><a href="https://developers.google.com/maps/documentation/javascript/error-messages?utm_source=maps_js&amp;utm_medium=degraded&amp;utm_campaign=billing#api-key-and-billing-errors" target="_blank" rel="noopener" style="color: rgba(0, 0, 0, 0.54); font-size: 12px;">Do you own this website?</a></td><td style="text-align: right;"><button class="dismissButton">OK</button></td></tr></table></div></div>
                            <script>
                                function initMap() {
                                    var uluru = {
                                        lat: -25.363,
                                        lng: 131.044
                                    };
                                    var grayStyles = [{
                                            featureType: "all",
                                            stylers: [{
                                                    saturation: -90
                                                },
                                                {
                                                    lightness: 50
                                                }
                                            ]
                                        },
                                        {
                                            elementType: 'labels.text.fill',
                                            stylers: [{
                                                color: '#ccdee9'
                                            }]
                                        }
                                    ];
                                    var map = new google.maps.Map(document.getElementById('map'), {
                                        center: {
                                            lat: -31.197,
                                            lng: 150.744
                                        },
                                        zoom: 9,
                                        styles: grayStyles,
                                        scrollwheel: false
                                    });
                                }
                            </script>
                            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;callback=initMap">
                            </script>
                        </div>
                    </div>
                </div>
                 <!--End Map -->
                <!-- Contact From -->
                <!-- From -->
<!--                 <div class="row justify-content-center"> -->
<!--                     <div class="col-lg-8"> -->
<!--                         <h3 class="mb-40">Massage </h3> -->
<!--                         Form -->
<!--                         <form class="form-contact contact_form mb-80" action="#" method="post"> -->
<!--                             <div class="row"> -->
<!--                                 <div class="col-sm-6"> -->
<!--                                     <div class="form-group"> -->
<!--                                         <input class="form-control error" name="name" id="name" type="text"  placeholder="Your Name"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="col-sm-6"> -->
<!--                                     <div class="form-group"> -->
<!--                                         <input class="form-control error" name="email" id="email" type="email" placeholder = 'Enter email address'"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="col-12"> -->
<!--                                     <div class="form-group"> -->
<!--                                         <textarea class="form-control w-100 error" name="message" id="message" cols="30" rows="9" placeholder = 'Enter Message'" placeholder="Enter Message"></textarea> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="form-group mt-3"> -->
<!--                                 <button type="submit" class="button button-contactForm boxed-btn">Send</button> -->
<!--                             </div> -->
<!--                         </form> -->
<!--                     </div> -->
<!--                 </div> -->
                <!-- listing Details Stat-->
                <div class="listing-details-area pb-80">
                    <div class="container">
                        <div class="row">
                       		<c:forEach items="${accomRoomOneList}" var="ar" varStatus="status" end="2">
	                            <div class="col-lg-4 col-md-6">
	                                <div class="single-listing mb-30">
	                                    <div class="list-img">
	                                    	<a href="${pageContext.request.contextPath}/accomRoomOne?accomRoomNo=${ar.accomRoomNo }&accomBuildingNo=${ar.accomBuildingNo }">
	                                            <c:forEach items="${ar.accomRoomImageList }" var="ari" varStatus="status">
						                   			<img src="${pageContext.request.contextPath}/resources/image/accom_room/${ari.getAccomRoomImageName() }" alt="">
						                   		</c:forEach>
					                   		</a>
                                            <!-- <span>Open</span> -->
                                        </div>
	                                    <div class="list-caption">
	                                        <span>
   	                                        	<a href="${pageContext.request.contextPath}/activityOne?activityNo=${ar.accomRoomNo }" style="color: #fff; text-decoration: none;">
   	                                        		Open
   	                                        	</a>
   	                                       	</span>
	                                        <h3>
                                              	<a href="${pageContext.request.contextPath}/activityOne?activityNo=${ar.accomRoomNo }">
                                              		${ar.getAccomRoomName()} room
                                              	</a>
                                            </h3>
	                                        <ul class="blog-info-link mt-3 pt-4 mb-0">
					                           <li><a style="color: #555555;"><i class="fa fa-user"></i> 기준인원 ${ar.accomRoomStan }</a></li>
					                           <li><a style="color: #555555;"><i class="fa fa-user"></i> 최대인원 ${ar.accomRoomMax }</a></li>
					                        </ul>
					                        <ul class="blog-info-link mt-3 mb-4">
					                           <li style="font-size: 1.3em;"><a style="color: #555555;">₩ ${ar.accomRoomPrice }</a></li>
					                        </ul>
					                        <ul class="pt-1">
												<c:forEach items="${ar.accomRoomItemList }" var="art" varStatus="status">
										            <li style="color: #555555;">${art.getAccomRoomItemName()}</li>
												</c:forEach>
											</ul>
	                                        <div class="list-footer">
                                                 <ul class="pb-15">
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
                                                     <li style="width: 60%; text-align: left;">
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
<%--                                                      <li style="width: 40%; text-align: right;">${ac.getActivityPhone() }</li> --%>
                                                 </ul>
                                             </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </c:forEach>
<!--                             <div class="col-lg-4 col-md-6"> -->
<!--                                 <div class="single-listing mb-30"> -->
<!--                                     <div class="list-img"> -->
<!--                                         <img src="assets/img/gallery/list3.png" alt=""> -->
<!--                                         <span>Open</span> -->
<!--                                     </div> -->
<!--                                     <div class="list-caption"> -->
<!--                                         <span>Open</span> -->
<!--                                          <h3><a href="listing_details.html">Saintmartine</a></h3> -->
<!--                                         <p>700/D, Kings road, Green lane, 85/ London</p> -->
<!--                                         <div class="list-footer"> -->
<!--                                             <ul> -->
<!--                                                 <li>+10 278 367 9823</li> -->
<!--                                                 <li>contact@midnight.com</li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                        </div>
                    </div>
                </div>
                <!-- listing Details End -->
            </div>
        </div>
        <!-- Listing caption End-->
        
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