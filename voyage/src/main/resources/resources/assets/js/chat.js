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
         success:function(result){
            console.log('result : ', result);
            console.log('출력 test : ', result.chatList[0].chatContent);
            console.log('출력 test : ', result.chatList[0].member.memberNickname);
            $('#chatList').empty(); // 먼저 출력된 목록이 있으면 지운다
            $.each(result, function(index, item){
               console.log('출력 test : ', index);
               console.log('출력 test : ', item);
               for(i=0;i<item.length;i++) {
                  $('#chatList').append('<tr>');
                     $('#chatList').append('<td>'+item[i].member.memberNickname+':'+item[i].chatContent+'</td>');
                  $('#chatList').append('</tr>');
               };
            });
         }
      });
   });
});

$(document).ready(function(){
	// chatRoom을 누르면 목록 불러오는 부분
	$('#chatRoom').click(function(){
		$.ajax({
			url:'/voyage/chatRoom?chatRoom=3',
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
