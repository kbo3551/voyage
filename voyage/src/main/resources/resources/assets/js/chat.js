/**
 * chat
 */

 // [사용자] 나의 채팅 목록 조회
 $(document).ready(function(){
	
   // chatBtn을 누르면 목록 불러오는 부분
   $('#chatBtn').click(function(){
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
                  $('#chatList').append('<tr>');
                     $('#chatList').append('<td>'+item[i].member.memberNickname+':'+item[i].chatContent+','+item[i].chatRead+'</td>');
                     $('#chatList').append('<button id="chatRoomBtn" value="'+item[i].chatRoom+'" data-toggle="modal" data-target="#myModal2">입장</button>');
                  $('#chatList').append('</tr>');
               };
            });
         }
      });
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