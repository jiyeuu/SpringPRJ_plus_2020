<%@page import="poly.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<BoardDTO> bList = (List<BoardDTO>) request.getAttribute("bList");
	String user_name = (String) request.getAttribute("user_name");
	String user_id = (String) session.getAttribute("SS_USER_ID");
	String user_Author = (String) session.getAttribute("user_Author");
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



<!-- <link rel="stylesheet" href="/css/style1.css">
<link rel="stylesheet" href="/css/style_list.css"> -->

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



								<form name="f" method="POST" action="/board/boardRegProc.do"
									id="regform" onsubmit="return submitTest();">
									<input type="text" style="width: 110%;" id="title"
										name="title" /> 
									<br>
									<br>
									<div>
										<textarea class="table_textbox" name="contents" id="contents"
											style="width: 110%; height: 20em; margin-right: 70px;"></textarea>
									</div>

									<input type="submit" class="button1" style="width: 80px; margin-left: 95%;"
										id="reg_btn1" value="등록">
								</form>


								<script>
									function submitTest() {
										var title = $('#title').val();
										var contents = $('#contents').val();

										if (title == "") {
											alert("제목을 입력해 주세요.");
											$('#title').focus();
											return false;

										} else if (contents == "") {
											alert("내용을 입력해 주세요.");
											$('#contents').focus();
											return false;
										}
									};
								</script>
							</div>
						</div>
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