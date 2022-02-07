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
	<% 
		int no = Integer.parseInt(request.getParameter("no"));
	
		//데이터 베이스에 접근
		RentCarDAO rdao  = new RentCarDAO();
		
		//렌트카 하나에 대한 정보를 얻어옴 
		CarList bean = rdao.getOneCar(no);

		
		int Category = bean.getCategory();
		String temp ="";
		if(Category ==1)temp="소형";
		else if(Category ==2)temp="중형";
		else if(Category ==3)temp="대형";
	%>
	
<center>
	<form action = "CarOptionSelect.jsp" method="post">
		<table width="1000">
			<tr height="100">
				<td align="center"colspan="3">
					<font size="7" color="gray"><%=bean.getName() %> 차량 선택</font>
				</td>
			</tr>
			
			<tr height="100">
				<td rowspan="6" width="500">
					<img alt = "" src="images/<%=bean.getImg()%>" width="450">	
				</td>
				<td width="250" align="center">차량이름</td>
				<td width="250" align="center"><%=bean.getName()%></td>
			</tr>	
				
			<tr>
				<td width="250" align="center">차량 수량</td>
				<td width="250" align="center">
					<select name="qty">
						<option value ="1">1</option>
						<option value ="2">2</option>
						<option value ="3">3</option>
					</select>
				</td>
			</tr>	
			
			<tr>
				<td width="250" align="center">차량 분류</td>
				<td width="250" align="center"><%=temp%></td>
				</td>
			</tr>	
			
			<tr>
				<td width="250" align="center">대여 가격</td>
				<td width="250" align="center"><%=bean.getPrice()%></td>
				</td>
			</tr>
			
			<tr>
				<td width="250" align="center">제조 회사</td>
				<td width="250" align="center"><%=bean.getCompany()%></td>
				</td>
			</tr>	
			
			<tr>
				<td colspan="2" align="center">
					<input type = "hidden" name="no" value="<%=bean.getNo()%>">
					<input type = "hidden" name="img" value="<%=bean.getImg()%>">
					<input type="submit" value="옵션 선택 후 구매하기">
				</td>
			</tr>	
		</table>
			<br><br><br>
			<font size="5" color="gray"> 차량 정보 보기</font>
			<p>
			<%=bean.getInfo()%>
	</form>
</center>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>