<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c"	uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Header
		============================================= -->
		<header id="header" class="transparent-header full-header" data-sticky-class="not-dark">

			<div id="header-wrap">

				<div class="container clearfix">

					<div id="primary-menu-trigger"><i class="icon-reorder"></i></div>

					<!-- Logo
					============================================= -->
					<div id="logo">
						<a href="${pageContext.request.contextPath}/main/main.do" class="standard-logo" data-dark-logo="${pageContext.request.contextPath}/resources/user/images/logo-dark.png"><img src="${pageContext.request.contextPath}/resources/user/images/logo.png" alt="Canvas Logo"></a>
						<a href="${pageContext.request.contextPath}/main/main.do" class="retina-logo" data-dark-logo="${pageContext.request.contextPath}/resources/user/images/logo-dark@2x.png"><img src="${pageContext.request.contextPath}/resources/user/images/logo@2x.png" alt="Canvas Logo"></a>
					</div><!-- #logo end -->

					<!-- Primary Navigation
					============================================= -->
					<nav id="primary-menu" class="dark">
											
						<ul>
							<li><a href="${pageContext.request.contextPath }/book/search.do">도서검색</a></li>
							<li class="wishlist"><a href="${pageContext.request.contextPath}/wishlist/write.do"><div>희망도서</div></a>
							<li class="notice"><a href="${pageContext.request.contextPath}/notice/list.do"><div>공지사항</div></a>
							<li class="speech"><a href="${pageContext.request.contextPath}/speech/list.do"><div>강연</div></a>
							<li><a href="#"><div>Features</div></a></li>
							<li class="mega-menu"><a href="#"><div>Pages</div></a></li>
							<li class="mega-menu"><a href="#"><div>Portfolio</div></a></li>
							<li><a href="#"><div>EVENT</div></a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/event/marathonInfo.do"><div>독서마라톤</div></a></li>
								</ul>
							</li>
							<li><a href="#"><div>BOARD</div></a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/board/list.do"><div>감상평게시판</div></a></li>
									<li><a href="${pageContext.request.contextPath}/board/qnaList.do"><div>질문게시판</div></a></li>								
								</ul>
							</li>
						</ul>
						
						<ul>
							<c:if test = "${empty userId }">
								<li><a href = "${pageContext.request.contextPath }/member/write.do">회원가입</a></li>
								<li><a href = "${pageContext.request.contextPath }/member/login.do">로그인</a></li>
							</c:if>
							<c:if test = "${!empty userId && mem_level == 2 }">
								<li><a href = "#">[관리자 ${userId }님 로그인 중]</a></li>
								<li><a href="${pageContext.request.contextPath}/admin/main.do">관리자 페이지</a></li>
								<li><a href = "${pageContext.request.contextPath }/member/logout.do">로그아웃</a></li>
							</c:if>
							<c:if test = "${!empty userId && mem_level == 0 }">
								<li><a href = "#">[일반회원 ${userId }님 로그인 중]</a></li>
								<li><a href ="${pageContext.request.contextPath }/book/basket.do">장바구니</a>
								<li><a href = "${pageContext.request.contextPath }/member/myOrder.do">나의 예약/취소</a></li>
								<li><a
									href="${pageContext.request.contextPath }/member/update.do">회원정보수정</a></li>
								<li><a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></li>								
							</c:if>
						</ul>

						<!-- Top Cart
						============================================= -->
						<div id="top-cart">
							<a href="#" id="top-cart-trigger"><i class="icon-shopping-cart"></i><span>5</span></a>
							<div class="top-cart-content">
								<div class="top-cart-title">
									<h4>Shopping Cart</h4>
								</div>
								<div class="top-cart-items">
									<div class="top-cart-item clearfix">
										<div class="top-cart-item-image">
											<a href="#"><img src="${pageContext.request.contextPath}/resources/user/images/shop/small/1.jpg" alt="Blue Round-Neck Tshirt" /></a>
										</div>
										<div class="top-cart-item-desc">
											<a href="#">Blue Round-Neck Tshirt</a>
											<span class="top-cart-item-price">$19.99</span>
											<span class="top-cart-item-quantity">x 2</span>
										</div>
									</div>
									<div class="top-cart-item clearfix">
										<div class="top-cart-item-image">
											<a href="#"><img src="${pageContext.request.contextPath}/resources/user/images/shop/small/6.jpg" alt="Light Blue Denim Dress" /></a>
										</div>
										<div class="top-cart-item-desc">
											<a href="#">Light Blue Denim Dress</a>
											<span class="top-cart-item-price">$24.99</span>
											<span class="top-cart-item-quantity">x 3</span>
										</div>
									</div>
								</div>
								<div class="top-cart-action clearfix">
									<span class="fleft top-checkout-price">$114.95</span>
									<button class="button button-3d button-small nomargin fright">View Cart</button>
								</div>
							</div>
						</div><!-- #top-cart end -->

						<!-- Top Search
						============================================= -->
						<div id="top-search">
							<a href="#" id="top-search-trigger"><i class="icon-search3"></i><i class="icon-line-cross"></i></a>
							<form action="search.html" method="get">
								<input type="text" name="q" class="form-control" value="" placeholder="Type &amp; Hit Enter..">
							</form>
						</div><!-- #top-search end -->

					</nav><!-- #primary-menu end -->

				</div>

			</div>

		</header><!-- #header end -->