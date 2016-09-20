/*==================================관리자 도서 목록==================================*/
//관리자 도서 등록시 이미지 미리보기
var ImagePreview = (function loadImageFile() {
	if (window.FileReader) {
		var ImagePre; 
		var ImgReader = new window.FileReader();
		var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 

		ImgReader.onload = function (Event) {
			if (!ImagePre) {
				var newPreview = document.getElementById("imagePreview");
				ImagePre = new Image();
				ImagePre.style.width = "200px";
				//ImagePre.style.height = "140px";
				newPreview.appendChild(ImagePre);
			}
			ImagePre.src = Event.target.result;
		};

		return function () {
			var img = document.getElementById("upload").files;

			if (!fileType.test(img[0].type)) { 
				alert("이미지 파일을 업로드 하세요"); 
				return; 
			}
			ImgReader.readAsDataURL(img[0]);
		}
	}
	document.getElementById("imagePreview").src = document.getElementById("upload").value;
})();

//관리자 도서목록 호출시 마우스오버-미리보기
$(document).on("mouseover",".adminListImage",function(e){ //마우스 오버시
	var xOffset = 10;
	var yOffset = 30;
	$("body").append("<p id='preview'><img src='"+ $(this).attr("src") +"' width='200px' /></p>"); //보여줄 이미지를 선언                       
	$("#preview")
	.css("top",(e.pageY - xOffset) + "px")
	.css("left",(e.pageX + yOffset) + "px")
	.fadeIn("fast"); //미리보기 화면 설정 셋팅
});

$(document).on("mouseout",".adminListImage",function(){ //마우스 아웃시
	$("#preview").remove();
});

//관리자 도서 목록 수정시 이미지 미리보기
var ImagePreview = (function loadImageFile() {
	if (window.FileReader) {
		var ImagePre; 
		var ImgReader = new window.FileReader();
		var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 

		ImgReader.onload = function (Event) {
			document.getElementById("beforeImage").remove();
			if (!ImagePre) {
				var newPreview = document.getElementById("imagePreview");
				ImagePre = new Image();
				ImagePre.style.width = "200px";
				//ImagePre.style.height = "140px";
				newPreview.appendChild(ImagePre);
			}
			ImagePre.src = Event.target.result;
		};

		return function () {
			var img = document.getElementById("upload").files;

			if (!fileType.test(img[0].type)) { 
				alert("이미지 파일을 업로드 하세요"); 
				return; 
			}
			ImgReader.readAsDataURL(img[0]);
		}
	}
	document.getElementById("imagePreview").src = document.getElementById("upload").value;
})();
