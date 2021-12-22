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
             <span class="align-middle">관리자 페이지</span>
           </a>
   
         <ul class="sidebar-nav">
            <li class="sidebar-header">
               Pages
            </li>
            <!-- 사용자 페이지 홈으로 -->
            <li class="sidebar-item">
               <a class="sidebar-link" href="${pageContext.request.contextPath}/index">
                   	 <i class="align-middle" data-feather="home"></i> <span class="align-middle">사용자 페이지</span>
                  </a>
            </li>
            <!-- 프로필 수정 -->
            <li class="sidebar-item">
               <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/adminUpdate">
                       <i class="align-middle" data-feather="user"></i> <span class="align-middle">정보&nbsp;수정</span>
                  </a>
            </li>
            <!-- 대시보드(차트표) -->
            <li class="sidebar-item active">
               <a class="sidebar-link" href="index.html">
                     <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
                 </a>
            </li>

         
         <!--    <li class="sidebar-item">
               <a class="sidebar-link" href="pages-sign-in.html">
                     <i class="align-middle" data-feather="log-in"></i> <span class="align-middle">Sign In</span>
                   </a>
            </li>   
         
            <li class="sidebar-item">
               <a class="sidebar-link" href="${pageContext.request.contextPath}/addAdmin">
                       <i class="align-middle" data-feather="user-plus"></i> <span class="align-middle">Sign Up</span>
                   </a>
            </li>           -->   
            <!-- 공란(복사해서 이용) -->
            <li class="sidebar-item">
               <a class="sidebar-link" href="pages-blank.html">
                      <i class="align-middle" data-feather="book"></i> <span class="align-middle">Blank</span>
                    </a>
            </li>
            <!-- 추가사항 -->
            <li class="sidebar-item">
               <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/adminNoticeList">
                       <i class="align-middle" data-feather="book"></i> <span class="align-middle">공지사항 관리</span>
                   </a>
            </li>
            
            <li class="sidebar-header">
               Management
            </li>
   
            <li class="sidebar-item">
               <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/memberList">
                       <i class="align-middle" data-feather="user"></i> <span class="align-middle">회원 관리</span>
                  </a>
            </li>
   
            <li class="sidebar-item">
               <a class="sidebar-link"href="${pageContext.request.contextPath}/admin/hostList">
                       <i class="align-middle" data-feather="user"></i> <span class="align-middle">사업자 관리</span>
                  </a>
            </li>
            
            <li class="sidebar-item">
               <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/hostAskList">
                       <i class="align-middle" data-feather="user"></i> <span class="align-middle">사업자 신청 관리</span>
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
               <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/accessAccomBuilding">
                     <i class="align-middle" data-feather="grid"></i> <span class="align-middle">승인완료된 숙소목록</span>
                  </a>
            </li>
   
            <li class="sidebar-item">
               <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/accessActivity">
                     <i class="align-middle" data-feather="grid"></i> <span class="align-middle">승인완료된 체험목록</span>
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