<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>

<!-- Document Title
	============================================= -->
<title>로그인</title>


<!-- Page Title
		============================================= -->
<section id="page-title">

	<div class="container clearfix">
		<h1>My Account</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/main/main.do" style = "font-size: 10pt;">Home</a></li>
			<li><a href = "${pageContext.request.contextPath}/member/write.do" style = "font-size: 10pt;">Register</a></li>
			<li><a href = "${pageContext.request.contextPath}/member/login.do" style = "font-size: 10pt;">Login</a></li>
		</ol>
	</div>

</section>
<!-- #page-title end -->

<!-- Content
		============================================= -->
<section id="content">

	<div class="content-wrap">

		<div class="container clearfix">

			<div class="tabs divcenter nobottommargin clearfix"
				id="tab-login-register" style="max-width: 500px;">

				<ul class="tab-nav tab-nav2 center clearfix">
					<li class="inline-block"><a href="#tab-login">로그인</a></li>
					<!-- <li class="inline-block"><a href="#tab-register">Register</a></li> -->
				</ul>

				<div class="tab-container">

					<div class="tab-content clearfix" id="tab-login">
						<div class="panel panel-default nobottommargin">
							<div class="panel-body" style="padding: 40px;">
							<%-- 	<form id="login-form" name="login-form" class="nobottommargin"
									action="write.do" method="post"> --%>

									<form:form action="login.do" commandName="command" id="login-form" class="nobottommargin">
										<form:errors element="div" class="error-color"/>
										<spring:message code="member.block.title" arguments="${penalty.penalty_blockcanceldate}"/>
										

										<li class="col_full"><label for="mem_id">아이디:</label>
											<form:input path="mem_id" class="form-control" />
											<form:errors path="mem_id" class="error-color"/>
										</li>

										<li class="col_full"><label for="mem_passwd">비밀번호:</label>
											<form:password path="mem_passwd" class="form-control" />
											<form:errors path="mem_passwd" class="error-color"/>	
										</li>

										<li class="col_full nobottommargin"><input type="submit"
											class="button button-3d button-black nomargin" value="로그인">
											<a href="#" class="fright">비밀번호를 잊어버리셨나요?</a></li>
											
								<div id="naver_id_login"></div>
								</form:form>
								<%-- </form> --%>
								
								<script type="text/javascript">
									var naver_id_login = new naver_id_login(
											"uEDM_z6QRhWhfFVbjIr8",
											"http://localhost:8080/lib_cih/main/main.do");
									var state = naver_id_login.getUniqState();
									naver_id_login.setButton("white", 2, 40);
									naver_id_login.setDomain(".service.com");
									naver_id_login.setState(state);
									naver_id_login.setPopup();
									naver_id_login.init_naver_id_login();
								</script>
								<script type="text/javascript">
									// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
									function naverSignInCallback() {
										// naver_id_login.getProfileData('프로필항목명');
										// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
										alert(naver_id_login
												.getProfileData('email'));
										alert(naver_id_login
												.getProfileData('nickname'));
										alert(naver_id_login
												.getProfileData('age'));
									}

									// 네이버 사용자 프로필 조회
									naver_id_login
											.get_naver_userprofile("naverSignInCallback()");
								</script>
								<!-- //네이버아디디로로그인 Callback페이지 처리 Script -->

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

