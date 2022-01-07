/**
 * chat
 */

// 2초 간격으로 메시지를 보여줌
//var timerId = setInterval(() => alert('째깍'), 2000);
// 5초 후에 정지
//setTimeout(() => { clearInterval(timerId); alert('정지'); }, 5000);

// ajax를 하나의 함수로 선언 : chatRoomListF
function chatRoomListF(){
	$.ajax({
         url:'/voyage/chatRoomList',
         type:'GET',
         datatype:'json',
         async: false, //ajax 옵션에 async 옵션이 있다. 서버로부터 값이 오지 않으면 잠시 다음으로 넘어가지 않는것이다.
         success:function(result){
            console.log('result : ', result);
            $('#chatList').empty(); // 먼저 출력된 목록이 있으면 지운다
            $.each(result, function(index, item){
               console.log('출력 test : ', index);
               console.log('출력 test : ', item);
               for(i=0;i<item.length;i++) {
					if(item[i].chatRead == 1) {
	                  $('#chatList').append('<tr>');
	                     $('#chatList').append('<td class="w-100"><i class="far fa-envelope" style="color:red"></i> <span style="font-weight:bold;">'+item[i].member.memberNickname+'</span><div>'+item[i].chatContent+'</div>');
	                     $('#chatList').append('<button class="btn" style="width:30px;" id="chatRoomBtn" value="'+item[i].chatRoom+'" data-toggle="modal" data-target="#myModal2" data-backdrop="static" data-keyboard="false">입장</button>');
	                     $('#chatList').append('</td>');
	                  $('#chatList').append('</tr>');
	                 } else {
					  $('#chatList').append('<tr>');
	                     $('#chatList').append('<td class="w-100"><i class="far fa-envelope-open" style="color:#808080;"></i> <span style="font-weight:bold; color:#808080;">'+item[i].member.memberNickname+'</span><div style="color:#808080;">'+item[i].chatContent+'</div>');
	                     $('#chatList').append('<button class="btn" style="width:30px;" id="chatRoomBtn" value="'+item[i].chatRoom+'" data-toggle="modal" data-target="#myModal2" data-backdrop="static" data-keyboard="false">입장</button>');
	                     $('#chatList').append('</td>');
	                  $('#chatList').append('</tr>');
					}
               };
            });
         }
      });
} 

 // [사용자] 나의 채팅 목록 조회
 $(document).ready(function(){
	
	// 페이지 로딩시 새로운 채팅이 있을 시에는 채팅 글씨 색 red로 변경
	$.ajax({
         url:'/voyage/chatRoomList',
         type:'GET',
         datatype:'json',
         async: false, //ajax 옵션에 async 옵션이 있다. 서버로부터 값이 오지 않으면 잠시 다음으로 넘어가지 않는것이다.
         success:function(result){
            $('#chatList').empty(); // 먼저 출력된 목록이 있으면 지운다
            $.each(result, function(index, item){
               for(i=0;i<item.length;i++) {
					if(item[i].chatRead == 1) {
						console.log('새로운 메세지가 있습니다');
	                  	$('#chatBtn').css('color','red');
	                 }
               };
            });
         }
      });
	
   // chatBtn을 누르면 목록 불러오는 부분
   $('#chatBtn').click(function(){
		chatRoomListF();
   });

	// chatRoomBtn을 누르면 목록 불러오는 부분
	$('body').on('click', '#chatRoomBtn', function() {
	/* 브라우저에서 html문서 생성(이때 버튼도 추가) -> 제이쿼리에서 버튼에 이벤트 추가 -> append 로 버튼추가
	의 순서로 실행되어서 새롭게 추가된 버튼에 이벤트가 추가되지 않아서 발생하는 문제입니다.
	$(변하지않는요소).on(click, 변하지않는요소안의 변하는요소, function..)  의 형태로 변하지않는 상위요소에 이벤트를 걸어주는 방식을 보통사용합니다. */
	//$('#chatRoomBtn').click(function(){ -> $('body').on('click', '#chatRoomBtn', function() {
	//console.log('chatRoom : ',$("body").on('button[id="chatRommBtn"]').attr("name"));
	    // 스크롤을 가장 아래로 가게 함 
		$('#scrollmodalBody').scrollTop($('#scrollmodalBody')[0].scrollHeight);
	    
	    // 2초에 한번씩 채팅 목록 불러오기(실시간 알림 전용)
   		timerId = setInterval(function(){
			chatRoomListF();
		},2000);
		
		// closeChatRoom을 누르면 채팅 목록을 불러오지 않 부분
		$('body').on('click', '#closeChatRoom', function() {
			clearTimeout(timerId);
		});
	     
		// 세션 값에 저장된 (로그인한) Id
		var loginId = $('#loginId').val();
		console.log('loginId : ',loginId);
		
		// 접속하려는 채팅방의 번호 
		var chatRoomNo = $(this).val();
		console.log('chatRoomNo : ',chatRoomNo);
	
		$.ajax({
			url:'/voyage/chatRoom?chatRoom='+chatRoomNo,
			type:'GET',
			datatype:'json',
			async: false, //ajax 옵션에 async 옵션이 있다. 서버로부터 값이 오지 않으면 잠시 다음으로 넘어가지 않는것이다.
			success:function(result){
				console.log('result : ', result);
				$('#chatMsgList').empty(); // 먼저 출력된 목록이 있으면 지운다
				$.each(result, function(index, item){
					console.log('출력 test : ', index);
           			console.log('출력 test : ', item);
					// 로그인된 아이디와 보낸 아이디가 같다면 닉네임을 출력하지 않음 
					var selmsgCon = ''; // 메세지 저장할 변수
					if(loginId == item.fromMemberId) {
						selmsgCon = '<div id="chatCon" style="margin:10px; clear:both;">';
						selmsgCon += '<div style="float:right;">';
						selmsgCon += '<div style="background-color: #ffeb33; border-radius: 10%; margin:5px; padding:5px;">' + item.chatContent + '</div>';
						selmsgCon += '</div>';
						selmsgCon += '</div>';
						// 보내는 사람 기준의 받는 사람 id 저장 
						$('#toMemberId').val(item.toMemberId);
					} else if(loginId != item.fromMemberId){
						selmsgCon = '<div id="chatCon" style="margin:10px; clear:both;">';
						selmsgCon += '<div style="float:left;">';
						selmsgCon += '<div style="font-weight: bold; margin:5px;">' + item.memberNickname + '</div>';
						selmsgCon += '<div style="background-color: white; border-radius: 10%; margin:5px; padding:5px;">' + item.chatContent + '</div>';
						selmsgCon += '</div>';
						selmsgCon += '</div>';
						// 보내는 사람 기준의 받는 사람 id 저장 
						$('#toMemberId').val(item.fromMemberId);
					}
					$('#chatMsgList').append(selmsgCon);
					// 메세지 추가 후 스크롤을 가장 아래로 가게 함 
					$('#scrollmodalBody').scrollTop($('#scrollmodalBody')[0].scrollHeight);
				});
				$('#chatRoomForm').val(chatRoomNo);
			}
		});
		// 스크롤을 가장 아래로 가게 함 
		$('#scrollmodalBody').scrollTop($('#scrollmodalBody')[0].scrollHeight);
	});

	
	// 모달 위에 모달을 출력하게 해주는 스크립트 코드 
	$('#openBtn').click(function() {
		$('#myModal').modal({
			show: true
		})
	});
	$(document).on({
		'show.bs.modal': function() {
			var zIndex = 1040 + (10 * $('.modal:visible').length);
			$(this).css('z-index', zIndex);
			setTimeout(function() {
	        	$('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
	      	}, 0);
	    },
	    'hidden.bs.modal': function() {
	    	if ($('.modal:visible').length > 0) {
	        	// restore the modal-open class to the body element, so that scrolling works
	        	// properly after de-stacking a modal.
	        	setTimeout(function() {
	          		$(document.body).addClass('modal-open');
	          	}, 0);
			}
		}
	}, '.modal');
	
});








// webSocket,STOMP 사용해서 채팅프로그램 구현하기 
let stompClient = null; // null : 접속X
let msgCon = ''; // 메세지 저장할 변수

// 로그인 시 접속 = connection / 로그아웃 시 접속 해
$(document).ready(function(){
		if(loginMember != ""){
			connect();
		} else {
			disConnect();
		}
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
			
			if(obj.memberId == $('#fromMemberId').val()) {
				msgCon = '<div id="chatCon" style="margin:10px; clear:both;">';
				msgCon += '<div style="float:left;">';
				msgCon += '<div style="font-weight: bold; margin:5px;">' + obj.memberNickname + '</div>';
				msgCon += '<div style="background-color: white; border-radius: 10%; margin:5px; padding:5px;">' + obj.chatContent + '</div>';
				msgCon += '</div>';
				msgCon += '</div>';
			} else {
				msgCon = '<div id="chatCon" style="margin:10px; clear:both;">';
				msgCon += '<div style="float:right;">';
				msgCon += '<div style="background-color: #ffeb33; border-radius: 10%; margin:5px; padding:5px;">' + obj.chatContent + '</div>';
				msgCon += '</div>';
				msgCon += '</div>';
			}
			$('#chatMsgList').append(msgCon);
			// 메세지 추가 후 스크롤을 가장 아래로 가게 함 
			$('#scrollmodalBody').scrollTop($('#scrollmodalBody')[0].scrollHeight);
		});
    });
};

function disConnect() {
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