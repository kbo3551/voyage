<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<title>주문목록</title>
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
                                주문목록 <br>
                            </h2>
                            <span style="float: left; margin-top: 0.7%">
								<small>
									<a href="${contextPath}/member/selectMyOrderList">주문내역</a>
								</small> | 
								<small>
									<a href="${contextPath}/member/selectMyProfile">회원정보</a>
								</small>
							</span>
							
							<span style="float: left; padding-left: 3%">
								<c:choose>
	                        		<c:when test="${category == '숙소'}">
	                        			<select id="category" name="category">
			                        		<option value="all">모두보기</option>
			                        		<option value="accom" selected="selected">숙소</option>
			                        		<option value="activity">체험</option>
			                        	</select>
	                        		</c:when>
	                        		<c:when test="${category == '체험'}">
	                        			<select id="category" name="category">
			                        		<option value="all">모두보기</option>
			                        		<option value="accom">숙소</option>
			                        		<option value="activity" selected="selected">체험</option>
			                        	</select>
	                        		</c:when>
	                        		<c:otherwise>
	                        			<select id="category" name="category">
			                        		<option value="all" selected="selected">모두보기</option>
			                        		<option value="accom">숙소</option>
			                        		<option value="activity">체험</option>
			                        	</select>
	                        		</c:otherwise>
	                        	</c:choose>
							</span>
							
							<br>
                            <hr>
                        </div>
                        
                        	

                        
                        <div class="clear"> 
                        	<c:if test="${param.category != 'activity'}">
	                            <div class="col-sm-12">
		                            &nbsp;&nbsp;<label>숙소</label>
									<div>
										<c:choose>
											<c:when test="${!empty accomPaymentList}">
												<div>
													<table class="table" style="text-align: center; vertical-align: middle; display:table;">
														<tr>
															<td style="font-weight: bold; display:table-cell;vertical-align:middle;">날짜</td>
															<td style="font-weight: bold; display:table-cell;vertical-align:middle;">상품정보</td>
															<td style="font-weight: bold; display:table-cell;vertical-align:middle;">상태</td>
															<td style="font-weight: bold; display:table-cell;vertical-align:middle;">확인</td>
														</tr>
														<c:forEach var="ap" items="${accomPaymentList}">
															<tr>
																<fmt:parseDate var="apCreateDateString" value="${ap.createDate}" pattern="yyyy-MM-dd HH:mm:ss.S" />
																<td style="display:table-cell;vertical-align:middle;" width="13%">
																	<small><fmt:formatDate value="${apCreateDateString}" pattern="yyyy-MM-dd" /></small>
																</td>
																<fmt:parseDate var="apAccomCheckInString" value="${ap.accomCheckIn}" pattern="yyyy-MM-dd HH:mm:ss.S" />
																<fmt:parseDate var="apAccomCheckOutString" value="${ap.accomCheckOut}" pattern="yyyy-MM-dd HH:mm:ss.S" />
																<td style="display:table-cell;vertical-align:middle;" width="61%">
																	<table frame="void">
																		<td width="30%" style="vertical-align: middle;">
																			<img width="80%" height="100&" src="${contextPath}/resources/image/accom_room/${ap.accomRoomImage.accomRoomImageName}.${ap.accomRoomImage.accomRoomImageExt}">
																		</td>
																		<td width="70%">
																			<span style="float:right; text-align: left;">
																			<p><small>${ap.accomRoom.accomRoomName}</small></p>
																			<p><small>인원 : ${ap.accomUsePerson}명 / 기간 : 
																			<fmt:formatDate value="${apAccomCheckInString}" pattern="yyyy-MM-dd HH:mm" /> ~ <fmt:formatDate value="${apAccomCheckOutString}" pattern="yyyy-MM-dd HH:mm" />
																			</small></p>
																			<p><b><fmt:formatNumber type="number" maxFractionDigits="3" value="${ap.accomAmount}" />원</b></p>
																			</span>
																		</td>
																	</table>
																	
																</td>
																<td style="display:table-cell;vertical-align:middle;" width="13%">${ap.accomPaymentState}</td>
																<td style="display:table-cell;vertical-align:middle;" width="13%"><small>${ap.receipt}</small></td>
															</tr>
														</c:forEach>
													</table>
												</div>
											</c:when>
											<c:otherwise>
												<small>&nbsp;&nbsp;목록이 비어있습니다.</small>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								
								<!-- 숙소 페이징 -->
								<c:if test="${accomCount > 0}">
									<div class="clear">
			                           <ul class="nav justify-content-center">
			                              <c:if test="${accomBeginRow > (ROW_PER_PAGE * 10)}">
			                                 <li><a href="${contextPath}/member/selectMyOrderList?accomPage=${accomPageNo-1}&activityPage=${activityPage}">&lt;</a></li>
			                              </c:if>
			                              <c:set var="doneLoop" value="false"></c:set>
			                              <c:forEach var="f" begin="${accomPageNo}" end="${accomPageNo + 9}">
			                                 <c:if test="${not doneLoop}">
			                                    <c:choose>
			                                       <c:when test="${accomPage == f}">
			                                          <li class="active"><span class="nav-link">${f}</span></li>
			                                       </c:when>
			                                       <c:otherwise>
			                                          <li><a class="nav-link active" href="${contextPath}/member/selectMyOrderList?accomPage=${f}&activityPage=${activityPage}">${f}</a></li>
			                                       </c:otherwise>
			                                    </c:choose>
			
			                                    <c:if test="${f == accomLastPage}">
			                                       <c:set var="doneLoop" value="true"></c:set>
			                                    </c:if>
			                                 </c:if>
			                              </c:forEach>
			                              <c:if test="${accomPage + 10 <= accomLastPage}">
			                                 <li><a class="nav-link active" href="${contextPath}/member/selectMyOrderList?accomPage=${accomPage+5}&activityPage=${activityPage}">&gt;</a></li>
			                              </c:if>
			                           </ul>
			                        </div>
								</c:if>
                        	</c:if>
                        
                        	<c:if test="${param.category == null}">
                        		<br>
                        		<br>
                        		<br>
                        	</c:if>
                        	
							<c:if test="${param.category != 'accom'}">
								<div class="clear"> 
		                            <div class="col-sm-12">
		                            	&nbsp;&nbsp;<label>체험</label>
		                            	<c:if test="${ActivityPaymentList > 0}">
		                            		<span>&nbsp;&nbsp;<a class="btn" href="${contextPath}/host/activityReqState" style="background: rgb(40,180,240); color: white;">신청조회</a></span>
		                            	</c:if>
		                            	
										<div>
											<c:choose>
												<c:when test="${!empty ActivityPaymentList}"><!-- ne '[]' -->
													<div>
														<table class="table" style="text-align: center; vertical-align: middle; display:table;">
															<tr>
																<td style="font-weight: bold; display:table-cell;vertical-align:middle;">이름</td>
																<td style="font-weight: bold; display:table-cell;vertical-align:middle;">생성일</td>
																<td style="font-weight: bold; display:table-cell;vertical-align:middle;">공개여부</td>
																<td style="font-weight: bold; display:table-cell;vertical-align:middle;"><a class="btn" style="background: rgb(40,180,240); color: white;">체험추가</a></td>
															</tr>
															<c:forEach var="al" items="${ActivityList}">
																<tr>
																	<td style="display:table-cell;vertical-align:middle;" width="25%"><small>${al.getActivityName()}</small></td>
																	<fmt:parseDate var="alCreateDateString" value="${al.getCreateDate()}" pattern="yyyy-MM-dd HH:mm:ss.S" />
																	<td style="display:table-cell;vertical-align:middle;" width="25%"><small><fmt:formatDate value="${alCreateDateString}" pattern="yyyy-MM-dd" /></small></td>
																	<td style="display:table-cell;vertical-align:middle;" width="25%"><small>${al.getActivityState()}</small></td>
																	<td style="display:table-cell;vertical-align:middle;" width="25%"><small><a href="#" class="btn" style="background: rgb(130,130,130);">상세</a></small></td>
																</tr>
															</c:forEach>
														</table>
													</div>
												</c:when>
												<c:otherwise>
													<small>&nbsp;&nbsp;목록이 비어있습니다.</small>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</c:if>
							
							
                        	<div class="col-sm-20 col-sm-offset-1" style="text-align: right;">
                            	<br>
							</div>
                         </div>
                         <br>
		            </div>
                </div>
                <br>
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