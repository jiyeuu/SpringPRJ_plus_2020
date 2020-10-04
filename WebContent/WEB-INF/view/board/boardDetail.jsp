<%@page import="poly.dto.BoardDTO"%>
<%@page import="poly.dto.UserInfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String user_id = (String) session.getAttribute("SS_USER_ID");
	UserInfoDTO uDTO = (UserInfoDTO) request.getAttribute("uDTO");
	String user_Author = (String) session.getAttribute("user_Author");
	BoardDTO bDTO = (BoardDTO) request.getAttribute("bDTO");
	String user_mail = (String) session.getAttribute("user_mail");
	String user_name = (String) session.getAttribute("user_name");
%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>

<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Lyric Analysis Page</title>

    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <!-- Ionicons -->
    <link href="/css/ionicons.min.css" rel="stylesheet">
    <link href="/css/linear-icon.css" rel="stylesheet">
    <!-- Owl-carousel -->
    <link href="/css/owl.carousel.css" rel="stylesheet">
    <link href="/css/owl.theme.css" rel="stylesheet">
    <!-- Magnific popup style sheet -->
    <link rel="stylesheet" href="/css/magnific-popup.css">

    <!-- Dolphin style sheet -->
    <link rel="stylesheet" href="/css/weblysleek-ui-fonts.css">
    <link rel="stylesheet" href="/css/main.css">

    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Rubik:400,700,900" rel="stylesheet">
    
  
<!-- <link rel="stylesheet" href="/css/main.css"> -->
<!-- <link rel="stylesheet" href="/css/style.css"> -->
<link rel="stylesheet" href="/css/style_list.css">
<link rel="stylesheet" href="/css/bootstrap.min_table.css">
<style>
.input {
	font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #51cdbe;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.button1 {
	font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #51cdbe;
  width: 18%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
</style>
</head>
<body>

	<!-- #header -->
	<%
		if (user_id != null ) {
	%>
	<%
		if (user_Author.equals("1") ) {
	%>
	<%@include file="/WEB-INF/view/frame/topbar-admin.jsp"%>
	<%
		} else if( user_name != null){
	%>
	<%@include file="/WEB-INF/view/frame/topbar-login.jsp"%>
	<%
		}
	%>
	<%
		} else {
	%>
	<%@include file="/WEB-INF/view/frame/topbar-logout.jsp"%>
	<%
		}
	%>


	<section id="home"
		class="section jumbotron-section bg--position-center no-repeat bg-cover md-display-table"
		style="background-image: url(images/header.png)">
		<div
			class="jumbotron jumbotron-fluid bg-transparent md-display-table-cell md-vertical-middle">
			<div class="container">
				<div class="row">
					<div class="col-md-6" style="margin-left: 270px;">
						<header data-brackets-id="1466" class="header">
							<h3 data-brackets-id="1467" class="text-center">
								<span data-brackets-id="1468" class="text--semi-bold">Notice</span>
								<span data-brackets-id="1469" class="text--light">Board</span>
							</h3>
						</header>


						<!-- <div class="container" data-aos="fade-up">
				<div class="login-page" style="padding-right: 100px">
					<div class="form" style="text-align: left;">
 -->

						<form method="POST" action="/board/boardModify.do">
							<input type="hidden" name="seq" value="<%=bDTO.getSeq()%>">

							<div class=""
								style="border: 1px solid gray; width: 500px; height: 40px;">
								<span> <%=bDTO.getTitle()%></span>
							</div>
							<br>
							<div style="height: 500px; border: 1px solid gray; width: 500px;">
								<span> <%=bDTO.getContent()%>
								</span>
							</div>
							<br>

							<div style="width: 500px;">
								<%
								if (user_id == null) {
							%>


								<%}else{%>

								<%if (bDTO.getUser_name().equals(user_name) || user_Author.equals("1") ) {%>

								<input type="submit" id="reg_btn" class="button1" value="수정하기"
									style="float: right; width: 17%; margig-right: 10px;" /> <input
									type="button" id="reg_btn" class="button1"
									style="float: right; width: 17%; margin-right: 10px;"
									onclick="location.href='/board/boardDelete.do?seq=<%=bDTO.getSeq()%>'"
									value="삭제하기" />
								<%}%>


								<%}%>

								<input type="button" class="button1"
									style="float: right; width: 17%; margin-right: 10px;"
									onclick="location.href='/board/boardList.do'" value="돌아가기">
							</div>
						</form>

						<!-- 댓글 작성 
							<div class="form" style="padding-top: 70px;">
								<form id="Comment" name="Comment" method="post"
									value=<%=bDTO.getSeq()%>"> -->
						<!-- action="board/CommentRegProc.do?seq= -->
						<!-- <div>
										<textarea id="content" name="content"
											style="width: 500px; height: 50px; margin-top: 10px;  resize: none;"
											placeholder="댓글을 입력해주세요"></textarea>
									</div>
									<div class="form-group" style="width: 100px; padding-top: 5px;">
										<div>
											<input type="button" id="submit"
												class="button1" style="cursor: pointer;" 
												onclick="location.href='/board/boardList.do'" value="댓글쓰기">
										</div>
									</div>
								</form>
							</div>
 									-->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- footer -->
 <section class="footer-bottom">
   <div class="container">
     <hr class="footer-devider">
     <div class="row">
       <div class="col-md-5"><p class="copyright">Copyright © 2020 Lyric Analysis Page</p></div>
       <div class="col-md-5">
         <ul class="footer-menu">
        <!--    <li><a href="">Legal</a></li>
           <li><a href="">Privacy</a></li>
           <li><a href="">Policy</a></li>
           <li><a href="">Cookies</a></li> -->
         </ul>
       </div>
       <div class="col-md-2">
         <a id="scroll-top-div" href="" class="pull-right back-top-btn">back to top <span class="btn-icon"><i class="ion-ios-arrow-thin-up"></i></span></a>
       </div>
     </div>
   </div>
 </section>
			
</body>
</html>