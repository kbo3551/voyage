/*
$(document).ready(function(){
    $("input[type=number]").bind('keyup input', function(){
        alert("숫자증가");
        console.log("숫자증가");
    });
    
    $("input[type=number]").bind('keydown input', function(){
        alert("숫자감소");
        console.log("숫자감소");
    });
});
*/

$(document).ready(function(){

    var roomPrice = $('#accomRoomPrice').val();
    var accomRoomStan = $('#accomRoomStan').val();
    
    $('input[name=accomAmount]').attr('value', accomRoomStan);
    
    // 인원추가
    $("#accomUsePerson").on("keyup keydown change", function(event){
    	$('#total').empty();
    
        var personNum = $('#accomUsePerson').val();
        var personPrice = 10000;
        var usePerson = Number(personNum-accomRoomStan);
        pTotal = Number(roomPrice) + (usePerson*personPrice);

        console.log("personNum"+personNum);
        console.log("personPrice"+personPrice);
        console.log("pTotal"+pTotal);
        
        $('#total').text(pTotal);
        //$('input[name=accomUsePerson]').attr('value', '');
        $('input[name=accomUsePerson]').attr('value', personNum);
        
        $('input[name=accomAmount]').attr('value', pTotal);
    });

/*
	물품 금액 추가 ..
	
    var itemLast = $('#itemLast').val();
    console.log("itemLast"+itemLast);

    var itemNum = [];
    var itemPrice = [];
    var itemTotal = [];

    for(var i=1; i<=itemLast; i++){
        itemNum[i] = $('#accomRoomItemQnt'+i).val();
        console.log("itemNum["+i+"] !!!!!!!!!!!"+itemNum[i]);
        console.log("test"+$('#accomRoomItemQnt1').val());

        //물품추가
        $('#accomRoomItemQnt'+i).on("keyup keydown change",function(event){
            itemNum[i] = $('#accomRoomItemQnt'+ i );
            var test = itemNum[i].val();

            var test = $('#accomRoomItemQnt1').val();
            console.log("test" + test);

            //itemPrice[i] = $('#accomRoomItemPrice'+ i ).val();
            //itemTotal[i] = itemNum[i]*itemPrice[i];

            //console.log("itemNum["+i+"]"+itemNum[i]);
            //console.log("itemPrice["+i+"]"+itemPrice[i]);
            //console.log("itemTotal["+i+"]"+itemTotal[i]);
        });

    }   
*/
   /*
   $('#accomSubmit').click(function(){
   	$('input[name=accoAmount]').attr('value',pTotal);   
   });
   */
});