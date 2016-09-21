<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:if test='${!empty param.keyword && param.keyfield == "bk_state"}'>
	<script type="text/javascript">
		$(function() {
			$('#selectBox')
					.val(
							'../book/search.do?keyfield=bk_state&keyword=${param.keyword}');
		});
	</script>
</c:if>

<!-- Stylesheets ============================================= -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

<div>  
	<h1 class="page-header"><spring:message code="adminMember.list.title" /></h1>
	<form action="list.do" id="search_form" method="post">
		<div align="center">
			<select name="keyfield" id="selectBox" class="form-control">
				<option value="mem_id">ID</option>
				<option value="mem_name">이름</option>
				<option value="mem_cell">연락처</option>
				<option value="mem_address">주소</option>
				<option value="all">전체</option>
			</select>		
			<input type="text" size="16" name="keyword">			
			<input type="submit" value="찾기">
		</div>
	</form>	
	<c:if test="${count == 0}">
		<div align="center">등록된 회원정보가 없습니다.</div>
	</c:if>

	<c:if test="${count > 0 }">
		<div class="panel panel-default">
			<div class="panel-heading" style="text-align: center">회원 검색결과</div>
			<form action="list.do" class="form-inline" id="detail-form" method="post" style="text-align: center">

				<table class="table table-hover provideList">
					<thead>
						<tr>
							<th>ID</th>
							<th>이름</th>
							<th>연락처</th>
							<th>email</th>
							<th>주소</th>
							<th>가입일</th>
							<th>회원등급</th>
							<th>회원상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="article" items="${list}">
							<tr>
								<td>${article.mem_id}</td>								
								<td>${article.mem_name}</td>
								<td>${article.mem_cell}</td>
								<td>${article.mem_email}</td>
								<td>${article.mem_address}</td>
								<td>${article.mem_regdate}</td>								
								<td>
									<c:if test="${article.mem_level == 0 || article.mem_level == 1}">일반회원</c:if>
									<c:if test="${article.mem_level == 2}">관리자</c:if>
								</td>
								<td>
									<c:if test="${article.mem_level == 0 || article.mem_level == 2}">정상</c:if>
									<c:if test="${article.mem_level == 1}">차단</c:if>									
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
		<div align="center">${pagingHtml }</div>
	</c:if>
</div>