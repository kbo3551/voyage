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
	
				<h1 class="h3 mb-3"><strong>숙소 관리</strong></h1>
					<div class="row">
						<div>
							<div class="card flex-fill">
								<div class="card-header">
	
									<h5 class="card-title mb-0">Latest AccomBuilding</h5>
								</div>
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>Building No</th>
											<th>Building Name</th>
											<th>Building Description</th>
											<th>View Details</th>
										</tr>
									</thead>
									<tbody> 
										<c:forEach items="${list}" var="Accom" >
											<tr>
										        <td>${Accom.accomBuildingNo}</td>
										        <td>${Accom.accomBuildingName}</td>
										        <td>${Accom.accomBuildingDescription}</td>
										        <td><a href="${pageContext.request.contextPath}/admin/accomBuildingOne?accomBuildingNo=${Accom.accomBuildingNo}">상세 보기</a></td>
										        </tr>
									    </c:forEach>
									</tbody>
								</table>
								<ul class="paging">
								    <c:if test="${paging.prev}">
								        <span><a href='<c:url value="/accomBuildingList?page=${paging.startPage-1}"/>'>이전</a></span>
								    </c:if>
								    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
								        <span><a href='<c:url value="/accomBuildingList?page=${num}"/>'>${num}</a></span>
								    </c:forEach>
								    <c:if test="${paging.next && paging.endPage>0}">
								        <span><a href='<c:url value="/accomBuildingList?page=${paging.endPage+1}"/>'>다음</a></span>
								    </c:if>
								</ul>
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