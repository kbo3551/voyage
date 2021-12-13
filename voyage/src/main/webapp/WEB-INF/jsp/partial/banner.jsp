<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너</title>
<style type="text/css">
#hashtag {
	background-color: rgba(0, 0, 0, 0.5);
    position: absolute;
    transition: all .4s;
	width: 120%;
	height: auto;
	left: -20%;
	top: -1500%;
	border-radius: 0 0 20px 20px;
	z-index: 100;
	padding: 30px 100px 50px 100px;
	overflow: hidden;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
       <div class="header-area header-transparent">
            <div class="main-header">
               <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                  <a href="${pageContext.request.contextPath}/index" title="여행을 떠나는 세대"><img src="${pageContext.request.contextPath}/assets/img/logo/logo.png" alt="logo"></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-8">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">                                                                                                                                     
                                            <li><a href="${pageContext.request.contextPath}/index">메인</a></li>
                                            <li><a href="${pageContext.request.contextPath}/about">설명</a></li>
                                            <li><a href="${pageContext.request.contextPath}/setProductCategory">예약</a>
                                                <ul class="submenu">
                                                    <li><a href="${pageContext.request.contextPath}/templates_citylisting/getActivityProduct">체험</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/templates_citylisting/getAccomProduct">숙소</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#hashtag" class="hashtag">해시태그</a></li>
										 	<li><a href="#">후기</a>
                                                <ul class="submenu">
                                                    <li><a href="${pageContext.request.contextPath}/getActivityReviewList">체험</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/getAccomReviewList">숙소</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">고객지원</a>
                                                <ul class="submenu">
                                                    <li><a href="${pageContext.request.contextPath}/noticeList">공지사항</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/qnaList">Q&A</a></li>
                                                </ul>
                                            </li> 
                                           	
                                           	<c:choose>
                                           		<c:when test="${empty loginMember}">
                                           			<li><a href="${pageContext.request.contextPath}/login"><i class="ti-user">사용자</i></a>
			                                            <ul class="submenu">
			                                            	<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
			                                                <li><a href="${pageContext.request.contextPath}/addMember">회원가입</a></li>
			                                            </ul>
		                                            </li>
                                           		</c:when>
                                           		
                                           		<c:when test="${loginMember.getMemberLevel() == 0}">
                                           			<li><a href="${pageContext.request.contextPath}/member/myPage"><i class="ti-user">${loginMember.getMemberNickname()}</i></a>
			                                           	<ul class="submenu">
				                                            <li><a href="${pageContext.request.contextPath}/member/myPage">마이페이지</a></li>
				                                            <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
			                                            </ul>
		                                            </li>
                                           		</c:when>
                                           		
                                           		<c:when test="${loginMember.getMemberLevel() == 1}">
                                           			<li><a href="${pageContext.request.contextPath}/member/myPage"><i class="ti-user">${loginMember.getMemberNickname()}</i></a>
			                                           	<ul class="submenu">
				                                            <li><a href="${pageContext.request.contextPath}/member/myPage">마이페이지</a></li>
				                                            <li><a href="${pageContext.request.contextPath}/host/hostIndex">사업자페이지</a></li>
				                                            <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
			                                            </ul>
		                                            </li>
                                           		</c:when>
                                           		
                                           		<c:when test="${loginMember.getMemberLevel() == 2}">
                                           			<li><a href="${pageContext.request.contextPath}/member/myPage"><i class="ti-user">${loginMember.getMemberNickname()}</i></a>
			                                           	<ul class="submenu">
				                                            <li><a href="${pageContext.request.contextPath}/member/myPage">마이페이지</a></li>
				                                            <li><a href="${pageContext.request.contextPath}/admin/adminIndex">관리자페이지</a></li>
				                                            <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
			                                            </ul>
		                                            </li>
                                           		</c:when>
                                           	
                                           	</c:choose>
                                            
                                    </nav>
                                    
									<div id="hashtag">
								    	<div>
											<c:import url="${pageContext.request.contextPath}/hashtag"></c:import>
								    	</div>
								    </div>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>
    
    <script type="text/javascript">
    // 해시태그 메뉴 클릭 시 해시태그 창 나타남
    $('.hashtag').click(function(){
		$('#hashtag').css('background-color','rgba(0, 0, 0, 0.5)');
		$('#hashtag').css('top','0%');
	    var top = $('#hashtag').css('top');
	});
    
    // 해시태그 창 클릭 시 해시태그 창 사라짐
    $('#hashtag').click(function(){
		$('#hashtag').css('background-color','rgba(0, 0, 0, 0.5)');
		$('#hashtag').css('top','-1500%');
	    var top = $('#hashtag').css('top');
	});
    </script>
    
</body>
</html>