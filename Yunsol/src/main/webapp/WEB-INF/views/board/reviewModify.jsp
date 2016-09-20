<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


    <!-- Stylesheets(지우면안됨X)-->

<style>

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
form input.title_nari{
	width:350px;
}
form input.content_nari{
width:350px;
height:300px;

}

form input#id{
	width:150px;
}
.error-color{
	color:red;
}




/*게시판*/
.align-right{
	text-align:right;
}
.align-center{
	text-align:center;
}


label.title_nari{
	width:350px;
}
label.content_nari{
width:350px;
height:300px;

}


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
    <link rel="stylesheet" href="css/responsive.css" type="text/css" />
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
                <h1><spring:message code="review.write.title"/></h1>
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
                   	
                   	<form:form action="update.do" enctype="multipart/form-data"
						                               commandName="command"
						                               id="modify_form">
                   	<form:errors element="div" class="error-color"/>
                   		<ul>
                   			<li>
                   				<label for="review_title">제목</label>
                   				<form:input class="title_nari" path="review_title"/>
								<form:errors path="review_title" class="error-color"/>
                   			</li>
                   			<li>
                   				<label for="review_content">내용</label>
                   				<form:input class="content_nari" path="review_content"/>
								<form:errors path="review_content" class="error-color"/>
                   			</li>
                   			<li>
                   				<label for="upload">파일업로드</label>
                   				<input type="file" name="upload" id="upload"/>								
								<c:if test="${!empty command.review_file }">
								<br>
								<span>(${command.review_file})파일이 등록되어 있습니다.
								다시 업로드하면 기존 파일은 삭제됩니다.</span>
								</c:if>
                   			</li>
                   			<li class="align-center">
                   				<input type="submit" value="전송">
                   				<input type="button" value="목록" 
                   				onclick="location.href='list.do'">
                   			
                   			</li>
                   		</ul>
                   	
                   	</form:form>
                   	
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