<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
			<a class="sidebar-brand" href="${pageContext.request.contextPath}/admin/adminIndex">
	          <span class="align-middle">Admin Page</span>
	        </a>
	
			<ul class="sidebar-nav">
				<li class="sidebar-header">
					Pages
				</li>
				<!-- 대시보드(차트표) -->
				<li class="sidebar-item active">
					<a class="sidebar-link" href="index.html">
	            		<i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
	        		</a>
				</li>
				<!-- 프로필 -->
				<li class="sidebar-item">
					<a class="sidebar-link" href="pages-profile.html">
	           			<i class="align-middle" data-feather="user"></i> <span class="align-middle">Profile</span>
	         		</a>
				</li>
				<!-- 로그인 -->
				<li class="sidebar-item">
					<a class="sidebar-link" href="pages-sign-in.html">
	            		<i class="align-middle" data-feather="log-in"></i> <span class="align-middle">Sign In</span>
	          		</a>
				</li>
				<!-- 관리자 가입 -->
				<li class="sidebar-item">
					<a class="sidebar-link" href="${pageContext.request.contextPath}/addAdmin">
	           			<i class="align-middle" data-feather="user-plus"></i> <span class="align-middle">Sign Up</span>
	          		</a>
				</li>
				<!-- 공란(복사해서 이용) -->
				<li class="sidebar-item">
					<a class="sidebar-link" href="pages-blank.html">
	             		<i class="align-middle" data-feather="book"></i> <span class="align-middle">Blank</span>
	           		</a>
				</li>
				<!-- 추가사항 -->
				<li class="sidebar-item">
					<a class="sidebar-link" href="pages-blank.html">
	           			<i class="align-middle" data-feather="book"></i> <span class="align-middle">공지사항 관리</span>
	          		</a>
				</li>
				
				<li class="sidebar-header">
					Management
				</li>
	
				<li class="sidebar-item">
					<a class="sidebar-link" href="pages-profile.html">
	           			<i class="align-middle" data-feather="user"></i> <span class="align-middle">회원 관리</span>
	         		</a>
				</li>
	
				<li class="sidebar-item">
					<a class="sidebar-link" href="pages-profile.html">
	           			<i class="align-middle" data-feather="user"></i> <span class="align-middle">사업자 관리</span>
	         		</a>
				</li>
	
				<li class="sidebar-item">
					<a class="sidebar-link" href="${pageContext.request.contextPath}/admin/accomBuildingList">
	            		<i class="align-middle" data-feather="grid"></i> <span class="align-middle">숙소 관리</span>
	         		</a>
				</li>
				
				<li class="sidebar-item">
					<a class="sidebar-link" href="${pageContext.request.contextPath}/admin/activityList">
	            		<i class="align-middle" data-feather="grid"></i> <span class="align-middle">체험 관리</span>
	         		</a>
				</li>
	
				<li class="sidebar-item">
					<a class="sidebar-link" href="ui-typography.html">
	            		<i class="align-middle" data-feather="align-left"></i> <span class="align-middle">Typography</span>
	          		</a>
				</li>
	
				<li class="sidebar-item">
					<a class="sidebar-link" href="icons-feather.html">
	            		<i class="align-middle" data-feather="coffee"></i> <span class="align-middle">Icons</span>
	          		</a>
				</li>
	
				<li class="sidebar-header">
					Plugins & Addons
				</li>
	
				<li class="sidebar-item">
					<a class="sidebar-link" href="charts-chartjs.html">
	            		<i class="align-middle" data-feather="bar-chart-2"></i> <span class="align-middle">Charts</span>
	          		</a>
				</li>
	
				<li class="sidebar-item">
					<a class="sidebar-link" href="maps-google.html">
	            		<i class="align-middle" data-feather="map"></i> <span class="align-middle">Maps</span>
	          		</a>
				</li>
			</ul>
	

		</div>
	</nav>
</body>
</html>