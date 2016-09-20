<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div>
	<h2 class="page-header"><spring:message code="wishlist.write.title"/></h2>
	<form:form action="write.do" commandName="command" id="register_form">
		<form:errors element="div" class="error-color"/>					
			<div class="form-group">
				<label for="wish_title">제목</label>
				<form:input path="wish_title" class="form-control"/>
				<form:errors path="wish_title" class="error-color"/>
			</div>
			<div class="form-group">
				<label for="wish_writer">지은이</label>
				<form:input path="wish_writer" class="form-control"/>
				<form:errors path="wish_writer" class="error-color"/>
			</div>
			<div class="form-group">
				<label for="wish_publish">출판사</label>
				<form:input path="wish_publish" class="form-control"/>
				<form:errors path="wish_publish" class="error-color"/>
			</div>
			<div>
				<input type="submit" value="신청" class="btn btn-primary" onclick="javascript:confirm_event();">
			</div>		
	</form:form>
</div>