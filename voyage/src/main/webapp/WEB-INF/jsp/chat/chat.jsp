<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/5.1.3/css/bootstrap.min.css">

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>	
	<button id="chatRoom" data-toggle="modal" data-target="#chatchatList">3</button>
	
	<!-- 
	<div style="width:450px; height:750px; background-color:#b2c7d9; float:left;">	
		<div style="width:450px; height:80px; background-color:#a9bdce;">
			<div style="float:left;"><img width="70px;" src="/image/단체.png"></div>
			<div style="float:left; color:#737272; font-weight:bold; margin-top:20px; font-size:16px;">단체톡</div>
		</div>
		<div style="width:450px; height:570px; overflow:auto;">
			<div id="msgList"></div>
		</div>
		<div style="width:450px; height:100px; background-color:white;">
			<input type="text" id="msgContent" style="border:0; width:85%; height:90px;" readonly="readonly">
			<button type="button" id="sendBtn" disabled="disabled" class="btn" style="background-color:#fae100; color:#391f1e;">전송</button>
		</div>
	</div>
	-->
	
	<!-- The Modal -->
	 <div class="modal" id="chatchatList">
	 	<div class="modal-dialog modal-dialog-scrollable">
	 		<div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
				<h2 class="modal-title">채팅</h2>
				<button type="button" id="disConnectBtn" class="close" data-dismiss="modal">×</button>
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
					<button type="button" id="disConnectBtn" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
			
			</div>
		</div>
	</div>

	<script>
	 $(document).ready(function(){
			// chatRoom을 누르면 목록 불러오는 부분
			$('#chatRoom').click(function(){
				$.ajax({
					url:'/chatRoom?chatRoom=3',
					type:'GET',
					datatype:'json',
					success:function(result){
						console.log('result : ', result);
						$('#chatList').empty(); // 먼저 출력된 목록이 있으면 지운다
						//$.each(result, function(index, item){
							for(i=0;i<=result.length;i++) {
								var myId = result[i].fromMemberId;
								if(myId == 'test') {
									$('#chatList').append('<tr>');
										$('#chatList').append('<td>'+result[i].chatContent+'</td>');
									$('#chatList').append('</tr>');
								} else if(myId != 'test'){
									$('#chatList').append('<tr>');
										$('#chatList').append('<td>'+result[i].memberNickname+':'+result[i].chatContent+'</td>');
									$('#chatList').append('</tr>');
								}
							}
						//});
					}
				});
			});
		});
	</script>
	
	<!-- 
	<script>
		let stompClient = null; // null : 접속X
		let msgCon = ''; // 메세지 저장할 변수
		
		// 페이지 접속 시 접속 = connection
		$(document).ready(function(){
			connect();
		});
		// 모달 close 시 접속 해
		$('#disConnectBtn').click(function(){
			disConnect();
		});
		// 메세지 전송을 위한 버튼
		$('#sendBtn').click(function(){
			sendMsg();
			// 전송후 textbox의 value 삭제
			$('#msgContent').prop('value', '');
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
			// 서버의 설정된 endPoint('/websocket')값과 동일하게 설정
			let sockjs = new SockJS('/websocket');
			stompClient = Stomp.over(sockjs);
			console.log('stompClient : ', stompClient);

			// 접속 -> 성공시 2번째 매개값인 콜백함수가 실행
			stompClient.connect({}, function(connectedMsg) {
				console.log('접속성공');
				console.log('connectedMsg : ', connectedMsg);
				// 서버측에서 메세지가 전달되면 -> 콜백으로 구현
				// .subscribe() : 소켓 서버로부터 특정 도착지의 데이터 구독
				stompClient.subscribe('/vovoChat', function(resp){
					console.log(resp);
					// stringify()로 저장한 json 문자열을 분석하여 자바스크립트 객체(배열)를 리턴하는 메서드 -> JSON.parse()
					let obj = JSON.parse(resp.body);
					// obj.memberName이 현재 접속한 memberName과 다를 경우 프로필이미지와 함께 왼쪽 말풍선에 대화 출력
					// 같을 경우에는 오른쪽 말풍선에 대화 출력
					if(obj.memberName != $('#memberName').val()) {
						msgCon = '<div style="margin:10px; clear:both;">';
						msgCon += '<img width="60px;" src="/image/' + obj.memberImg + '" style="float:left;">';
						msgCon += '<div style="float:left;">';
						msgCon += '<div style="font-weight: bold; margin:5px;">' + obj.memberName + '</div>';
						msgCon += '<div style="background-color: white; border-radius: 10%; margin:5px; padding:5px;">' + obj.msgContent + '</div>';
						msgCon += '</div>';
						msgCon += '</div>';
					} else {
						msgCon = '<div style="margin:10px; clear:both;">';
						msgCon += '<div style="float:right;">';
						msgCon += '<div style="background-color: #ffeb33; border-radius: 10%; margin:5px; padding:5px;">' + obj.msgContent + '</div>';
						msgCon += '</div>';
						msgCon += '</div>';
					}
					$('#msgList').append(msgCon);
				});
			});
		};
		
		// 서버 접속 취소
		function disConnect() {
			console.log('disConnect!');
			stompClient.disconnect();
			console.log(stompClient);
		};
		
		// 챗팅 메세지를 보내는 함수
		function sendMsg() {
			// 메세지가 없을 때 보내지 않음
			if($('#msgContent').val() =='') {
				return;
			}
			let msg = {};
			msg.chatRoom = $('#memberName').val();
			msg.toMemberId = ;
			msg.formMemberId = ;
			msg.chatContent = ;
			msg.createDate = ;
			msg.memberImg = $('#memberImg').val().replace(/C:\\fakepath\\/i, '');
			msg.msgContent = $('#msgContent').val();
			// 입력받은 데이터를 .stringify()를 이용해 string으로 바꾸어 로컬 스토리지에 저장
			let jsonStr = JSON.stringify(msg); 
			// 소켓 서버의 특정 도착지로 데이터 전송 -> .send()) : ('문자열형식 도착지', 헤더, 전송할 데이터)
			stompClient.send('/vovoChat', {}, jsonStr);
		};
	</script>
	
	 -->
</body>
</html>