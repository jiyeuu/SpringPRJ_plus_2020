<%@page import="poly.dto.SongDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.BugsDTO"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="poly.util.CmmUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BugsDTO> rList = (List<BugsDTO>) request.getAttribute("rList");	

	String user_id = (String) session.getAttribute("SS_USER_ID");
	String user_Author = (String) session.getAttribute("user_Author");
	String user_name = (String) session.getAttribute("user_name");
%>
<!DOCTYPE html>
<html>
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
 <section id="home" class="section jumbotron-section bg--position-center no-repeat bg-cover md-display-table" style="background-image:url(images/header.png)">
   <div class="jumbotron jumbotron-fluid bg-transparent md-display-table-cell md-vertical-middle">
     <div class="container">
       <div class="row">
         <div class="col-md-6">
          
          <%!private Logger log = Logger.getLogger(this.getClass()); %>
					<%
						if (rList == null) {

						rList = new ArrayList<BugsDTO>();
					}
					log.info("############" + rList.size());
					%>

					<%
						int i = rList.size();
						for (int a = 0; a < i; a++) {
					%>

					<div style="width: 400px; margin: 0 auto;">
						<div>
						
							<%=rList.get(a).getRank()%>
							<span style="color: #34b7a7; margin-left: 10px"> 
							<%=rList.get(a).getSong()%></span>
						</div>

						<sanp style=" margin-left: 20px;"> 
						<%=rList.get(a).getSinger()%>
						</sanp>
					</div>
					<%
						}
					%>
         
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