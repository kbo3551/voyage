<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js">
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>ActivityOne</title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/assets/img/favicon.ico">

		<link rel="stylesheet" href="${contextPath}/accom/css/bootstrap-select.min.css"> 
		<link rel="stylesheet" href="${contextPath}/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${contextPath}/accom/css/wizard.css">
		<link rel="stylesheet" href="${contextPath}/accom/css/style.css">
		<link rel="stylesheet" href="${contextPath}/accom/css/icheck.min_all.css">
		
		<!-- CSS here -->
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
		
		<!-- 눈누 - 한산스네오 레귤러 폰트 -->
		<style type="text/css">
		
			@font-face {
			    font-family: 'SpoqaHanSansNeo-Regular';
			    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SpoqaHanSansNeo-Regular.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			
			body {
				background-color:WHITE;
				font-family: 'SpoqaHanSansNeo-Regular';
			}
			
			.container{
				font-size: 18px;
			}
			.form-control {
				font-size: 13px;
			}
			
			.header-area {
			    border-bottom: 0px;
			}
			
			.profiel-container {
			    border: 0px;
			}
		</style>
		
    </head>
    
    <body>

    
    
    
   	<c:import url="/WEB-INF/jsp/partial/banner.jsp"/>
   	
	<main>
	

        <div class="page-head hero-overly" style="background-image: url('${contextPath}/assets/img/page-header.jpg'); background-repeat : no-repeat;">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-9">
                        <div class="col-sm-10 col-sm-offset-1 profiel-container" style="line-height:125%">
                            
                        </div>
                        <!--Hero form -->
                    
                    </div>
                </div>
            </div>
        </div>
      <section class="blog_area single-post-area section-padding" style="padding-bottom: 20px !important;">
      
         <div class="container">
            <div class="row">
            
               <div class="col-lg-8 posts-list">
                  <div>
                     <div>
                      <h1 style="font-size:30px;">체험 상세</h1>
                        <c:forEach items="${activityOne.activityImageList }" var="aci" varStatus="status">
                   			<img src="${pageContext.request.contextPath}/resources/image/activity/${aci.getActivityImageName() }" alt="">
                   		</c:forEach>
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
						 <div class="quote-wrapper" style="width:500px;height:150px;">
                            <label>DESCRIPTION:</label>
                       		 <input style="width:300px;height:50px;font-size:15px;" class="form-control" type="text" readonly="readonly" value="${activityOne.activityDescription }">
                         </div> 
                 		 <div class="quote-wrapper" style="width:500px;height:150px;">
                            <label>오픈</label>
                       		<input style="width:300px;height:50px;font-size:15px;" class="form-control" type="text" readonly="readonly" value=" ${activityOne.activityOpenHour }">
                         </div> 
                     	<div class="quote-wrapper" style="width:500px;height:150px;">
                            <label>마감</label>
                       		<input style="width:300px;height:50px;font-size:15px;" class="form-control" type="text" readonly="readonly" value=" ${activityOne.activityCloseHour }">
                         </div> 
                        <div class="quote-wrapper" style="width:500px;height:350px;">
                            <label>해시태그</label>
                            <c:forEach items="${activityOne.getHashtagList()}" var="h">
                       		<input style="width:300px;height:50px;font-size:15px;" class="form-control" type="text" readonly="readonly" value=" ${h.getHashtag() }">
 
                       		</c:forEach>
                         </div> 
                         <div class="quote-wrapper" style="width:500px;height:300px;">
                            <label>추천장소</label>
                             <c:forEach items="${activityOne.getActivitySpotList()}" var="acs">
                       		<input style="width:300px;height:50px;font-size:15px;"class="form-control" type="text" readonly="readonly" value="장소명: ${acs.getActivitySpotName()}">
                   
                       		<input style="width:300px;height:50px;font-size:15px;"class="form-control" type="text" readonly="readonly" value="종류: ${acs.getActivitySpotCategory()}">
                 
                       		<input style="width:300px;height:50px;font-size:15px;"class="form-control" type="text" readonly="readonly" value="DESCRIPTION: ${acs.getActivitySpotDescription()}">
                       		</c:forEach>
                         </div> 
                     </div>
                  </div>
            </div>
			</div>
         </div>
      </section>
 

	</main>
	<!--footer.jsp 시작  -->
    	<c:import url="/WEB-INF/jsp/partial/footer.jsp"/>
    <!--footer.jsp 끝  -->
    
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>
    
	
	<script src="${contextPath}/accom/js/vendor/modernizr-2.6.2.min.js"></script>
    <script src="${contextPath}/accom/js//jquery-1.10.2.min.js"></script>
    <script src="${contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${contextPath}/accom/js/bootstrap-select.min.js"></script>
    <script src="${contextPath}/accom/js/bootstrap-hover-dropdown.js"></script>
    <script src="${contextPath}/accom/js/easypiechart.min.js"></script>
    <script src="${contextPath}/accom/js/jquery.easypiechart.min.js"></script>
    <script src="${contextPath}/accom/js/owl.carousel.min.js"></script>
    <script src="${contextPath}/accom/js/wow.js"></script>
    <script src="${contextPath}/accom/js/icheck.min.js"></script>

    <script src="${contextPath}/accom/js/price-range.js"></script> 
    <script src="${contextPath}/accom/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
    <script src="${contextPath}/accom/js/jquery.validate.min.js"></script>
    <script src="${contextPath}/accom/js/wizard.js"></script>

    <script src="${contextPath}/accom/js/main.js"></script>
    
</body>
</html>

