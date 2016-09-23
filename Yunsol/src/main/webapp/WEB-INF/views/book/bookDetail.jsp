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
										src="${book.list_filename}" width="200" alt="도서 이미지" /></td>
									<td style="vertical-align: top;">
										<dl>
											<dt>표제/책임표시.</dt>
											<dd>${book.list_title}</dd>
											<dt>작가</dt>
											<dd>${book.list_writer}</dd>
											<dt>발행사항.</dt>
											<dd>${book.list_publish}</dd>
											<dt>표준번호/부호.</dt>
											<dd>${book.list_code}</dd>
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
						<form action="detail.do" id="detail-form">
							<table class="table table-hover provideList">
								<tr>
									<th>상태</th>
									<th>도서정보</th>
									<th>자료실</th>
									<th>예약</th>
								</tr>
								<tr>
									<td><c:if test="${book.list_rent == 0 }">
											비치중, 대여가능
										</c:if> <c:if test="${book.list_rent == 1 }">
											대여중
										</c:if></td>
									<td>${book.list_title}</td>
									<td>북수원도서관<br>서수원도서관
									</td>
									<td>
										<!-- 대출중일때 --> <c:if test="${book.list_rent == 1 }">
											<input type="button" value="예약" id="reserveButton">
											<br>
										</c:if> <!-- 비치중일때 --> <c:if test="${book.list_rent == 0 }">
											<input type="hidden" id="list_num" name="list_num"
												value="${book.list_num }">
											<a id="checkbasket-button"
												href="${pageContext.request.contextPath}/book/basket.do?list_title=${book.list_title }&list_num=${book.list_num }&list_filename=${book.list_filename }"
												class="btn btn-primary">대여</a>
											<input class="btn" type="button" value="무인">
										</c:if>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>


				<!--별점 및 한줄평 -->
				<div class="panel panel-default">
					<div class="panel-heading" align="center">별점 및 한줄평</div>
					<div class="panel-body">
						<form id="grade_form">
							<input type="hidden" name="list_num" value="${book.list_num}">
							<input type="hidden" name="mem_id" value="${userId}" id="userId">

							<div class="fb-like"
								data-href="http://www.your-domain.com/your-page.html"
								data-layout="standard" data-action="like" data-share="true"
								data-show-faces="true"></div>

							<!-- 별점 -->
							<div class="col-md-2">
								<span class="star-input"> <span class="input"> <input
										type="radio" name="grade_star" id="p1" value="1"><label
										for="p1">1</label> <input type="radio" name="grade_star"
										id="p2" value="2"><label for="p2">2</label> <input
										type="radio" name="grade_star" id="p3" value="3"><label
										for="p3">3</label> <input type="radio" name="grade_star"
										id="p4" value="4"><label for="p4">4</label> <input
										type="radio" name="grade_star" id="p5" value="5"><label
										for="p5">5</label> <input type="radio" name="grade_star"
										id="p6" value="6"><label for="p6">6</label> <input
										type="radio" name="grade_star" id="p7" value="7"><label
										for="p7">7</label> <input type="radio" name="grade_star"
										id="p8" value="8"><label for="p8">8</label> <input
										type="radio" name="grade_star" id="p9" value="9"><label
										for="p9">9</label> <input type="radio" name="grade_star"
										id="p10" value="10"><label for="p10">10</label>
								</span> <output for="star-input">
										<b id="star_point">0</b>점
									</output>
								</span>
							</div>





							<textarea rows="2" cols="70" name="grade_content"
								id="grade_content" maxlength="140" class="col-md-8"></textarea>

							<c:if test="${!empty userId}">
								<div id="grade_first">
									<span class="letter-count">140/140</span>
								</div>
								<div id="grade_second" align="right">
									<input type="submit" class="col-md-2" value="등록">
								</div>
							</c:if>
						</form>


					</div>

					<!-- 목록 출력 -->
					<div class="panel-body">
						<div id="output"></div>
						<div class="paging_button" style="display: none;">
							<input type="button" value="다음글보기	">
						</div>

						<div id="loading" style="display: none;">
							<img
								src="${pageContext.request.contextPath}/resources/event/images/ajax-loader.gif">
						</div>
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


