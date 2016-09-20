<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section id="page-title">

	<div class="container clearfix">
		<h1>Page</h1>
		<span>A Blank Page</span>
		<ol class="breadcrumb">
			<li><a href="#">Home</a></li>
			<li><a href="#">Library</a></li>
			<li class="active">Data</li>
		</ol>
	</div>

</section>
<!-- #page-title end -->

<!-- Content
		============================================= -->
<section id="content">

	<div class="content-wrap">

		<div class="container clearfix">

			<div class="panel-group">
				<div class="panel panel-default">
					<div class="panel-heading" style="text-align: center">도서 상세정보</div>

					<div class="panel-body">
						<div>
							<h3>${book.list_title }</h3>
							<table style="font-size: 10pt;">
								<tr>
									<td style="width: 157px; vertical-align: top;"><img
										src="/lib/upload/${book.list_filename }" width="200" alt="도서 이미지" /></td>
									<td style="vertical-align: top;">
										<dl>
											<dt>표제/책임표시.</dt>
											<dd>${book.list_title }</dd>
											<dt>작가</dt>
											<dd>${book.list_writer }</dd>
											<dt>발행사항.</dt>
											<dd>${book.list_publish }</dd>
											<dt>표준번호/부호.</dt>
											<dd>${book.list_code }</dd>
											<dt>분류기호.</dt>
											<dd>한국십진분류법 -> 005.135</dd>
										</dl>
									</td>
								</tr>
							</table>

							<p style="margin: 0 auto; text-align: right;">
								<input type="button" value="목록으로" onclick="history.go(-1)">
							</p>

						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading" align="center">소장정보</div>
					<div class="panel-body">
						<form action="basket.do" id="detail-form" method = "post">
							<table class="table table-hover provideList">
								<tr>
									<th>상태</th>
									<th>도서정보</th>
									<th>자료실</th>
									<th>반납예정</th>
									<th>예약</th>
								</tr>
								<tr>
									<td>
										<c:if test="${book.list_rent == 0 }">
											비치중, 대여가능
										</c:if> <c:if test="${book.list_rent == 1 }">
											대여중
										</c:if>
									</td>
									<td>${book.list_title}</td>
									<td>북수원도서관<br>서수원도서관
									</td>
									<td>${book.list_returnDate }</td>
									<td>
										<!-- 대출중일때 -->
										<c:if test="${book.list_rent == 1 }">
										<input type = "hidden" id = "list_title" name = "list_title" value = "${book.list_title }">
										<input type = "hidden" id = "list_num" name = "list_num" value = "${book.list_num }"> 
											<input type="button" value="예약" id="reserve-button" class = "btn btn-primary"><br>
											<c:if test="${book.list_order == 1 }">
											<span>${book.list_order }&nbsp;순위</span>
											</c:if>
											<c:if test="${book.list_order == 2 }">
											<span>허용인원 초과</span>
											</c:if>
										</c:if> 
										<!-- 비치중일때 -->
										<c:if test="${book.list_rent == 0 }">  
											<input type = "hidden" id = "list_num" name = "list_num" value = "${book.list_num }"> 
											<!-- <input type = "submit" id = "checkbasket-submit" > -->
											<a id = "checkbasket-button" onclick = "formSubmit()" class = "btn btn-primary"
											href="${pageContext.request.contextPath}/book/basket.do"
											>대여</a>
											<script type="text/javascript">
												function formSubmit() {
													document.getElementById("detail-form").submit();
												}
											</script>
											<input class = "btn btn-primary" type="button" value="무인">
										</c:if></td>    
								</tr>
							</table>
						</form>
					</div>
				</div>

			</div>

		</div>
	</div>

</section>
<!-- #content end -->



<!-- Go To Top
	============================================= -->
<div id="gotoTop" class="icon-angle-up"></div>


