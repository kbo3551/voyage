<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>VOYAGE | addAccomBuilding</title>
		<meta name="description" content="GARO is a real-estate template">
		<meta name="author" content="Kimarotec">
	   	<meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    
	    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
		
		<link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
		
		<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
		<link rel="icon" href="favicon.ico" type="image/x-icon">
		
		<link rel="stylesheet" href="accom/css/normalize.css">
		<link rel="stylesheet" href="accom/css/font-awesome.min.css">
		<link rel="stylesheet" href="accom/css/fontello.css">
		<link href="accom/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
		<link href="accom/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
		<link href="css/animate.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="accom/css/bootstrap-select.min.css"> 
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="accom/css/icheck.min_all.css">
		<link rel="stylesheet" href="accom/css/price-range.css">
		<link rel="stylesheet" href="accom/css/owl.carousel.css">  
		<link rel="stylesheet" href="accom/css/owl.theme.css">
		<link rel="stylesheet" href="accom/css/owl.transitions.css"> 
		<link rel="stylesheet" href="accom/css/wizard.css"> 
		<link rel="stylesheet" href="accom/css/style.css">
		<link rel="stylesheet" href="accom/css/responsive.css">
		
		<!-- CSS here -->
            <link rel="stylesheet" href="assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="assets/css/slicknav.css">
            <link rel="stylesheet" href="assets/css/flaticon.css">
            <link rel="stylesheet" href="assets/css/price_rangs.css">
            <link rel="stylesheet" href="assets/css/animate.min.css">
            <link rel="stylesheet" href="assets/css/magnific-popup.css">
            <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="assets/css/themify-icons.css">
            <link rel="stylesheet" href="assets/css/slick.css">
            <link rel="stylesheet" href="assets/css/nice-select.css">
            <link rel="stylesheet" href="assets/css/style.css">
		
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
			
		</style>
    </head>
    
    <body>
    <!-- 배너 : 시작 -->
    	<c:import url="../partial\\banner.jsp"/>
    <!-- 배너 : 끝 -->
    <div style="height:130px; background-color: black;"></div>
    <!-- property area -->
	<div class="content-area submit-property">
		<div class="container" style="background-color: #FCFCFC;">
			<div class="clearfix">
				<div class="wizard-container">
	
					<div class="wizard-card ct-wizard-orange" id="wizardProperty">
						<form action="${pageContext.request.contextPath}/addAccomBuilding" method="post" enctype="multipart/form-data" id="accomBuildingForm">
							<div class="wizard-header">
								<h3>
									<b>Accommodation</b> _building<br>
									<small>숙소-건물의 정보를 입력해주세요.</small>
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
													<img src="assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview" title="" />
													<input type="file" name="accomBuildingImage" id="wizard-picture">
												</div>
											</div>
											<div class="picture-container" style="float:left; margin-left:20px;">
												<div class="picture">
													<img src="assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview2" title="" />
													<input type="file" name="accomBuildingImage" id="wizard-picture2">
												</div>
											</div>
											<div class="picture-container" style="float:left; margin-left:20px;">
												<div class="picture">
													<img src="assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview3" title="" />
													<input type="file" name="accomBuildingImage" id="wizard-picture3">
												</div>
											</div>
											<div class="picture-container" style="float:left; margin-left:20px;">
												<div class="picture">
													<img src="assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview4" title="" />
													<input type="file" name="accomBuildingImage" id="wizard-picture4">
												</div>
											</div>
										</div>
										<div class="col-sm-6" style="margin:0 auto;">
											<div class="form-group">
												<h4>Name <small>(required)</small></h4>
												<input name="accomBuilding.accomBuildingName" type="text" class="form-control" placeholder="Sky villa ..." style="height:34px;">
											</div>
	
											<div class="form-group">
												<h4>Description <small>(required)</small></h4>
												<textarea name="accomBuilding.accomBuildingDescription" class="form-control" placeholder="루프탑이 있는 ..." rows="8"></textarea>
											</div>
											<div class="form-group">
												<h4>Phone <small>(required)</small></h4>
												<input name="accomBuilding.accomBuildingPhone" type="text" class="form-control" placeholder="080-0000-0000" style="height:34px;">
											</div>
										</div>
									</div>
								</div>
								<!--  End step 1 -->
	
								<div class="tab-pane" id="step2">
									<h3 class="text-center">Address &amp; Facility</h3>
									<div class="row mt-4">
										<div class="col-sm-6" style="margin:0 auto;">
										
											<div class="col-sm-12">
												<div class="form-group">
													<h4>
														Address <small>(required)</small>
														<input type="button" class="btn-sm" style="width:130px; color:white; background: #ff3d1c; border-radius: 30px;
    													color: #fff; font-weight: 500;" onclick="execDaumPostcode()" value="우편번호">
													</h4>
		                                    		<input type="number" class="form-control" id="postalCode" name="postalCode" placeholder="버튼을 클릭해 우편번호 찾기를 진행해주세요 *" readonly="readonly" style="height:34px;">
													<input type="text" class="form-control" id="roadAddress" name="roadAddress" placeholder="도로명주소가 입력됩니다." readonly="readonly" style="height:34px;">
													<input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세주소" style="height:34px;">
												</div>
											</div>
											
											<div class="col-sm-12 mt-4">
												<div class="form-group">
													<h4>
														Facility
														<span class="m-2" style="float: right;">
															<input type="button" class="btn-sm" style="width:80px; color:white; background: #ff3d1c; border-radius: 30px;
		    													color: #fff; font-weight: 500;" id="addFacility" value="시설추가">
		    												<input type="button" class="btn-sm" style="width:80px; color:white; background: #ff3d1c; border-radius: 30px;
		    													color: #fff; font-weight: 500;" id="delFacility" value="삭제">
			                                    		</span>
		                                    		</h4>
		                                    		<label>* 입력 폼 하나당, 시설 하나씩 입력해주세요.</label>
		                                    		
		                                    		<div class="form-group" id="facilityPlace">
														<input type="text" class="form-control" id="accomBuildingFacilityName" name="accomBuildingFacility[0].accomBuildingFacilityName" placeholder="ex) 주차장" style="height:34px;">
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
															<label>Name</label>
				                                    		<input type="text" class="form-control" id="accomBuildingSpotName" name="accomBuildingSpot[0].accomBuildingSpotName" placeholder="ex) 보보커피" style="height:34px;">
															<label>Category</label>
															<input type="text" class="form-control" id="accomBuildingSpotCategory" name="accomBuildingSpot[0].accomBuildingSpotCategory" placeholder="ex) 카페" style="height:34px;">
															<label>Description</label>
															<textarea class="form-control" id="accomBuildingSpotDescription" name="accomBuildingSpot[0].accomBuildingSpotDescription" placeholder="ex) 사장님이 직접 로스팅한 에소프레소를 맛볼 수 있는 곳..." rows="8"></textarea>
														</div><hr>
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
		                                    		<label>* 입력 폼 하나당, 해시태그 하나씩 입력해주세요.</label>
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
													<label> <input type="checkbox" /> <strong>Accept
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
									<input type='button' class='btn btn-finish btn-primary' name='finish' id="accomSubmit" value='Finish' />
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
	
	<!--footer.jsp 시작  -->
    	<c:import url="../partial\\footer.jsp"/>
    <!--footer.jsp 끝  -->
	
	<script src="accom/js/vendor/modernizr-2.6.2.min.js"></script>
    <script src="accom/js//jquery-1.10.2.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="accom/js/bootstrap-select.min.js"></script>
    <script src="accom/js/bootstrap-hover-dropdown.js"></script>
    <script src="accom/js/easypiechart.min.js"></script>
    <script src="accom/js/jquery.easypiechart.min.js"></script>
    <script src="accom/js/owl.carousel.min.js"></script>
    <script src="accom/js/wow.js"></script>
    <script src="accom/js/icheck.min.js"></script>

    <script src="accom/js/price-range.js"></script> 
    <script src="accom/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
    <script src="accom/js/jquery.validate.min.js"></script>
    <script src="accom/js/wizard.js"></script>

    <script src="accom/js/main.js"></script>
    
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
	
	// 시설 폼 추가시 사용하는 스크립트 이벤트
	let numFacility = 0;
	
	$('#addFacility').click(function(){
		numFacility = numFacility + 1;
		let inputFacility = '<input type="text" class="form-control" id="accomBuildingFacilityName" name="accomBuildingFacility['+numFacility+'].accomBuildingFacilityName" style="height:34px;">';
		$('#facilityPlace').append(inputFacility);
	});
	
	// 시설 폼 삭제시 사용하는 스크립트 이벤트
	$('#delFacility').click(function(){
		if($('input[name=accomBuildingFacilityName]').length>1){
			numFacility = numFacility - 1;
			$('input[name=accomBuildingFacilityName]:last').remove();
		} else {
			alert("한 가지 이상의 시설을 입력해주세요!");
		}
	});
	
	// 추천장소 폼 추가시 사용하는 스크립트 이벤트
	let numSpot = 0;
	
	$('#addSpot').click(function(){
		numSpot = numSpot + 1;
		let inputSpot = '<div id="spotForm">';
		inputSpot += '<label>Name</label>';
		inputSpot += '<input type="text" class="form-control" id="accomBuildingSpotName" name="accomBuildingSpot['+numSpot+'].accomBuildingSpotName" style="height:34px;">';
		inputSpot += '<label>Category</label>';
		inputSpot += '<input type="text" class="form-control" id="accomBuildingSpotCategory" name="accomBuildingSpot['+numSpot+'].accomBuildingSpotCategory" style="height:34px;">';
		inputSpot += '<label>Description</label>';
		inputSpot += '<textarea class="form-control" id="accomBuildingSpotDescription" name="accomBuildingSpot['+numSpot+'].accomBuildingSpotDescription" rows="8"></textarea>';
		inputSpot += '</div><hr>';
		$('#spotPlace').append(inputSpot);
	});
	
	// 추천장소 폼 삭제시 사용하는 스크립트 이벤트
	$('#delSpot').click(function(){
		if($('div[id=spotForm]').length>1){
			numSpot = numSpot - 1;
			$('div[id=spotForm]:last').remove();
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
	
	$('#accomSubmit').click(function(){
		$('#accomBuildingForm').submit();
	});
	</script>

</body>
</html>