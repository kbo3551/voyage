<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js">
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>VOYAGE | addAccomBuilding</title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/assets/img/favicon.ico">
		
		<link rel="stylesheet" href="${contextPath}/accom/css/bootstrap-select.min.css"> 
		<link rel="stylesheet" href="${contextPath}/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${contextPath}/accom/css/wizard.css">
		<link rel="stylesheet" href="${contextPath}/accom/css/style.css">
		<link rel="stylesheet" href="${contextPath}/accom/css/icheck.min_all.css">

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
			
			.header-area {
			    border-bottom: 0px;
			}
			
			.profiel-container {
			    border: 0px;
			}
		</style>

    </head>
    
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
	
	<!-- property area -->
	<div class="content-area submit-property">
		<div class="container" style="background-color: #FCFCFC;">
			<div class="clearfix">
				<div class="wizard-container">
	
					<div class="wizard-card ct-wizard-orange" id="wizardProperty">
						<form action="${pageContext.request.contextPath}/member/loadActivityPayment" method="get" id="activityForm">
							<div class="wizard-header">
								<h3 class="pt-15 pb-15">
									<b>Reservation</b> _activity<br>
									<small>체험 예약 정보를 확인하세요.</small>
								</h3>
							</div>
	
							<ul>
								<li><a href="#step1" class="reservation" data-toggle="tab">Step 1 </a></li>
								<li><a href="#step2" class="reservation" data-toggle="tab">Step 2 </a></li>
								<li><a href="#step3" class="reservation" data-toggle="tab">Step 3 </a></li>
								<li><a href="#step4" class="reservation" data-toggle="tab">Finished </a></li>
							</ul>
	
							<div class="tab-content">
								<div class="tab-pane" id="step1">
									<div class="row mt-4">
										<div class="col-sm-4 pt-40 mr-0 pr-0 pl-30" style="margin:0 auto; display: flex; align-content: center; align-items: flex-start;">
											<div class="form-group">											
												<input type="hidden" name="accomCheckIn" value="${checkIn }">
												<input type="hidden" name="accomCheckOut" value="${checkOut }">				
												<h3 class="pt-20 pb-20"><i>check In <span style="color: #BD83CE; font-weight: bold; font-size: 1.2em;">${checkIn }</span>, check Out <span style="color: #BD83CE; font-weight: bold; font-size: 1.2em;">${checkOut }</span></i></h3>
												<c:forEach items="${activityOne.activityImageList }" var="aci" varStatus="status" begin="1" end="1">
						                   			<img src="${pageContext.request.contextPath}/resources/image/activity/${aci.getActivityImageName() }.${aci.getActivityImageExt() }" alt="">
						                   		</c:forEach>
											</div>
										</div>
										<div class="col-sm-6 pt-30 pl-0 pr-30" style="margin:0 auto;"> 
											<h1 class="text-center pb-30 pr-30">Basic information</h1>
											<div style="display: flex; flex-wrap: nowrap; justify-content: flex-start; border-bottom: 1px solid #eaeaea;">
												<div class="col-sm-12">
													<div class="form-group" style="float: left; width: 50%;">
														<input type="hidden" name="accomRoomNo" value="${activityOne.activityNo }">
														<input type="hidden" name="hostNo" value="${activityOne.hostNo }">	
														<h4>Activity <small style="font-size: 0.6em;">체험 이름</small></h4>
														<h2 class="pt-10 pl-10" style="letter-spacing: 0.1em;">${activityOne.activityName }</h2>
													</div>
<!-- 													<div class="form-group" style="float: left; width: 50%;"> -->
<!-- 														<h4>Room <small style="font-size: 0.6em;">객실 이름</small></h4> -->
<%-- 														<h2 class="pt-10 pl-10" style="letter-spacing: 0.1em;">${accomRoomOne.accomRoomName }</h2> --%>
<!-- 													</div> -->
												</div>
											</div>
											<div class="pt-30" style="display: flex; flex-wrap: nowrap; justify-content: flex-start; border-bottom: 1px solid #eaeaea;">
												<div class="col-sm-12">
													<div class="form-group" style="float: left; width: 50%;">
														<h4>Activity Description</h4>
														<h2 class="pt-10 pl-10" style="font-size: 0.9em;">${activityOne.activityDescription }</h2>
													</div>
													<div class="form-group" style="float: left; width: 50%;">
														<h4>Phone</h4>
														<h2 class="pt-10 pl-10" style="font-size: 0.9em;">${activityOne.activityPhone }</h2>
													</div>
												</div>
											</div>
