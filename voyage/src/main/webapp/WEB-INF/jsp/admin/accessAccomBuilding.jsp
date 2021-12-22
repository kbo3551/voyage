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
	
				<h1 class="h3 mb-3"><strong>승인된 숙소 목록 보기</strong></h1>
					<div class="row">
						<div>
							<div class="card flex-fill">
								<div class="card-header">
	
									<h5 class="card-title mb-0">Access AccomBuilding</h5>
								</div>
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>건물 번호</th>
											<th>사업자 번호</th>
											<th>건물 이름</th>
											<th>건물 내용</th>
											<th>건물 전화번호</th>
											<th>공개 여부</th>
											<th>승인 여부</th>
											<th>create Date</th>
											<th>update Date</th>
										</tr>
									</thead>
									<tbody> 
											<c:forEach items="${list}" var="A">
											<tr>
										        <td>${A.accomBuildingNo}</td>
										        <td>${A.hostNo}</td>
										        <td>${A.accomBuildingName}</td>
										        <td>${A.accomBuildingDescription}</td>
										        <td>${A.accomBuildingPhone}</td>
										        <td>${A.accomBuildingState}</td>
										        <td>${A.accomBuildingStateAdmin}</td>
										        <td>${A.createDate}</td>
										        <td>${A.updateDate}</td>
										   </tr>
										   </c:forEach>
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