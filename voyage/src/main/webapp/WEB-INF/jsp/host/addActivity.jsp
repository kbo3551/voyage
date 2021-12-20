<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>VOYAGE | addActivity</title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico">

		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/bootstrap-select.min.css"> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/wizard.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/style.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/icheck.min_all.css">
		
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
    <!-- <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="${pageContext.request.contextPath}/assets/img/logo/loder.jpg" alt="">
                </div>
            </div>
        </div>
    </div>  -->
    
    
   	<c:import url="/WEB-INF/jsp/partial/banner.jsp"/>
   	
	<main>
	
	<div class="page-head hero-overly" style="background-image: url('${pageContext.request.contextPath}/assets/img/page-header.jpg'); background-repeat : no-repeat;"> 
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
	<div class="content-area submit-property">
		<div class="container" style="background-color: #FCFCFC;">
			<div class="clearfix">
				<div class="wizard-container">
	
					<div class="wizard-card ct-wizard-orange" id="wizardProperty">
						<form action="${pageContext.request.contextPath}/host/addActivity" method="post" enctype="multipart/form-data" id="activityForm">
							<div class="wizard-header">
								<h3>
									<b>Activity</b><br>
									<small>체험의 정보를 입력해주세요.</small>
								</h3>
							</div>
	
							<ul>
								<li><a href="#step1" data-toggle="tab">Step 1 </a></li>
								<li><a href="#step2" data-toggle="tab">Step 2 </a></li>
								<li><a href="#step3" data-toggle="tab">Step 3 </a></li>
								<li><a href="#step4" data-toggle="tab">Finished </a></li>
							</ul>
	
							<div class="tab-content">
	
								<div class="tab-pane" id="step1">
									<h3 class="text-center">Basic information</h3>
									<div class="row p-b-15">
										<div class="col-sm-offset-1" style="margnin:0 auto;">
											<div class="picture-container" style="float:left; margin-left:20px;">
												<div class="picture">
													<img src="${pageContext.request.contextPath}/assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview" title="" />
													<input type="file" name="activityImage" id="wizard-picture">
												</div>
											</div>
											<div class="picture-container" style="float:left; margin-left:20px;">
												<div class="picture">
													<img src="${pageContext.request.contextPath}/assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview2" title="" />
													<input type="file" name="activityImage" id="wizard-picture2">
												</div>
											</div>
											<div class="picture-container" style="float:left; margin-left:20px;">
												<div class="picture">
													<img src="${pageContext.request.contextPath}/assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview3" title="" />
													<input type="file" name="activityImage" id="wizard-picture3">
												</div>
											</div>
											<div class="picture-container" style="float:left; margin-left:20px;">
												<div class="picture">
													<img src="${pageContext.request.contextPath}/assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview4" title="" />
													<input type="file" name="activityImage" id="wizard-picture4">
												</div>
											</div>
										</div>
										<div class="col-sm-6" style="margin:0 auto;">
											<div class="form-group">
												<h4>Name <small>(required)</small></h4>
												<input name="activity.activityName" id="activityName" type="text" class="form-control" placeholder="나만의 그릇 만들기..." style="height:34px;">
											</div>
	
											<div class="form-group">
												<h4>Description <small>(required)</small></h4>
												<textarea name="activity.activityDescription" id="activityDescription" class="form-control" placeholder="내 스타일의 그릇을 만들어보기 ..." rows="8"></textarea>
											</div>
											<div class="form-group">
												<h4>Start Date <small>(required)</small></h4>
												<input name="activity.activityOpenDate" id="activityOpenDate" type="date" class="form-control" style="height:34px;">
											</div>
											<div class="form-group">
												<h4>End Date <small>(required)</small></h4>
												<input name="activity.activityCloseDate" id="activityCloseDate" type="date" class="form-control" style="height:34px;">
											</div>
											<div class="form-group">
												<h4>Open Hour <small>(required)</small></h4>
												<input name="activity.activityOpenHour" id="activityOpenHour" type="time" class="form-control" style="height:34px;">
											</div>
											<div class="form-group">
												<h4>Close Hour <small>(required)</small></h4>
												<input name="activity.activityCloseHour" id="activityCloseHour" type="time" class="form-control" style="height:34px;">
											</div>
											<div class="form-group">
												<h4>Maximum usage time <small>(required)</small></h4>
												<div class="input-group">
												    <input type="number" class="form-control" name="activity.activityMaxT" id="activityMaxT" style="height:34px;">
													<span class="input-group-text">시간</span>
												</div>
											</div>
											<div class="form-group">
												<h4>Maximum users <small>(required)</small></h4>
												<div class="input-group">
												    <input type="number" class="form-control" name="activity.activityMaxP" id="activityMaxP" style="height:34px;">
													<span class="input-group-text">명</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--  End step 1 -->
	
								<div class="tab-pane" id="step2">
									<h3 class="text-center">Address &amp; Price</h3>
									<div class="row mt-4">
										<div class="col-sm-6" style="margin:0 auto;">
										
											<div class="col-sm-12">
												<div class="form-group">
													<h4>
														Address <small>(required)</small>
														<input type="button" class="btn-sm" style="width:130px; color:white; background: #ff3d1c; border-radius: 30px;
    													color: #fff; font-weight: 500;" onclick="execDaumPostcode()" value="우편번호">
													</h4>
		                                    		<input type="number" class="form-control" id="postalCode" name="activityAddress.activityAddressPostalCode" placeholder="버튼을 클릭해 우편번호 찾기를 진행해주세요 *" readonly="readonly" style="height:34px;">
													<input type="text" class="form-control" id="roadAddress" name="activityAddress.activityAddressZip" placeholder="도로명주소가 입력됩니다." readonly="readonly" style="height:34px;">
													<input type="text" class="form-control" id="activityAddressDetail" name="activityAddress.activityAddressDetail" placeholder="상세주소" style="height:34px;">
												</div>
											</div>
											
											<div class="col-sm-12 mt-4">
												<div class="form-group">
													<h4> Price <small>(required)</small> </h4>
		                                    		<div class="input-group">
													    <input type="number" class="form-control" name="activity.activityPrice" id="activityPrice" style="height:34px;">
														<span class="input-group-text">원</span>
													</div>
												</div>
											</div>
											
										</div>
									</div>
								</div>
								<!-- End step 2 -->
	
								<div class="tab-pane" id="step3">
									<h3 class="text-center">Spot &amp; Hashtag</h3>
									<div class="row mt-4">
										<div class="col-sm-6" style="margin:0 auto;">
										
											<div class="col-sm-12 mt-2">
												<div class="form-group">
													<h4>
														Spot
														<span class="m-2" style="float: right;">
															<input type="button" class="btn-sm" style="width:80px; color:white; background: #ff3d1c; border-radius: 30px;
		    													color: #fff; font-weight: 500;" id="addSpot" value="추천장소추가">
		    												<input type="button" class="btn-sm" style="width:80px; color:white; background: #ff3d1c; border-radius: 30px;
		    													color: #fff; font-weight: 500;" id="delSpot" value="삭제">
			                                    		</span>
													</h4>
													
													<div class="form-group" id="spotPlace">
														<div id="spotForm">
															<label><small>Name</small></label>
				                                    		<input type="text" class="form-control" id="activitySpotName" name="activitySpotForm[0].activitySpot.activitySpotName" placeholder="ex) 보보커피" style="height:34px;">
															<label><small>Category</small></label>
															<input type="text" class="form-control" id="activitySpotCategory" name="activitySpotForm[0].activitySpot.activitySpotCategory" placeholder="ex) 카페" style="height:34px;">
															<label><small>Description</small></label>
															<textarea class="form-control" id="activitySpotDescription" name="activitySpotForm[0].activitySpot.activitySpotDescription" placeholder="ex) 사장님이 직접 로스팅한 에소프레소를 맛볼 수 있는 곳..." rows="8"></textarea>
														</div>
														<div>
															<span>
																<label><small>Spot Address </small></label>
																<input type="button" class="btn-sm" style="width:130px; color:white; background: #ff3d1c; border-radius: 30px;
		    													color: #fff; font-weight: 500;" onclick="execDaumPostcodeSpot()" value="우편번호">
															</span>
				                                    		<input type="number" class="form-control" id="spotPostalCode" name="activitySpotForm[0].spotAddress.spotAddressPotalCode" placeholder="버튼을 클릭해 우편번호 찾기를 진행해주세요 *" readonly="readonly" style="height:34px;">
															<input type="text" class="form-control" id="spotRoadAddress" name="activitySpotForm[0].spotAddress.spotAddressZip" placeholder="도로명주소가 입력됩니다." readonly="readonly" style="height:34px;">
															<input type="text" class="form-control" id="spotAddressDetail" name="activitySpotForm[0].spotAddress.spotAddressDetail" placeholder="상세주소" style="height:34px;">
														</div>
														<hr>
													</div>
												</div>
											</div>
											
											<div class="col-sm-12 mt-4">
												<div class="form-group">
													<h4>
														HashTag
														<span class="m-2" style="float: right;">
															<input type="button" class="btn-sm" style="width:80px; color:white; background: #ff3d1c; border-radius: 30px;
		    													color: #fff; font-weight: 500;" id="addHashtag" value="해시태그추가">
		    												<input type="button" class="btn-sm" style="width:80px; color:white; background: #ff3d1c; border-radius: 30px;
		    													color: #fff; font-weight: 500;" id="delHashtag" value="삭제">
			                                    		</span>
		                                    		</h4>
		                                    		<h4><small>* 입력 폼 하나당, 해시태그 하나씩 입력해주세요.</small></h4>
		                                    		<div class="form-group" id="hashtagPlace">
														<div class="input-group">
														    <span class="input-group-addon"><i class="fas fa-hashtag"></i></span>
														    <input type="text" class="form-control" id="inputHashtag" name="hashtag[0].hashtag" placeholder="ex) 오션뷰" style="height:34px;">
														</div>
													</div>
												</div>
											</div>
											
										</div>
									</div>
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
													<label><input type="checkbox" class="icheckbox_square-yellow"> <strong>Accept
															termes and conditions.</strong>
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
									<input type='button' class='btn btn-next btn-primary' name='next' value='Next' /> 
									<input type='button' class='btn btn-finish btn-primary' name='finish' id="activitySubmit" value='Finish' />
								</div>
	
								<div class="pull-left">
									<input type='button' class='btn btn-previous btn-default'
										name='previous' value='Previous' />
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
    
    <!-- [최지혜] addAccomBuilding의 유효성 검사를 진행하는 js -->
	<script src="${pageContext.request.contextPath}/accom/js/jeje.js"></script>
	
	<script src="${pageContext.request.contextPath}/accom/js/vendor/modernizr-2.6.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js//jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js/bootstrap-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js/bootstrap-hover-dropdown.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js/easypiechart.min.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js/jquery.easypiechart.min.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js/wow.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js/icheck.min.js"></script>

    <script src="${pageContext.request.contextPath}/accom/js/price-range.js"></script> 
    <script src="${pageContext.request.contextPath}/accom/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/accom/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js/wizard.js"></script>

    <script src="${pageContext.request.contextPath}/accom/js/main.js"></script>
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
	// 다음(카카오) 주소 api
	function execDaumPostcode() {
		new daum.Postcode(
			{
				oncomplete : function(data) {
					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
							&& /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postalCode').value = data.zonecode;
					document.getElementById('roadAddress').value = roadAddr;
				}
			}).open();
		}
	
	// 다음(카카오) 주소 api - 추천장소
	function execDaumPostcodeSpot() {
		new daum.Postcode(
			{
				oncomplete : function(data) {
					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
							&& /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('spotPostalCode').value = data.zonecode;
					document.getElementById('spotRoadAddress').value = roadAddr;
				}
			}).open();
		}
	
	// 추천장소 폼 추가시 사용하는 스크립트 이벤트
	let numSpot = 0;
	
	$('#addSpot').click(function(){
		numSpot = numSpot + 1;
		if($('div[id=spotForm]').length<3){
			let inputSpot = '<div id="spotForm">';
			inputSpot += '<label><small>Name</small></label>';
			inputSpot += '<input type="text" class="form-control" id="activitySpotName" name="activitySpotForm['+numSpot+'].activitySpot.activitySpotName" style="height:34px;">';
			inputSpot += '<label><small>Category</small></label>';
			inputSpot += '<input type="text" class="form-control" id="activitySpotCategory" name="activitySpotForm['+numSpot+'].activitySpot.activitySpotCategory" style="height:34px;">';
			inputSpot += '<label><small>Description</small></label>';
			inputSpot += '<textarea class="form-control" id="activitySpotDescription" name="activitySpotForm['+numSpot+'].activitySpot.activitySpotDescription" rows="8"></textarea>';
			inputSpot += '</div>';
			inputSpot += '<div id="addSpotAddr">';
			inputSpot += '<span>';
			inputSpot += '<label><small>Spot Address&nbsp;</small></label>';
			inputSpot += '<input type="button" class="btn-sm" style="width:130px; color:white; background: #ff3d1c; border-radius: 30px;';
			inputSpot += 'color: #fff; font-weight: 500;" onclick="execDaumPostcodeSpot'+numSpot+'()" value="우편번호">';
			inputSpot += '</span>';
			inputSpot += '<input type="number" class="form-control" id="spotPostalCode'+numSpot+'" name="activitySpotForm['+numSpot+'].spotAddress.spotAddressPotalCode" placeholder="버튼을 클릭해 우편번호 찾기를 진행해주세요 *" readonly="readonly" style="height:34px;">';
			inputSpot += '<input type="text" class="form-control" id="spotRoadAddress'+numSpot+'" name="activitySpotForm['+numSpot+'].spotAddress.spotAddressZip" placeholder="도로명주소가 입력됩니다." readonly="readonly" style="height:34px;">';
			inputSpot += '<input type="text" class="form-control" id="spotAddressDetail" name="activitySpotForm['+numSpot+'].spotAddress.spotAddressDetail" placeholder="상세주소" style="height:34px;">';
			inputSpot += '</div><hr>';
			inputSpot += '</div>';
			$('#spotPlace').append(inputSpot);
		} else {
			alert("세 가지 이상의 추천장소를 등록할 수 없습니다!");
		}
	});
	
	// 다음(카카오) 주소 api - 추천장소 추가시 사용
	function execDaumPostcodeSpot1() {
		new daum.Postcode(
			{
				oncomplete : function(data) {
					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
							&& /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('spotPostalCode1').value = data.zonecode;
					document.getElementById('spotRoadAddress1').value = roadAddr;
				}
			}).open();
		}
	
	// 다음(카카오) 주소 api - 추천장소 추가시 사용
	function execDaumPostcodeSpot2() {
		new daum.Postcode(
			{
				oncomplete : function(data) {
					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
							&& /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('spotPostalCode2').value = data.zonecode;
					document.getElementById('spotRoadAddress2').value = roadAddr;
				}
			}).open();
		}
	
	// 추천장소 폼 삭제시 사용하는 스크립트 이벤트
	$('#delSpot').click(function(){
		if($('div[id=spotForm]').length>1){
			numSpot = numSpot - 1;
			$('div[id=spotForm]:last').remove();
			$('div[id=addSpotAddr]:last').remove();
			$('hr:last').remove();
		} else {
			alert("한 가지 이상의 추천시설을 입력해주세요!");
		}
	});
	
	// 해시태그 폼 추가시 사용하는 스크립트 이벤트
	let numHashtag = 0;
	
	$('#addHashtag').click(function(){
		numHashtag = numHashtag + 1;
		let inputHashtag = '<div class="input-group">';
		inputHashtag += '<span class="input-group-addon"><i class="fas fa-hashtag"></i></span>';
		inputHashtag += '<input type="text" class="form-control" id="inputHashtag" name="hashtag['+numHashtag+'].hashtag" style="height:34px;">';
		inputHashtag += '</div>';
		$('#hashtagPlace').append(inputHashtag);
	});
	
	// 해시태그 폼 삭제시 사용하는 스크립트 이벤트
	$('#delHashtag').click(function(){
		if($('input[id=inputHashtag]').length>1){
			numHashtag = numHashtag - 1;
			$('input[id=inputHashtag]:last').remove();
			$('span[class=input-group-addon]:last').remove();
		} else {
			alert("한 가지 이상의 해시태그를 입력해주세요!");
		}
	});
	</script>

</body>
</html>