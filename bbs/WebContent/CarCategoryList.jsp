<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="RentCar.RentCarDAO"%>
<%@ page import="RentCar.CarList"%>
<%@ page import="java.util.Vector"%>
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
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
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
	//카테고리 분류값을 받아옴 
	int Category = Integer.parseInt(request.getParameter("category"));
	String temp = "";
	if (Category == 1)
		temp = "소형";
	else if (Category == 2)
		temp = "중형";
	else if (Category == 3)
		temp = "대형";
	%>

	<center>
		<table width="1000" border="1" bordercolor="gray">
			<tr height="100">
				<td align="center" colspan="3"><font size="7" color="gray"><%=temp%>
						자동차</font></td>
			</tr>
			<%
			RentCarDAO rdao = new RentCarDAO();
			Vector<CarList> v = rdao.getCategoryCar(Category);
			//tr를 3개씩 보여주고 다시 tr을 실행 할수 있도록 하는 변수 선언 
			int j = 0;
			for (int i = 0; i < v.size(); i++) {
				//벡터에 저장되어 있는 빈클래스를 추출
				CarList bean = v.get(i);
				if (j % 3 == 0) {
			%>
			<tr height="220">
				<%
				}
				%>
				<td width="333" align="center"><a
					href="CarReserveInfo.jsp?no=<%=bean.getNo()%>"> <img alt=""
						src="images/<%=bean.getImg()%>" width="300" height="200">
				</a>
				<p>
						<font size="3" color="gray"><b> 차량명 : <%=bean.getName()%></b></font>
					</p></td>

				<%
				j = j + 1;//j값을 가하여 하나의 행에 총 3개의 차량정보를 보여주기 위해서 증가
				}
				%>
			
		</table>
	</center>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>