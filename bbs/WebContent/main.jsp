<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width",intial-scale"1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>게시판 프로젝트</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">렌터카</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="CarReserveMain.jsp">예약하기</a></li>
				<li><a href="CarReserveView.jsp">예약확인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
			if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a>
						<li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
			} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expeanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a>
						<li>
					</ul></li>
			</ul>
			<%
			}
			%>
		</div>
	</nav>
	<div class="container">
	<div class="Container">
	</div>
	</div>
	<div class="container">
	<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="500">
	<ol class="carousel-indicators">
	<li data-target="#myCarousel" data-slide-tto="0" class="active"></li>
	<li data-target="#myCarousel" data-slide-tto="1"></li>
	<li data-target="#myCarousel" data-slide-tto="2"></li>
	</ol>
	<div class="carousel-inner">
	<div class="item active">
	<img src="images/1.1.jpg" width="1000" height="200">
	</div>
	<div class="item">
	<img src="images/1.2.jpg" width="1000" height="200">
	</div>
	<div class="item">
	<img src="images/1.3.jpg" width="1000" height="200">
	</div>
	</div>
	
	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
	<span class="glyphicon glyphicon-chevron-left"></span>
	</a>
	
	<a class="right carousel-control" href="#myCarousel" data-slide="next">
	<span class="glyphicon glyphicon-chevron-right"></span>
	</a>
	</div>
	</div>
	
	<footer>
          <nav>
          <table width ="1000">
		<tr height = "100">
			<td align = "center">
			<hr color="red" size="3">
			이용약관
			이메일무단수집거부
			개인정보처리방침
			영상정보처리기기 운영관리방침
			아이디어 정책
			Copyright. SAMSUNG ELECTRO-MECHANICS All rights reserved.
			삼성전기(주)대표이사 경계현사업자등록번호 124-81-00979
			경기도 수원시 영통구 매영로 150 (매탄동)
			</td>
		</tr>
	</table>
	</nav>
      </footer>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>