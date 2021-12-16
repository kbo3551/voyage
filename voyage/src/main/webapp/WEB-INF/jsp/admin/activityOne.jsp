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
<style>
	td{height: 80px; width: 20%;}
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
	
				<h1 class="h3 mb-3"><strong>상세 보기</strong></h1>
					<div class="row">
						<div>
							<div class="card flex-fill">
								<div class="card-header">
	
									<h5 class="card-title mb-0">Latest Activity</h5>
								</div>
								<table class="table table-hover my-0">
									<c:forEach items="${activity}" var="Act" >
									<thead>
										<tr>
											<th>ActivityNo</th>
											<th>Host No</th>
											<th>ActivityName</th>
											<th>ActivityOpenDate</th>
											<th>ActivityCloseDate</th>
										</tr>
									</thead>
										<tr>
											<td>${Act.activityNo}</td>
										    <td>${Act.hostNo}</td>
										    <td>${Act.activityName}</td>
										    <td>${Act.activityOpenDate}</td>
										    <td>${Act.activityCloseDate}</td>
										</tr>
										
									<thead>
										<tr>
											<th>ActivityPrice</th>
											<th>ActivityOpenHour</th>
											<th>ActivityCloseHour</th>
											<th>ActivityMaxT</th>
											<th>ActivityMaxP</th>
										<tr>
									</thead>
										<tr>
									 		<td>${Act.activityPrice}</td>
										    <td>${Act.activityOpenHour}</td>
										    <td>${Act.activityCloseHour}</td>
										    <td>${Act.activityMaxT}</td>
										    <td>${Act.activityMaxP}</td>
										</tr>
									
									<thead>
										<tr>
											<th>ActivityDescription</th>
											<th>ActivityState</th>
											<th>ActivityStateAdmin</th>
											<th>CreateDate</th>
											<th>UpdateDate</th>
										</tr>
									</thead>
											<tr>
										        <td>${Act.activityDescription}</td>
										        <td>${Act.activityState}</td>
										        <td>${Act.activityStateAdmin}</td>
										        <td>${Act.createDate}</td>
										        <td>${Act.updateDate}</td>
										   </tr>
									    </c:forEach>
									</table>
									<br>
								<div style="text-align: center;"><a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/accomActivityUpdate">수정하기</a></div>
								<br>
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