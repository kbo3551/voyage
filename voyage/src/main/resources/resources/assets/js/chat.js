/**
 * chat
 */
 
 $(document).ready(function(){
	// chatBtn을 누르면 목록 불러오는 부분
	$('#chatBtn').click(function(){
		$.ajax({
			url:'/chat',
			type:'GET',
			datatype:'json',
			success:function(result){
				console.log('result : ', result);
				$('#chatList').empty(); // 먼저 출력된 목록이 있으면 지운다
				$.each(result, function(index, item){
					for(i=0;i<=item.length;i++) {
						$('#chatList').append('<tr>');
							$('#chatList').append('<td>'+item[i].member.memberNickname+':'+item[i].chatContent+'</td>');
						$('#chatList').append('</tr>');
					};
				});
			}
		});
	});
});
