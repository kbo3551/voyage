<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="assets/css/hashtag.css">
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
                                            <li><button class="hashtag btn" style="color: rgba(190,240,80); background-color: rgba(255,255,255,0);">해시태그</button></li>
                                           	
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
                                           		
                                           		<c:when test="${loginMember.getMemberLevel() == 2 && empty adminSession}">
                                           			<li><a href="${pageContext.request.contextPath}/member/myPage"><i class="ti-user">${loginMember.getMemberNickname()}</i></a>
			                                           	<ul class="submenu">
				                                            <li><a href="${pageContext.request.contextPath}/member/myPage">마이페이지</a></li>
				                                            <li><a href="${pageContext.request.contextPath}/addAdmin">관리자회원가입</a></li>
				                                            <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
			                                            </ul>
		                                            </li>
                                           		</c:when>
                                           		
                                           		<c:when test="${loginMember.getMemberLevel() == 2 && !empty adminSession}">
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
                                </div>
                                <div id="hashtag">
                                    <div id="search__box">
                                        <div class="quest_box" >
                                            <div class="search-box">
                                                <div class="input-form">
                                                    <input type="text" id="word" onkeyup="search(this);" placeholder="해시태그를 입력해주세요">
                                                </div>
                                                <div class="search-form">
                                                    <button type="button" id="btn_search">Search</button>
                                                </div>
                                            </div>
                                            <ul id="hashtagList"></ul> <!-- hashtag 검색 제시어가 나타나는 영역 -->
                                        </div>
                                    </div>
                                    <div class="hashtag_body">
                                        <div>
                                            <c:import url="/hashtag"></c:import>
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
      $('.hashtag_body').css('background-color','rgba(0, 0, 0, 0.5)');
      $('.hashtag_body').css('top','0%');
      $('#search__box').css('top','152%');
   });
    
    // 해시태그 창 클릭 시 해시태그 창 사라짐
    $('.hashtag_body').click(function(){
      $('.hashtag_body').css('background-color','rgba(0, 0, 0, 0.5)');
      $('.hashtag_body').css('top','-1500%');
      $('#search__box').css('top','-1500%');
   });

    // 검색 제시어 이벤트
    function search(target){
       
       var word = target.value;
       var encodeWord = encodeURI(word);
       console.log(word);
       console.log(encodeWord);
       
    //start Ajax
    $.ajax({
        type : 'GET',
        dataType : 'json',
        url : "http://localhost/hashtagSearh?"
            + "searchKeyword="
            + word,
            error : function(err) {
                console.log("실행중 오류가 발생하였습니다.");
            },
            success : function(data) {
                console.log("data확인 : "+data);
                console.log("결과 갯수 : "+data.dataSearch.content.length);
                console.log("첫번째 결과 : "+data.dataSearch.content[0]);
                $("#hashtagList").empty();
                var checkWord = $("#word").val(); // 검색어 입력값
                console.log(data.dataSearch.content.length);
                if(checkWord.length > 0 && data.dataSearch.content.length > 0){
                    for (i = 0; i < data.dataSearch.content.length; i++) {
                    $("#hashtagList")
                        .append(
                                "<li class='hashtagList' value='"
                                + data.dataSearch.content[i].schoolName
                                + "' data-input='"
                                + data.dataSearch.content[i].schoolName
                                + ">"
                                + "<a href='javascript:void(0);'>"
                                + data.dataSearch.content[i].schoolName
                                + "</a>"
                                + "</li>");
                }
            } 
        } 
        });
        //end Ajax
    }
    </script>
    
</body>
</html>