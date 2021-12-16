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

<body>
	<div class="wrapper">
	<div class="main">
		<main class="content">
			<div class="container-fluid p-0">
				<form class="form-contact contact_form mb-80" action="${pageContext.request.contextPath}/admin/accomBuildingUpdate" method="post" name="accomBuildingUpdate" id="accomBuildingUpdateForm">
				<h1 class="h3 mb-3"><strong>상세 보기</strong></h1>
					<div class="row">
						<div>
							<div class="card flex-fill">
								<div class="card-header">
	
									<h5 class="card-title mb-0">Update AccomBuilding</h5>
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
											</tr>
										</thead>
									
									<tbody>
									<tr>
									<td><input name="accomBuildingNo" id="accomBuildingNo" type="text" value="${accomBuilding.accomBuildingNo}" readonly="readonly"/></td>
	                                
	                                <td><input name="hostNo" id="hostNo" type="text" value="${accomBuilding.hostNo}" readonly="readonly"/></td>
	                                
	                                <td><input name="accomBuildingName" id="accomBuildingName" type="text" value="${accomBuilding.accomBuildingName}" readonly="readonly"/></td>
	                                
	                                <td><input name="accomBuildingDescription" id="accomBuildingDescription" type="text" value="${accomBuilding.accomBuildingDescription}" readonly="readonly"/></td>
	                                
	                                <td><input name="accomBuildingPhone" id="accomBuildingPhone" type="text" value="${accomBuilding.accomBuildingPhone}" readonly="readonly"/></td>
	                                <td>
                                		<select name="accomBuildingState" id="accomBuildingState">
				                            <option value="공개">공개</option>
				                            <option value="비공개">비공개</option>
										</select>
                                	</td>
                                			
                                	<td>
                                		<select name="accomBuildingStateAdmin" id="accomBuildingStateAdmin">
				                           	<option value="승인대기">승인대기</option>
				                          	<option value="승인완료">승인완료</option>
				                            <option value="점검">점검</option>
				                            <option value="삭제">삭제</option>
										</select>
                                	</td>
	                                <td><input name="createDate" id="createDate" type="text" value="${accomBuilding.createDate}" readonly="readonly"/></td>
	                                
	                                <td><input name="updateDate" id="updateDate" type="text" value="${accomBuilding.updateDate}" readonly="readonly"/></td>
	                                </tr>
									</tbody>
									</table>
									<div style="text-align: center;">
	                                	<button class="btn btn-primary" type="submit">수정하기</button>
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