<!-- 											<div class="pt-15" style="display: flex; flex-wrap: nowrap; justify-content: flex-start; border-bottom: 1px solid #eaeaea;"> -->
<!-- 												<div class="col-sm-12"> -->
<!-- 													<div class="form-group" style="float: left;"> -->
<!-- 														<h4>Facility <small style="font-size: 0.6em;">시설 정보</small></h4> -->
<!-- 														<div style="display: flex; flex-wrap: nowrap; justify-content: flex-start;"> -->
<%-- 															<c:forEach items="${accomRoomOne.accomBuildingFacilityList }" var="abf" varStatus="status"> --%>
<%-- 																<c:choose> --%>
<%-- 																 	<c:when test="${status.last}"> --%>
<%-- 															            <h2 class="pt-10 ml-10" style="float: left; font-size: 0.9em; width: auto;">${abf.accomBuildingFacilityName }</h2> --%>
<%-- 															        </c:when> --%>
<%-- 															        <c:otherwise> --%>
<%-- 															            <h2 class="pt-10 ml-10" style="float: left; font-size: 0.9em; width: auto;">${abf.accomBuildingFacilityName }, </h2>	 --%>
<%-- 															        </c:otherwise> --%>
<%-- 															    </c:choose> --%>
<%-- 															</c:forEach> --%>
<!-- 														</div>													 -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="pt-15" style="display: flex; flex-wrap: nowrap; justify-content: flex-start; border-bottom: 1px solid #eaeaea;"> -->
<!-- 												<div class="col-sm-12"> -->
<!-- 													<div class="form-group" style="float: left;"> -->
<!-- 														<h4>Item <small style="font-size: 0.6em;">물품 정보</small></h4> -->
<!-- 														<div style="display: flex; flex-wrap: nowrap; justify-content: flex-start;"> -->
<%-- 															<c:forEach items="${accomRoomOne.accomRoomItemList }" var="art" varStatus="status"> --%>
<%-- 																<c:choose> --%>
<%-- 																 	<c:when test="${status.last}"> --%>
<%-- 															            <h2 class="pt-10 ml-10" style="float: left; font-size: 0.9em; width: auto;">${art.accomRoomItemName }</h2> --%>
<%-- 															        </c:when> --%>
<%-- 															        <c:otherwise> --%>
<%-- 															            <h2 class="pt-10 ml-10" style="float: left; font-size: 0.9em; width: auto;">${art.accomRoomItemName }, </h2>	 --%>
<%-- 															        </c:otherwise> --%>
<%-- 															    </c:choose> --%>
<%-- 															</c:forEach> --%>
<!-- 														</div>													 -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
										</div>
									</div>
								</div>
								<!--  End step 1 -->
	
								<div class="tab-pane" id="step2">
									<div class="row mt-4">
										<div class="col-sm-4 pt-40 mr-0 pr-0 pl-30" style="margin:0 auto; display: flex; align-content: center; align-items: flex-start;">
											<div class="form-group">
												<c:forEach items="${activityOne.activityImageList }" var="aci" varStatus="status" begin="1" end="1">
												<h3 class="pt-20 pb-20"><i>check In <span style="color: #BD83CE; font-weight: bold; font-size: 1.2em;">${checkIn }</span>, check Out <span style="color: #BD83CE; font-weight: bold; font-size: 1.2em;">${checkOut }</span></i></h3>
						                   			<img src="${pageContext.request.contextPath}/resources/image/activity/${aci.getActivityImageName() }.${ari.getAccomRoomImageExt() }" alt="">
						                   		</c:forEach>
											</div>
										</div>
										<div class="col-sm-6 pt-30 pl-0 pr-30" style="margin:0 auto;"> 
