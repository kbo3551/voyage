// addAccomBuilding 폼의 유효성 검사
$('#accomSubmit').click(function(){
	// 숙소_건물의 이미지 파일 유효성 검사
	let imgFile = $('#wizard-picture').val();
	let imgFile2 = $('#wizard-picture2').val();
	let imgFile3 = $('#wizard-picture3').val();
	let imgFile4 = $('#wizard-picture4').val();
	let fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
	let maxSize = 20 * 1024 * 1024;
	let fileSize;
	if ($('#wizard-picture').val() == '' && $('#wizard-picture2').val() == '' && $('#wizard-picture3').val() == '' && $('#wizard-picture4').val() == '') {
		if(!imgFile.match(fileForm) && !imgFile2.match(fileForm) && !imgFile3.match(fileForm) && !imgFile4.match(fileForm)) {
	    	alert("숙소 건물의 이미지 파일을 4개 업로드 해주세요!");
	        return;
	    } else if(fileSize = maxSize) {
	    	alert("파일 사이즈는 한 파일당 20MB까지 가능합니다!");
	        return;
	    }
	}
	
	// 숙소_건물의 기본 정보 유효성 검사
	if ($('#accomBuildingName').val() == '') {
		alert('숙소의 이름을 입력하세요!');
		return;
	}
	if ($('#accomBuildingDescription').val() == '') {
		alert('숙소의 설명글을 입력하세요!');
		return;
	}
	if ($('#accomBuildingPhone').val() == '') {
		alert('숙소의 전화번호를 입력하세요!');
		return;
	}
	
	// 숙소_건물의 주소 유효성 검사
	if ($('#postalCode').val() == '' || $('#roadAddress').val() == '') {
		alert('숙소의 주소를 입력하기 위해 우편번호 찾기를 진행해주세요!');
		return;
	}
	if ($('#addressDetail').val() == '') {
		alert('숙소의 주소를 상세주소도 입력하세요!');
		return;
	}
	
	// 숙소_건물의 시설 유효성 검사
	if ($('#accomBuildingFacilityName').val() == '') {
		alert('숙소의 시설을 입력하세요!');
		return;
	}
	
	// 숙소_건물의 추천장소 유효성 검사
	if ($('#accomBuildingSpotName').val() == '' ||  $('#accomBuildingSpotCategory').val() == '' || $('#accomBuildingSpotDescription').val() == '') {
		alert('추천장소의 입력 부분을 전부 입력하세요!');
		return;
	}
	if ($('#spotPostalCode').val() == '' ||  $('#spotRoadAddress').val() == '' || $('#spotAddressDetail').val() == '') {
		alert('추천장소의 주소를 입력하세요!');
		return;
	}
	
	// 숙소_건물의 해시태그 유효성 검사
	if ($('#inputHashtag').val() == '') {
		alert('숙소의 해시태그를 입력하세요!');
		return;
	}
	
	// 숙소_건물 등록시 약관 확인 check 검사
	let checkAccept = $('.icheckbox_square-yellow:checked'); // . 클래스속성으로 부르면 리턴값은 배열
	if (checkAccept.length == 0) {
		alert('약관과 수수료 등을 확인해주세요!');
		return;
	}

	$('#accomBuildingForm').submit();
});



// addAccomRoom 폼의 유효성 검사
$('#roomSubmit').click(function(){
	// 숙소_객실의 이미지 파일 유효성 검사
	let imgFile = $('#wizard-picture').val();
	let imgFile2 = $('#wizard-picture2').val();
	let imgFile3 = $('#wizard-picture3').val();
	let imgFile4 = $('#wizard-picture4').val();
	let fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
	let maxSize = 20 * 1024 * 1024;
	let fileSize;
	if ($('#wizard-picture').val() == '' && $('#wizard-picture2').val() == '' && $('#wizard-picture3').val() == '' && $('#wizard-picture4').val() == '') {
		if(!imgFile.match(fileForm) && !imgFile2.match(fileForm) && !imgFile3.match(fileForm) && !imgFile4.match(fileForm)) {
	    	alert("숙소 건물의 이미지 파일을 4개 업로드 해주세요!");
	        return;
	    } else if(fileSize = maxSize) {
	    	alert("파일 사이즈는 한 파일당 20MB까지 가능합니다!");
	        return;
	    }
	}
	
	// 숙소_객실의 기본 정보 유효성 검사
	if ($('#accomRoomName').val() == '') {
		alert('객실의 이름을 입력하세요!');
		return;
	}
	if ($('#accomRoomDescription').val() == '') {
		alert('객실의 설명글을 입력하세요!');
		return;
	}
	
	// 숙소_객실의 기준인원 유효성 검사
	if ($('#accomRoomStan').val() == '') {
		alert('객실의 기준인원을 입력하세요!');
		return;
	}
	
	// 숙소_객실의 최대인원 유효성 검사
	if ($('#accomRoomMax').val() == '') {
		alert('객실의 최대인원을 입력하세요!');
		return;
	}
	
	// 숙소_객실의 가격 유효성 검사
	if ($('#accomPrice').val() == '') {
		alert('객실의 가격을 입력하세요!');
		return;
	}
	
	// 숙소_객실의 물품 유효성 검사
	if ($('#accomRoomItemName').val() == '' || $('#accomRoomItemQnt').val() == '' || $('#accomRoomItemPrice').val() == '') {
		alert('객실의 물품의 입력 부분을 전부 입력하세요!');
		return;
	}
	
	// 숙소_객실의 해시태그 유효성 검사
	if ($('#inputHashtag').val() == '') {
		alert('객실의 해시태그를 입력하세요!');
		return;
	}
	
	// 숙소_객실의 등록시 약관 확인 check 검사
	let checkAccept = $('.icheckbox_square-yellow:checked'); // . 클래스속성으로 부르면 리턴값은 배열
	if (checkAccept.length == 0) {
		alert('약관과 수수료 등을 확인해주세요!');
		return;
	}

	$('#accomRoomForm').submit();
});