<%@page import="poly.dto.BoardDTO"%>
<%@page import="poly.dto.PagingDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.DateUtil"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	int curPage = (int)request.getAttribute("curPage");
	PagingDTO pagg = (PagingDTO)request.getAttribute("pagg");
	List<BoardDTO> bList = (List<BoardDTO>)request.getAttribute("bList");
	String user_name = (String)request.getAttribute("user_name");
	String user_id = (String)session.getAttribute("SS_USER_ID");
	String user_Author = (String)session.getAttribute("user_Author");
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
    

  <!-- Template Main CSS File 
  <link href="/assets/css/style.css" rel="stylesheet">
  <link href="/assets/css/style_index.css" rel="stylesheet">-->
  
<!-- <link rel="stylesheet" href="/css/main.css"> -->
<!-- <link rel="stylesheet" href="/css/style.css"> -->
<link rel="stylesheet" href="/css/style_list.css">
<link rel="stylesheet" href="/css/bootstrap.min_table.css">



   <script type="text/javascript">
     function fn_paging(curPage) {
     location.href = "/board/boardList.do?curPage=" + curPage;
     }
 </script>
<style type="text/css">

@keyframes backMasking {
  0% {
    width: 0%;
  }
  100% {
    width: 100%;
  }
}
@-webkit-keyframes backMasking {
  0% {
    width: 0%;
  }
  100% {
    width: 100%;
  }
}
     
      #jb-content {
        width: 100%;
        padding: 20px;
        margin-bottom: 20px;
        position: relative;
        border: 1px solid #bcbcbc;
      }
     
      @media ( max-width: 480px ) {
     
        #jb-content {
          float: none;
          width: auto;
            position: absolute;
        }
       
      }
      
      
.find_info {
    font-size: 13px;
    line-height: 14px;
    padding-top: 20px;
    text-align: center;
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
  width: 10%;
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
	<!-- #header -->
			  
	<section id="home"
		class="section jumbotron-section bg--position-center no-repeat bg-cover md-display-table"
		style="background-image: url(images/header.png)">
		<div
			class="jumbotron jumbotron-fluid bg-transparent md-display-table-cell md-vertical-middle">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<header data-brackets-id="1466" class="header">
							<h3 data-brackets-id="1467" class="text-center">
								<span data-brackets-id="1468" class="text--semi-bold">Notice</span> <span
									data-brackets-id="1469" class="text--light">Board</span>
							</h3>
						</header>
			
				<!-- <input type="button" value="글작성" class="button" onclick="window.location='/board/boardReg.do'"/> -->

		<button type="button" class="button1"
		style="margin-right: 275px;"
			onclick="window.location='/board/boardReg.do'">글쓰기
		</button>	
		
		<br>
		<br>
		<br>
		<br>
		
						<div style="border: 1px solid gray; width: 600px; margin: 0 auto;">
							<div style="border-bottom: 1px solid black;">
								<span style="padding-left: 9px;">번호</span> 
								<span style="padding-left: 50px;">제목</span> 
								<span style="padding-left: 170px;">작성자</span> 
								<span style="padding-left: 50px;">조회수</span> 
								<span style="padding-left: 50px;">작성일</span>
							</div>
							<%for(BoardDTO bDTO : bList){ %>
							<div style="border: 1px solid gray;">
								<span style="padding-left: 10px;"><%=bDTO.getSeq() %></span> <span
									style="padding-left: 50px;"> <a
									href="/board/boardDetail.do?seq=<%=bDTO.getSeq()%>"> <%=bDTO.getTitle()%></a></span>
								<span style="padding-left: 60px;"><%=bDTO.getUser_name() %></span>
								<span style="padding-left: 60px"><%=bDTO.getRead_cnt() %></span>
								<span style="padding-left: 60px"><%=bDTO.getReg_date() %></span>
							</div>
							<%} %>
						</div>
						<br>


						<!-- 페이징 -->
						<div style="display: inline-block;">
							<!-- 1~5페이지 아닌 경우에 처음 찍기 -->
							<ul class="pagination">
								<c:if test="${pagg.curRange ne 1 }">
									<!-- 현재페이지가 1이 아닐때 -->
									<a class="page-link" href="#" onClick="fn_paging(1)">처음</a>
								</c:if>
								<!-- 1페이지가 아닌 경우에 이전 찍기 -->
								<c:if test="${pagg.curPage ne 1}">
									<a class="page-link" href="#"
										onClick="fn_paging('${pagg.prevPage }')">이전</a>
								</c:if>


								<c:forEach var="pageNum" begin="${pagg.startPage }"
									end="${pagg.endPage }">
									<c:choose>
										<c:when test="${pageNum eq  pagg.curPage}">
											<span style="font-weight: bold;"><a class="page-link"
												href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
										</c:when>
										<c:otherwise>
											<a class="page-link" href="#"
												onClick="fn_paging('${pageNum }')">${pageNum }</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>


								<!-- 마지막 페이지가 아닌 경우에 다음 찍기 -->
								<c:if test="${pagg.curPage ne pagg.pageCnt && pagg.pageCnt > 0}">
									<a class="page-link" href="#"
										onClick="fn_paging('${pagg.nextPage }')">다음</a>
								</c:if>

								<!-- 마지막 페이지 블록이 아닐때 끝 찍기 -->
								<c:if
									test="${pagg.curRange ne pagg.rangeCnt && pagg.rangeCnt > 0}">
									<a class="page-link" href="#"
										onClick="fn_paging('${pagg.pageCnt }')">끝</a>
								</c:if>

							</ul>
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