<!-- 											<h1 class="text-center pb-25 pr-30">Price &amp; Option</h1> -->
<!-- 											<div class="pt-50 pb-17" style="display: flex; flex-wrap: nowrap; justify-content: flex-start; border-bottom: 1px solid #eaeaea;"> -->
<!-- 												<div class="col-sm-12"> -->
<!-- 													<div class="form-group"> -->
<!-- 														<input type="hidden" name="accomAmount" id="accomAmount" value=""> -->
<!-- 														<h4>Price <small style="font-size: 0.6em;">추가 인원과 추가 물품의 가격을 모두 더한 금액입니다.</small></h4> -->
<%-- 														<h1 class="pt-10 pl-10" style="letter-spacing: 0.1em; font-size: 1.5em;"><i><span id="total">${accomRoomOne.accomRoomPrice }</span></i></h1> --%>
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="pt-15" style="display: flex; flex-wrap: nowrap; justify-content: flex-start; border-bottom: 1px solid #eaeaea;"> -->
<!-- 												<div class="col-sm-12"> -->
<!-- 													<div class="form-group"> -->
<%-- 														<input type="hidden" id="accomRoomStan" value="${accomRoomOne.accomRoomStan }"> --%>
<%-- 														<input type="hidden" id="accomRoomPrice" value="${accomRoomOne.accomRoomPrice }"> --%>
<%-- 														<h4>사용인원  <small style="font-size: 0.6em;">￦10000</small><span class="pl-10" style="font-size: 0.8em;"><i class="fa fa-user" style="color: #C99DBC;"></i> 기준인원 ${accomRoomOne.accomRoomStan } &nbsp; <i class="fa fa-user" style="color: #C99DBC;"></i> 최대인원 ${accomRoomOne.accomRoomMax }</span></h4> --%>
<!-- 														<div class="input-group" style="width: 300px;"> -->
<%-- 														    <input type="number" class="form-control" name="accomUsePerson" id="accomUsePerson" min="${accomRoomOne.accomRoomStan }" max="${accomRoomOne.accomRoomMax }" placeholder="${accomRoomOne.accomRoomStan }" value="${accomRoomOne.accomRoomStan }" style="height: 34px; width: 150px;"> --%>
<!-- 															<span class="input-group-text">명</span> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="col-sm-12 pt-15"> -->
<!-- 												<div class="form-group" style="display: flex; flex-wrap: nowrap;"> -->
<%-- 												<c:set var="itemLast" value="0"/> --%>
<%-- 													<c:forEach items="${accomRoomOne.accomRoomItemList }" var="art" varStatus="status"> --%>
<%-- 													<c:set var="itemLast" value="${itemLast +1 }"/> --%>
<!-- 														<div class="pr-20"> -->
<%-- 															<h4>${art.getAccomRoomItemName() } <small style="font-size: 0.6em;">￦${art.getAccomRoomItemPrice() }</small></h4> --%>
<!-- 															<div style="float: left;"> -->
<!-- 																<div class="input-group"> -->
<%-- <%-- 																	<c:set var="x" value="accomItemPrice"/>  --%> --%>
<%-- <%-- 																	<input type="text" id="${x+status.count}" value="${art.getAccomRoomItemPrice() }" readonly="readonly"> --%> --%>
																	
<%-- 																	<input type="hidden" id="accomItemPrice${status.count }" value="${art.getAccomRoomItemPrice() }"> --%>
<%-- 																    <input type="number" class="form-control" name="accomUsePerson" id="accomRoomItemQnt${status.count}" min="0" max="${art.getAccomRoomItemQnt() }" placeholder="0" style="height:34px;"> --%>
<!-- 																	<span class="input-group-text">개</span> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 														</div> -->
<%-- 													</c:forEach> --%>
<%-- 													<input type="hidden" id="itemLast" value="${itemLast }"> --%>
<!-- 												</div> -->
<!-- 											</div> -->
										</div>
									</div>
								</div>
								<!-- End step 2 -->
	
								<div class="tab-pane" id="step3">
<!-- 									<h3 class="text-center">Spot &amp; Hashtag</h3> -->
<!-- 									<div class="row mt-4"> -->
<!-- 										<div class="col-sm-6" style="margin:0 auto;"> -->
										
<!-- 											<div class="col-sm-12 mt-2"> -->
<!-- 												<div class="form-group"> -->
<!-- 													<h4> -->
<!-- 														Spot -->
<!-- 														<span class="m-2" style="float: right;"> -->
<!-- 															<input type="button" class="btn-sm" style="width:80px; color:white; background: #ff3d1c; border-radius: 30px; -->
<!-- 		    													color: #fff; font-weight: 500;" id="addSpot" value="추천장소추가"> -->
<!-- 		    												<input type="button" class="btn-sm" style="width:80px; color:white; background: #ff3d1c; border-radius: 30px; -->
<!-- 		    													color: #fff; font-weight: 500;" id="delSpot" value="삭제"> -->
<!-- 			                                    		</span> -->
<!-- 													</h4> -->
													
