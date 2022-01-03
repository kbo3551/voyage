<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

	<link rel="canonical" href="https://demo-basic.adminkit.io/" />

	<title>쿠폰 생성</title>

	<link href="${pageContext.request.contextPath}/admin/css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
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
			font-family: 'SpoqaHanSansNeo-Regular';
		}
		
        #addCoupon {
          
            width:1500px;
            
        }
	</style>
<body>
	<div class="wrapper">
    <!-- adminKit : 시작 -->
    	<c:import url="partial\\adminKit.jsp"/>
    <!-- adminKit : 끝 -->
	<div class="main">
    <!-- adminKit : 시작 -->
    	<c:import url="partial\\\\adminBanner.jsp"/>
    <!-- adminKit : 끝 -->
    	<main class="content">
			<div class="container-fluid p-1">
				<h1 class="h3 mb-3"><strong>Coupon</strong>  생성</h1>
			</div>
	<form class="form-contact contact_form mb-80" action="${pageContext.request.contextPath}/admin/addCoupon" method="post" name="AddCoupon">
		<div class="container-fluid row justify-content-center align-items-center">
			<div class="row">
				<div class="col-12 col-lg-8 col-xxl-9 d-flex">
					<div class="card flex-fill" align="center">
						<div class="card-header">
							<h3 class="h3 mb-3" align="center">Coupon 생성목록&emsp;</h3>
						</div>
						<div class="clear"> 
                            <div class="col-sm-10"  align="center" style="height: 400px;">
                                <div class="form-group">
                                    <label for="couponName">쿠폰 이름&emsp;</label>
                                    <input style="width:30%;" placeholder="쿠폰 이름을 입력해주세요" id="couponName" name="couponName" class="form-control" type="text" value="${coupon.couponName}">
                                </div>
                                <br>
                                <div class="form-group">
                                    <label for="couponTerms">조건 금액&emsp;</label>
                                     <input style="width:30%;" placeholder="조건 금액을 입력해주세요" id="couponTerms" name="couponTerms" class="form-control" type="number" value="${coupon.couponTerms}">
                                </div> 
                                <br>
                                <div class="form-group">
                                    <label for="couponDiscount">할인 금액&emsp;</label>
                                  	<input style="width:30%;" placeholder="할인 금액을 입력해주세요" id="couponDiscount" name="couponDiscount" class="form-control" type="number" value="${coupon.couponDiscount}">
                                </div> 
                                <br>
                                <div class="form-group">
                                    <label for="deadLine">쿠폰 유효 기간&emsp;</label>
                                     <input style="width:30%;" id="deadLine" name="deadLine" class="form-control" type="datetime-local" value="${coupon.deadLine}">
                                </div> 
                            </div>
                               <br>
                               <br>
                               <div align="center" style="height: 100px;"><button type="button" class="btn btn-finish btn-primary" onclick="addCoupon()">쿠폰 추가</button>&emsp;</div>
                               <br>
                       </div>
                    </div>
				</div>
			</div>			
		</div>
	</form>
	<script>
    // 유효성 검사
    function addCoupon(){		
		if($("#couponName").val() == ""){
			alert('쿠폰 이름을 입력해주세요.');
			return;
		} else if($("#couponTerms").val() == ""){
			alert('조건 금액을 입력해주세요.');
			return;
		} else if($("#couponDiscount").val() == ""){
			alert('할인 금액을 입력해주세요');
			return;
		} else if($("#deadLine").val() == ""){
			alert('쿠폰의 유효기간을 입력해주세요');
			return;
		} else if($("#couponTerms").val().length > 11){
			alert('조건 금액의 크기가 너무 큽니다.');
			return;
		} else if($("#couponDiscount").val().length > 11){
			alert('할인 금액의 크기가 너무 큽니다.');
			return;
		} else if($("#deadLine").val() == ""){
			alert('쿠폰의 유효기간을 입력해주세요');
			return;
		} else if($("#couponTerms").val() <= $("#couponDiscount").val()){
			alert('할인 금액이 조건금액과 같거나 큽니다.');
			return;
		} else {
			AddCoupon.submit();
		}
	};
</script>
</main>
      <!-- adminFooter : 시작 -->
    	<c:import url="partial\\\\adminFooter.jsp"/>
    <!-- adminFooter : 끝 -->
		</div>
	</div>  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/app.js"></script>
</body>
</html>