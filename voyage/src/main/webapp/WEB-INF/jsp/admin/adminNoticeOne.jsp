<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<body>
	<div class="wrapper">
    <!-- adminKit : 시작 -->
    	<c:import url="partial\\adminKit.jsp"/>
    <!-- adminKit : 끝 -->
	<div class="main">
    <!-- adminKit : 시작 -->
    	<c:import url="partial\\adminBanner.jsp"/>
    <!-- adminKit : 끝 -->
		
		<!-- 메인(중앙) -->
		<main class="content">
			<div class="container-fluid p-0">
				<h1 class="h3 mb-3"><strong>관리자</strong> 공지사항</h1>
			</div>
			<div class="row">
				<div class="col-12 col-lg-8 col-xxl-9 d-flex">
					<div class="card flex-fill">
						<div class="card-header">
							<h3 class="h3 mb-3"> ${notice.noticeNo}. ${notice.noticeTitle} </h3>
						</div>
						<div class="card">
							<div class="card-header">
								<div>
									조회수 : <input type="text" class="form-control" readonly="readonly" value=" ${notice.noticeViewCnt}">
								</div>
								<div>
									작성자 : <input type="text" class="form-control" readonly="readonly" value=" ${notice.adminId}">
								</div>
							</div>
							<div class="card_body">
								<div>
									<textarea cols="100%" rows="5" readonly="readonly">${notice.noticeContent}</textarea>
								</div>
								<div>
									<c:if test="${!(empty notice.noticeFile)}">
										<img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/notice/${notice.noticeFile.noticeFileName}.${notice.noticeFile.noticeFileExt}" alt="Unsplash">
									</c:if>
								</div>
							</div>
							<div>
								생성일 : <input type="text" class="form-control" readonly="readonly" value="${notice.createDate}">
							</div>
							<div>
								수정일 : <input type="text" class="form-control" readonly="readonly" value="${notice.updateDate}">
							</div>
							<div>
								<a href="${pageContext.request.contextPath}/admin/modifyNotice?noticeNo=${notice.noticeNo}" class="btn btn-primary">수정</a>
								<a href="${pageContext.request.contextPath}/admin/removeNotice?noticeNo=${notice.noticeNo}" class="btn btn-primary">삭제</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</main>
   
    <!-- adminFooter : 시작 -->
    	<c:import url="partial\\adminFooter.jsp"/>
    <!-- adminFooter : 끝 -->

		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/admin/js/app.js"></script>
	
</body>

</html>