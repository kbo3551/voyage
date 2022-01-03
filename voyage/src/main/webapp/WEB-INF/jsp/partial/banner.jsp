<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<title>배너</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="${contextPath}/assets/css/hashtag.css">
</head>
<style>
	.btn:before {
		background: rgba(190,255,255,0.2);
	}
</style>
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
                                  <a href="${contextPath}/index" title="여행을 떠나는 세대"><img src="${contextPath}/assets/img/logo/logo.png" alt="logo"></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-8">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">                                                                                                                                     
                                            <li><a href="${contextPath}/index">메인</a></li>
                                            <li><a href="${contextPath}/about">설명</a></li>
                                            <li><a href="${contextPath}/setProductCategory">예약</a>
                                                <ul class="submenu">
                                                    <li><a href="${contextPath}/getActivityProductList">체험</a></li>
                                                    <li><a href="${contextPath}/getAccomProductList">숙소</a></li>
                                                </ul>
                                            </li>
										 	<li><a href="${contextPath}/setReviewCategory">후기</a>
                                                <ul class="submenu">
                                                    <li><a href="${contextPath}/getActivityReviewList">체험</a></li>
                                                    <li><a href="${contextPath}/getAccomReviewList">숙소</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">고객지원</a>
                                                <ul class="submenu">
                                                    <li><a href="${contextPath}/noticeList">공지사항</a></li>
                                                    <li><a href="${contextPath}/qnaList">Q&A</a></li>
                                                    <c:if test="${loginMember.getMemberLevel() == 0}">
                                                    	<!-- 필터를 먹여야하기 때문에 member에 집어넣음 -->
                                                    	<li><a href="${contextPath}/member/requestHost">사업자신청</a></li>
                                                    </c:if>
                                                </ul>
                                            </li> 
                                            <li><button class="btn hashtag" style="color: rgba(190,240,80); background-color: rgba(255,255,255,0);">해시태그</button></li>
                                           	
                                           	
                                           	<li><a href="#">📢</a>
                                           		<ul class="submenu">
                                           			<li><a href="#">🤔</a></li>
                                           		</ul>
                                           	</li>
                                           	
                                           	<c:choose>
                                           		<c:when test="${empty loginMember}">
                                           			<li><a href="${contextPath}/login"><i class="ti-user">사용자</i></a>
			                                            <ul class="submenu">
			                                            	<li><a href="${contextPath}/login">로그인</a></li>
			                                                <li><a href="${contextPath}/addMember">회원가입</a></li>
			                                            </ul>
		                                            </li>
                                           		</c:when>
                                           		
                                           		<c:when test="${loginMember.getMemberLevel() == 0}">
                                           			<li><a href="${contextPath}/member/selectMyProfile"><i class="ti-user">${loginMember.getMemberNickname()}</i></a>
			                                           	<ul class="submenu">
				                                            <li><a href="${contextPath}/member/selectMyProfile">회원정보</a></li>
				                                            <li><a href="${contextPath}/member/selectMyOrderList">주문목록</a></li>
				                                            <li><a href="${contextPath}/member/selectMyInterest">관심상품</a></li>
				                                            <li><a href="${contextPath}/member/coupon">쿠폰</a></li>
				                                            <li><a id="chatBtn" data-toggle="modal" data-target="#chatMain">채팅</a></li>
				                                            <li><a href="${contextPath}/logout">로그아웃</a></li>
			                                            </ul>
		                                            </li>
                                           		</c:when>
                                           		
                                           		<c:when test="${loginMember.getMemberLevel() == 1}">
                                           			<li><a href="${contextPath}/member/selectMyProfile"><i class="ti-user">${loginMember.getMemberNickname()}</i></a>
			                                           	<ul class="submenu">
			                                           		<li><a href="${contextPath}/host/hostIndex">사업자페이지</a></li>
				                                            <li><a href="${contextPath}/member/selectMyProfile">회원정보</a></li>
				                                            <li><a href="${contextPath}/member/selectMyOrderList">주문목록</a></li>
				                                            <li><a href="${contextPath}/member/selectMyInterest">관심상품</a></li>
				                                            <li><a href="${contextPath}/member/coupon">쿠폰</a></li>
				                                            <li><a id="chatBtn" data-toggle="modal" data-target="#myModal">채팅</a></li>
				                                            <li><a href="${contextPath}/logout">로그아웃</a></li>
			                                            </ul>
		                                            </li>
                                           		</c:when>
                                           		
                                           		<c:when test="${loginMember.getMemberLevel() == 2 && empty adminSession}">
                                           			<li><a href="${contextPath}/member/selectMyProfile"><i class="ti-user">${loginMember.getMemberNickname()}</i></a>
			                                           	<ul class="submenu">
			                                           		<li><a href="${contextPath}/addAdmin">관리자회원가입</a></li>
				                                            <li><a href="${contextPath}/member/selectMyProfile">회원정보</a></li>
				                                            <li><a href="${contextPath}/member/selectMyOrderList">주문목록</a></li>
				                                            <li><a href="${contextPath}/member/selectMyInterest">관심상품</a></li>
				                                            <li><a href="${contextPath}/member/coupon">쿠폰</a></li>
				                                            <li><a id="chatBtn" data-toggle="modal" data-target="#chatMain">채팅</a></li>
				                                            <li><a href="${contextPath}/logout">로그아웃</a></li>
			                                            </ul>
		                                            </li>
                                           		</c:when>
                                           		
                                           		<c:when test="${loginMember.getMemberLevel() == 2 && !empty adminSession}">
                                           			<li><a href="${contextPath}/member/selectMyProfile"><i class="ti-user">${loginMember.getMemberNickname()}</i></a>
			                                           	<ul class="submenu">
			                                           		<li><a href="${contextPath}/admin/adminIndex">관리자페이지</a></li>
				                                            <li><a href="${contextPath}/member/selectMyProfile">회원정보</a></li>
				                                            <li><a href="${contextPath}/member/selectMyOrderList">주문목록</a></li>
				                                            <li><a href="${contextPath}/member/selectMyInterest">관심상품</a></li>
				                                            <li><a href="${contextPath}/member/coupon">쿠폰</a></li>
				                                            <li><a id="chatBtn" data-toggle="modal" data-target="#chatMain">채팅</a></li>
				                                            <li><a href="${contextPath}/logout">로그아웃</a></li>
			                                            </ul>
		                                            </li>
                                           		</c:when>
                                           	</c:choose>
                                    	</ul>
                                    </nav>
                                </div>
                                <div id="hashtag">
                                    <div id="search__box">
                                        <div class="quest_box" >
                                        	<form action="/getAccomProductList" method="post">
	                                            <div class="search-box">
	                                                <div class="input-form">
	                                                    <input type="text" name="searchWord" id="word" onkeyup="search(this);" placeholder="해시태그를 입력해주세요">
	                                                </div>
	                                                <div class="hashtag-search-form">
	                                                    <button type="submit" id="btn_search">Search</button>
	                            						<button id="hashtagSearchParam" value="도넛맨 미안해 마이크 못줘서 미안해">돌 맞은 개구리</button>
	                                                </div>
	                                            </div>
	                                        </form>
                                            <ul id="hashtagList"></ul> <!-- hashtag 검색 제시어가 나타나는 영역 -->
                                        </div>
                                    </div>
                                    <div class="hashtag_body">
                                        <div>
                                            <c:import url="/hashtag">
<%--                                             	<c:param name="hashtag" id="hashtag_result_param" value="hashtag"></c:param> --%>
                                            </c:import>
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
    
	<!-- The Modal : 채팅방 목록 -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h2 class="modal-title">채팅</h2>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body">
					<div>
						<table class="table table-hover">
							<tbody id="chatList">
							</tbody>
						</table>
					</div>
		
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<!-- The Modal : 1:1 채팅방 -->
	<!-- 채팅방에 접근하기 위한 데이터 저장 용 input  -->
	<input type="hidden" id="loginId" value="${loginMember.memberId}">
	
	<div class="modal fade" id="myModal2">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h2 class="modal-title">채팅</h2>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body">
					<div>
						<table class="table table-hover">
							<tbody id="chatRoomList">
							</tbody>
						</table>
					</div>
		
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</div>
				
			</div>
		</div>
	</div>
    
	<script type="text/javascript">
	</script>
  
  	<script src="${contextPath}/assets/js/chat.js"></script>
  	<script src="${contextPath}/assets/js/hashtag.js"></script>
</body>
</html>