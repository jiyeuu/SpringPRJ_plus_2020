<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
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

<script type="text/javascript">
//비밀번호 일치 체크
	function checkPw1() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#pwd1").val();
			var pwd2 = $("#pwd2").val();
			var CheckForm = /^[a-z0-9]{8,16}$/;
			if(pwd1==""){
				$("#alert-danger1").hide();
				$('#pwinput').val("0");
			}
			if(pwd1.length<8){
				$("#alert-danger1").show();				
				$('#pwinput').val("0");
			}
			if (!CheckForm.test(pwd1)) {
				$("#alert-danger1").show();
				$('#submitbtn').prop("disabled", true);	
				$('#pwinput').val("0");
			} else{
			 	if (pwd1 != "" || pwd2 != "") {
					if (pwd1 == pwd2) {
						$("#alert-danger1").hide();
						$("#alert-success").show();
						$("#alert-danger").hide();
						$("#submitbtn").removeAttr("disabled");
						$('#pwinput').val("1");
					} else {
						$("#alert-danger1").hide();
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submitbtn").attr("disabled", "disabled");
						$('#pwinput').val("0");
					}
			  	}
			}
		});
	};

</script>

 <style>
.find_info {
    font-size: 13px;
    line-height: 14px;
    padding-top: 20px;
    text-align: right;
    color: #8e8e8e;
    border-top: 1px solid #e4e4e5;
}
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
.button1 {
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
 </style>

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
					<div class="col-md-6" style="margin-left: 270px;">
						<header data-brackets-id="1466" class="header">
							<h3 data-brackets-id="1467" class="text-center">
								<span data-brackets-id="1468" class="text--semi-bold">My</span>
								<span data-brackets-id="1469" class="text--light">Page</span>
							</h3>
						</header>

						<form name="chpwdForm" id="login" action="/user/changePw.do">

							<input type="password" class="input" placeholder="new password"
								name="password" id="pwd1" oninput="checkPw1()" required />
							<div id="alert-danger1" style="display: none;">영문소문자,
								숫자8~16로 입력해주세요</div>

							<input class="input" id="pwd2" type="password"
								name="repeatpassword" oninput="checkPw1()"
								placeholder="new Password check" required>
							<div id="alert-success" style="display: none;">비밀번호 사용가능</div>
							<div id="alert-danger" style="display: none;">비밀번호가 일치하지
								않습니다</div>

							<input type="hidden" id="pwinput" value="0"> <input
								type="hidden" id="submitinput" value="0"> <input
								type="submit" value="변경하기" class="button1" id="submitbtn" />

							<div class="find_info" style="margin-left: 73%;">
								<a target="_blank" id="idinquiry" href="/mypage/Mypage.do">뒤로가기</a>
								<span class="bar" aria-hidden="true">|</span>
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

	<script type="text/javascript">
		function submitTest(){
			var subinput = $("#submitinput").val();
			if(subinput=='0'){
				alert("아이디 중복 체크를 해주세요.");
				return false;
			}
			return true;
			
		}
	</script>
  

 
	
</body>
</html>