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
	<div class="main">
		<main class="content">
			<div class="container-fluid p-0">
				<form class="form-contact contact_form mb-80" action="${pageContext.request.contextPath}/admin/activityUpdate" method="post" name="activityUpdate" id="activityUpdateForm">
				<h1 class="h3 mb-3"><strong>상세 보기</strong></h1>
					<div class="row">
						<div>
							<div class="card flex-fill">
								<div class="card-header">
	
									<h5 class="card-title mb-0">Update Activity</h5>
								</div>
								<div class="clear"> 
                            		<div class="col-sm-5">
                                		<div class="form-group">
											<label>체험 번호</label>
											<input class="form-control" type="text" readonly="readonly" name="activityNo" value="${activity.activityNo}">
										</div>
										<div class="form-group">
											<label>사업자 번호</label>
											<input class="form-control" type="text" readonly="readonly" value="${activity.hostNo}">
										</div>
										<div class="form-group">
											<label>체험 이름</label>
											<input class="form-control" type="text" readonly="readonly" value="${activity.activityName}">
										</div>
										<div class="form-group">
											<label>체험 여는 날짜</label>
											<input class="form-control" type="text" readonly="readonly" value="${activity.activityOpenDate}">
										</div>
										<div class="form-group">
											<label>체험 닫는 날짜</label>
											<input class="form-control" type="text" readonly="readonly" value="${activity.activityCloseDate}">
										</div>
										<div class="form-group">
											<label>체험 가격</label>
											<input class="form-control" type="text" readonly="readonly" value="${activity.activityPrice}">
										</div>
										<div class="form-group">
											<label>체험 여는 시간</label>
											<input class="form-control" type="text" readonly="readonly" value="${activity.activityOpenHour}">
										</div>
										<div class="form-group">
											<label>체험 닫는 시간</label>
											<input class="form-control" type="text" readonly="readonly" value="${activity.activityCloseHour}">
										</div>
									</div>
									
          	             			<div class="col-sm-5">
										<div class="form-group">
											<label>Activity Max T</label>
											<input class="form-control" type="text" readonly="readonly" value="${activity.activityMaxT}">
										</div>
										<div class="form-group">
											<label>Activity Max P</label>
											<input class="form-control" type="text" readonly="readonly" value="${activity.activityMaxP}">
										</div>
										<div class="form-group">
											<label>체험 내용</label>
											<input class="form-control" type="text" readonly="readonly" value="${activity.activityDescription}">
										</div>
										<div class="form-group">
											<label>공개 여부</label>
											<select name="activityState" id="activityState">
					                            <option value="공개">공개</option>
					                            <option value="비공개">비공개</option>
											</select>
										</div>
										<div class="form-group">
											<label>승인 여부</label>
											<select name="activityStateAdmin" id="activityStateAdmin">
					                           	<option value="승인대기">승인대기</option>
					                          	<option value="승인완료">승인완료</option>
					                            <option value="점검">점검</option>
					                            <option value="삭제">삭제</option>
											</select>
										</div>
										<div class="form-group">
											<label>Create Date</label>
											<input class="form-control" type="text" readonly="readonly" value="${activity.createDate}">
										</div>
										<div class="form-group">										
											<label>Update Date</label>
											<input class="form-control" type="text" readonly="readonly" value="${activity.updateDate}">
										</div>
										<br>
										<div style="text-align: center;">
	                                		<button class="btn btn-info" type="submit">수정하기</button>
										</div>
										<br>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</main>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/app.js"></script>
	
</body>

</html>