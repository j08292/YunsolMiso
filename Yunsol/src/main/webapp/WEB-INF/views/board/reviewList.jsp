<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
 <%@ taglib prefix = "c"	uri = "http://java.sun.com/jsp/jstl/core" %>
   
    <!-- Stylesheets(지우면안됨X)-->
	
    <style>
/*레이아웃*/
body{
	font-size:10pt;
	font-family:"맑은 고딕";
}
div#main{
	width:960px;
	margin:0 auto;
}
div#main_header{
	margin-bottom:10px;
	padding:0 10px 0 0;
}
div#main_menu{
	float:left;
	width:17%;
	min-height:400px;
}
div#main_body{
	float:left;
	width:78%;
	padding:5px;
}
div#main_footer{
	clear:both;
	width:100%;
	text-align:center;
	background-color:yellow;
}
ul.menu{
	list-style:none;
}
ul.menu li{
	margin-bottom:5px;
}
a{
	text-decoration:none;
	color:#3f3f3f;
}
a:hover{
	text-decoration:none;
	color:#0c8f84;
	font-weight:bold;
}
.align-right{
	text-align:right;
}
.align-center{
	text-align:center;
}
/*회원관리*/
#register_form label,#modify_form label,#delete_form label,#login_form label{
	font-size:11pt;
	font-family:"맑은 고딕";
	width:140px;
	float:left;
}
form#register_form,form#modify_form,form#delete_form,form#login_form{
	width:500px;
	margin:0 auto;
}
form ul{
	list-style:none;
	padding:0;
	margin:2px;
}
form ul li{
	margin:0 0 9px 0;
	padding:0;
}
form input[type="text"], form input[type="password"], form textarea, form#login_form input#id{
	width:350px;
}
form input#id{
	width:150px;
}
.error-color{
	color:red;
}
/*게시판*/
ul.search{
	width:300px;
	list-style:none;
	padding:0;
	margin:10px auto;
}
ul.search li{
	margin:0 0 9px 0;
	padding:0;
	display:inline;
}
ul.search li input[type="text"]{
	width:100px;
}
table{
	width:98%;
	margin:0 auto;
}
form#re_form{
	width:650px;
	margin:0 auto;
}
span.re-title{
	color:#000;
	font-size:12pt;
	line-height:200%;
}
span.letter-count{
	font-size:10pt;
	color:#999;
}
span.form-id{
	padding-left:93px;
	color:#000;
}
textarea.rep-content{
	width:97%;
	height:50px;
	margin:10px 10px;
}
div#re_first{
	float:left;
	width:79%;
	margin-bottom:10px;
}
div#re_second{
	float:left;
	width:20%;
	margin-bottom:10px;
}
div#loading{
	width:100px;
	margin:0 auto;
}
div.paging_button{
	text-align:right;
}
div#output{
	clear:both;
}
form#mre_form{
	margin:5px;
}

</style>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <!--[if lt IE 9]>
    	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->

    <!-- External JavaScripts(지우면안됨X) -->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/plugins.js"></script>

        <!-- Page Title(지우면안됨X) -->
        <section id="page-title">

            <div class="container clearfix">
                <h3><spring:message code="review.list.title"/></h3>
                <span>Start Buying your Favourite Theme</span>
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Shop</li>
                </ol>
            </div>

        </section><!-- #page-title end -->

        <!-- Content(지우면안됨X)-->
        <section id="content">

            <div class="content-wrap">

                <div class="container clearfix">

                   <!-- 내용입력 시작-->
                   
                 <div>
                   	<form action="list.do" id="search_form" method="get">
                   		<ul class="search">
                   			<li>
                   				<select name="keyfield">
                   					<option value="review_title">제목</option>
                   					<option value="mem_id">ID</option>
                   					<option value="review_content">내용</option>
                   					<option value="all">전체</option>                   					
                   				</select>
                   			</li>
                   			<li>
                   				<input type="text" size="16" name="keyword">
                   			</li>
                   			<li>
                   				<input type="submit" value="찾기">
                   			</li>
                   		</ul>                   		
                   	</form>
                   	<table>
                   		<tr>
                   			<td class="align-right">
                   				<input type="button" value="글쓰기"
                   						 onclick="location.href='write.do'">
                   			</td>
                   		</tr>                   		
                   	</table>
                   
                   <c:if test="${count == 0 }">
                   	<div class="align-center">등록된 게시글이 없습니다.</div>
                   </c:if>
                   <c:if test="${count > 0 }">
                   <table border="1">
                   	<tr>
                   		<th>번호</th>
                   		<th>제목</th>
                   		<th>ID</th>
                   		<th>날짜</th>
                   		<th>조회수</th>
                   		<th>좋아요</th>
                   		<th>싫어요</th>
                   	</tr>
                   	<c:forEach var="article" items="${list}">
                   		<tr>
                   			<td>${article.review_num}</td>
                   			<td><a href="detail.do?review_num=${article.review_num}">${article.review_title}</a></td>
                   			<td>${article.mem_id}</td>
                   			<td>${article.review_regdate}</td>
                   			<td>${article.review_hit}</td>
                   			<td>${article.review_like}</td>
                   			<td>${article.review_dislike}</td>
                   		</tr>
                   		
                   	
                   	</c:forEach>
                   </table>
                   <div class="align-center">${pagingHtml}</div>
                   </c:if>
                   </div>
                    <!-- 내용입력 끝-->

                </div>

            </div>

        </section>
        <!-- #content end -->

    
    <!-- Go To Top (지우면안됨X)-->
    <div id="gotoTop" class="icon-angle-up"></div>

    <!-- Footer Scripts (지우면안됨X)-->
    <script type="text/javascript" src="js/functions.js"></script>

</body>
</html>