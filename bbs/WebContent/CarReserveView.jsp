<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="RentCar.RentCarDAO" %>
<%@ page import="RentCar.CarList"%>
<%@ page import="RentCar.CarView"%>
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
	
		String id  =(String)session.getAttribute("userID");
		
		if(id ==null){		
	%>
	<script>
		alert("로그인을 먼저 해주세요");
		location.href = 'login.jsp';
	</script>
	<% 
		}
		//로그인 되어있는 아이디를 읽어옴
		RentCarDAO rdao = new RentCarDAO();
		Vector<CarView> v = rdao.getAllReserve(id);
	%>
	
	<center>
		<table width="1000">
			<tr height="100">
				<td align="center" colspan="11">
					<font size="6" color="gray">차량 예약 완료 화면</font>
				</td>
			</tr>
		</table>
		
		<table width="1000" border="1">
			<tr height="40">
				<td width="150"align="center">이미지 </td>
				<td width="150"align="center">이름 </td>
				<td width="150"align="center">대여일</td>
				<td width="60"align="center">대여기간</td>
				<td width="100"align="center">금액</td>
				<td width="60"align="center">수량</td>
				<td width="60"align="center">보험</td>
				<td width="60"align="center">wifi유무</td>
				<td width="60"align="center">네비게이션</td>
				<td width="60"align="center">베이비시트유무</td>
				<td width="90"align="center">삭제</td>
			</tr>
			
	<% 
			for(int i =0 ; i< v.size() ; i++){			
				CarView bean = v.get(i);
	%>
			<tr height="60">
				<td width="150"align="center"><img alt ="" src="images/<%=bean.getImg()%>"  width="120" height="70"></td>
				<td width="150"align="center"><%=bean.getName()%></td>
				<td width="150"align="center"><%=bean.getDday()%></td>
				<td width="60"align="center"><%=bean.getRday()%></td>
				<td width="100"align="center"><%=bean.getPrice()%></td>
				<td width="60"align="center"><%=bean.getQty()%></td>
				<td width="60"align="center"><%=bean.getUserin()%></td>
				<td width="60"align="center"><%=bean.getUsewifi()%></td>
				<td width="60"align="center"><%=bean.getUsenavi()%></td>
				<td width="60"align="center"><%=bean.getUseseat()%></td>
				<td width="90"align="center"><button onclick="location.href='CarReserveDel.jsp?id=<%=id%>&rday=<%=bean.getRday()%>'">삭제</button></td>
			</tr>
	<% 		
			}
	%>
			</table>
	</center>	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>