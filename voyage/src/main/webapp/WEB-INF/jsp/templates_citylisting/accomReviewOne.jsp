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

	<title>AdminKit Demo - Bootstrap 5 Admin Templateee</title>

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
			<div class="container-fluid p-0">
	
				<h1 class="h3 mb-3"><strong>숙소 후기</strong></h1>
					<div class="row">
						<div>
							<div class="card flex-fill">
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>리뷰 번호</th>
											<th>결제 번호</th>
											<th>제목</th>
											<th>내용</th>
											<th>별점</th>
											<th>조회수</th>
											<th>create Date</th>
											<th>update Date</th>
										</tr>
									</thead>
									<tbody> 
											<tr>
										        <td>${accomReview.accomReviewNo}</td>
										        <td>${accomReview.accomPaymentDetails}</td>
										        <td>${accomReview.accomReviewTitle}</td>
										        <td>${accomReview.accomReviewContent}</td>
										        <td>${accomReview.accomReviewStar}</td>
										        <td>${accomReview.accomReviewViewCnt}</td>
										        <td>${accomReview.createDate}</td>
										        <td>${accomReview.updateDate}</td>
										   </tr>
									</tbody>
								</table>
							
							</div>
						</div>
					</div>
				</div>
			</main>
	
    <!-- adminFooter : 시작 -->
    	<c:import url="partial\\\\adminFooter.jsp"/>
    <!-- adminFooter : 끝 -->
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/app.js"></script>

</body>

</html>