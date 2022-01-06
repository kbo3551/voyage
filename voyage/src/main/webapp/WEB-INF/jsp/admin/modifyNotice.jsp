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
    <!-- adminBanner : 시작 -->
    	<c:import url="partial\\adminBanner.jsp"/>
    <!-- adminBanner : 끝 -->
		
		<!-- 메인(중앙) -->
		<main class="content">
			<div class="container-fluid p-0">
	
				<h1 class="h3 mb-3"><strong>관리자</strong> 공지사항</h1>
				
				<!-- 입력공간 -->
				<form method="post" action="${pageContext.request.contextPath}/admin/modifyNotice"  enctype="multipart/form-data" id="noticeForm">
					<!-- 작성자 -->
					<input type="hidden" name="notice.adminId" value="${loginMember.getMemberId()}">
					<!-- 식별번호 -->
					<input type="hidden" name="notice.noticeNo" value="${notice.noticeNo}">
					<!-- 공지 제목 -->
					<div class="row">
						<div class="card">
							<div class="card-header">
								<h5 class="card-title mb-0">공지사항 제목</h5>
							</div>
							<div class="card-body">
								<input type="text" class="form-control" placeholder="제목" name="notice.noticeTitle" value="${notice.noticeTitle}">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="card">
							<div class="card-header">
								<!-- 상단고정(공지중요성)체크 -->
								<div>
									<h5 class="card-title mb-0">상단고정 여부</h5>
								</div>
								<div>
									<select class="form-select mb-3" name="notice.noticeTop">
										<!-- 게시글 수정 전 고정여부에 따른 option -->
										<c:choose>
											<c:when test="${notice.noticeTop == 'Y'}">
												<!-- 상단 비고정 -->
												<option value="N">일반</option>
												<!-- 상단 고정 -->
												<option selected value="Y">중요</option>
											</c:when>
											<c:otherwise>
												<!-- 상단 비고정 -->
												<option selected value="N">일반</option>
												<!-- 상단 고정 -->
												<option value="Y">중요</option>
											</c:otherwise>
										</c:choose>
									</select>
								</div>
								<!-- 사진 -->
								<c:choose>
									<c:when test="${!(empty notice.noticeFile)}">	
										<img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/notice/${notice.noticeFile.noticeFileName}.${notice.noticeFile.noticeFileExt}" alt="noImage" style="max-width:100% hegiht:auto">
										<a href="${pageContext.request.contextPath}/admin/removeNoticeModifyFile?noticeNo=${notice.noticeNo}" class="btn btn-primary">삭제</a>
									</c:when>
									<c:otherwise>
										<input type="file" name="noticeFile" id="noticeFile">
									</c:otherwise>
								</c:choose>	
							</div>
							<!-- 공지내용 -->
							<div class="card-body">
								<h5 class="card-title mb-0">내용</h5>
								<textarea class="form-control" rows="3" placeholder="내용입력" name="notice.noticeContent">${notice.noticeContent}</textarea>
							</div>
						</div>
					</div>
					<!-- 공지 Update -->
					<button class="btn btn-primary btn-lg" type="submit">수정</button>
				</form>
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