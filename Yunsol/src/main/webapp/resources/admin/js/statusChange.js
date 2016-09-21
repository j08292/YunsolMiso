/*==================================관리자 희망 도서==================================*/
//관리자 희망도서 진행상태 변경
$(".status").change(function(){
	//alert($(this).attr('data-num')+', ' +$(this).find('option:selected').val());
	var wish_num=$(this).attr('data-num');
	var wish_status=$(this).find('option:selected').val();
	$('.status_button').click(function(){
		location.href="updateStatus.do?wish_num="+wish_num+"&wish_status="+wish_status;
		alert('변경되었습니다.');
	});
});

//관리자 희망도서 목록 검색창 변경
$("#wishlistSearch").change(function(){	
	if($(this).val()=="wish_title"){
		$("#selectbox").remove();
		var output = '';
		output +='<input type="text" name="keyword" size="16" id="textbox">';
		$("#output").append(output);
	}else{		
		$("#textbox").remove();
		var output = '';
		output +='<select name="keyword" id="selectbox" style="width:150px;">';
		output +='<option value="">선택하세요</option>';
		output +='<option value="0">신청중</option>';
		output +='<option value="1">처리중</option>';
		output +='<option value="2">취소됨</option>';
		output +='<option value="3">소장중</option>';
		output +='</select>';
		$("#output").append(output);
	}
});

/*==================================관리자 도서 목록==================================*/
//관리자 도서 목록 검색창 변경
$("#booklistSearch").change(function(){	
	if($(this).val()=="list_status"){
		$("#textbox").remove();
		var output = '';
		output +='<select name="keyword" id="selectbox" style="width:150px;">';
		output +='<option value="">선택하세요</option>';
		output +='<option value="0">대출가능</option>';
		output +='<option value="1">대출정지</option>';
		output +='</select>';
		$("#output").append(output);
	}else{
		$("#textbox").remove();
		$("#selectbox").remove();
		var output = '';
		output +='<input type="text" name="keyword" size="16" id="textbox">';
		$("#output").append(output);		
	}
});

//대출정지 처리시 확인  
function rentStop_event(list_num,list_title){
	if (confirm("정말 ["+list_title+"] 을/를 대출정지 처리하시겠습니까?") == true) {
		location.href='updateStatus.do?list_num='+list_num+'&list_status=1';
	}else{
		return;
	}
}

/*==================================관리자 대출 도서==================================*/
//관리자 대출 목록 검색창 변경
$("#bookrentSearch").change(function(){	
	if($(this).val()=="rent_status"){
		$("#textbox").remove();
		var output = '';
		output +='<select name="keyword" id="selectbox" style="width:150px;">';
		output +='<option value="">선택하세요</option>';
		output +='<option value="0">대출중</option>';
		output +='<option value="1">반납</option>';
		output +='<option value="2">예약중</option>';
		output +='<option value="3">대출대기</option>';
		output +='</select>';
		$("#output").append(output);
	}else{
		$("#textbox").remove();
		$("#selectbox").remove();
		var output = '';
		output +='<input type="text" name="keyword" size="16" id="textbox">';
		$("#output").append(output);
	}
});

//관리자 대출 목록 반납,승인,대출 처리시 확인
function bookRent_event(rent_num,list_title){//대출대기 도서 -> 대출 처리
	if (confirm("["+list_title+"] 을/를 대출 처리하시겠습니까?") == true) {
		location.href='updateRent.do?rent_num='+ rent_num+'&rent_status=0';
	}else{
		return;
	}
}

function bookReturn_event(rent_num,rent_status,list_title,list_num){//도서 반납처리 -> 반납시 예약중 도서 대출대기로 상태변경	
	if (confirm("["+list_title+"] 을/를 반납하시겠습니까?") == true) {
		location.href='updateStatus.do?rent_num='+ rent_num+'&rent_status=1'+'&list_num='+list_num;
	}else{
		return;
	}
}

function updatePenalty_event(rent_num,mem_penalty,list_title,mem_id){//연체도서 -> 패널티,반납 처리
	if (confirm("["+list_title+"] 을/를 반납하시겠습니까?") == true) {
		location.href='updatePenalty.do?rent_num='+ rent_num+'&mem_penalty='+mem_penalty+'&rent_status=1'+'&mem_id='+mem_id;
	}else{
		return;
	}
}

function bookCancel_event(rent_num,list_title){//대출 or 예약 취소	
	if (confirm("["+list_title+"] 예약을 취소하시겠습니까?") == true) {
		location.href='updateCancel.do?rent_num='+ rent_num+'&rent_status=4';
	}else{
		return;
	}
}