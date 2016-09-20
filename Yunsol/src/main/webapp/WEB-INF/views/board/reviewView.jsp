<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
/*레이아웃*/
body {
	font-size: 10pt;
	font-family: "맑은 고딕";
}

div#main {
	width: 960px;
	margin: 0 auto;
}

div#main_header {
	margin-bottom: 10px;
	padding: 0 10px 0 0;
}

div#main_menu {
	float: left;
	width: 17%;
	min-height: 400px;
}

div#main_body {
	float: left;
	width: 78%;
	padding: 5px;
}

div#main_footer {
	clear: both;
	width: 100%;
	text-align: center;
	background-color: yellow;
}

ul.menu {
	list-style: none;
}

ul.menu li {
	margin-bottom: 5px;
}

a {
	text-decoration: none;
	color: #3f3f3f;
}

a:hover {
	text-decoration: none;
	color: #0c8f84;
	font-weight: bold;
}

.align-right {
	text-align: right;
}

.align-center {
	text-align: center;
}
/*회원관리*/
#register_form label, #modify_form label, #delete_form label,
	#login_form label {
	font-size: 11pt;
	font-family: "맑은 고딕";
	width: 140px;
	float: left;
}

form#register_form, form#modify_form, form#delete_form, form#login_form
	{
	width: 500px;
	margin: 0 auto;
}

form ul {
	list-style: none;
	padding: 0;
	margin: 2px;
}

form ul li {
	margin: 0 0 9px 0;
	padding: 0;
}

form input[type="text"], form input[type="password"], form textarea,
	form#login_form input#id {
	width: 350px;
}

form input#id {
	width: 150px;
}

.error-color {
	color: red;
}
/*게시판*/
ul.search {
	width: 300px;
	list-style: none;
	padding: 0;
	margin: 10px auto;
}

ul.search li {
	margin: 0 0 9px 0;
	padding: 0;
	display: inline;
}

ul.search li input[type="text"] {
	width: 100px;
}

table {
	width: 98%;
	margin: 0 auto;
}

form#re_form {
	width: 650px;
	margin: 0 auto;
}

span.re-title {
	color: #000;
	font-size: 12pt;
	line-height: 200%;
}

span.letter-count {
	font-size: 10pt;
	color: #999;
}

span.form-id {
	padding-left: 93px;
	color: #000;
}

textarea.rep-content {
	width: 97%;
	height: 50px;
	margin: 10px 10px;
}

div#re_first {
	float: left;
	width: 79%;
	margin-bottom: 10px;
}

div#re_second {
	float: left;
	width: 20%;
	margin-bottom: 10px;
}

div#loading {
	width: 100px;
	margin: 0 auto;
}

div.paging_button {
	text-align: right;
}

div#output {
	clear: both;
}

form#mre_form {
	margin: 5px;
}
</style>

<!-- Page Title(지우면안됨X) -->
<section id="page-title">
	<div class="container clearfix">
		<h1>${review.review_title}</h1>
		<span>Start Buying your Favourite Theme</span>
		<ol class="breadcrumb">
			<li><a href="#">Home</a></li>
			<li class="active">Shop</li>
		</ol>
	</div>
</section>
<!-- #page-title end -->

<!-- Content(지우면안됨X)-->
<section id="content">

	<div class="content-wrap">

		<div class="container clearfix">

			<!-- ============ 내용입력 시작============ -->

			<div>
				<h2 class="align-center">${review.review_title}</h2>
				<ul>
					<li>번호 : ${review.review_num}</li>
					<li>ID : ${review.mem_id }</li>
					<li>조회수 : ${review.review_hit}</li>
					<li>등록날짜 : ${review.review_regdate}</li>
					<c:if test="${!empty review.review_file}">
						<li>첨부파일 : <a href="file.do?review_file=${review.review_file}">${review.review_file}</a></li>
					</c:if>
				</ul>
				<hr size="1" width="100%">
				<p>
					<c:if test="${!empty review.review_file}">
					<img src="file.do?review_file=${review.review_file}" width=512 height=384></img><br><br>
					</c:if>
					${review.review_content}
				</p>
				<hr size="1" width="100%">
				<p class="align-right">
					<c:if test="${!empty userId && userId == review.mem_id}">
						<input type="button" value="수정"
							onclick="location.href='update.do?review_num=${review.review_num}'">
						<input type="button" value="삭제"
							onclick="location.href='delete.do?review_num=${review.review_num}'">
					</c:if>
				</p>
				<!-- 댓글 -->
				<span class="reply title">댓글달기</span>
				<form id="re_form">
					<input type="hidden" name="review_num" value="${review.review_num}"
						id="review_num"> <input type="hidden" name="mem_id"
						value="${userId}" id="userId">
					<textarea rows="3" cols="50" name="review_re_content"
						id="review_re_content" maxlength="300" class="a"
						<c:if test="${empty userId}">disabled="disabled"</c:if>><c:if
							test="${empty userId}">로그인해야 작성할 수 있습니다.</c:if></textarea>
					<c:if test="${!empty userId}">
						<div id="re_first">
							<span class="letter-count">300/300</span>
						</div>
						<div id="re_second" class="align-right">
							<input type="submit" value="전송">
						</div>
					</c:if>
				</form>
				<!-- 목록출력 -->
				<div id="output"></div>
				<div class="paging_button" style="display: none;">
					<input type="button" value="다음글 보기">
				</div>
				<div id="loading" style="display: none;">
					<img
						src="${pageContext.request.contextPath}/resources/user/images/ajax-loader.gif">

				</div>
				<!-- 수정폼 -->
				<div id="modify_div" style="display: none;">
					<form id="mre_form">
						<input type="hidden" name="review_re_num" id="mreview_re_num">
						<input type="hidden" name="mem_id" id="muserId">
						<textarea rows="3" cols="50" name="review_re_content"
							id="mreview_re_content" class="a"></textarea>
						<div id="mre_first">
							<span class="letter-count">300/300</span>
						</div>
						<div id="mre_second" class="align-right">
							<input type="submit" value="수정"> <input type="button"
								value="취소" class="re-reset">
						</div>
						<hr size="1" noshade width="96%">
					</form>
				</div>
			</div>

			<!--============ 내용입력 끝===============-->

		</div>

	</div>

</section>
<!-- #content end -->