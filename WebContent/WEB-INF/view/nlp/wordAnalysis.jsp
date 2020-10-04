<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%
	//Controller로부터 전달받은 데이터
String res = CmmUtil.nvl((String) request.getAttribute("res"));
int pos = (int) request.getAttribute("pos");
int neg = (int) request.getAttribute("neg");

String user_id = (String) session.getAttribute("SS_USER_ID");
String user_Author = (String) session.getAttribute("user_Author");
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


<style>
#chartdiv {
	width: 100%;
	height: 200px;
}
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/frozen.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<script src="/js/jquery-3.5.1.min.js"></script>

<!-- Chart code -->
<script type="text/javascript">
      //차트 벨류값 받아오기
   var positive = <%=pos%>
   var negative = <%=neg%>
   var cal = (positive)/(positive+negative);
   cal = cal*100;
   am4core.ready(function() {

      // Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end

      // create chart
      // 차트위치 지정
      var chart = am4core.create("chartdiv", am4charts.GaugeChart);
		chart.hiddenState.properties.opacity = 0; // this makes initial fade in effect

		// 차트 크기
		chart.innerRadius = -25;

		var axis = chart.xAxes.push(new am4charts.ValueAxis());
		axis.min = 0;
		axis.max = 100;
		axis.strictMinMax = true;
		axis.renderer.grid.template.stroke = new am4core.InterfaceColorSet()
				.getFor("background");
		axis.renderer.grid.template.strokeOpacity = 0.3;

		var colorSet = new am4core.ColorSet();

		//차트 색상 지정
		var range0 = axis.axisRanges.create();
		range0.value = 0;
		range0.endValue = 20;
		range0.axisFill.fillOpacity = 1;
		range0.axisFill.fill = am4core.color("#5960a6");
		range0.axisFill.zIndex = -1;

		var range1 = axis.axisRanges.create();
		range1.value = 20;
		range1.endValue = 50;
		range1.axisFill.fillOpacity = 1;
		range1.axisFill.fill = am4core.color("#808cbc");
		range1.axisFill.zIndex = -1;
		
		var range2 = axis.axisRanges.create();
		range2.value = 50;
		range2.endValue = 80;
		range2.axisFill.fillOpacity = 1;
		range2.axisFill.fill = am4core.color("#e08bb2");
		range2.axisFill.zIndex = -1;
		
		var range3 = axis.axisRanges.create();
		range3.value = 80;
		range3.endValue = 100;
		range3.axisFill.fillOpacity = 1;
		range3.axisFill.fill = am4core.color("#d26a9d");
		range3.axisFill.zIndex = -1;

		// 차트 화살표 생성
		var hand = chart.hands.push(new am4charts.ClockHand());

		hand.showValue(cal, 100, am4core.ease.cubicOut);

	}); // end am4core.ready()
</script>
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
			<div class="container" style="width: 400%;">
				<div class="row">
					<div class="col-md-6" style="margin-left: 500px;">
						<header data-brackets-id="1466" class="header">
							<h3 data-brackets-id="1467" class="text-center">
								<span data-brackets-id="1468" class="text--semi-bold">Lyric</span>
								<span data-brackets-id="1469" class="text--light">Analysis1</span>
							</h3>
						</header>

					
 					<p>Bugs Music chart 노래가사들을 감정분석한 결과 긍정적인 결과를 퍼센트로 나타낸 결과입니다.
 					
 					<br>
 					<br>
					<div id="chartdiv"></div>
			

					</div>
					</form>

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

