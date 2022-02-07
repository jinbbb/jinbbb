<%@page import="RentCar.RentCarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="RentCar.RentCarDAO" %>
<%@ page import="RentCar.CarList"%>
<%@ page import ="java.util.Vector"%>
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
				<li><a href="#">예약확인</a></li>
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
		<% 
		RentCarDAO rdao = new RentCarDAO();
			//벡터를 이용하여 자동차를 결정
			Vector <CarList> v = rdao.getSelectCar();
		%>
			<table	width ="1000" border="1">
				<tr height="100">
					<td align="center"colspan="3">
						<font size="7" color="gray">최신형 자동차</font>
					</td>
				</tr>
				
		<%		for(int i = 0;i<v.size();i++){ 
					CarList bean = v.get(i);
		%>
					<td width="333" align="center" border="1">
						<a href="CarReserveInfo.jsp?no=<%=bean.getNo()%>">
							<img alt="" src="images/<%=bean.getImg()%>" width="300" height="200">
						</a><p>
						차량명은 : <%=bean.getName()%>
					</td>	
		<% 			
			}
		%>
			</table>
			
			<p>
			<font size ="4" color="gray"><b>차량 검색 하기</b></font><br><br>
			<form action="CarCategoryList.jsp" method="post">
			<font size ="3" color="gray"><b>차량 검색 하기</b></font>&nbsp;&nbsp;
			
			<select name="category">
				<option value="1">소형</option>
				<option value="2">중형</option>
				<option value="3">대형</option>
			</select>
			<input type="submit" value="검색 ">&nbsp;&nbsp;
			
			</form>
			<button onclick="location.href='CarAllList.jsp'">전체 검색</button>	
</center>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>