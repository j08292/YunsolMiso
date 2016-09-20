<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Page Title
		============================================= -->

<section id="page-title">

	<div class="container clearfix">
		<h1>주문 내역</h1>
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
			<label>도서대여 내역</label>
			<form:form action="myOrder.do" id="myOrder-form" class="nobottommargin">
			<div class="panel panel-default">
				<div class="panel-body">
					<table class="table table-hover provideList">
						<thead>
							<tr>
								<th>주문번호</th>
								<th>도서정보</th>
								<th>구분</th>
								<th>도서관</th>
								<th>대여날짜</th>
								<th>반납날짜</th>
								<th>상태</th>
								<th>연체</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="rent" items="${list_rent }">
								<tr>
									<td>${rent.rent_num }</td>
									<td><a href = "${pageContext.request.contextPath}/member/myOrderDetail.do?rent_num=${rent.rent_num}&list_num=${rent.list_num}&rent_listTitle=${rent.rent_listTitle}">${rent.rent_listTitle }</a></td>
									<c:choose>
										<c:when test="${rent.rent_status == 0 || rent.rent_status == 1 || rent.rent_status == 2 || rent.rent_status == 3 || rent.list_order == 2}">
											<td>일반</td>
										</c:when>
										<c:when test="${rent.rent_status == 4 || rent.rent_status == 5 || rent.rent_status == 6}">
											<td>무인</td>
										</c:when>
									</c:choose>
									<td>북수원 도서관</td>
									<td>${rent.rent_rentDate }</td>
									<td>${rent.rent_returnDate }</td>
									<c:choose>
										<c:when test="${rent.rent_status == 0 }">
											<td>대여</td>
										</c:when>
										<c:when test="${rent.rent_status == 1 }">
											<td>반납</td>
										</c:when>
										<c:when test="${rent.rent_status == 3 }">
											<td>대여대기</td>
										</c:when>
										<c:when test="${rent.rent_status == 4 }">
											<td>무인대여 대기</td>
										</c:when>
										<c:when test="${rent.rent_status == 5 }">
											<td>무인대여</td>
										</c:when>
										<c:when test="${rent.rent_status == 6 }">
											<td>무인반납</td>
										</c:when>
									</c:choose>
									<td></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			</form:form>
			
			<label>도서예약 내역</label>
			<form:form action="myOrder.do" id="myOrder-form" class="nobottommargin">
			<div class="panel panel-default">
				<div class="panel-body">
					<table class="table table-hover provideList">
						<thead>
							<tr>
								<th>주문번호</th>
								<th>도서정보</th>
								<th>구분</th>
								<th>도서관</th>
								<th>대여날짜<br>(예약날짜)</th>
								<th>반납날짜<br>(예약취소 날짜)</th>
								<th>상태</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="rentRe" items="${list_rentRe }">
								<tr>
									<td>${rentRe.rent_num }</td>
									<td><a href = "${pageContext.request.contextPath}/member/myOrderDetail.do?rent_num=${rentRe.rent_num}&list_num=${rentRe.list_num}&rent_listTitle=${rentRe.rent_listTitle}">${rentRe.rent_listTitle }</a></td>
									<c:choose>
										<c:when test="${rentRe.rent_status == 0 || rentRe.rent_status == 1 || rentRe.rent_status == 2 || rentRe.rent_status == 3 || rentRe.list_order == 2}">
											<td>일반</td>
										</c:when>
										<c:when test="${rentRe.rent_status == 4 || rentRe.rent_status == 5 || rentRe.rent_status == 6}">
											<td>무인</td>
										</c:when>
									</c:choose>
									<td>북수원 도서관</td>
									<td>${rentRe.rent_reserveDate}</td>
									<c:if test="${rentRe.rent_reserveDateCancel != null }">
									<td>${rentRe.rent_reserveDateCancel }</td>
									</c:if>
									<c:if test="${rentRe.rent_reserveDateCancel == null }">
									<td></td>
									</c:if>
									<c:choose>
										<c:when test="${rentRe.list_order == 2 }">
											<td>예약</td>
										</c:when>
										<c:when test="${rentRe.list_order == 3 }">
											<td>예약취소</td>
										</c:when>
									</c:choose>
									<td><a id = "reserveDateCancel-button" class = "btn btn-primary">취소</a></td>
								</tr>
								<input type = "hidden" id = "rent_num" name = "rent_num" value = "${rentRe.rent_num }">
								<input type = "hidden" id = "list_num" name = "list_num" value = "${rentRe.list_num }">
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</form:form>
		
		</div>
	</div>
</section>
