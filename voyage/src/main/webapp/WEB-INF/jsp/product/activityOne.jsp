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
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/normalize.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/fontello.css">
		<link href="${pageContext.request.contextPath}/accom/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/accom/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/bootstrap-select.min.css"> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/icheck.min_all.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/price-range.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/owl.carousel.css">  
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/owl.theme.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/owl.transitions.css"> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/wizard.css"> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/style.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/responsive.css">
		
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
			
		</style>
    </head>
    
    <body>
    <!-- 배너 : 시작 -->
    	<c:import url="../partial\\banner.jsp"/>
    <!-- 배너 : 끝 -->
    <div style="height:130px; background-color: black;"></div>
    
    
    
    
    	<!--footer.jsp 시작  -->
    	<c:import url="../partial\\footer.jsp"/>
    <!--footer.jsp 끝  -->
	
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

</body>
</html>