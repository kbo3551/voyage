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
<script src="${contextPath}/webjars/jquery/jquery.min.js"></script>
<script src="${contextPath}/webjars/sockjs-client/sockjs.min.js"></script>
<script src="${contextPath}/webjars/stomp-websocket/stomp.min.js"></script>
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
				                                            <li><a id="chatBtn" data-toggle="modal" data-target="#myModal">채팅</a></li>
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
				                                            <li><a id="chatBtn" data-toggle="modal" data-target="#myModal">채팅</a></li>
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
				                                            <li><a id="chatBtn" data-toggle="modal" data-target="#myModal">채팅</a></li>
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
					<button type="button" class="close" id="closeChat" data-dismiss="modal">×</button>
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
						<button type="button" class="btn btn-danger" id="closeChat" data-dismiss="modal">Close</button>
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
						<form action="${contextPath}/chat" method="post" id="chatForm" style="width: 100%">
							<div class="input-group mb-3">
								<input type="hidden" id="fromMemberId" name="fromMemberId" value="${loginMember.memberId}">
								<input type="hidden" id="chatRoomForm" name="chatRoom" value="">
								<input type="hidden" id="toMemberId" name="toMemberId" value="">
								<textarea class="form-control" id="chatContentForm" name="chatContent" placeholder="채팅을 입력하세요"></textarea>
								<div class="input-group-append">
									<button class="btn btn-primary" id="sendBtn" type="button">SEND</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				
			</div>
		</div>
	</div>
    
	<script type="text/javascript">
	</script>
  
  	<script src="${contextPath}/assets/js/chat.js"></script>
  	<script src="${contextPath}/assets/js/hashtag.js"></script>
  	
  	
  	<!-- webSocket,STOMP 사용해서 채팅프로그램 구현하기  -->
  	<script type="text/javascript">
  	let stompClient = null; // null : 접속X
	let msgCon = ''; // 메세지 저장할 변수
	
	// 페이지 접속 시 접속 = connection
	$('#chatBtn').click(function(){
		connect();
	});
	
	// 모달 close 시 접속 해
	$('#closeChat').click(function(){
		disConnect();
	});
	// 메세지 전송을 위한 버튼
	$('#sendBtn').click(function(){
		sendChat();
		// 전송후 textbox의 value 삭제
		$('#chatContentForm').prop('value', '');
	});
	// 엔터키를 클릭했을 때 메세지 전송 버튼을 누르는 클릭이벤트 실행
	$(document).keypress(function(event){
		if(event.keyCode == '13') {
			$('#sendBtn').click();
		}
	});

	// 3개의 함수 : connect(), disConnect(), sendMsg()
	// 서버에 접속하는 함수
  	function connect() {
  		console.log('connect!');
  		
  		// 서버의 설정된 endPoint('/ws')값과 동일하게 설정
		let sockjs = new SockJS('/voyage/ws');
		stompClient = Stomp.over(sockjs);
		console.log('stompClient : ', stompClient);
  	  	
  		// 접속 -> 성공시 2번째 매개값인 콜백함수가 실행
  	    stompClient.connect({}, function (connectedMsg) {
  	      	console.log('접속성공');
			console.log('connectedMsg : ', connectedMsg);
			
			// 서버측에서 메세지가 전달되면 -> 콜백으로 구현
			// .subscribe() : 소켓 서버로부터 특정 도착지의 데이터 구독
			stompClient.subscribe('/vovoChatServer', function(resp){
				console.log(resp);
				
				// stringify()로 저장한 json 문자열을 분석하여 자바스크립트 객체(배열)를 리턴하는 메서드 -> JSON.parse()
				let obj = JSON.parse(resp.body);
				
				if(obj.memberId != $('#fromMemberId').val()) {
					msgCon = '<div style="margin:10px; clear:both;">';
					msgCon += '<div style="float:left;">';
					// msgCon += '<div style="font-weight: bold; margin:5px;">' + obj.memberName + '</div>';
					msgCon += '<div style="background-color: white; border-radius: 10%; margin:5px; padding:5px;">' + obj.chatContent + '</div>';
					msgCon += '</div>';
					msgCon += '</div>';
				} else {
					msgCon = '<div style="margin:10px; clear:both;">';
					msgCon += '<div style="float:right;">';
					msgCon += '<div style="background-color: #ffeb33; border-radius: 10%; margin:5px; padding:5px;">' + obj.chatContent + '</div>';
					msgCon += '</div>';
					msgCon += '</div>';
				}
				$('#chatRoomList').append(msgCon);
  	        });
  	    });
  	};

  	function disconnect() {
  		console.log('disConnect!');
		stompClient.disconnect();
		console.log(stompClient);
  	};
  	
 	// 챗팅 메세지를 보내는 함수
  	function sendChat() { //Message객체에 값 전달 
  		// 메세지가 없을 때 보내지 않음
		if($('#chatContentForm').val() =='') {
			return;
		}
		let chat = {};
		chat.chatRoom = $('#chatRoomForm').val();
		chat.toMemberId = $('#toMemberId').val();
		chat.fromMemberId = $('#loginId').val();
		chat.chatContent = $('#chatContentForm').val();
		// 입력받은 데이터를 .stringify()를 이용해 string으로 바꾸어 로컬 스토리지에 저장
		let jsonStr = JSON.stringify(chat); 
		// 소켓 서버의 특정 도착지로 데이터 전송 -> .send()) : ('문자열형식 도착지', 헤더, 전송할 데이터)
		stompClient.send('/vovoChat', {}, jsonStr);
  	};
	</script>
</body>
</html>