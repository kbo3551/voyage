/**
 * banner.jsp
 */
 	// 해시태그 메뉴 클릭 시 해시태그 창 나타남
    $('.hashtag').click(function(){
		console.log(".hashtag 클릭");
	  	$('.hashtag_body').css('background-color','rgba(0, 0, 0, 0.5)');
	  	$('.hashtag_body').css('top','0%');
	  	$('#search__box').css('top','152%');
    });
    
    // 해시태그 창 클릭 시 해시태그 창 사라짐
    $('.hashtag_body').click(function(){
		$('.hashtag_body').css('background-color','rgba(0, 0, 0, 0.5)');
		$('.hashtag_body').css('top','-300000%');
		$('#search__box').css('top','-300000%');
    });


	       var donut = $('#hashtagSearchParam').val();
	       console.log("donut : "+donut);

	// 검색 제시어 이벤트
	    function search(target) {
	       
	       var word = target.value;
	       console.log(word); // 검색어 입력값
	       
		    // start Ajax
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
						$("#hashtagList").empty(); // 검색 전 제시어 비우기
		            	
						$(data).each(function(index, item){ // each : JSON의 반복문
							var checkWord = $("#word").val(); // 검색어 입력값 저장
							
							if(checkWord.length > 0) { // 검색어 입력값의 길이가 0보다 클 때만
								let result = '<li class="hashtagList_result"><a href="/hashtag?hashtag=';
								result += item.hashtag;
								result += '" id="';
								result +=item.hashtagNo;
								result += '">';
								result += item.hashtag;
								result += '</a></li>';
								$('#hashtagList').append(result);
							}
							
						});
		
		        	} 
		     });
		     // end Ajax
	    }
    
/**
 * hashtag.jsp
 */
