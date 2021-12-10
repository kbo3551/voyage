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
						<form action="" method="">
							<div class="wizard-header">
								<h3>
									<b>Accommodation</b> _building<br>
									<small>건물의 정보를 입력해주세요.</small>
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
									<div class="row p-b-15">
										<h4 style="margin:0 auto;">＊건물의 기본 정보에 대해 입력해주세요.</h4>
										<div class="col-sm-offset-1" style="margnin:0 auto;">
											<div class="picture-container" style="float:left; margin-left:20px;">
												<div class="picture">
													<img src="assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview" title="" />
													<input type="file" name="AccomBuildingImage" id="wizard-picture">
												</div>
											</div>
											<div class="picture-container" style="float:left; margin-left:20px;">
												<div class="picture">
													<img src="assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview2" title="" />
													<input type="file" name="AccomBuildingImage" id="wizard-picture2">
												</div>
											</div>
											<div class="picture-container" style="float:left; margin-left:20px;">
												<div class="picture">
													<img src="assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview3" title="" />
													<input type="file" name="AccomBuildingImage" id="wizard-picture3">
												</div>
											</div>
											<div class="picture-container" style="float:left; margin-left:20px;">
												<div class="picture">
													<img src="assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview4" title="" />
													<input type="file" name="AccomBuildingImage" id="wizard-picture4">
												</div>
											</div>
										</div>
										<div class="col-sm-6" style="margin:0 auto;">
											<div class="form-group">
												<label>Name <small>(required)</small></label> 
												<input name="accomBuildingName" type="text" class="form-control" placeholder="Sky villa ...">
											</div>
	
											<div class="form-group">
												<label>Description <small>(required)</small></label>
												<input name="accomBuildingDescription" type="text" class="form-control" placeholder="루프탑이 있는 ...">
											</div>
											<div class="form-group">
												<label>Phone <small>(required)</small></label>
												<input name="accomBuildingPhone" type="text" class="form-control" placeholder="080-0000-0000">
											</div>
										</div>
									</div>
								</div>
								<!--  End step 1 -->
	
								<div class="tab-pane" id="step2">
									<h4 style="margin:0 auto;">＊건물의 주소와 시설에 대해서 입력해주세요</h4>
									<div class="row">
										<div class="col-sm-12">
											<div class="col-sm-12">
												<div class="form-group">
													<label>Property Description :</label>
													<textarea name="discrition" class="form-control"></textarea>
												</div>
											</div>
										</div>
	
										<div class="col-sm-12">
											<div class="col-sm-3">
												<div class="form-group">
													<label>Property State :</label> 
													<select id="lunchBegins" class="selectpicker" data-live-search="true" data-live-search-style="begins" title="Select your city">
														<option>Seoul</option>
														<option>Paris</option>
														<option>Casablanca</option>
														<option>Tokyo</option>
														<option>Marraekch</option>
														<option>kyoto , shibua</option>
													</select>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="form-group">
													<label>Property City :</label> <select id="lunchBegins"
														class="selectpicker" data-live-search="true"
														data-live-search-style="begins" title="Select your city">
														<option>New york, CA</option>
														<option>Paris</option>
														<option>Casablanca</option>
														<option>Tokyo</option>
														<option>Marraekch</option>
														<option>kyoto , shibua</option>
													</select>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="form-group">
													<label>Property Statue :</label> <select id="basic"
														class="selectpicker show-tick form-control">
														<option>-Status-</option>
														<option>Rent</option>
														<option>Boy</option>
														<option>used</option>
	
													</select>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="form-group">
													<label>Property Statue :</label> <select id="basic"
														class="selectpicker show-tick form-control">
														<option>-Status-</option>
														<option>Rent</option>
														<option>Boy</option>
														<option>used</option>
	
													</select>
												</div>
											</div>
										</div>
										<div class="col-sm-12 padding-top-15">
											<div class="col-sm-4">
												<div class="form-group">
													<label for="property-geo">Min bed :</label> <input
														type="text" class="span2" value="" data-slider-min="0"
														data-slider-max="600" data-slider-step="5"
														data-slider-value="[250,450]" id="min-bed"><br />
													<b class="pull-left color">1</b> <b
														class="pull-right color">120</b>
												</div>
											</div>
											<div class="col-sm-4">
	
												<div class="form-group">
													<label for="price-range">Min baths :</label> <input
														type="text" class="span2" value="" data-slider-min="0"
														data-slider-max="600" data-slider-step="5"
														data-slider-value="[250,450]" id="min-baths"><br />
													<b class="pull-left color">1</b> <b
														class="pull-right color">120</b>
												</div>
											</div>
											<div class="col-sm-4">
	
												<div class="form-group">
													<label for="property-geo">Property geo (m2) :</label> <input
														type="text" class="span2" value="" data-slider-min="0"
														data-slider-max="600" data-slider-step="5"
														data-slider-value="[50,450]" id="property-geo"><br />
													<b class="pull-left color">40m</b> <b
														class="pull-right color">12000m</b>
												</div>
											</div>
										</div>
										<div class="col-sm-12 padding-top-15">
											<div class="col-sm-3">
												<div class="form-group">
													<div class="checkbox">
														<label> <input type="checkbox"> Swimming
															Pool
														</label>
													</div>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="form-group">
													<div class="checkbox">
														<label> <input type="checkbox"> 2 Stories
														</label>
													</div>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="form-group">
													<div class="checkbox">
														<label> <input type="checkbox"> Emergency
															Exit
														</label>
													</div>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="form-group">
													<div class="checkbox">
														<label> <input type="checkbox"> Fire Place
														</label>
													</div>
												</div>
											</div>
										</div>
										<div class="col-sm-12 padding-bottom-15">
											<div class="col-sm-3">
												<div class="form-group">
													<div class="checkbox">
														<label> <input type="checkbox"> Laundry
															Room
														</label>
													</div>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="form-group">
													<div class="checkbox">
														<label> <input type="checkbox"> Jog Path
														</label>
													</div>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="form-group">
													<div class="checkbox">
														<label> <input type="checkbox"> Ceilings
														</label>
													</div>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="form-group">
													<div class="checkbox">
														<label> <input type="checkbox"> Dual Sinks
														</label>
													</div>
												</div>
											</div>
										</div>
										<br>
									</div>
								</div>
								<!-- End step 2 -->
	
								<div class="tab-pane" id="step3">
									<h4 class="info-text">Give us somme images and videos ?</h4>
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label for="property-images">Chose Images :</label> <input
													class="form-control" type="file" id="property-images">
												<p class="help-block">Select multipel images for your
													property .</p>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label for="property-video">Property video :</label> <input
													class="form-control" value=""
													placeholder="http://www.youtube.com, http://vimeo.com"
													name="property_video" type="text">
											</div>
	
											<div class="form-group">
												<input class="form-control" value=""
													placeholder="http://www.youtube.com, http://vimeo.com"
													name="property_video" type="text">
											</div>
	
											<div class="form-group">
												<input class="form-control" value=""
													placeholder="http://www.youtube.com, http://vimeo.com"
													name="property_video" type="text">
											</div>
										</div>
									</div>
								</div>
								<!--  End step 3 -->
	
	
								<div class="tab-pane" id="step4">
									<h4 class="info-text">Finished and submit</h4>
									<div class="row">
										<div class="col-sm-12">
											<div class="">
												<p>
													<label><strong>Terms and Conditions</strong></label> By
													accessing or using GARO ESTATE services, such as posting
													your property advertisement with your personal information
													on our website you agree to the collection, use and
													disclosure of your personal information in the legal proper
													manner
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
									<input type='button' class='btn btn-next btn-primary'
										name='next' value='Next' /> <input type='button'
										class='btn btn-finish btn-primary ' name='finish'
										value='Finish' />
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
	
    
    <!--footer.jsp 시작  -->
    	<c:import url="../partial\\footer.jsp"/>
    <!--footer.jsp 끝  -->
    
	</body>
</html>