<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width-device-width",intial-scale"1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Insert title here</title>
</head>
<body>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<% 
		int no = Integer.parseInt(request.getParameter("no"));	
		//수량 
		int qty = Integer.parseInt(request.getParameter("qty"));
		//이미지
		String img = request.getParameter("img");
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">게시판</a>
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
	
<center>
	<form action = "CarReserveResult.jsp" method="post">
		<table width="1000">
			<tr height="100">
				<td align="center"colspan="3">
					<font size="6" color="gray">옵션 선택</font>
				</td>
			</tr>
			
			<tr height="100">
				<td rowspan="7" width="450">
					<img alt = "" src="images/<%=img%>" width="450">	
				</td>
				
				<td width="250" align="center">대여기간</td>
				<td width="250" align="center">
				 	<select name="dday">
				 		<option value = "1">1일</option>
				 		<option value = "2">2일</option>
				 		<option value = "3">3일</option>
				 		<option value = "4">4일</option>
				 		<option value = "5">5일</option>
				 		<option value = "6">6일</option>
				 		<option value = "7">7일</option>
				 	</select>
				</td>
			</tr>	
			
			<tr>
				<td width="250" align="center">대여일</td>
				<td width="250" align="center">
					<input type="date" name="rday" size ="15"></td>
			</tr>
			
			<tr>
				<td width="250" align="center">보험 적용</td>
				<td width="250" align="center">
				 	<select name="usein">
				 		<option value = "1">적용 (1일 1만원)</option>
				 		<option value = "2">비적용</option>
				 	</select>
				</td>
			</tr>
			
			<tr>
				<td width="250" align="center">Wifi 적용</td>
				<td width="250" align="center">
				 	<select name="usewifi">
				 		<option value = "1">적용 (1일 1만원)</option>
				 		<option value = "2">비적용</option>
				 	</select>
				</td>
			</tr>
			
			<tr>
				<td width="250" align="center">네비게이션 적용</td>
				<td width="250" align="center">
				 	<select name="usenavi">
				 		<option value = "1">적용(무료)</option>
				 		<option value = "2">비적용</option>
				 	</select>
				</td>
			</tr>
			
			<tr>
				<td width="250" align="center">베이비 시트 적용</td>
				<td width="250" align="center">
				 	<select name="useseat">
				 		<option value = "1">적용 (1일 1만원)</option>
				 		<option value = "2">비적용</option>
				 	</select>
				</td>
			</tr>
			
			<tr>
				<td align="center" colspan="2">
					<input type = "hidden" name="no" value="<%=no%>">
					<input type = "hidden" name="qty" value="<%=qty%>">
					<input type="submit" value="차량예약하기">
				</td>
			</tr>
		</table>
	</form>
</center>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>