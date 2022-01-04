<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<title>사업자페이지</title>
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
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.js" integrity="sha512-zO8oeHCxetPn1Hd9PdDleg5Tw1bAaP0YmNvPY8CwcRyUk7d7/+nyElmFrB6f7vg4f7Fv4sui1mcep8RIEShczg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            <script src="${contextPath}/Chart.js-2.9.4/dist/Chart.js"></script>
            
    
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
                                <span style="float: left;">사업자페이지</span> 
                                <span style="float: left; padding-left: 1.8%">
									<select id="category" name="category" onchange="categorySelect()">
										<c:choose>
			                        		<c:when test="${param.category == 'accom'}">
				                        		<option value="all">모두보기</option>
				                        		<option value="accom" selected="selected">숙소</option>
				                        		<option value="activity">체험</option>
			                        		</c:when>
			                        		<c:when test="${param.category == 'activity'}">
				                        		<option value="all">모두보기</option>
				                        		<option value="accom">숙소</option>
				                        		<option value="activity" selected="selected">체험</option>
			                        		</c:when>
			                        		<c:otherwise>
				                        		<option value="all" selected="selected">모두보기</option>
				                        		<option value="accom">숙소</option>
				                        		<option value="activity">체험</option>
			                        		</c:otherwise>
			                        	</c:choose>
		                        	</select>
								</span>
								<br>
                            </h2>
                            <hr>
                        </div>
                        
                        <!-- 카테고리 선택하면 해당 카테고리값만 나오게 함 -->
                        <script>
	                        function categorySelect(){ 
	                    		// 카테고리 선택값을 가져와서 벨류 저장
	                    		let category = document.getElementById("category"); 
	                    		let selectCategoryValue = category.options[category.selectedIndex].value; 
	                    		
	                    		// 페이징
	                    		let accomPage = 1;
	                    		let activityPage = 1;
	                    		if('${accomPage}' != null){
	                    			accomPage = '${accomPage}';
	                    		}
	                    		if('${activityPage}' != null){
	                    			activityPage = '${activityPage}';
	                    		}
	                    		
	                    		let contextPath = '${contextPath}';
	                    		
	                    		location.replace(contextPath+'/host/hostIndex?accomPage='+accomPage+'&activityPage='+activityPage+'&category='+selectCategoryValue);
	                    		
	                        }
                        
                        </script>
                        
                        <div class="clear">
                        	<div class="col-sm-12">
                        		<script type="text/javascript">
                        			// 사업자 번호
                        			let hostNo = "${hostSession.getHostNo()}";
                        			
                        			// 총 수익
                        			$.ajax(
                        				{
                        					type: "GET",
                        					url:"/voyage/selectAllProfitByHost?hostNo="+hostNo,
                        					dataType:"text",
                        					success : function (data) {
                        						let totalProfit = data;
                        						totalProfit *= 1;
                        						$('#totalProfit').append(totalProfit.toLocaleString());
											}
                        						
                        				}		
                        			)
                        			
                        			// 월 수익
                        			$.ajax(
                        				{
                        					type: "GET",
                        					url:"/voyage/selectAllProfitByHostToMonth?hostNo="+hostNo,
                        					dataType:"text",
                        					success : function (data) {
                        						let totalMonthProfit = data;
                        						totalMonthProfit *= 1;
                        						$('#totalProfitByMonth').append(totalMonthProfit.toLocaleString());
											}
                        						
                        				}		
                        			)
                        			
                        			// 숙소 총 수익
                        			$.ajax(
                        				{
                        					type: "GET",
                        					url:"/voyage/selectAccomProfitByHost?hostNo="+hostNo,
                        					dataType:"text",
                        					success : function (data) {
                        						let accomTotalProfit = data;
                        						accomTotalProfit *= 1;
                        						$('#accomTotalProfit').append(accomTotalProfit.toLocaleString());
											}
                        						
                        				}		
                        			)
                        			
                        			// 숙소 월 수익
                        			$.ajax(
                        				{
                        					type: "GET",
                        					url:"/voyage/selectAccomProfitByHostToMonth?hostNo="+hostNo,
                        					dataType:"text",
                        					success : function (data) {
                        						let accomMonthTotalProfit = data;
                        						accomMonthTotalProfit *= 1;
                        						$('#accomMonthTotalProfit').append(accomMonthTotalProfit.toLocaleString());
											}
                        						
                        				}		
                        			)
                        			
                        			// 체험 총 수익
                        			$.ajax(
                        				{
                        					type: "GET",
                        					url:"/voyage/selectActivityProfitByHost?hostNo="+hostNo,
                        					dataType:"text",
                        					success : function (data) {
                        						let activityTotalProfit = data;
                        						activityTotalProfit *= 1;
                        						$('#activityTotalProfit').append(activityTotalProfit.toLocaleString());
											}
                        						
                        				}		
                        			)
                        			
                        			// 체험 월 수익
                        			$.ajax(
                        				{
                        					type: "GET",
                        					url:"/voyage/selectActivityProfitByHostToMonth?hostNo="+hostNo,
                        					dataType:"text",
                        					success : function (data) {
                        						let activityMonthTotalProfit = data;
                        						activityMonthTotalProfit *= 1;
                        						$('#activityMonthTotalProfit').append(activityMonthTotalProfit.toLocaleString());
											}
                        						
                        				}		
                        			)
                        			
                        			// 해당 사업자의 월별 가장 많은 수익을 벌어들인 숙소
                        			$.ajax(
                        				{
                        					type: "GET",
                        					url:"/voyage/selectAccomProfitByQuarterly?hostNo="+hostNo,
                        					dataType:"text",
                        					success : function (data) {
                        						$('#accomQuarterlyProfit').append(data);
											}
                        						
                        				}		
                        			)
                        			
                        			// 해당 사업자의 월별 가장 많은 수익을 벌어들인 숙소
                        			$.ajax(
                        				{
                        					type: "GET",
                        					url:"/voyage/selectActivityProfitByQuarterly?hostNo="+hostNo,
                        					dataType:"text",
                        					success : function (data) {
                        						$('#activityQuarterlyProfit').append(data);
											}
                        						
                        				}		
                        			)
                        			
                        			// 해당 사업자의 저번주와 비교한 총 수익
                        			$.ajax(
                        				{
                        					type: "GET",
                        					url:"/voyage/selectAllProfitCompare?hostNo="+hostNo,
                        					dataType:"text",
                        					success : function (data) {
                        						$('#allProfit').append(data);
											}
                        						
                        				}		
                        			)
                        			
                        			// 해당 사업자의 저번달과 비교한 월 수익
                        			$.ajax(
                        				{
                        					type: "GET",
                        					url:"/voyage/selectAllProfitCompareByMonth?hostNo="+hostNo,
                        					dataType:"text",
                        					success : function (data) {
                        						$('#allProfitMonth').append(data);
											}
                        						
                        				}		
                        			)
                        			
                        			// 해당 사업자의 저번주와 비교한 숙소 수익
                        			$.ajax(
                        				{
                        					type: "GET",
                        					url:"/voyage/selectAccomProfitCompare?hostNo="+hostNo,
                        					dataType:"text",
                        					success : function (data) {
                        						$('#accomProfit').append(data);
											}
                        						
                        				}		
                        			)
                        			
                        			// 해당 사업자의 저번달과 비교한 숙소 월 수익
                        			$.ajax(
                        				{
                        					type: "GET",
                        					url:"/voyage/selectAccomProfitCompareByMonth?hostNo="+hostNo,
                        					dataType:"text",
                        					success : function (data) {
                        						$('#accomProfitMonth').append(data);
											}
                        						
                        				}		
                        			)
                        			
                        			// 해당 사업자의 저번주와 비교한 체험 수익
                        			$.ajax(
                        				{
                        					type: "GET",
                        					url:"/voyage/selectActivityProfitCompare?hostNo="+hostNo,
                        					dataType:"text",
                        					success : function (data) {
                        						$('#activityProfit').append(data);
											}
                        						
                        				}		
                        			)
                        			
                        			// 해당 사업자의 저번달과 비교한 체험 월 수익
                        			$.ajax(
                        				{
                        					type: "GET",
                        					url:"/voyage/selectActivityProfitCompareByMonth?hostNo="+hostNo,
                        					dataType:"text",
                        					success : function (data) {
                        						$('#activityProfitMonth').append(data);
											}
                        						
                        				}		
                        			)
                        			
                        			
                        			
                        			// 최근 한달간 숙소 일별 수익
                        			$.ajax(
                        				{
                        					type: "GET",
                        					url:"/voyage/selectAccomProfitByMonthToDate?hostNo="+hostNo,
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
                        							new Chart(document.getElementById("accom-dashboard-line"), {
                        								type: "line",
                        								data: {
                        									labels: label,
                        									datasets: [{
                        										label: "",
                        										fill: true,
                        										data: amount,
                        										backgroundColor: 'rgba(23, 21, 132, 0.1)',
                        									    borderColor: 'rgb(255, 99, 132)',
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
                        										text: '숙소 월별 수익'
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
                        			
                        			
                        			
                        			
                        			// 최근 한달간 체험 일별 수익
                        			$.ajax(
                        				{
                        					type: "GET",
                        					url:"/voyage/selectActivityProfitByMonthToDate?hostNo="+hostNo,
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
                        										text: '체험 월별 수익'
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
                        		

                        		<!-- Earning 차트 -->
                        		<c:if test="${param.category == 'all' || param.category == null}">
                        		<div class="clear">
                        			<div class="card" style="float: left;  width: 50%">
										<div class="card-body">
											<div class="row">
												<div class="col mt-0">
													<h5 class="card-title">총 수익</h5>
												</div>
											</div>
											<h1 class="mt-1 mb-3" id="totalProfit">&#8361;</h1>
											<div class="mb-0" id="allProfit">
											</div>
										</div>
									</div>
									<div class="card" style="float: left;  width: 50%">
										<div class="card-body">
											<div class="row">
												<div class="col mt-0">
													<h5 class="card-title">월 수익</h5>
												</div>
											</div>
											<h1 class="mt-1 mb-3" id="totalProfitByMonth">&#8361;</h1>
											<div class="mb-0 " id="allProfitMonth">
											</div>
										</div>
									</div>
                        		</div>
								</c:if>
								
								<c:if test="${param.category != 'activity'}">
                        		<div class="clear">
                        			<div class="card" style="float: left; width: 50%">
										<div class="card-body">
											<div class="row">
												<div class="col mt-0">
													<h5 class="card-title">숙소 총 수익</h5>
												</div>
											</div>
											<h1 class="mt-1 mb-3" id="accomTotalProfit">&#8361;</h1>
											<div class="mb-0 " id="accomProfit">
											</div>
										</div>
									</div>
									<div class="card" style="float: left;  width: 50%">
										<div class="card-body">
											<div class="row">
												<div class="col mt-0">
													<h5 class="card-title">숙소 월 수익</h5>
												</div>
											</div>
											<h1 class="mt-1 mb-3" id="accomMonthTotalProfit">&#8361;</h1>
											<div class="mb-0 " id="accomProfitMonth">
											</div>
										</div>
									</div>
                        		</div>
								</c:if>
								
								<c:if test="${param.category != 'accom'}">
                        		<div class="clear">
                        			<div class="card" style="float: left;  width: 50%">
										<div class="card-body">
											<div class="row">
												<div class="col mt-0">
													<h5 class="card-title">체험 총 수익</h5>
												</div>
											</div>
											<h1 class="mt-1 mb-3" id="activityTotalProfit">&#8361;</h1>
											<div class="mb-0 " id="activityProfit">
											</div>
										</div>
									</div>
									<div class="card" style="float: left;  width: 50%">
										<div class="card-body">
											<div class="row">
												<div class="col mt-0">
													<h5 class="card-title">체험 월 수익</h5>
												</div>
											</div>
											<h1 class="mt-1 mb-3" id="activityMonthTotalProfit">&#8361;</h1>
											<div class="mb-0 " id="activityProfitMonth">
											</div>
										</div>
									</div>
                        		</div>
								</c:if>
                        		
                        		
                        		<br>
                        		<br>
                        		<br>
                        		
                        		<br>
                        		<br>
                        		<br>
                        		<br>
                        		
                        		<c:if test="${param.category != 'activity'}">
	                        		<div class="card" style="float: left;  width: 50%">
										<div class="card-body">
											<div class="row">
												<div class="col mt-0">
													<h5 class="card-title">이번달 최다실적 숙소</h5>
												</div>
											</div>
											<h1 class="mt-1 mb-3" id="accomQuarterlyProfit"></h1>
										</div>
									</div>
                        		</c:if>
                        		<c:if test="${param.category != 'accom'}">
                        			<div class="card" style="float: left;  width: 50%">
										<div class="card-body">
											<div class="row">
												<div class="col mt-0">
													<h5 class="card-title">이번달 최다실적 체험</h5>
												</div>
											</div>
											<h1 class="mt-1 mb-3" id="activityQuarterlyProfit"></h1>
										</div>
									</div>
                        		</c:if>
                        		
                        		
                        		<br>
                        		<br>
                        	</div>
                        </div>
                        
                        
                        <br>
                        <br>
                        <br>
                        <c:if test="${param.category != 'activity'}">
                        <div class="clear"> 
                            <div class="col-sm-12">
	                            <div class="chart chart-sm">
									<canvas id="accom-dashboard-line"></canvas>
								</div>
                            </div>
                        </div>
                        </c:if>
                        
                        
                        <div class="clear"> 
                        	<c:if test="${param.category != 'activity'}">
                            <div class="col-sm-12">
                            <br>
                            <br>
	                            &nbsp;&nbsp;<label>운영 숙소</label>
	                            <c:if test="${accomReqCount > 0}">
	                            	<span>&nbsp;&nbsp;<a href="${contextPath}/host/accomReqState" class="btn" style="background: rgb(40,180,240); color: white;">신청조회</a></span>
	                            </c:if>
								<div>
									<c:choose>
										<c:when test="${!empty accomBuildingList}">
											<div>
												&nbsp;&nbsp;<small>현재 ${accomCount}개의 숙소를 운영하고 있습니다.</small>
												<table class="table" style="text-align: center; vertical-align: middle; display:table;">
													<tr>
														<td style="font-weight: bold; display:table-cell;vertical-align:middle;">이름</td>
														<td style="font-weight: bold; display:table-cell;vertical-align:middle;">생성일</td>
														<td style="font-weight: bold; display:table-cell;vertical-align:middle;">공개여부</td>
														<td style="font-weight: bold; display:table-cell;vertical-align:middle;"><a class="btn" href="${contextPath}/host/addAccomBuilding" style="background: rgb(40,180,240); color: white;">숙소추가</a></td>
													</tr>
													<c:forEach var="ab" items="${accomBuildingList}">
														<tr>
															<td style="display:table-cell;vertical-align:middle;" width="25%"><small>${ab.accomBuildingName}</small></td>
															<fmt:parseDate var="abCreateDateString" value="${ab.createDate}" pattern="yyyy-MM-dd HH:mm:ss.S" />
															<td style="display:table-cell;vertical-align:middle;" width="25%"><small><fmt:formatDate value="${abCreateDateString}" pattern="yyyy-MM-dd" /></small></td>
															<td style="display:table-cell;vertical-align:middle;" width="25%"><small>${ab.accomBuildingState}</small></td>
															<td style="display:table-cell;vertical-align:middle;" width="25%"><small><a href="#" class="btn" style="background: rgb(130,130,130);">상세</a></small></td>
														</tr>
													</c:forEach>
												</table>
											</div>
										</c:when>
										<c:otherwise>
											<small>&nbsp;&nbsp;목록이 비어있습니다.</small> <a class="btn" href="${contextPath}/host/addAccomBuilding" style="background: rgb(40,180,240); color: white;">숙소추가</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							
							<!-- 숙소 페이징 -->
							<c:if test="${accomCount > 0}">
								<div class="clear">
		                           <ul class="nav justify-content-center">
		                              <c:if test="${accomBeginRow > (ROW_PER_PAGE * 10)}">
		                                 <li><a href="${contextPath}/host/hostIndex?accomPage=${accomPageNo-1}&activityPage=${activityPage}&category=${param.category}">&lt;</a></li>
		                              </c:if>
		                              <c:set var="doneLoop" value="false"></c:set>
		                              <c:forEach var="f" begin="${accomPageNo}" end="${accomPageNo + 9}">
		                                 <c:if test="${not doneLoop}">
		                                    <c:choose>
		                                       <c:when test="${accomPage == f}">
		                                          <li class="active"><span class="nav-link">${f}</span></li>
		                                       </c:when>
		                                       <c:otherwise>
		                                          <li><a class="nav-link active" href="${contextPath}/host/hostIndex?accomPage=${f}&activityPage=${activityPage}&category=${param.category}">${f}</a></li>
		                                       </c:otherwise>
		                                    </c:choose>
		
		                                    <c:if test="${f == accomLastPage}">
		                                       <c:set var="doneLoop" value="true"></c:set>
		                                    </c:if>
		                                 </c:if>
		                              </c:forEach>
		                              <c:if test="${accomPage + 10 <= accomLastPage}">
		                                 <li><a class="nav-link active" href="${contextPath}/host/hostIndex?accomPage=${accomPage+10}&activityPage=${activityPage}&category=${param.category}">&gt;</a></li>
		                              </c:if>
		                           </ul>
		                        </div>
							</c:if>
							</c:if>
						
							<c:if test="${param.category == 'all' || param.category == null}">
							<br>
							<hr>
							<br>
							</c:if>
							
							<c:if test="${param.category != 'accom'}">
							<div class="clear"> 
	                            <div class="col-sm-12">
		                            <div class="chart chart-sm">
										<canvas id="activity-dashboard-line"></canvas>
									</div>
	                            </div>
                        	</div>
							
							<div class="clear"> 
	                            <div class="col-sm-12">
	                            	<br>
	                            	<br>
	                            	&nbsp;&nbsp;<label>운영 체험</label>
	                            	<c:if test="${activityReqCount > 0}">
	                            		<span>&nbsp;&nbsp;<a class="btn" href="${contextPath}/host/activityReqState" style="background: rgb(40,180,240); color: white;">신청조회</a></span>
	                            	</c:if>
	                            	
									<div>
										<c:choose>
											<c:when test="${!empty activityList}">
												<div>
													&nbsp;&nbsp;<small>현재 ${activityCount}개의 체험을 운영하고 있습니다.</small>
													<table class="table" style="text-align: center; vertical-align: middle; display:table;">
														<tr>
															<td style="font-weight: bold; display:table-cell;vertical-align:middle;">이름</td>
															<td style="font-weight: bold; display:table-cell;vertical-align:middle;">생성일</td>
															<td style="font-weight: bold; display:table-cell;vertical-align:middle;">공개여부</td>
															<td style="font-weight: bold; display:table-cell;vertical-align:middle;"><a class="btn" href="${contextPath}/host/addActivity" style="background: rgb(40,180,240); color: white;">체험추가</a></td>
														</tr>
														<c:forEach var="al" items="${activityList}">
															<tr>
																<td style="display:table-cell;vertical-align:middle;" width="25%"><small>${al.activityName}</small></td>
																<fmt:parseDate var="alCreateDateString" value="${al.createDate}" pattern="yyyy-MM-dd HH:mm:ss.S" />
																<td style="display:table-cell;vertical-align:middle;" width="25%"><small><fmt:formatDate value="${alCreateDateString}" pattern="yyyy-MM-dd" /></small></td>
																<td style="display:table-cell;vertical-align:middle;" width="25%"><small>${al.activityState}</small></td>
																<td style="display:table-cell;vertical-align:middle;" width="25%"><small><a href="#" class="btn" style="background: rgb(130,130,130);">상세</a></small></td>
															</tr>
														</c:forEach>
													</table>
												</div>
											</c:when>
											<c:otherwise>
												<small>&nbsp;&nbsp;목록이 비어있습니다.</small> <a class="btn" href="${contextPath}/host/addActivity" style="background: rgb(40,180,240); color: white;">체험추가</a>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
							 
							<!-- 체험 페이징 -->
							<c:if test="${activityCount > 0}">
								<div class="clear">
		                           <ul class="nav justify-content-center">
		                              <c:if test="${activityBeginRow > (ROW_PER_PAGE * 10)}">
		                                 <li><a href="${contextPath}/host/hostIndex?accomPage=${accomPage}&activityPage=${activityPageNo-1}&category=${param.category}">&lt;</a></li>
		                              </c:if>
		                              <c:set var="doneLoop" value="false"></c:set>
		                              <c:forEach var="f" begin="${activityPageNo}" end="${activityPageNo + 9}">
		                                 <c:if test="${not doneLoop}">
		                                    <c:choose>
		                                       <c:when test="${activityPage == f}">
		                                          <li class="active"><span class="nav-link">${f}</span></li>
		                                       </c:when>
		                                       <c:otherwise>
		                                          <li><a class="nav-link active" href="${contextPath}/host/hostIndex?accomPage=${accomPage}&activityPage=${f}&category=${param.category}">${f}</a></li>
		                                       </c:otherwise>
		                                    </c:choose>
		
		                                    <c:if test="${f == activityLastPage}">
		                                       <c:set var="doneLoop" value="true"></c:set>
		                                    </c:if>
		                                 </c:if>
		                              </c:forEach>
		                              <c:if test="${activityPage + 10 <= activityLastPage}">
		                                 <li><a class="nav-link active" href="${contextPath}/host/hostIndex?accomPage=${accomPage}&activityPage=${activityPage+10}&category=${param.category}">&gt;</a></li>
		                              </c:if>
		                           </ul>
		                       </div>
							</c:if>
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