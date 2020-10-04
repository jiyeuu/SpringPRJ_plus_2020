<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%
	String user_id = (String) session.getAttribute("SS_USER_ID");
	String user_Author = (String) session.getAttribute("user_Author");
	List<String> pList = (List<String>) request.getAttribute("pList");
	List<Integer> iList = (List<Integer>) request.getAttribute("iList");
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

<!-- Styles -->
<style>
#chartdiv {
	width: 300%;
	height: 500px;
	padding-right: 300px;
}
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/plugins/wordCloud.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/frozen.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<script src="/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	
	
	var str =  [];
	<%for(int i = 0 ; i<pList.size();i++){%>
		str.push({"word":"<%=pList.get(i)%>","count" : "<%=iList.get(i)%>"});
	<%}%>
	
	am4core.ready(function() {
		// Themes begin
		am4core.useTheme(am4themes_frozen);
		am4core.useTheme(am4themes_animated);
	  	// Themes end
		var chart = am4core.create("chartdiv", am4plugins_wordCloud.WordCloud);
		var series = chart.series.push(new am4plugins_wordCloud.WordCloudSeries());
		   series.randomness = 0.1;
		   series.labels.template.tooltipText = "{word}: {value}";
		   series.fontFamily = "Courier New";
		   series.data = str;
		   series.dataFields.word = "word";
		   series.dataFields.value = "count";
		   series.colors = new am4core.ColorSet();
		   series.colors.passOptions = {}; // makes it loop
	});
</script>
</head>
<body>

	
	<%
		if (user_id != null) {
	%>
	<%
		if (user_Author.equals("1")) {
	%>
	<%@include file="/WEB-INF/view/frame/topbar-admin.jsp"%>
	<%
		} else {
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
					<div class="col-md-6" style="margin-left: ;">
						<header data-brackets-id="1466" class="header">
							<h3 data-brackets-id="1467" class="text-center">
								<span data-brackets-id="1468" class="text--semi-bold">Lyric</span>
								<span data-brackets-id="1469" class="text--light">Analysis2</span>
							</h3>
						</header>

						<div id="chartdiv" ></div>
						
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

</html>