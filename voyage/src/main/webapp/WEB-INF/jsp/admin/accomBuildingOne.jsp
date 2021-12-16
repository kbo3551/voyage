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
	
				<h1 class="h3 mb-3"><strong>상세 보기</strong></h1>
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
											<th>Host No</th>
											<th>Building Name</th>
											<th>Building Description</th>
											<th>Building Phone</th>
											<th>Building State</th>
											<th>Building State Admin</th>
											<th>create Date</th>
											<th>update Date</th>
											<th>수정하기</th>
										</tr>
									</thead>
									<tbody> 
											<tr>
										        <td>${accomBuilding.accomBuildingNo}</td>
										        <td>${accomBuilding.hostNo}</td>
										        <td>${accomBuilding.accomBuildingName}</td>
										        <td>${accomBuilding.accomBuildingDescription}</td>
										        <td>${accomBuilding.accomBuildingPhone}</td>
										        <td>${accomBuilding.accomBuildingState}</td>
										        <td>${accomBuilding.accomBuildingStateAdmin}</td>
										        <td>${accomBuilding.createDate}</td>
										        <td>${accomBuilding.updateDate}</td>
										        <td><a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/accomBuildingUpdate?accomBuildingNo=${accomBuilding.accomBuildingNo}">수정하기</a></td>
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