//  해시태그 버튼을 나타낼 때 사용하는 이벤트
   let arr = [];
   for(let i=0; i<50; i++) {
      arr[i] = i+1; // 1~50
   }
   for(let i=0; i<10000; i++) {
      let temp = arr[0];
      let ranNum = Math.floor(Math.random()*50); // 0~50
      arr[0] = arr[ranNum];
      arr[ranNum] = temp;
   }
   var largeNum = arr.slice(25, 40);
   var smallNum = arr.slice(10, 20);
   
   // larg Button
   var idL0 = 'hashtag' + largeNum[0];
   var idL1 = 'hashtag' + largeNum[1];
   var idL2 = 'hashtag' + largeNum[2];
   var idL3 = 'hashtag' + largeNum[3];
   var idL4 = 'hashtag' + largeNum[4];
   var idL5 = 'hashtag' + largeNum[5];
   var idL6 = 'hashtag' + largeNum[6];
   var idL7 = 'hashtag' + largeNum[7];
   var idL8 = 'hashtag' + largeNum[8];
   var idL9 = 'hashtag' + largeNum[9];
   var idL10 = 'hashtag' + largeNum[10];
   var idL11 = 'hashtag' + largeNum[11];
   var idL12 = 'hashtag' + largeNum[12];
   var idL13 = 'hashtag' + largeNum[13];
   var idL14 = 'hashtag' + largeNum[14];
   
   document.getElementById(idL0).style.fontSize = '1.5em';
   document.getElementById(idL0).style.padding = '1.8em';
   document.getElementById(idL0).style.borderRadius = '1.8em';
   document.getElementById(idL0).style.backgroundColor = 'rgba(249, 52, 50)';
   
   document.getElementById(idL1).style.fontSize = '1.5em';
   document.getElementById(idL1).style.padding = '1.8em';
   document.getElementById(idL1).style.borderRadius = '1.8em';
   document.getElementById(idL1).style.backgroundColor = 'rgba(249, 52, 50)';
   
   document.getElementById(idL2).style.fontSize = '1.5em';
   document.getElementById(idL2).style.padding = '1.8em';
   document.getElementById(idL2).style.borderRadius = '1.8em';
   document.getElementById(idL2).style.backgroundColor = 'rgba(249, 52, 50)';
   
   document.getElementById(idL3).style.fontSize = '1.5em';
   document.getElementById(idL3).style.padding = '1.8em';
   document.getElementById(idL3).style.borderRadius = '1.8em';
   document.getElementById(idL3).style.backgroundColor = 'rgba(249, 52, 50)';
   
   document.getElementById(idL4).style.fontSize = '1.5em';
   document.getElementById(idL4).style.padding = '1.8em';
   document.getElementById(idL4).style.borderRadius = '1.8em';
   document.getElementById(idL4).style.backgroundColor = 'rgba(249, 52, 50)';
   
   document.getElementById(idL5).style.fontSize = '1.5em';
   document.getElementById(idL5).style.padding = '1.8em';
   document.getElementById(idL5).style.borderRadius = '1.8em';
   
   document.getElementById(idL6).style.fontSize = '1.5em';
   document.getElementById(idL6).style.padding = '1.8em';
   document.getElementById(idL6).style.borderRadius = '1.8em';
   
   document.getElementById(idL7).style.fontSize = '1.5em';
   document.getElementById(idL7).style.padding = '1.8em';
   document.getElementById(idL7).style.borderRadius = '1.8em';
   
   document.getElementById(idL8).style.fontSize = '1.5em';
   document.getElementById(idL8).style.padding = '1.8em';
   document.getElementById(idL8).style.borderRadius = '1.8em';
   
   document.getElementById(idL9).style.fontSize = '1.5em';
   document.getElementById(idL9).style.padding = '1.8em';
   document.getElementById(idL9).style.borderRadius = '1.8em';
   
   document.getElementById(idL10).style.fontSize = '1.5em';
   document.getElementById(idL10).style.padding = '1.8em';
   document.getElementById(idL10).style.borderRadius = '1.8em';
   
   document.getElementById(idL11).style.fontSize = '1.5em';
   document.getElementById(idL11).style.padding = '1.8em';
   document.getElementById(idL11).style.borderRadius = '1.8em';
   
   document.getElementById(idL12).style.fontSize = '1.5em';
   document.getElementById(idL12).style.padding = '1.8em';
   document.getElementById(idL12).style.borderRadius = '1.8em';
   
   document.getElementById(idL13).style.fontSize = '1.5em';
   document.getElementById(idL13).style.padding = '1.8em';
   document.getElementById(idL13).style.borderRadius = '1.8em';
   
   document.getElementById(idL14).style.fontSize = '1.5em';
   document.getElementById(idL14).style.padding = '1.8em';
   document.getElementById(idL14).style.borderRadius = '1.8em';
   
   // small Button
   var idS0 = 'hashtag' + smallNum[0];
   var idS1 = 'hashtag' + smallNum[1];
   var idS2 = 'hashtag' + smallNum[2];
   var idS3 = 'hashtag' + smallNum[3];
   var idS4 = 'hashtag' + smallNum[4];
   var idS5 = 'hashtag' + smallNum[5];
   var idS6 = 'hashtag' + smallNum[6];
   var idS7 = 'hashtag' + smallNum[7];
   var idS8 = 'hashtag' + smallNum[8];
   var idS9 = 'hashtag' + smallNum[9];
   
   document.getElementById(idS0).style.fontSize = '0.8em';
   document.getElementById(idS0).style.padding = '1.3em';
   document.getElementById(idS0).style.borderRadius = '1.3em';
   document.getElementById(idS0).style.backgroundColor = 'rgba(249, 52, 50)';
   
   document.getElementById(idS1).style.fontSize = '0.8em';
   document.getElementById(idS1).style.padding = '1.3em';
   document.getElementById(idS1).style.borderRadius = '1.3em';
   document.getElementById(idS1).style.backgroundColor = 'rgba(249, 52, 50)';
   
   document.getElementById(idS2).style.fontSize = '0.8em';
   document.getElementById(idS2).style.padding = '1.3em';
   document.getElementById(idS2).style.borderRadius = '1.3em';
   document.getElementById(idS2).style.backgroundColor = 'rgba(249, 52, 50)';
   
   document.getElementById(idS3).style.fontSize = '0.8em';
   document.getElementById(idS3).style.padding = '1.3em';
   document.getElementById(idS3).style.borderRadius = '1.3em';
   
   document.getElementById(idS4).style.fontSize = '0.8em';
   document.getElementById(idS4).style.padding = '1.3em';
   document.getElementById(idS4).style.borderRadius = '1.3em';
   
   document.getElementById(idS5).style.fontSize = '0.8em';
   document.getElementById(idS5).style.padding = '1.3em';
   document.getElementById(idS5).style.borderRadius = '1.3em';
   
   document.getElementById(idS6).style.fontSize = '0.8em';
   document.getElementById(idS6).style.padding = '1.3em';
   document.getElementById(idS6).style.borderRadius = '1.3em';
   
   document.getElementById(idS7).style.fontSize = '0.8em';
   document.getElementById(idS7).style.padding = '1.3em';
   document.getElementById(idS7).style.borderRadius = '1.3em';
   
   document.getElementById(idS8).style.fontSize = '0.8em';
   document.getElementById(idS8).style.padding = '1.3em';
   document.getElementById(idS8).style.borderRadius = '1.3em';
   
   document.getElementById(idS9).style.fontSize = '0.8em';
   document.getElementById(idS9).style.padding = '1.3em';
   document.getElementById(idS9).style.borderRadius = '1.3em';