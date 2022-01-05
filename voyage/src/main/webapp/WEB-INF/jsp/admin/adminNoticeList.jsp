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
				
				<div class="row">
					<div class="col-12 col-lg-8 col-xxl-9 d-flex">
						<div class="card flex-fill">
							<div class="card-header">
								<h3 class="h3 mb-3">공지사항 리스트</h3>
							</div>
							<table class="table table-hover my-0">
								<thead>
									<tr>
										<th>번호</th>
										<th>관리자 명</th>
										<th>제목</th>
										<th>조회수</th>
										<th>생성일</th>
										<th>수정일</th>
										<th></th>
									</tr>
								</thead>
								<tbody> 
									<c:forEach items="${noticeList}" var="n" >
										<tr>
									        <td>${n.noticeNo}</td>
									        <td>${n.adminId}</td>
									        <td>${n.noticeTitle}</td>
									        <td>${n.noticeViewCnt}</td>
									        <td>${n.createDate}</td>
									        <td>${n.updateDate}</td>
									        <td><a href="${pageContext.request.contextPath}/admin/adminNoticeOne?noticeNo=${n.noticeNo}" class="btn btn-primary">상세 보기</a></td>
									    </tr>
								    </c:forEach>
								</tbody>
							</table>
							<form method="get" action="${pageContext.request.contextPath}/admin/adminNoticeList">
								<div>
									<input type="text" class="form-control" placeholder="search" name="searchNotice">
									<button type="submit" class="btn btn-primary">검색</button>
								</div>
							</form>
						</div>
					</div>
					<!-- 페이징 -->
					<div class="container" id="page">
						<ul class="nav justify-content-center bg-light">
						 	<c:if test="${beginRow > (ROW_PER_PAGE * 10)}">
					 				<li><a href="${pageContext.request.contextPath}/admin/adminNoticeList?currentPage=${pageNo-1}&searchNotice=${param.searchNotice}">&lt;</a></li>
							</c:if>
							<c:set var="doneLoop" value="false"></c:set>
							<c:forEach var="f" begin="${pageNo}" end="${pageNo + 9}">
								<c:if test="${not doneLoop}">
									<c:choose>
										<c:when test="${currentPage == f}">
											<li class="active"><span>${f}</span></li>
										</c:when>
										<c:otherwise>
											<li><a class="nav-link active" href="${pageContext.request.contextPath}/admin/adminNoticeList?currentPage=${f}&searchNotice=${param.searchNotice}">${f}</a></li>
										</c:otherwise>
									</c:choose>
									<c:if test="${f == lastPage}">
										<c:set var="doneLoop" value="true"></c:set>
									</c:if>
								</c:if>
							</c:forEach>
							<c:if test="${currentPage + 10 <= lastPage}">
				 				<li><a class="nav-link active" href="${pageContext.request.contextPath}/admin/adminNoticeList?currentPage=${pageNo+10}&searchNotice=${param.searchNotice}">&gt;</a></li>
							</c:if>
						</ul>
					</div> 
				</div>
			</div>
			<div><a href="${pageContext.request.contextPath}/admin/addNotice" class="btn btn-primary">공지사항 작성</a></div>
		</main>
   
    <!-- adminFooter : 시작 -->
    	<c:import url="partial\\adminFooter.jsp"/>
    <!-- adminFooter : 끝 -->

		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/admin/js/app.js"></script>
	
</body>

</html>