<!-- 													<div class="form-group" id="spotPlace"> -->
<!-- 														<div id="spotForm"> -->
<!-- 															<label><small>Name</small></label> -->
<!-- 				                                    		<input type="text" class="form-control" id="accomBuildingSpotName" name="accomSpotForm[0].accomBuildingSpot.accomBuildingSpotName" placeholder="ex) 보보커피" style="height:34px;"> -->
<!-- 															<label><small>Category</small></label> -->
<!-- 															<input type="text" class="form-control" id="accomBuildingSpotCategory" name="accomSpotForm[0].accomBuildingSpot.accomBuildingSpotCategory" placeholder="ex) 카페" style="height:34px;"> -->
<!-- 															<label><small>Description</small></label> -->
<!-- 															<textarea class="form-control" id="accomBuildingSpotDescription" name="accomSpotForm[0].accomBuildingSpot.accomBuildingSpotDescription" placeholder="ex) 사장님이 직접 로스팅한 에소프레소를 맛볼 수 있는 곳..." rows="8"></textarea> -->
<!-- 														</div> -->
<!-- 														<div> -->
<!-- 															<span> -->
<!-- 																<label><small>Spot Address </small></label> -->
<!-- 																<input type="button" class="btn-sm" style="width:130px; color:white; background: #ff3d1c; border-radius: 30px; -->
<!-- 		    													color: #fff; font-weight: 500;" onclick="execDaumPostcodeSpot()" value="우편번호"> -->
<!-- 															</span> -->
<!-- 				                                    		<input type="number" class="form-control" id="spotPostalCode" name="accomSpotForm[0].spotAddress.spotAddressPotalCode" placeholder="버튼을 클릭해 우편번호 찾기를 진행해주세요 *" readonly="readonly" style="height:34px;"> -->
<!-- 															<input type="text" class="form-control" id="spotRoadAddress" name="accomSpotForm[0].spotAddress.spotAddressZip" placeholder="도로명주소가 입력됩니다." readonly="readonly" style="height:34px;"> -->
<!-- 															<input type="text" class="form-control" id="spotAddressDetail" name="accomSpotForm[0].spotAddress.spotAddressDetail" placeholder="상세주소" style="height:34px;"> -->
<!-- 														</div> -->
<!-- 														<hr> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
											
<!-- 											<div class="col-sm-12 mt-4"> -->
<!-- 												<div class="form-group"> -->
<!-- 													<h4> -->
<!-- 														HashTag -->
<!-- 														<span class="m-2" style="float: right;"> -->
<!-- 															<input type="button" class="btn-sm" style="width:80px; color:white; background: #ff3d1c; border-radius: 30px; -->
<!-- 		    													color: #fff; font-weight: 500;" id="addHashtag" value="해시태그추가"> -->
<!-- 		    												<input type="button" class="btn-sm" style="width:80px; color:white; background: #ff3d1c; border-radius: 30px; -->
<!-- 		    													color: #fff; font-weight: 500;" id="delHashtag" value="삭제"> -->
<!-- 			                                    		</span> -->
<!-- 		                                    		</h4> -->
<!-- 		                                    		<h4><small>* 입력 폼 하나당, 해시태그 하나씩 입력해주세요.</small></h4> -->
<!-- 		                                    		<div class="form-group" id="hashtagPlace"> -->
<!-- 														<div class="input-group"> -->
<!-- 														    <span class="input-group-addon"><i class="fas fa-hashtag"></i></span> -->
<!-- 														    <input type="text" class="form-control" id="inputHashtag" name="hashtag[0].hashtag" placeholder="ex) 오션뷰" style="height:34px;"> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
											
<!-- 										</div> -->
<!-- 									</div> -->
								</div>
								<!--  End step 3 -->
	
	
								<div class="tab-pane" id="step4">
									<h3 class="info-text">Finished and submit</h3>
									<div class="row">
										<div class="col-sm-12">
											<div class="">
												<p>
													<label><strong>나중에 추가</strong></label> 
													약관 및 동의.. 등록비 내용 이런거....
												</p>
	
												<div class="checkbox">
													<label> 
														<input type="checkbox" class="icheckbox_square-purple">
														<strong>Accept termes and conditions.</strong>
													</label>
												</div>
	
											</div>
										</div>
									</div>
								</div>
								<!--  End step 4 -->
	
							</div>
	
							<div class="wizard-footer">
								<div class="pull-right">
									<input type='button' class='btn btn-next btn-primary' style="background-color: #BD83CE; color: #fff;" name='next' value='Next' /> 
									<input type='submit' class='btn btn-finish btn-primary' style="background-color: #BD83CE; color: #fff;" name='finish' id="accomSubmit" value='Finish' />
								</div>
								<div class="pull-left">
									<input type='button' class='btn btn-previous btn-default' style="background-color: #BD83CE; color: #fff;" name='previous' value='Previous' />
								</div>
								<div class="clearfix"></div>
							</div>
						</form>
					</div>
					<!-- End submit form -->
				</div>
			</div>
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
	  
	<!-- Jquery Plugins, main Jquery -->	
    <script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

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
    
    <script src="${contextPath}/accom/js/total-price.js"></script>
    
</body>
</html>