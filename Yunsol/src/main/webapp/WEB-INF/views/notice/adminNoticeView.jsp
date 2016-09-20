<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div>
	<div align="center"><h1>${notice.notice_title}</h1></div>
	<ul style="list-style:none;">
		<li>번호 : ${notice.notice_num}</li>
		<li>ID : ${notice.mem_id}</li>
		<li>등록날짜 : ${notice.notice_regdate}</li>
	</ul>
	<hr size="1" width="100%">
	<p>${notice.notice_content}</p>
	<hr size="1" width="100%">
	<div align="right">
		<input type="button" value="수정" onclick="location.href='update.do?notice_num=${notice.notice_num}'" class="btn btn-sm btn-warning">
		<input type="button" value="삭제" onclick="javascript:delete_event(${notice.notice_num});" class="btn btn-sm btn-danger">
	</div>
</div>