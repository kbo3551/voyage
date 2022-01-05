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
    position: absolute;
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
			
			* {
    box-sizing: border-box;
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
            <div class="center">
                  <div>
                     <div class="blog_details">
                     <form action="" method="post">
                        <h2 style="font-size: 2em; color: #555555;"><input style="text-align: center;" readonly="readonly" name="activityName" value="${activityOne.activityName }"></h2>
                        <ul>
                           <li><a style="font-size: 1.3em; color: #555555;"><i class="fa fa-user"></i> 최대인원 <input style="text-align: center;" readonly="readonly" name="activityMaxP" value="${activityOne.activityMaxP }"></a></li>
                           <li><a style="font-size: 1.3em; color: #555555;"><i class="fa fa-comments"></i> 최대이용시간 <input style="text-align: center;" readonly="readonly" name="activityMaxT" value="${activityOne.activityMaxT }"></a></li>
                        </ul>
                        <ul>
                           <li style="font-size: 1.3em;"><a style="color: #555555;"><i class="fa fa-user"></i>체험가<input style="text-align: center;" readonly="readonly" name="activityPrice" value="${activityOne.activityPrice }"></a></li>
                        </ul>
                       
                        <br>
                        <div align="center">
						<table class="table"  style="width: 30%; font-size: 1.3em; text-align: center;">
							<thead>
									<tr>
										<th>DESCRIPTION</th>
									</tr>
							</thead>
								<tr>
									<td><input  readonly="readonly" name="activityDescription" value="${activityOne.activityDescription }"></td>
								</tr>
						</table>
						<table class="table"style="width: 30%; font-size: 1.3em; text-align: center;" >
							<thead>
									<tr>
										<th>오픈</th>
										<th>마감</th>
									</tr>
							</thead>
								<tr>
									<td><input  readonly="readonly" name="activityOpenHour" value="${activityOne.activityOpenHour }"></td>
									<td><input  readonly="readonly" name="activityCloseHour" value="${activityOne.activityCloseHour }"></td>
								</tr>
						</table>
						<table class="table" style="width: 65%; font-size: 1.3em; text-align: center;">
							<thead>
									<tr>
										<th></th>
										<th>추천장소</th>
										<th></th>
									</tr>
							</thead>
							<c:forEach items="${activityOne.getActivitySpotList()}" var="acs">
								<tr>						
									<td><input type="hidden" name="spotNo" value="${acs.activitySpotNo}">
										장소<input  readonly="readonly" name="activitySpotName" value="${acs.getActivitySpotName()}"></td>
									<td>종류<input  readonly="readonly" name="activitySpotCategory" value="${acs.getActivitySpotCategory()}"></td>
									<td>소개<input  readonly="readonly" name="activitySpotDescription" value="${acs.getActivitySpotDescription()}"></td>
								</tr>
							</c:forEach>
						</table>
						<table class="table" style="width: 30%; font-size: 1.3em; text-align: center;">
							<thead>
									<tr>
										<th>해시태그</th>
									</tr>
							</thead>
								<c:forEach items="${activityOne.getHashtagList()}" var="h">
								<tr>
									<td><input style="text-align: center;" readonly="readonly" name="hashtag" value="${h.getHashtag() }"></td>
								</tr>
								</c:forEach>
						</table>
						<br>
						 <div class="slider">
						
						  <div class="slides">
						   <c:forEach items="${activityOne.getActivityImageList()}" var="aci">
						    <div id="slide-1"><img id="imga" src="${contextPath}/resources/image/activity/${aci.getActivityImageName()}.${aci.activityImageExt}" alt=""></div>
						    </c:forEach>
						  </div>
						</div>
						<br>
						<div><button class="btn btn-finish btn-primary" type="submit">수정</button></div>
					</div>
					<br>
					</form>
					
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