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
			<a class="navbar-brand" href="main.jsp">����ī</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">����</a></li>
				<li><a href="CarReserveMain.jsp">�����ϱ�</a></li>
				<li><a href="#">����Ȯ��</a></li>
				<li><a href="bbs.jsp">�Խ���</a></li>
			</ul>
			<%
			if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">�����ϱ�<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">�α���</a>
						<li>
						<li><a href="join.jsp">ȸ������</a></li>
					</ul></li>
			</ul>
			<%
			} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expeanded="false">ȸ������<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">�α׾ƿ�</a>
						<li>
					</ul></li>
			</ul>
			<%
			}
			%>
		</div>
	</nav>
	<%
	//ī�װ��� �з����� �޾ƿ� 
	int Category = Integer.parseInt(request.getParameter("category"));
	String temp = "";
	if (Category == 1)
		temp = "����";
	else if (Category == 2)
		temp = "����";
	else if (Category == 3)
		temp = "����";
	%>

	<center>
		<table width="1000" border="1" bordercolor="gray">
			<tr height="100">
				<td align="center" colspan="3"><font size="7" color="gray"><%=temp%>
						�ڵ���</font></td>
			</tr>
			<%
			RentCarDAO rdao = new RentCarDAO();
			Vector<CarList> v = rdao.getCategoryCar(Category);
			//tr�� 3���� �����ְ� �ٽ� tr�� ���� �Ҽ� �ֵ��� �ϴ� ���� ���� 
			int j = 0;
			for (int i = 0; i < v.size(); i++) {
				//���Ϳ� ����Ǿ� �ִ� ��Ŭ������ ����
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
						<font size="3" color="gray"><b> ������ : <%=bean.getName()%></b></font>
					</p></td>

				<%
				j = j + 1;//j���� ���Ͽ� �ϳ��� �࿡ �� 3���� ���������� �����ֱ� ���ؼ� ����
				}
				%>
			
		</table>
	</center>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>