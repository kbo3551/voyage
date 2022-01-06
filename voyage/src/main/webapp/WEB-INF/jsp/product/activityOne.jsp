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
    background: rgb(200,200,200);
    border-radius: 10px;
  }
  .slides::-webkit-scrollbar-track {
    background: transparent;
  }
  .slides > div {
    scroll-snap-align: start;
    flex-shrink: 0;
    width: 700px;
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
    background-color: rgba(200,200,200,0.01);
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

        <!-- Hero Start-->
        <div class="hero-area3 hero-overly2 d-flex align-items-center ">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-9">
                        <div class="hero-cap text-center pt-50 pb-20">
                            <h2>체험 상세</h2>
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
                     <div class="slider">
                    <div class="slides">
                   		<c:forEach items="${activityOne.getActivityImageList()}" var="aci">
	                        <div id="slide-1"><img id="imga" src="${pageContext.request.contextPath}/resources/image/activity/${aci.getActivityImageName()}.${aci.activityImageExt}" alt=""></div>
	                    </c:forEach>
	                    </div>
	                    </div>
                     </div>
                     <div class="blog_details">
                        <h2> ${activityOne.activityName }</h2>
                        <ul class="blog-info-link mt-3 pt-4 mb-0">
                           <li><a style="color: #555555;"><i class="fa fa-user"></i> 최대인원 ${activityOne.activityMaxP }</a></li>
                           <li><a style="color: #555555;"><i class="fa fa-comments"></i> 최대이용시간 ${activityOne.activityMaxT }</a></li>
                        </ul>
                        <ul class="blog-info-link mt-3 mb-4">
                           <li style="font-size: 1.3em;"><a style="color: #555555;"><i class="fa fa-user"></i>₩ ${activityOne.activityPrice }</a></li>
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
                              DESCRIPTION : ${activityOne.activityDescription }
                              <br><br>
                              <small>오픈: ${activityOne.activityOpenHour } / 마감: ${activityOne.activityCloseHour }</small>
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
                        <form action="${pageContext.request.contextPath}/member/addActivityByInterest" method="post" name="addActivityByInterest" id="addActivityByInterest">
                        <input type="hidden" name="activityNo" value=${activityOne.activityNo }>
                        <p class="like-info"><span class="align-middle">
                        <button  class="btn" style="background-color: rgb(220,74,100);" type="submit">♥</button>
                        </span>
                        </p>
                        </form>
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
<!--                      <aside class="single_sidebar_widget search_widget"> -->
<!--                         <form action="#"> -->
<!--                            <div class="form-group"> -->
<!--                               <div class="input-group mb-3"> -->
<!--                                  <input type="text" class="form-control" placeholder='Search Keyword' -->
<!--                                     onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'"> -->
<!--                                  <div class="input-group-append"> -->
<!--                                     <button class="btns" type="button"><i class="ti-search"></i></button> -->
<!--                                  </div> -->
<!--                               </div> -->
<!--                            </div> -->
<!--                            <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" -->
<!--                               type="submit">Search</button> -->
<!--                         </form> -->
<!--                      </aside> -->
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
                        	<c:forEach items="${activityOne.getHashtagList()}" var="h">
		                       <li>
	                              <a href="${pageContext.request.contextPath}/#">${h.getHashtag() }</a>
	                           </li>
	                     	</c:forEach>	
                        </ul>
                     </aside>
                     <aside class="single_sidebar_widget popular_post_widget">
                        <h3 class="widget_title">Host 추천 장소</h3>
                        <c:forEach items="${activityOne.getActivitySpotList()}" var="acs">
	                        <div class="media post_item">
	                           <img src="${pageContext.request.contextPath}/assets/img/post/post_1.png" alt="post">
	                           <div class="media-body">
	                              <a>
	                                 <h3 style="margin-top: 0px !important;">${acs.getActivitySpotName()}</h3>
	                              </a>
	                              <small style="color: #EB566C;">${acs.getActivitySpotCategory()}</small>
	                              <h5 style="margin-top: 2px !important;">${acs.getActivitySpotDescription()}</h5>
	                           </div>
	                        </div>
	                     </c:forEach>
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
                     </aside>
                     
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
                    	<div class="row pb-30" style="justify-content: center; flex-wrap: nowrap !important;">
                            <div class="col-sm-5">
                            	<div style="text-align: left; padding-right: 8%;">
	                                <h3 style="letter-spacing: 0.1em;"><i class="fa fa-map-marker"></i> Address</h3>
	                                <p>
	                                    <small id="address">${activityOne.activityAddress.activityAddressZip }</small><br>
	                                    <small id="addressName">${activityOne.activityAddress.activityAddressDetail }</small>
	                                </p>
                                </div>
                            </div>
                            <!-- /.col-sm-4 -->
                            <div class="col-sm-5">
                            	<div style="text-align: left; padding-left: 8%;">
	                                <h3><i class="fa fa-phone"></i> Call center</h3>
	                                <p class="text-muted">전화문의</p>
	                                <p><strong>${activityOne.activityPhone }</strong></p>
                                </div>
                            </div>
                            <!-- /.col-sm-4 -->
                            <div class="col-sm-5">
                            	<div style="text-align: left;">
	                                <h3><i class="fa fa-envelope"></i> Voyage E-mail</h3>
	                                <p class="text-muted"></p>
	                                <ul>
	                                    <li><strong><a href="mailto:">oliweq@naver.com</a></strong>   </li>
	                                    <li><strong><a href="${pageContext.request.contextPath}/qnaList">Q&A</a></strong> - Q&A 문의</li>
	                                </ul>
                                </div>
                            </div>
                            <!-- /.col-sm-4 -->
                        </div>
                            <!-- /.row -->
                </div>
                <!-- Map -->
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0fdeb74ea7218785dc85928a77d4373c&libraries=services"></script>
						<div class="center-block" id="map" style="width:1000px;height:400px;"></div>
						<br>

                          <script>
                          var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                          mapOption = {
                              center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                              level: 3 // 지도의 확대 레벨
                          };  

                      // 지도를 생성합니다    
                      var map = new kakao.maps.Map(mapContainer, mapOption); 

                      // 주소-좌표 변환 객체를 생성합니다
                      var geocoder = new kakao.maps.services.Geocoder();
						
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch($('#address').text(), function(result, status) {
						
							// 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {

						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						        
						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });

						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$('#addressName').text()+'</div>'
						        });
						        infowindow.open(map, marker);

						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});	
							
								
						var zoomControl = new kakao.maps.ZoomControl();
						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new kakao.maps.MapTypeControl();

						// 지도 타입 컨트롤을 지도에 표시합니다
						map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
						map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
						
						var geocoder = new kakao.maps.services.Geocoder();
						
								
						</script>

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
                       		<c:forEach items="${activityOneList}" var="ac" varStatus="status" end="2">
	                            <div class="col-lg-4 col-md-6">
	                                <div class="single-listing mb-30">
	                                    <div class="list-img">
	                                    	<a href="${pageContext.request.contextPath}/activityOne?activityNo=${ac.activityNo }">
						                        <c:forEach items="${ac.activityImageList }" var="aci" varStatus="status">
						                   			<img src="${pageContext.request.contextPath}/resources/image/activity/${aci.getActivityImageName() }" alt="">
						                   		</c:forEach>
					                   		</a>
                                            <!-- <span>Open</span> -->
                                        </div>
	                                    <div class="list-caption">
	                                        <span>
   	                                        	<a href="${pageContext.request.contextPath}/activityOne?activityNo=${ac.activityNo }" style="color: #fff; text-decoration: none;">
   	                                        		Open
   	                                        	</a>
   	                                       	</span>
	                                        <h3>
                                              	<a href="${pageContext.request.contextPath}/activityOne?activityNo=${ac.activityNo }">
                                              		${ac.getActivityName()}
                                              	</a>
                                            </h3>
	                                        <ul class="blog-info-link mt-3 pt-4 mb-0">
					                           <li><a style="color: #555555;"><i class="fa fa-user"></i> 최대인원 ${activityOne.activityMaxP }</a></li>
					                           <li><a style="color: #555555;"><i class="fa fa-comments"></i> 최대이용시간 ${activityOne.activityMaxT }</a></li>
					                        </ul>
					                        <ul class="blog-info-link mt-3 mb-4">
					                           <li style="font-size: 1.3em;"><a style="color: #555555;"><i class="fa fa-user"></i>₩ ${activityOne.activityPrice }</a></li>
					                        </ul>
	                                        <div class="list-footer">
                                                 <ul class="pb-15">
                                                 	<li>
														<c:forEach items="${ac.hashtagList }" var="ach" varStatus="status">
												            <c:choose>
														        <c:when test="${fn:length(ach.getHashtag()) gt 35}">
														        	<c:out value="${fn:substring(ach.getHashtag(), 0, 34)}···"></c:out>
														        </c:when>
														        <c:otherwise>
															        <c:out value="${ach.getHashtag()}">
															        </c:out>
														        </c:otherwise>
															</c:choose>
														</c:forEach>
													</li>	                                                    
                                                 </ul>
                                                 <ul>
                                                     <li style="width: 60%; text-align: left;">
		                                                <c:choose>
													        <c:when test="${fn:length(ac.getActivityDescription()) gt 35}">
													        	<c:out value="${fn:substring(ac.getActivityDescription(), 0, 34)}···"></c:out>
													        </c:when>
													        <c:otherwise>
														        <c:out value="${ac.getActivityDescription()}">
														        </c:out>
													        </c:otherwise>
														</c:choose>
													</li>
                                                     <li style="width: 40%; text-align: right;">${ac.getActivityPhone() }</li>
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