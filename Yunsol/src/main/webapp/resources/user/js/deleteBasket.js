$(document).ready(function() {

var checkNum = 0;
$('#delete-button').click(function(event){
		$.ajax({
			url:'delete.do',
			type:'post',
			data:{basket_num:$('#basket_num').val()},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
				if(data.result=="deleteSuccess"){
					alert("삭제완료.");
					location.href="http://localhost:8080/lib_cih/book/basket.do"
//					history.go(0);
				}else if(data.result == "noUserId"){
					alert("로그인을 해주세요.")
					location.href="http://localhost:8080/lib_cih/member/login.do";
				}
			},
			error : function() {
				alert('네트워크 오류 발생');
			}	
		});
		event.preventDefault();
	});

});