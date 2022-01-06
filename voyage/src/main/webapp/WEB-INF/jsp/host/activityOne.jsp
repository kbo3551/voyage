<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>체험 상세</title>
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
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.js" integrity="sha512-zO8oeHCxetPn1Hd9PdDleg5Tw1bAaP0YmNvPY8CwcRyUk7d7/+nyElmFrB6f7vg4f7Fv4sui1mcep8RIEShczg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            <script src="${contextPath}/Chart.js-2.9.4/dist/Chart.js"></script>
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

	<script type="text/javascript">
         // 사업자 번호
         let hostNo = "${hostSession.getHostNo()}";
         // 체험 번호
         let activityNo = "${param.activityNo}"
			
         
        	// 최근 한달간 체험 일별 수익
             $.ajax(
                {
                   type: "GET",
                   url:"/voyage/selectActivityProfitByMonthToDateOne?hostNo="+hostNo+"&activityNo="+activityNo,
                   async:false,
                   success : function (data) {
                      let label = [];
                            let amount = [];
                      
                      for(let key in data){
                         label.push(key)
                         amount.push(data[key])
                      }
                      
                      document.addEventListener("DOMContentLoaded", function() {

                         // Line chart
                         new Chart(document.getElementById("activity-dashboard-line"), {
                            type: "line",
                            data: {
                               labels: label,
                               datasets: [{
                                  label: "",
                                  fill: true,
                                  data: amount,
                                  backgroundColor: 'rgba(255, 99, 132, 0.1)',
                                   borderColor: 'rgb(23, 80, 190)',
                                   tension: 0.3
                               }]
                            },
                            options: {
                               // 컨테이너가 수행 할 때 차트 캔버스의 크기를 조정(dafalut : true)
                               responsive: true,
                               // 크기 조정 이벤트 후 새 크기로 애니메이션하는 데 걸리는 시간(밀리 초) (defalut : 0)
                               responsiveAnimationDuration: 1000,
                               // (width / height) 크기를 조정할 떄 원래 캔버스 종횡비를 유지 (defalut : true)
                               maintainAspectRatio: true,
                               // 캔버스 종횡비( width / height, 정사각형 캔버스를 나타내는 값) 높이가 속성으로 또는 스타일 통해 명시적으로 정의된 경우이 옵션은 무시
                               aspectRatio: 2,
                               title: {
                                  display: true,
                                  // 차트 제목 
                                  text: ' 월별 수익'
                               },
                               legend:{
                                  display: false
                               },
                               tooltips: {
                                  mode: 'index',
                                  intersect: false,
                               },
                               hover: {
                                  mode: 'nearest',
                                  intersect: true
                               },
                               
                               scales: {
                                  xAxes: [{
                                     reverse: true,
                                     gridLines: {
                                        color: "rgba(0,0,0,0.0)"
                                     },
                                     ticks: {
                                             display: false
                                         }
                                  }],
                               }
                            }
                         });
                      });
                   }   
                }      
             )
         
    </script>

    <main>
    	
    
        <div class="hero-area3 hero-overly2 d-flex align-items-center ">
        
            <div class="container">
            
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-9">
                        <div class="hero-cap text-center pt-50 pb-20">
                            <h2>체험 상세</h2>
                        </div>
                    </div>
                    
                </div>
                
            </div>
        </div>
      <section class="blog_area single-post-area section-padding" style="padding-bottom: 20px !important;">
      <div class="container">
      		<div class="clear">
               		<div class="col-sm-12">
                          <div class="chart chart-sm">
                              <canvas id="activity-dashboard-line"></canvas>
                           </div>
                     </div>
               	</div>
            </div>
            <br>
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
                     	<c:set var="activityName" value="${activityOne.activityName}"/>
                        <h2> ${activityName }</h2>
                        <ul class="blog-info-link mt-3 pt-4 mb-0">
                           <li><a style="color: #555555;"><i class="fa fa-user"></i> 최대인원 ${activityOne.activityMaxP }</a></li>
                           <li><a style="color: #555555;"><i class="fa fa-comments"></i> 최대이용시간 ${activityOne.activityMaxT }</a></li>
                        </ul>
                        <ul class="blog-info-link mt-3 mb-4">
                           <li style="font-size: 1.3em;"><a style="color: #555555;"><i class="fa fa-user"></i>₩ ${activityOne.activityPrice }</a></li>
                        </ul>
                        <div class="quote-wrapper">
                           <div class="quotes">
                              DESCRIPTION : ${activityOne.activityDescription }
                              <br><br>
                              <small>오픈: ${activityOne.activityOpenHour } / 마감: ${activityOne.activityCloseHour }</small>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4">
                  <div class="blog_right_sidebar">
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
                     </aside>
                     
                     <aside class="single_sidebar_widget instagram_feeds">
                            <form action="${pageContext.request.contextPath}/#" method="get">
							<input type="hidden" name="accomRoomNo" value="${activityOne.activityNo}">
                     <div align="center"><button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" type="submit">삭제</button></div>
                     </form>
                     </aside>
                  </div>
               </div>
            </div>
            
         </div>
      </section>
        <div class="listing-caption">
            <div class="container">
                <div class="row justify-content-center pt-80" style="border-top: 1px solid #eee;">
                </div>
						<br>
						
                        </div>
                        
                    </div>
               

        
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