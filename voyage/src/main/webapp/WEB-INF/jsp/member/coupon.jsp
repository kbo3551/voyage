<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<title>쿠폰</title>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/assets/img/favicon.ico">

		<!-- CSS here -->
			<link rel="stylesheet" href="${contextPath}/accom/css/bootstrap-select.min.css"> 
            <link rel="stylesheet" href="${contextPath}/assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/slicknav.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/flaticon.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/price_rangs.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/animate.min.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/magnific-popup.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/themify-icons.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/slick.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/nice-select.css">
            <link rel="stylesheet" href="${contextPath}/assets/css/style.css">
            <link rel="stylesheet" href="${contextPath}/bootstrap/css/bootstrap.min.css">
            
    
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
                    <img src="${contextPath}/assets/img/logo/loder.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
    
    
   	<c:import url="/WEB-INF/jsp/partial/banner.jsp"/>

	

	<main>
	

	


        <div class="page-head hero-overly" style="background-image: url('${contextPath}/assets/img/page-header.jpg'); background-repeat : no-repeat;"> 
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
        <div class="content-area user-profiel" style="background-color: #FCFCFC;">&nbsp;
            <div class="container">   
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1 profiel-container">
                   		<h1 class="page-title">Hello!  <span class="orange strong" style="color: olive;">${loginMember.getMemberNickname()}</span></h1>
						<br>
                        <div class="profiel-header">
                            <h2>
                                쿠폰목록 <br>
                            </h2>
                            <hr>
                        </div>                        
                        <div class="clear"> 
	                            <div class="col-sm-12">
		                            &nbsp;&nbsp;<label>쿠폰</label>
									<div>
                        <table class="table table-hover my-0">
                           <thead>
                              <tr>
                                 <th>발급 번호</th>                                 
                                 <th>쿠폰 상태</th>
                                 <th>발급날짜</th>
                                 <th>사용가능기한</th>
                                 <th></th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach items="${memberCouponList}" var="mc">
                                 <tr>
                                    <td width="10%" >${mc.couponMemberNo}</td>
                                    <td>${mc.couponUse}</td>
                                    <td>${mc.createDate}</td>
                                    <td>${mc.deadLine}</td>
                                    <td style="text-align:left;"><label></label>    
									</td>
                                 </tr>
                              </c:forEach>
                           </tbody>
                        </table>
                <!-- 회운이 발급받은 쿠폰 페이징 -->
                <c:if test="${memberCouponCount > 0}">
                <div class="container">
                <ul class="nav justify-content-center bg-light">
                   <c:if test="${memberCouponBeginRow > (ROW_PER_PAGE * 10)}">
                      <li><a href="/member/coupon?memberCouponPage=${memberCouponPage-1}&couponPage=${couponPage}">&lt;</a></li>
                   </c:if>
                   <c:set var="doneLoop" value="false"></c:set>
                   <c:forEach var="f" begin="${memberCouponPageNo}" end="${memberCouponPageNo + 9}">
                      <c:if test="${not doneLoop}">
                         <c:choose>
                            <c:when test="${memberCouponPage == f}">
                               <li class="active"class="nav-link"><span>${f}</span></li>
                            </c:when>
                            <c:otherwise>
                               <li><a class="nav-link active" href="/member/coupon?memberCouponPage=${f}&couponPage=${couponPage}">${f}</a></li>
                            </c:otherwise>
                         </c:choose>
                         <c:if test="${f == memberCouponlastPage}">
                            <c:set var="doneLoop" value="true"></c:set>
                         </c:if>
                      </c:if>
                   </c:forEach>
                   <c:if test="${memberCouponPage + 10 <= memberCouponlastPage}">
                      <li><a class="nav-link active" href="/member/coupon?memberCouponPage=${memberCouponPage+10}&couponPage=${couponPage}">&gt;</a></li>
                   </c:if>
                </ul>
          </div> 
        </c:if>  
           <div class="container-fluid p-0">
               <h1 class="h3 mb-3">
                  <strong>발급가능 쿠폰 목록</strong>
               </h1>
               <div class="clear">
                  <div>
                     <div>
                        <table class="table table-hover my-0">
                           <thead>
                              <tr>
                             	 <th>쿠폰 번호</th>
                                 <th>쿠폰 이름</th>
                                 <th>조건 금액</th>
                                 <th>할인 금액</th>
                                 <th>만료 일자</th>
                                 <th></th>
                                 <th></th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach items="${couponList}" var="c">
						        <c:if test="${c.couponState == '활성화'}">
                                 <tr>
                                 	<td width="10%">${c.couponNo}</td>
                                    <td width="15%">${c.couponName}</td>
                                    <td>${c.couponTerms}</td>
                                    <td>${c.couponDiscount}</td>
                                    <td>${c.deadLine}</td>
                                    <td style="text-align:left;"><label></label>    
										&emsp;
									<button class="btn btn-finish btn-primary" type="submit">발급</button>
										</td>
                                	 </tr>
                                 </c:if>
                              </c:forEach>
                           </tbody>
                        </table>
                        
                     </div>
                  </div>
               </div>
            </div>
                                              <!-- 발급가능한 쿠폰 페이징 -->
           <c:if test="${couponCount > 0}">
                <div class="container">
                <ul class="nav justify-content-center bg-light">
                   <c:if test="${couponBeginRow > (ROW_PER_PAGE * 10)}">
                      <li><a href="/member/coupon?memberCouponPage=${memberCouponPage}&couponPage=${couponPage-1}">&lt;</a></li>
                   </c:if>
                   <c:set var="doneLoop" value="false"></c:set>
                   <c:forEach var="f" begin="${couponPageNo}" end="${couponPageNo + 9}">
                      <c:if test="${not doneLoop}">
                         <c:choose>
                            <c:when test="${couponPage == f}">
                               <li class="active"><span>${f}</span></li>
                            </c:when>
                            <c:otherwise>
                               <li><a class="nav-link active" href="/member/coupon?memberCouponPage=${memberCouponPage}&couponPage=${f}">${f}</a></li>
                            </c:otherwise>
                         </c:choose>
                         <c:if test="${f == couponLastPage}">
                            <c:set var="doneLoop" value="true"></c:set>
                         </c:if>
                      </c:if>
                   </c:forEach>
                   <c:if test="${couponPage + 10 <= couponLastPage}">
                      <li><a class="nav-link active" href="/member/coupon?memberCouponPage=${memberCouponPage}&couponPage=${couponPage+10}">&gt;</a></li>
                   </c:if>
                </ul>
         	 </div>
          </c:if> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</main>


	<c:import url="/WEB-INF/jsp/partial/footer.jsp"/>
    
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>


    <!-- JS here -->
	<!-- All JS Custom Plugins Link Here here -->
       <script src="${contextPath}/assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script src="${contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
       <script src="${contextPath}/assets/js/popper.min.js"></script>
       <script src="${contextPath}/assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
       <script src="${contextPath}/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
       <script src="${contextPath}/assets/js/owl.carousel.min.js"></script>
       <script src="${contextPath}/assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
       <script src="${contextPath}/assets/js/wow.min.js"></script>
	<script src="${contextPath}/assets/js/animated.headline.js"></script>
       <script src="${contextPath}/assets/js/jquery.magnific-popup.js"></script>

	<!-- Nice-select, sticky -->
       <script src="${contextPath}/assets/js/jquery.nice-select.min.js"></script>
	<script src="${contextPath}/assets/js/jquery.sticky.js"></script>
       
       <!-- contact js -->
       <script src="${contextPath}/assets/js/contact.js"></script>
       <script src="${contextPath}/assets/js/jquery.form.js"></script>
       <script src="${contextPath}/assets/js/jquery.validate.min.js"></script>
       <script src="${contextPath}/assets/js/mail-script.js"></script>
       <script src="${contextPath}/assets/js/jquery.ajaxchimp.min.js"></script>
       
	<!-- Jquery Plugins, main Jquery -->	
       <script src="${contextPath}/assets/js/plugins.js"></script>
       <script src="${contextPath}/assets/js/main.js"></script>
        
</body>
</html>